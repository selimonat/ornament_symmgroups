%%
nrow = 3
ncol = 4
%
subplot(nrow,ncol,1)
group1 = [1,0];
group2 = [-1,0];
SimilaritySimulation(group1 ,group2)
subplot(nrow,ncol,1+ncol)
SimilaritySimulation(group1 -mean(group1),group2-mean(group2),'MINUS MEAN')
subplot(nrow,ncol,1+ncol*2)
SimilaritySimulation(group1 /sum(group1),group2/sum(group2),'DIVIDE by SUM')

subplot(nrow,ncol,2)
group1 = [1,0];
group2 = [0,1];
SimilaritySimulation(group1 ,group2)
subplot(nrow,ncol,2+ncol)
SimilaritySimulation(group1 -mean(group1),group2-mean(group2),'MINUS MEAN')
subplot(nrow,ncol,2+ncol*2)
SimilaritySimulation(group1 /sum(group1),group2/sum(group2),'DIVIDE by SUM')

subplot(nrow,ncol,3)
group1 = [.6,.8];
group2 = [.8,.6];
SimilaritySimulation(group1 ,group2)
subplot(nrow,ncol,3+ncol)
SimilaritySimulation(group1 -mean(group1),group2-mean(group2),'MINUS MEAN')
subplot(nrow,ncol,3+ncol*2)
SimilaritySimulation(group1 /sum(group1),group2/sum(group2),'DIVIDE by SUM')

subplot(nrow,ncol,4)
group1 = [.6,.8]*3;
group2 = [.8,.6];
SimilaritySimulation(group1 ,group2)
subplot(nrow,ncol,4+ncol)
SimilaritySimulation(group1 -mean(group1),group2-mean(group2),'MINUS MEAN')
subplot(nrow,ncol,4+ncol*2)
SimilaritySimulation(group1 / sum(group1),group2/sum(group2),'DIVIDE by SUM')
