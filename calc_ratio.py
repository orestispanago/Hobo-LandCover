import os
import numpy as np
import pandas as pd

os.chdir("C:/Users/user/Mega/Drafts/Hobo-mobile/QGIS/Points-Land-Use-Buffer")

df = pd.read_csv("400/400area.csv")

by_alias = df.groupby(['Alias','Lat','Lon'],as_index=False)['area'].sum()

by_alias['Road_Buffer_Ratio'] = by_alias['area']/(np.pi*400**2)

by_alias.to_csv('buffer 400 ratio.csv',index=False)