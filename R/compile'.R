install.packages("ggplot2")
library(ggplot2)
ggplot(mpg, aes(displ,hwy))+geom_point()
#add class by assigning unique color to unique class
ggplot(mpg, aes(displ,hwy))+geom_point(aes(color=class))
#add labels
ggplot(mpg, aes(displ,hwy))+geom_point(aes(color=class))+labs(x="Engine Displacement (liters)",y="Highway Miles per Gallon")
#change background theme - no fill
ggplot(mpg, aes(displ,hwy))+geom_point(aes(color=class))+labs(x ="Engine Displacement (liters)",y="Highway Miles per Gallon")+theme_bw()
#increase size of points
ggplot(mpg, aes(displ,hwy))+geom_point(aes(color=class),size=6)+labs(x ="Engine Displacement (liters)",y="Highway Miles per Gallon")+theme_bw()
#increase transpareny of points
ggplot(mpg, aes(displ,hwy))+geom_point(aes(color=class),size=6,alpha=0.3)+labs(x ="Engine Displacement (liters)",y="Highway Miles per Gallon")+theme_bw()
#add qualitative color schemes
ggplot(mpg, aes(displ,hwy))+geom_point(aes(color=class),size=6)+labs(x ="Engine Displacement (liters)",y="Highway Miles per Gallon")+scale_color_brewer(palette="Set1",name="")+theme_bw()

