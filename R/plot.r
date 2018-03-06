library(tidyverse)
library(sf)
library(rvest)
library(stringr)
library(scales)
map.world <- ggplot2::map_data('world')
# country = region, e.g. region == "USA"
# state  = subregion e.g. subregion =="Florida"
gxSESmapValues = data.frame(subregion="Florida", gxSES = 1)
gxSESmap <- merge(map.world, gxSESmapValues, by = 'subregion') 
ggplot(gxSESmap, aes( x = long, y = lat, group = group )) + geom_polygon(aes(fill = gxSES))

pp = ggplot(gxSESmap, aes( x = long, y = lat, group = group ))
pp = pp + geom_polygon(aes(fill = gxSES, color = as.factor(opec_ind)))
pp = pp + scale_fill_gradientn(colours = c('#461863','#404E88','#2A8A8C','#7FD157','#F9E53F')
	,values = scales::rescale(c(100,96581,822675,3190373,10000000))
	,labels = comma, breaks = c(100,96581,822675,3190373,10000000))
pp = pp + guides(fill = guide_legend(reverse = T))
pp = pp + labs(fill = 'Barrels per day\n2016' ,color = 'OPEC Countries',title = 'OPEC countries produce roughly 44% of world oil' ,x = NULL,y = NULL)
pp = pp + theme(text = element_text(family = 'Gill Sans', color = '#EEEEEE')
        ,plot.title = element_text(size = 28)
        ,plot.subtitle = element_text(size = 14)
        ,axis.ticks = element_blank()
        ,axis.text = element_blank()
        ,panel.grid = element_blank()
        ,panel.background = element_rect(fill = '#333333')
        ,plot.background = element_rect(fill = '#333333')
        ,legend.position = c(.18,.36)
        ,legend.background = element_blank()
        ,legend.key = element_blank()
  )
pp = pp + annotate(geom = 'text' ,label = 'Source: U.S. Energy Information Administration\nhttps://en.wikipedia.org/wiki/List_of_countries_by_oil_production\nhttps://en.wikipedia.org/wiki/OPEC'
           ,x = 18, y = -55
           ,size = 3
           ,family = 'Gill Sans'
           ,color = '#CCCCCC'
           ,hjust = 'left'
  )
pp = pp + scale_color_manual(values = c('1' = 'orange', '0' = NA), labels = c('1' = 'OPEC'), breaks = c('1'))

pp