library(ggplot2)
library(dplyr)

#Using R internal Data(mtcars)
View(mtcars)
mpg.cyl.plots=ggplot(mtcars,aes(x=cyl,y=mpg))+geom_boxplot(aes(group=cyl),color="red",fill="blue")+ggtitle("Gas Efficiency by cylinders")+xlab("Cylinders")+ylab("Miles per gallon")
mpg.cyl.plots

mtcars.four=mtcars%>%select(cyl,mpg,hp)%>%
  group_by(cyl)%>%
  summarize(sd=sd(mpg))
View(mtcars.four)

sum.mpg.cyl=mtcars%>%group_by(cyl)%>% summarize(m.mpg=mean(mpg))
View(sum.mpg.cyl)

cars.cyl=mtcars%>%group_by(cyl)%>%summarize(count=n())
View(cars.cyl)

mean.cyl.info=mtcars%>%group_by(cyl)%>% summarize(mean.mpg=mean(mpg),mean.wt=mean(wt),mean.drat=mean(drat),mean.disp=mean(disp),mean.hp=mean(hp))
View(mean.cyl.info)

min.max.cyl=mtcars%>%group_by(cyl)%>%summarize(min.mpg=min(mpg),max.mpg=max(mpg))
View(min.max.cyl)

best.four=mtcars%>%select(cyl,mpg,hp)%>%
  filter(cyl==4)%>%
  filter(mpg>26.66364)%>%
  arrange(desc(mpg))%>%
  arrange(desc(hp))
View(best.four)

best.six=mtcars%>%select(cyl,mpg,hp)%>%
  filter(cyl==6)%>%
  filter(mpg>19.74286)%>%
  arrange(desc(mpg))%>%
  arrange(desc(hp))
View(best.six)

best.eight=mtcars%>%select(cyl,mpg,hp)%>%
  filter(cyl==8)%>%
  filter(mpg>15.10000)%>%
  arrange(desc(mpg))%>%
  arrange(desc(hp))
View(best.eight)


