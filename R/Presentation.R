library(rmarkdown)
library(ggplot2)
library(ggrepel)

# if (!require("yaml")) {
#    install.packages("yaml", repos="http://cran.rstudio.com/") 
#    library("yaml")
#  }

#Base Plotting vs ggplot2
data(diamonds)
plot(diamonds$carat,diamonds$price,col= diamonds$color,pch = as.numeric(diamonds$cut))
ggplot(diamonds, aes(carat, price, col = color, shape = cut)) +
  geom_point()

#Basics 

# create canvas
ggplot(mpg)

# variables of interest mapped
ggplot(mpg, aes(x = displ, y = hwy))

# data plotted
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()


#Aesthetic Mappings
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()

#Geoms
#Left: x and y mapping needed!
require(gridExtra)
l1<-ggplot(mpg,aes(x=displ,y=hwy))+ geom_point()
l2<-ggplot(mpg,aes(x=displ,y= hwy))+geom_smooth()

#Right: no y mapping needed!
r1<-ggplot(mpg,aes(x=class))+geom_bar()  
r2<-ggplot(mpg,aes(x=displ,y=hwy))+geom_point(color="blue")+geom_smooth(color="red")
grid.arrange(l1,r1,l2,r2, ncol=2,nrow=2)

#add points and smooth line
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+geom_smooth()

#geom aesthetics
ggplot(mpg,aes(x=displ,y=hwy))+ geom_point(color="blue")+geom_smooth(color="red")

# color aesthetic passed to each geom layer
p1<-ggplot(mpg,aes(x=displ,y=hwy,color=class))+geom_point()+geom_smooth(se=FALSE)
# color aesthetic specified for only the geom_point layer
p2<-ggplot(mpg,aes(x=displ,y=hwy))+geom_point(aes(color=class))+geom_smooth(se=FALSE)
grid.arrange(p1,p2, ncol=2)

#Statistical Transformations
class_count <- dplyr::count(mpg, class)
q1<-ggplot(mpg,aes(x=class))+geom_bar()
q2<-ggplot(class_count,aes(x=class,y=n))+geom_bar(stat = "identity")
grid.arrange(q1,q2, nrow=2)

ggplot(mpg,aes(displ,hwy))+geom_point(color="grey") + 
  stat_summary(fun.y ="mean",geom ="line",size = 1,linetype ="dashed")


#Facets
ggplot(mpg,aes(x=displ,y=hwy)) +geom_point() +facet_grid(~class)

ggplot(mpg,aes(x=displ,y=hwy))+ geom_point()+facet_grid(year~cyl)


#labels and annotations
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  labs(title = "Fuel Efficiency by Engine Power",
       subtitle = "Fuel economy data from 1999 and 2008 for 38 popular models of cars",
       x = "Engine power (litres displacement)",
       y = "Fuel Efficiency (miles per gallon)",
       color = "Car Type")

library(dplyr)

#table of each car that has best efficiency of its type
best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

ggplot(mpg,aes(x=displ,y=hwy)) + 
  geom_point(aes(color=class)) +
  geom_label(data=best_in_class,aes(label=model),alpha=0.5)

#resolve overlapping labels 
library(ggrepel)

ggplot(mpg,aes(x=displ,y=hwy))
+ geom_point(aes(color=class)) 
+ geom_text_repel(data=best_in_class,aes(label=model))

