import os
##import the following if you need to import this file as module
#from qgis.core import QgsProject, QgsVectorLayer,QgsVectorFileWriter,QgsCoordinateReferenceSystem
#import processing


# Sets project dir as working directory
os.chdir(os.path.dirname(QgsProject.instance().fileName()))

BASE_DIR = os.getcwd()
CORINE_SHPATH = os.path.join(BASE_DIR,"Corine","Shapefiles","EL003L1_PATRA_UA2012.shp")
HOBO_DIR = os.path.join(BASE_DIR,"Hobo") # coords and shapefiles in EPSG:3035
STYLES_DIR = os.path.join(BASE_DIR,'styles')
# Created dirs
RATIO_DIR = os.path.join(BASE_DIR,"Ratios") # csv files for further processing
BUFFER_DIR = os.path.join(BASE_DIR,"Buffers") # shapefiles for map styling
radius=200

def make_dir(dirname):
    if not os.path.exists(dirname):
        os.makedirs(dirname)

def coords2shp():
    """ Loads Hobo station coordinates from coords.txt and creates stations shapefile
    use EPSG:3035 to insert radius in meters"""
    coords = QgsVectorLayer(f"file:///{HOBO_DIR}//stations.txt?type=csv&detectTypes=yes&xField=lon&yField=lat&crs=EPSG:4326&spatialIndex=yes&subsetIndex=no&watchFile=no","", "delimitedtext")
    QgsVectorFileWriter.writeAsVectorFormat(coords,
                                            f"{HOBO_DIR}/stations.shp",
                                            "utf-8",
                                            destCRS=QgsCoordinateReferenceSystem(
                                                "EPSG:3035"),
                                            driverName='ESRI Shapefile')

class Layer():
    def __init__(self,name,shpath):
        self.name = name
        self.shpath = shpath
        self.veclayer = QgsVectorLayer(self.shpath, self.name, "ogr")
    def load_and_style(self,stylepath=None):
        """ Adds layer to map if not there"""
        if len(QgsProject.instance().mapLayersByName(self.name)) is 0:
            QgsProject.instance().addMapLayer(self.veclayer)
        self.veclayer.loadNamedStyle(stylepath)
        self.veclayer.triggerRepaint()

