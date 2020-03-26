import os
import numpy as np
import pandas as pd
import geopandas as gpd
import matplotlib.pyplot as plt
import matplotlib.patheffects as pe
import seaborn as sns

params = {'figure.figsize': (14, 4),
          'axes.titlesize': 18,
          'axes.titleweight': 'bold',
          'axes.labelsize': 18,
          'axes.labelweight': 'bold',
          'xtick.labelsize': 18,
          'ytick.labelsize': 18,
          'font.weight' : 'bold',
          'font.size': 18,
          'savefig.dpi': 300.0,
          'savefig.format': 'tiff',
          'savefig.bbox' : "tight"
#          'figure.constrained_layout.use': True
          }
plt.rcParams.update(params)


class LandCoverGroup():
    def __init__(self,name,keywords=None,cmap=None):
        self.name = name
        self.keywords = keywords
        self.cmap = cmap

def group_lc(row):
    for group in groups:
        if any(x in row["ITEM2012"].lower() for x in group.keywords):
            return group.name
    return "other"

def plot_buffers_cmap(group,outdir=None):
    """ Plots roads map with buffers and colorbar based on ratios """
    ax = roads_4326.plot(color='dimgrey',figsize=(10,8))
    buffers_4326.plot(ax=ax,column=group.name,legend=True,cmap=group.cmap,edgecolor='k')
    ax.set_xlim([21.69,21.81])
    ax.set_ylim([38.18,38.3])
    ax.set_yticklabels([])
    ax.set_xticklabels([])
    ax.set_xticks([])
    ax.set_yticks([])
    for a,x,y in zip(buffers_4326['Alias'],buffers_4326['Lon'],buffers_4326['Lat']):
        ax.text(x+0.003,y, a, color='black', 
                path_effects=[pe.withStroke(linewidth=4, foreground="white")])
    plt.title(group.name.capitalize())
    if outdir:
        
        plt.savefig(f"{outdir}/{group.name}")

def plot_pies(df,cdict=None,outdir=None):
    """ Plots land cover pie chart for all stations """
    for a in df.index.levels[0]:
        y=df.loc[a]["area"].sort_values(ascending=False)
        x = y.index
        percentage = 100.*y/y.sum()
        labels = ['{1:1.1f}% - {0}'.format(i,j) for i,j in zip(x, percentage)]
        colors = [cdict[k] for k in x]
        explode = [0.05]*len(x)
        fig,ax = plt.subplots()
        ax.pie(y, labels=None, startangle=90,colors=colors, radius=1.2, 
               explode=explode,
               wedgeprops = { 'linewidth' : 0, 'edgecolor' : 'k' }) # 0:no line
        ax.legend(bbox_to_anchor=(1.15, 1.05), labels=labels)
        ax.set_ylabel('')
        ax.set_title(a)
        # Donut
        my_circle=plt.Circle( (0,0), 0.7, color='white')
        p=plt.gcf()
        p.gca().add_artist(my_circle)
        if outdir:
            plt.savefig(f"{outdir}/{a}")


groups = [
LandCoverGroup("urban",keywords=["continuous"],cmap="Reds"),
LandCoverGroup("green",keywords=["green","pastures","crops"],cmap="Greens"),
LandCoverGroup("roads",keywords=["roads"],cmap="Greys"),
LandCoverGroup("other",keywords=[],cmap="Blues")
]

    
corine = gpd.read_file("Corine/Shapefiles/EL003L1_PATRA_UA2012.shp")
hobo = gpd.read_file("Hobo/stations.shp")

radius=200
hobo['geometry'] = hobo.geometry.buffer(radius)#Radius in m (in epsg3035)
hobo['area'] = hobo['geometry'].area

intersection = gpd.overlay(corine,hobo,how="intersection")
intersection = intersection[['Alias','ITEM2012','geometry']]
intersection['area'] = intersection['geometry'].area
intersection['LCTYPE'] = intersection.apply(lambda row: group_lc(row), axis=1)

grouped = intersection[["LCTYPE","Alias","area"]].groupby(["LCTYPE","Alias"])
ratios = grouped.apply(lambda x: round(x['area'].sum()/(np.pi*radius**2), 2))#.reset_index()
ratios = ratios.reset_index(name='LCRATIO').pivot(columns='LCTYPE', 
                                                index='Alias', 
                                                values='LCRATIO')
ratios = ratios.fillna(0)

sns.heatmap(data=ratios)

buffers = hobo.merge(ratios,on='Alias')
roads = corine.loc[corine["ITEM2012"].str.contains("roads")].copy()
# Reprojections for plots
roads_4326 = roads.to_crs(epsg=4326)
buffers_4326 = buffers.to_crs(epsg=4326)

#for g in groups:
#    plot_buffers_cmap(g,outdir="Maps")


my_groups = intersection[["LCTYPE","Alias","area"]].groupby(["Alias","LCTYPE"]).sum()
all_groups = intersection.groupby(["Alias",'ITEM2012']).sum()

cdict = {'urban': 'red', 'green': 'green', 'roads': 'grey', 'other':'blue'  }

styles = pd.read_csv('styles.txt',sep='\t')
styles_dict = dict(zip(styles["ITEM2012"],styles["Color"]))

#plot_pies(my_groups,cdict=cdict,outdir="Pies/Groups")
#plot_pies(all_groups,cdict=styles_dict, outdir="Pies/All")