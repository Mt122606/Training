#Data Exploration
library(gapminder)
levels(gapminder$country)
#Choose 5 Countries
library(dplyr)
exp=data.frame(gapminder)
View(exp)
exp.5=filter(exp,country %in% c("Egypt","Jordan","Brazil","Philippines","Mexico"))
View(exp.5)

#Which country of the five you chose has the lowest per capita GDP in 1952? In 2007?
low.GDP.1952=filter(exp.5,year == 1952)%>%
  arrange(desc(gdpPercap))%>%
  filter(gdpPercap==min(gdpPercap))%>%
  select(country,gdpPercap)
View(low.GDP.1952)

low.GDP.2007=filter(exp.5,year == 2007)%>%
  arrange(desc(gdpPercap))%>%
  filter(gdpPercap==min(gdpPercap))%>%
  select(country,gdpPercap)
View(low.GDP.2007)

#Which has the highest per capita GDP in 1952? In 2007?
high.GDP.1952=filter(exp.5,year == 1952)%>%
  arrange(desc(gdpPercap))%>%
  filter(gdpPercap==max(gdpPercap))%>%
  select(country,gdpPercap)
View(high.GDP.1952)

high.GDP.2007=filter(exp.5,year == 2007)%>%
  arrange(desc(gdpPercap))%>%
  filter(gdpPercap==max(gdpPercap))%>%
  select(country,gdpPercap)
View(high.GDP.2007)

gapmindermeangdp=gapminder%>%summarise(mean.GDP=mean(gdpPercap))
View(gapmindermeangdp)
gapmindermeangdp1952=filter(gapminder,country!="Kuwait")%>%filter(year==1952)%>%
  summarise(mean.GDP1952=mean(gdpPercap))
View(gapmindermeangdp1952)
gapmindermeangdp2007=filter(gapminder,year==2007)%>%
  summarise(mean.GDP2007=mean(gdpPercap))
View(gapmindermeangdp2007)

#Create a line plot with year on the horizontal axis and lifeExp on the vertical axis for the five countries; give each country a different color line. 
library(ggplot2)
exp.5.life.line=ggplot(exp.5, aes(x = year, y = lifeExp, color = country),) +
  geom_point(aes(alpha = gdpPercap),size=3) + geom_line()+ylab("Life Expectancy")+xlab("Year")+ggtitle("Life Expectancy per Year")
exp.5.life.line

exp.5.GDP.line=ggplot(exp.5, aes(x = year, y = gdpPercap, color = country)) +
  geom_point(aes(alpha = lifeExp),size=3) + geom_path()+scale_alpha(range = c(0.3, 1.0))+
  ggtitle("Gross Domestic Product per capital per Year")

library(gridExtra)
grid.arrange(exp.5.life.line,exp.5.GDP.line, ncol = 2)
#Relationship
cor.test(exp.5$lifeExp, exp.5$gdpPercap, method="pearson", use = "complete.obs")
#strong correlation 
exp.5_quant <- exp.5[, c(4,5,6)]
library("PerformanceAnalytics")
chart.Correlation(exp.5_quant, histogram=FALSE, method="pearson")
corr_matrix <- cor(exp.5_quant)
cor(exp.5_quant)
#Could not get to work?
library(corrplot)
corrplot(corr_matrix, type="lower", order="hclust", p.mat = corr_matrix, sig.level = 0.01)

#Describe the variations in life expectancy between the countries.
ggplot(exp.5, aes(x = lifeExp, y = gdpPercap, color = country)) +
  geom_point(aes(alpha = year), size = 3) + geom_path() +
  scale_alpha(range = c(0.3, 1.0))
IT.exp.5=t.test(exp.5$lifeExp,exp.5$gdpPercap,alternative = "two.sided",var.equal = FALSE)
IT.exp.5
#On the entire gapminder data frame, compute the median of lifeExp for each year. 
median.life.year=gapminder%>%
  group_by(year)%>%
  summarise(medianLifeExp=median(lifeExp))
View(median.life.year)

median.life.line=ggplot(median.life.year, aes(x = year, y = medianLifeExp)) +
  geom_point() + geom_line()+ggtitle("Median Life Expectancy per Year")
median.life.line

#not used
lifebox=ggplot(gapminder, aes(x = factor(year), y = lifeExp)) + geom_boxplot()
lifebox

grid.arrange(exp.5.life.line,median.life.line, ncol = 2)

#For what years is the life expectancy for your five countries above the median life expectancy for the entire gapminder data frame?
gap.median.life=gapminder%>%
  summarise(mediallifeExp=median(lifeExp))
View(gap.median.life)

high.lifeExp.5=exp.5%>%filter(lifeExp>60.7125)%>%
  select(country,lifeExp,year)%>%
  mutate(amountAbovemedian=lifeExp-60.7125)%>%
  arrange(desc(country))
View(high.lifeExp.5)