class LandCoverGroup(Layer):
    def __init__(self, name, keywords=None):
        self.name = name
        self.keywords = keywords
        self.query = 'SELECT * FROM "Corine" WHERE LOWER(ITEM2012) LIKE '+' OR LOWER(ITEM2012) LIKE '.join("'%{0}%'".format(w) for w in self.keywords)
        self.virlayer = QgsVectorLayer('?query='+self.query, self.name, "virtual")
        self.dir = os.path.join(BASE_DIR,self.name.capitalize())
        self.selection_shpath = os.path.join(self.dir,self.name+".shp")
        self.ratio_csvpath = os.path.join(RATIO_DIR, self.name + ".csv")
        self.buffer_shpath = os.path.join(BUFFER_DIR, self.name + ".shp")
        Layer.__init__(self,name,self.buffer_shpath)
    def save_to_dir(self):
        """ Saves virtual layer (selection from Corine) as shapefile in self-named directory"""
        make_dir(self.dir)
        QgsVectorFileWriter.writeAsVectorFormat(self.virlayer,
                                        self.selection_shpath,
                                        "utf-8",
                                        destCRS=QgsCoordinateReferenceSystem(
                                            "EPSG:3035"),
                                        driverName='ESRI Shapefile')
    def calc_buffer_ratio(group):  
        """ Calculates land cover group to buffer area ratio and saves to csv"""
        buffer = processing.run('native:buffer',
                            {'DISSOLVE': False,
                             'DISTANCE': radius,
                             'END_CAP_STYLE': 0,
                             'INPUT': stations_layer.veclayer,
                             'JOIN_STYLE': 0,
                             'MITER_LIMIT': 2,
                             'OUTPUT': 'TEMPORARY_OUTPUT',
                             'SEGMENTS': 32})
        intersection = processing.run('native:intersection',
                                      {'INPUT': buffer['OUTPUT'],
                                       'INPUT_FIELDS': [],
                                       'OUTPUT': 'TEMPORARY_OUTPUT',
                                       'OVERLAY': group.virlayer,
                                       'OVERLAY_FIELDS': ['Alias']})
        area = processing.run('qgis:exportaddgeometrycolumns',
                              {'CALC_METHOD': 0,
                               'INPUT': intersection['OUTPUT'],
                               'OUTPUT': 'TEMPORARY_OUTPUT'})
        area_out = area['OUTPUT']
        # Virtual layer SQL query won't work unless area['OUTPUT'] is added on map
        area_out.setName(group.name)
        QgsProject.instance().addMapLayer(area_out)
        make_dir(RATIO_DIR)
        ratio = QgsVectorLayer(f'?query=SELECT *, Sum("area")/({radius}*{radius}*PI()) AS area_buffer_ratio /*:double*/ FROM "{group.name}" GROUP BY "Alias"', f"{group.name} ratio", "virtual" )
        QgsProject.instance().addMapLayer(ratio)
        QgsVectorFileWriter.writeAsVectorFormat(ratio,
                                        group.ratio_csvpath,
                                        "utf-8",driverName='CSV')
        QgsProject.instance().removeMapLayer(area_out)
        QgsProject.instance().removeMapLayer(ratio)


    def buffer_ratio_to_shp(group,load=False):
        """ Creates buffer around stations, saves shapefiles and adds to map.
        csv files must contain area_buffer_ratio column for categorized styling """
        buffer_ratio = QgsVectorLayer(f"file:///{group.ratio_csvpath}?type=csv&detectTypes=yes&xField=Lon&yField=Lat&crs=EPSG:4326&spatialIndex=yes&subsetIndex=no&watchFile=no",group.name, "delimitedtext")
        reprojected = processing.run('native:reprojectlayer', 
                                       {'INPUT': buffer_ratio, 
                                        'TARGET_CRS': 'EPSG:3035', 
                                        'OUTPUT': 'memory:Reprojected'})
        make_dir(BUFFER_DIR)
        color_buffer = processing.run('native:buffer',
                                {'DISSOLVE': False,
                                 'DISTANCE': radius,
                                 'END_CAP_STYLE': 0,
                                 'INPUT': reprojected['OUTPUT'],
                                 'JOIN_STYLE': 0,
                                 'MITER_LIMIT': 2,
                                 'OUTPUT': group.buffer_shpath,
                                 'SEGMENTS': 32})
        if load:
            lyr = QgsVectorLayer(group.buffer_shpath, group.name, "ogr")
            QgsProject.instance().addMapLayer(lyr)
    

corine_layer = Layer("Corine",CORINE_SHPATH)
corine_layer.load_and_style(stylepath = f"{STYLES_DIR}/corine_land_use.qml")
stations_layer = Layer("Stations","{HOBO_DIR}/stations.shp")
stations_layer.load_and_style(stylepath = f"{STYLES_DIR}/hobo_points.qml")

groups = [
LandCoverGroup('green',keywords=['crops','pastures','green']),
LandCoverGroup('urban',keywords=['continuous']),
LandCoverGroup('other',keywords=['industrial','isolated','without']),
LandCoverGroup('roads',keywords=['roads'])
]

roads = groups[-1]
#roads.save_to_dir()
#
#for g in groups:
#    LandCoverGroup.calc_buffer_ratio(g)
#    LandCoverGroup.buffer_ratio_to_shp(g)
#
roads_layer = Layer(roads.name.capitalize(),roads.selection_shpath)
roads_layer.load_and_style()
#
#for g in groups:
#    g.load_and_style()
#
