library(ggplot2)

spectrum <- read.csv("./data/galaxyoutflow.csv")

#Variando log(nH)

vg <- 100
vo <- 100
lnh <- c(20.125,20.5625,21.25,22.25)

spectrum_sub <- spectrum[spectrum$v_gal==vg,]
spectrum_sub <- spectrum_sub[spectrum_sub$v_out==vo,]
#spectrum_sub <- spectrum_sub[spectrum_sub$lognh==lnh,]

text = paste(c("v_out =", vo, "km/s \n", "v_gal =", vg, "km/s"), collapse=" ")

df1 <- spectrum_sub[spectrum_sub$lognh==lnh[1],]
df2 <- spectrum_sub[spectrum_sub$lognh==lnh[2],]
df3 <- spectrum_sub[spectrum_sub$lognh==lnh[3],]
df4 <- spectrum_sub[spectrum_sub$lognh==lnh[4],]

ggplot(df1,aes(x,y)) + geom_line(aes(color="log(nH) = 20.125"), size=1.3)+
  geom_line(data=df2,aes(color="log(nH) = 20.5625"), size=1.3)+
  geom_line(data=df3,aes(color="log(nH) = 21.25"), size=1.3)+
  geom_line(data=df4,aes(color="log(nH) = 22.25"), size=1.3)+
  labs(x="Lambda (A)", y="Intensity (Arbitrary Units)", color=text, size = 40) + 
  xlim(1210, 1227) + ylim(0, 7000) 

#Variando v_out

vg <- 100
vo <- c(100,200,300)
lnh <- c(20.125, 21.25)

spectrum_sub_i <- spectrum[spectrum$v_gal==vg,]
#spectrum_sub <- spectrum_sub[spectrum_sub$v_out==vo,]
#spectrum_sub <- spectrum_sub[spectrum_sub$lognh==lnh,]

spectrum_sub <- spectrum_sub_i[spectrum_sub_i$lognh==lnh[1],]
text = paste(c("log(nH) =", lnh[1], "\n v_gal =", vg, "km/s"), collapse=" ")

df1 <- spectrum_sub[spectrum_sub$v_out==vo[1],]
df2 <- spectrum_sub[spectrum_sub$v_out==vo[2],]
df3 <- spectrum_sub[spectrum_sub$v_out==vo[3],]

ggplot(df1,aes(x,y)) + geom_line(aes(color="v_out = 100 km/s"), size=1.3)+
  geom_line(data=df2,aes(color="v_out = 200 km/s"), size=1.3)+
  geom_line(data=df3,aes(color="v_out = 300 km/s"), size=1.3)+
  labs(x="Lambda (A)", y="Intensity (Arbitrary Units)", color=text, size = 40) + 
  xlim(1210, 1225) + ylim(0, 7000) 

spectrum_sub <- spectrum_sub_i[spectrum_sub_i$lognh==lnh[2],]
text = paste(c("log(nH) =", lnh[2], "\n v_gal =", vg, "km/s"), collapse=" ")

df1 <- spectrum_sub[spectrum_sub$v_out==vo[1],]
df2 <- spectrum_sub[spectrum_sub$v_out==vo[2],]
df3 <- spectrum_sub[spectrum_sub$v_out==vo[3],]

ggplot(df1,aes(x,y)) + geom_line(aes(color="v_out = 100 km/s"), size=1.3)+
  geom_line(data=df2,aes(color="v_out = 200 km/s"), size=1.3)+
  geom_line(data=df3,aes(color="v_out = 300 km/s"), size=1.3)+
  labs(x="Lambda (A)", y="Intensity (Arbitrary Units)", color=text, size = 40) + 
  xlim(1210, 1225) + ylim(0, 7000) 

#Variando v_gal

vg <- c(0,20,100,200)
vo <- 100
lnh <- 20.9375

#spectrum_sub <- spectrum[spectrum$v_gal==vg,]
spectrum_sub <- spectrum[spectrum$v_out==vo,]
spectrum_sub <- spectrum_sub[spectrum_sub$lognh==lnh,]

text = paste(c("v_out =", vo, "km/s \n", "log(nH) =", lnh), collapse=" ")

df1 <- spectrum_sub[spectrum_sub$v_gal==vg[1],]
df2 <- spectrum_sub[spectrum_sub$v_gal==vg[2],]
df3 <- spectrum_sub[spectrum_sub$v_gal==vg[3],]
df4 <- spectrum_sub[spectrum_sub$v_gal==vg[4],]

ggplot(df1,aes(x,y)) + geom_line(aes(color="v_gal = 0 km/s"))+
  geom_line(data=df2,aes(color="v_gal = 20 km/s"))+
  geom_line(data=df3,aes(color="v_gal = 100 km/s"))+
  geom_line(data=df4,aes(color="v_gal = 200 km/s"))+
  labs(x="Lambda (A)", y="Intensity (Arbitrary Units)", color=text, size = 40) + 
  xlim(1210, 1223) + ylim(0, 3000) 

