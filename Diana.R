#perform divisive analysis
library(cluster)
DATA<-read.table(file="matrix.tmp")
DISS_MATRIX<-data.matrix(DATA, rownames.force = NA)
CLUSTER<-diana(DISS_MATRIX, diss = TRUE, keep.diss = TRUE)
HCLUST<-as.hclust(CLUSTER)


#plot tree as pdf
pdf("dendrogram.pdf")
DCLUST<-as.dendrogram(CLUSTER)
plot(DCLUST, type = "triangle", center = TRUE)
dev.off();

#for CH-index calculation: print out first 25 clusterings
file<-file("tree_diana.txt")
sink(file)
cat("#Nr_clusters", "\t", "Data", "\n")
sink(file, append=TRUE)
for (i in 2:20) {
     clustering<-cutree(HCLUST, k=i)
     cat( i, "\t") 
     cat( clustering, "\n")
}
# cat("#")