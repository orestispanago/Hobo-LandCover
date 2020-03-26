import os
import glob
import pandas as pd
import seaborn as sns


csvfiles = glob.glob(os.getcwd()+"/Ratios/*.csv")
fname = os.path.basename(csvfiles[0].split('.')[0])

dflist = []
for f in csvfiles:
    fname = os.path.basename(f.split('.')[0])
    df = pd.read_csv(f, usecols=[0,5], skiprows=1, index_col=0, 
                     names=["Alias",fname])
    dflist.append(df)
    
large = pd.concat(dflist,sort=False,axis=1)
large=large.fillna(0)

sns.heatmap(large,annot=True)

