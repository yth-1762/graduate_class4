library(dplyr)
library(plyr)
library(VGAM)

rdata <- read.csv("C:\\data\\orbits.csv", header = T)
str(rdata)

table(rdata$Object.Classification)

# remove row, columns
orbits <- rdata %>% 
  select(-c(1,3,14)) %>%
  filter(!Object.Classification == "Apohele Asteroid" & !Object.Classification == "Apohele Asteroid (Hazard)")

#table(is.na(orbits$Orbit.Axis..AU.))
#table(is.na(orbits$Orbit.Eccentricity))
#table(is.na(orbits$Orbit.Inclination..deg.))
#table(is.na(orbits$Perihelion.Argument..deg.))
#table(is.na(orbits$Node.Longitude..deg.))
#table(is.na(orbits$Mean.Anomoly..deg.))
#table(is.na(orbits$Perihelion.Distance..AU.))
#table(is.na(orbits$Aphelion.Distance..AU.))
#table(is.na(orbits$Orbital.Period..yr.))
#table(is.na(orbits$Minimum.Orbit.Intersection.Distance..AU.))
#table(is.na(orbits$Asteroid.Magnitude)) # missing value

orbits$Asteroid.Magnitude <- as.numeric(orbits$Asteroid.Magnitude)

# remove NAs
orbits <- na.omit(orbits)
dim(orbits)

orbits$Object.Classification <- as.factor(orbits$Object.Classification)
table(orbits$Object.Classification)

levels(orbits$Object.Classification)[levels(orbits$Object.Classification) == "Amor Asteroid"] <- "Amor"
levels(orbits$Object.Classification)[levels(orbits$Object.Classification) == "Amor Asteroid (Hazard)"] <- "Amor"
levels(orbits$Object.Classification)[levels(orbits$Object.Classification) == "Apollo Asteroid"] <- "Apollo"
levels(orbits$Object.Classification)[levels(orbits$Object.Classification) == "Apollo Asteroid (Hazard)"] <- "Apollo"
levels(orbits$Object.Classification)[levels(orbits$Object.Classification) == "Aten Asteroid"] <- "Aten"
levels(orbits$Object.Classification)[levels(orbits$Object.Classification) == "Aten Asteroid (Hazard)"] <- "Aten"
table(orbits$Object.Classification)

str(orbits$Object.Classification)
head(orbits)
dim(orbits)

orbits.x <- scale(orbits[,-c(1)])
summary(orbits.x)
orbits.y <- orbits[,c(1)]

orbits <- cbind(orbits.y, orbits.x)

attach(orbits)

###############################################################################################

fit1 <- vglm(Object.Classification ~. ,multinomial, data = orbits)
coef(fit1, matrix = T) #Aten baseline category
conint(fit1, method = "profile")
