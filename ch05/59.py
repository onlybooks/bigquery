import seaborn as sns
ax = sns.regplot(badtrips['num_trips'],badtrips['fraction_bad']);
ax.set_ylim(0, 0.05);