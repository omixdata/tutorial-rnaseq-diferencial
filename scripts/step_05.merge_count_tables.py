import pandas as pd

samples = [l.strip("\n") for l in open("samples").readlines()]
samples_df = [pd.read_csv('read_count/%s.count'%sample, sep="\t", header=None, names=['locus_tag', sample]) for sample in samples]
merged_df = samples_df[0][['locus_tag']]

for s,sample in enumerate(samples):
	merged_df[sample] = samples_df[s][sample]

merged_df.drop(merged_df.tail(5).index,inplace=True)
merged_df.to_csv("read_count/merged.csv", index=False)
