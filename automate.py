import os
import glob
import pandas as pd
import numpy as np

# Sets project dir as working directory
os.chdir(os.path.dirname(QgsProject.instance().fileName()))

CWD = os.getcwd()

def make_dir(dirname):
    if not os.path.exists(dirname):
        os.makedirs(dirname)
    return f"{dirname}/"

def load_and_style(shapefile,stylepath):
    vlayer = iface.addVectorLayer(shapefile,'','ogr')
    vlayer.loadNamedStyle(stylepath)
    vlayer.triggerRepaint()

""" Selects roads from Corine land cover data """
layer = QgsVectorLayer(
    f"{CWD}/Corine/Shapefiles/EL003L1_PATRA_UA2012.shp", '', "ogr")
layer.selectByExpression('"CODE2012"=12220')
QgsVectorFileWriter.writeAsVectorFormat(layer,
                                        f"{make_dir('selected')}roads.shp",
                                        "UTF-8",
                                        layer.crs(),
                                        "ESRI Shapefile",
                                        onlySelected=True)

""" Loads Hobo station coordinates and creates shapefile
use EPSG:3035 to insert radius in meters"""
coords = QgsVectorLayer(f"file:///{CWD}//coords.txt?type=csv&detectTypes=yes&xField=lon&yField=lat&crs=EPSG:4326&spatialIndex=yes&subsetIndex=no&watchFile=no","", "delimitedtext")
QgsVectorFileWriter.writeAsVectorFormat(coords,
                                        f"{make_dir('points')}stations.shp",
                                        "utf-8",
                                        destCRS=QgsCoordinateReferenceSystem(
                                            "EPSG:3035"),
                                        driverName='ESRI Shapefile')

buffers = range(100, 500, 50)

for radius in buffers:
    buffer = processing.run('native:buffer',
                            {'DISSOLVE': False,
                             'DISTANCE': radius,
                             'END_CAP_STYLE': 0,
                             'INPUT': f"{CWD}/points/stations.shp",
                             'JOIN_STYLE': 0,
                             'MITER_LIMIT': 2,
                             'OUTPUT': 'TEMPORARY_OUTPUT',
                             'SEGMENTS': 32})
    intersection = processing.run('native:intersection',
                                  {'INPUT': buffer['OUTPUT'],
                                   'INPUT_FIELDS': [],
                                   'OUTPUT': 'TEMPORARY_OUTPUT',
                                   'OVERLAY': f"{CWD}/selected/roads.shp",
                                   'OVERLAY_FIELDS': ['ITEM2012']})
    area = processing.run('qgis:exportaddgeometrycolumns',
                          {'CALC_METHOD': 0,
                           'INPUT': intersection['OUTPUT'],
                           'OUTPUT': f"{CWD}/{make_dir('areas')}/{radius}.csv"})

csvpaths = glob.glob(f"{CWD}/areas/*.csv")

for csvpath in csvpaths:
    fname = os.path.basename(csvpath).split('.')[0]
    buffer_radius = int(fname)
    df = pd.read_csv(csvpath)
    by_alias = df.groupby(['Alias', 'Lat', 'Lon'], as_index=False)[
        'area'].sum()
    by_alias['Road_Buffer_Ratio'] = by_alias['area'] / (
                np.pi * buffer_radius ** 2)
    by_alias.to_csv(f"{make_dir('Road-Buffer-Ratio')}{fname}.csv", index=False)

    road_buffer_ratio = QgsVectorLayer(
        f"file:///{CWD}/Road-Buffer-Ratio/{fname}.csv?type=csv&detectTypes=yes&xField=Lon&yField=Lat&crs=EPSG:4326&spatialIndex=no&subsetIndex=no&watchFile=no",
        fname, "delimitedtext")
    QgsVectorFileWriter.writeAsVectorFormat(road_buffer_ratio,
                                            f"{make_dir('Road-Buffer-Ratio/Shapefiles')}{fname}.shp",
                                            "utf-8",
                                            destCRS=QgsCoordinateReferenceSystem(
                                                "EPSG:3035"),
                                            driverName='ESRI Shapefile')
    processing.run('native:buffer',  {'DISSOLVE': False,
                                     'DISTANCE': buffer_radius,
                                     'END_CAP_STYLE': 0,
                                     'INPUT': f"{CWD}/Road-Buffer-Ratio/Shapefiles/{fname}.shp",
                                     'JOIN_STYLE': 0,
                                     'MITER_LIMIT': 2,
                                     'OUTPUT': f"{CWD}/{make_dir('Road-Buffer-Ratio/Final-buffer')}{fname}.shp",
                                     'SEGMENTS': 32})


load_and_style(f"{CWD}/selected/roads.shp",f"{CWD}/styles/roads.qml")

bufferpaths = glob.glob(f"{CWD}/Road-Buffer-Ratio/Final-buffer/*.shp")
for bufferpath in reversed(bufferpaths):
    load_and_style(bufferpath,f"{CWD}/styles/graduated_0-0.5_step0.1.qml")

load_and_style(f"{CWD}/points/stations.shp",f"{CWD}/styles/hobo_points.qml")


