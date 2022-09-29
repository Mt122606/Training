library(ggplot2)
library(dplyr)

#Using R internal Data(mtcars)
View(mtcars)
mpg.cyl.plots=ggplot(mtcars,aes(x=cyl,y=mpg))+geom_boxplot(aes(group=cyl),color="red",fill="blue")+ggtitle("Gas Efficiency by cylinders")+xlab("Cylinders")+ylab("Miles per gallon")
mpg.cyl.plots

mtcars.sd=mtcars%>%select(cyl,mpg,hp)%>%
  group_by(cyl)%>%
  summarize(sd=sd(mpg))
View(mtcars.sd)

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

mtcars.four=mtcars%>%
  select(cyl,mpg)%>%
  filter(cyl==4)%>%
  select(mpg)
View(mtcars.four)

t_four <- t.test(mtcars.four, mu = 20)
print(t_four)

mtcars.eight=mtcars%>%
  select(cyl,mpg)%>%
  filter(cyl==8)%>%
  select(mpg)
View(mtcars.eight)
#single Sample
t_eight <- t.test(mtcars.eight, mu = 15)
print(t_eight)

his.eight=ggplot(mtcars.eight,aes(x=mpg))+
  geom_histogram(binwidth = 2, fill="purple")+
  geom_vline(xintercept = t_eight$conf.int[1], color = "red") +
  geom_vline(xintercept = t_eight$conf.int[2], color = "red") +
  geom_vline(xintercept = t_eight$null.value, color = "green")
his.eight

qq.eight=ggplot(mtcars.eight,aes(sample=mpg))+geom_qq()
qq.eight

#independent 
hp.disp=t.test(mtcars$hp,mtcars$disp,alternative = "two.sided",var.equal = FALSE)
hp.disp
library(reshape2)
mtcars.mpg=select(mtcars,cyl,mpg)%>%
  arrange(cyl)%>%
  mutate(cyl,)
View(mtcars.mpg)

