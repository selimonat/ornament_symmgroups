clear all;
clf;
%% 
% SET PARAMETERS FOR ANALYSIS
% which metric to use for computing distances.
% type help pdist to see other options.
DISTANCE_METRIC = 'euclidean'%'correlation'
% 
MDS_TYPE = 'classical' % classical uses cmdscale function (classical mds), 
% in order to use mdscale function change MDS_TYPE to something else.
% read their documentation with help cmdscale or help mdscale


% READ DATA
fprintf('importing data\n');
data = xlsread('symm_groups.xlsx');
fprintf('imported data looks like this:\n');
% discard useless last rows
data = data(1:17,[4,3,2,5,6]);
fprintf('the size of the data (symmetry groups X cultures)\n');
size(data);

% ANALYZE
fprintf('computing dissimilarities\n');
dissimilarities = pdist(data',DISTANCE_METRIC);
% pdist returns a vector, reformat it to a dissimilarity matrix
% for plotting.

% DISPLAY DISSIMILARITY MATRIX
matrix_form     = squareform(dissimilarities);
figure(1);clf;subplot(3,4,1);
imagesc(matrix_form);colorbar;
title('Dissimilarity Matrix with original data')
%
if strcmp(MDS_TYPE,'classical')
    fprintf('Using classical')
    [Y,stress] = cmdscale(dissimilarities,4);
else
    [Y,stress] = mdscale(dissimilarities,4,'criterion','metricstress');
end
stress
% How good we approximate the original dissimilarity matrix when using only
% 1 dimension
maxerr2 = mean(abs(dissimilarities - pdist(Y(:,1),DISTANCE_METRIC)));
figure(1);subplot(3,4,2);
imagesc(squareform( pdist(Y(:,1),DISTANCE_METRIC)));colorbar;
title(sprintf(['Dissimilarity Matrix with 1 MDS dimensions \n mean(abs(Error)):' mat2str(maxerr2,3) ]))
subplot(3,4,3);
imagesc(squareform(abs(dissimilarities - pdist(Y(:,1),DISTANCE_METRIC))));colorbar;
title(sprintf(['Reconstruction Error (dimen = 1)']));
subplot(3,4,4);
plot(Y(:,1),'o');title('MDS plot');

% How good we approximate the original dissimilarity matrix when using only
% 2 dimensions
maxerr3 = mean(abs(dissimilarities - pdist(Y(:,1:2),DISTANCE_METRIC)));
figure(1);subplot(3,4,6);
imagesc(squareform( pdist(Y(:,1:2),DISTANCE_METRIC)));colorbar;
title(sprintf(['Dissimilarity Matrix with 2 MDS dimensions \n mean(abs(Error)):' mat2str(maxerr3,3) ]));
subplot(3,4,7);
imagesc(squareform(abs(dissimilarities - pdist(Y(:,1:2),DISTANCE_METRIC))));colorbar;
title(sprintf(['Reconstruction Error (dimen = 2)']));
subplot(3,4,8);
plot(Y(:,1),Y(:,2),'o');title('MDS plot');

% How good we approximate the original dissimilarity matrix when using only
% 3 dimension
maxerr4 = mean(abs(dissimilarities - pdist(Y(:,1:3),DISTANCE_METRIC)));
figure(1);subplot(3,4,10);
imagesc(squareform( pdist(Y(:,1:3),DISTANCE_METRIC)));colorbar;
title(sprintf(['Dissimilarity Matrix with 3 MDS dimensions \n mean(abs(Error)):' mat2str(maxerr4,3) ]));
subplot(3,4,11);
imagesc(squareform(abs(dissimilarities - pdist(Y(:,1:3),DISTANCE_METRIC))));colorbar;
title(sprintf(['Reconstruction Error (dimen = 3)']));