import os
import glob
import pandas as pd
import matplotlib.pyplot as plt

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
          'figure.constrained_layout.use': True}
plt.rcParams.update(params)


csvfiles = glob.glob('Road-Buffer-Ratio/*.csv')
df_list = []
for csvfile in csvfiles:
    buffer_radius = int(os.path.basename(csvfile).split('.')[0])
    df = pd.read_csv(csvfile,usecols=['Alias','Road_Buffer_Ratio'])

    table = pd.pivot_table(df, values='Road_Buffer_Ratio',index=['Alias'])
    table = table.rename(columns={"Road_Buffer_Ratio": buffer_radius})
    
    df_list.append(table)

large = pd.concat(df_list,axis=1,sort=False)
large = large.T
large = large.fillna(0)

plt.figure(figsize=(10,4))
for i in large.columns:
    plt.plot(large[i])
    plt.legend(bbox_to_anchor=(1, 1.05))
plt.ylabel('Road-Buffer area ratio')
plt.xlabel('Buffer radius (m)')
plt.savefig('ratio-buffer-radius')
plt.show()

