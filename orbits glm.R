orbits<-read.table('orbits3.csv',header=TRUE,sep=',')
library(VGAM)


#scalce 변수 생성##
au<-scale(orbits$Orbit.Axis..AU.)
eccentricity<-scale(orbits$Orbit.Eccentricity)
inclination<-scale(orbits$Orbit.Inclination..deg.)
perihelion<-scale(orbits$Perihelion.Argument..deg.)
node<-scale(orbits$Node.Longitude..deg.)
anomoly<-scale(orbits$Mean.Anomoly..deg.)
periheliondistance<-scale(orbits$Perihelion.Distance..AU.)
apheliondistance<-scale(orbits$Aphelion.Distance..AU.)
orbitalperiod<-scale(orbits$Orbital.Period..yr.)
minimumorbit<-scale(orbits$Minimum.Orbit.Intersection.Distance..AU.)
magnitude<-scale(as.numeric(orbits$Asteroid.Magnitude))

orbits2<-data.frame(y=orbits$Object.Classification,au=au,eccentricity=eccentricity,inclination=inclination,
                    perihelion=perihelion,node=node,anomoly=anomoly,periheliondistance=periheliondistance,
                    apheliondistance=apheliondistance,orbitalperiod=orbitalperiod,minimumorbit=minimumorbit,
                    magnitude=magnitude)

orbits2<-na.omit(orbits2)




fit <- vglm(formula=factor(y)~au+eccentricity+inclination+perihelion+node+anomoly+periheliondistance+
              apheliondistance+orbitalperiod+minimumorbit+magnitude, 
            family=multinomial,data=orbits2)
fit2 <- vglm(formula=factor(y)~1, 
            family=multinomial,data=orbits2)
fit3 <- vglm(formula=factor(y)~eccentricity+periheliondistance+orbitalperiod, 
            family=multinomial,data=orbits2)
fit4 <- vglm(formula=factor(y)~eccentricity+periheliondistance, 
             family=multinomial,data=orbits2)


fit2
fit3
fit
summary(fit)
summary(fit3)
summary(fit4)
fitted(fit)




#discrete choice model(mlogit package)##

install.packages("mlogit")
library(mlogit)
data(Fishing)
head(Fishing)
Fishing$mode
mfit<-mlogit(formula=factor(y)~au+eccentricity+inclination+perihelion+node+anomoly+periheliondistance+
                    apheliondistance+orbitalperiod+minimumorbit+magnitude, 
                  family=multinomial,data=orbits2)

# 필요한 패키지 로드
library(mlogit)

# 예제 데이터 생성
choice <- c(1, 0, 0, 1, 0, 1)  # 선택 여부 (1: 제품 A 선택, 0: 제품 B 선택)
price <- c(10, 8, 12, 9, 7, 11)  # 가격
quality <- c(8, 7, 6, 9, 8, 7)  # 품질

# 데이터 프레임 생성
df <- data.frame(choice, price, quality)

# 데이터 변환 (mlogit 패키지에서 사용하는 형식으로 변환)
df_mlogit <- mlogit.data(df, choice = "choice", shape = "wide")

# 모델 fitting
model <- mlogit(choice ~ price + quality, data = df_mlogit)

# 모델 요약 정보 출력
summary(model)


  
install.packages("nnet")  
library(nnet)

# 예제 데이터 생성
choice <- c(1, 2, 3, 2, 3, 1)  # 선택된 제품의 인덱스 (1, 2, 3)
price <- c(10, 8, 12, 9, 7, 11)  # 가격
quality <- c(8, 7, 6, 9, 8, 7)  # 품질

# 데이터 프레임 생성
df <- data.frame(choice, price, quality)

# 모델 fitting
model <- multinom(formula=factor(y)~au+eccentricity+inclination+perihelion+node+anomoly+periheliondistance+
                    apheliondistance+orbitalperiod+minimumorbit+magnitude, data = orbits2)

# 모델 요약 정보 출력
summary(model)
