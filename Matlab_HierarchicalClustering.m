ORDER = [4,3,2,5,6,7];
[data,headers,dummy] = xlsread('data_paper_Greek.xlsx');
headers = {headers{1,2:end}};
headers = headers(ORDER)

% discard useless last rows
data = data(1:17,ORDER);   
figure(2)
% OPTIONS:
%       'single'    --- nearest distance (default)
%      'complete'  --- furthest distance
%      'average'   --- unweighted average distance (UPGMA) (also known as
%                      group average)
%      'weighted'  --- weighted average distance (WPGMA)
%      'centroid'  --- unweighted center of mass distance (UPGMC)
%      'median'    --- weighted center of mass distance (WPGMC)
%      'ward'      --- inner squared distance (min variance algorithm)
Z = linkage(data','average','euclidean')
dendrogram(Z,'Labels', headers,'orientation', 'top');set(gca,'fontsize',20)

cophenet(Z,pdist(data','euclidean'))

inconsistent(Z,2)

c = cluster(Z,'cutoff',.4)

% %      crosstab(c,species)
%      dendrogram(Z)