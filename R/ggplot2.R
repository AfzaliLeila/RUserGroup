#Sample Code for illustration of ggplot2

#install & load ggplot2 library and dplyr for examples
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

#ggplot2 vs base plot
load(url("http://varianceexplained.org/files/ggplot2_example.rda"))
top_data <- cleaned_data %>%  semi_join(top_intercept, by = "systematic_name")

ggplot(top_data, aes(rate,expression,color=nutrient))+geom_point()+geom_smooth(method='lm',se=FALSE)+facet_wrap(~name+systematic_name,scales="free_y")

#more information on geoms
geoms<-help.search("geom_",package="ggplot2")
geoms$matches[c(4,6,8,17,30),1:2]
(geoms$matches[1:8,1:2])
#using mpg dataset included in ggplot2 package

#install & load ggplot2 library and dplyr for examples
install.packages("ggplot2")
library(ggplot2)

#view first few lines of dataset 
head(mpg)
#structure of dataframe
str(mpg) 

#to learn more about variables
?mpg 

#variable description
#displ- engine size (litres)
#hwy- highway fuel efficiency (mpg)


#creating a ggplot to describe relationship b/w engine size (displ) and fuel efficency (hwy)
ggplot(data=mpg) 
#scatterplot
ggplot()+geom_point(data=mpg,aes(x=displ,y=hwy))
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))



#simple plots
ggplot(mpg,aes(displ,hwy))+geom_point()
ggplot(mpg,aes(displ,hwy))+geom_point(aes(color=class))

#add layer
p<-ggplot(mpg,aes(displ,hwy,color=class))
p+layer(geom="point",stat="identify",position="identify",geom_params=list(size=7))
#types of cars
levels(as.factor(mpg$class))
#if outliers are hybrids would expect them to be compact or subcompact

#add third variable class as color aesthetic
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,color=class))
#alternatively
require(gridExtra)
p1<-ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,alpha=class))
p2<-ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,shape=class))
grid.arrange(p1,p2,ncol=2)

#facets
ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy)) +   facet_wrap(~ class, nrow = 2)
ggplot(data = mpg) +   geom_point(mapping = aes(x = displ, y = hwy)) +   facet_grid(drv ~ cyl)
















#Labels & Annotations

ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  labs(title = "Fuel Efficiency by Engine Power",
       subtitle = "Fuel economy data from 1999 and 2008 for 38 popular models of cars",
       x = "Engine power (litres displacement)",
       y = "Fuel Efficiency (miles per gallon)",
       color = "Car Type")



# #Managing scales
# # color the data by engine type
# ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
#   geom_point()
# # same as above, with explicit scales
# ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
#   geom_point() +
#   scale_x_continuous() +
#   scale_y_continuous() +
#   scale_colour_discrete()
# 
# ggplot(mpg, aes(x = class, fill = drv)) + 
#   geom_bar(position = "fill") +
#   scale_y_continuous(breaks = seq(0, 1, by = .2), labels = scales::percent)
# 
# # default color brewer
# ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
#   geom_point() +
#   scale_color_brewer()
# 
# # specifying color palette
# ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
#   geom_point() +
#   scale_color_brewer(palette = "Set3")
# 
# #Coordinate SystemsCoordinate Systems
# # zoom in with coord_cartesian
# ggplot(mpg, aes(x = displ, y = hwy)) +
#   geom_point() +
#   coord_cartesian(xlim = c(0, 5))
# 
# # flip x and y axis with coord_flip
# ggplot(mpg, aes(x = class)) +
#   geom_bar() +
#   coord_flip()

######################################################
# color aesthetic specified for only the geom_point layer
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE)
ggplot(data = mpg, aes(x = hwy)) +
  geom_histogram() 


