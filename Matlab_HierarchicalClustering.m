ORDER = [4,3,2,5,6,7];
[data,headers,dummy] = xlsread('data_paper_Greek.xlsx');
headers = {headers{1,2:end}};
headers = headers(ORDER);
% discard useless last rows
data = data(1:17,ORDER);   
figure(2)
Z = linkage(data','complete','euclidean');
dendrogram(Z,'Labels', headers,'orientation', 'left')

set(gca,'fontsize',20)