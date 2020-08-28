function SimilaritySimulation(x,y,varargin)

title_addon = ''
if ~isempty(varargin)
    title_addon = varargin{1}
end
    
plotv(x(:),'r-o')
hold on
plotv(y(:),'k-o')
hold off
xlim([-3,3]);
ylim([-3,3]);
set(gca,'XTick',[-3,-2,-1,0,1,2,3]);
set(gca,'YTick',[-3,-2,-1,0,1,2,3]);
xlabel('Symm.Group 1')
ylabel('Symm.Group 2')
grid on;
set(gca,'fontsize',16)

dis_cos = pdist([x;y],'cosine');
dis_euc = pdist([x;y],'euclidean');
dis_cor = 1-pdist([x;y],'correlation');

title(sprintf('%s\nCosine Dissimilarity: %.2f\nEuclidean Dissimilarity: %.2f\nCorrelation: %.2f\n',title_addon,dis_cos,dis_euc,dis_cor),'fontsize',16)
axis square


