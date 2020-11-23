# Data Editing

baseline <- read.csv("PTM_Baseline.csv")
anthro <- read.csv("PTM_Anthro_Long.csv")
lab <- read.csv("PTM_Lab.csv")

anthro2 <- anthro[(anthro$vtime==2),] # 200 obs
anthro5 <- anthro[(anthro$vtime==5),] # 187 obs
new.anthro <- rbind(anthro5, anthro2)
no5 <- which(!duplicated(new.anthro$sid))[-(1:187)]
no5 <- new.anthro$sid[no5]
# No 5 values: 6077 6095 6127 6154 6159 6168 6178 6202 6205 6268 6269 6308 6312
# delete 13 values without 5 vitime
for (i in 1:13) {
  anthro2 <- anthro2[!(anthro2$sid == no5[i]),]
}

# 5vtime - 2vtime
new.anthro <- cbind(anthro5, anthro2)[,c(1, 6:8, 14:16)]
new.anthro$HAZ <- new.anthro$HAZ - new.anthro$HAZ.1
new.anthro$WAZ <- new.anthro$WAZ - new.anthro$WAZ.1
new.anthro$WHZ <- new.anthro$WHZ - new.anthro$WHZ.1
new.anthro <- new.anthro[,1:4]

lab1 <- lab[lab$SPECSEQ==1,] # 200 obs
lab2 <- lab[lab$SPECSEQ==2,] # 190 obs
new.lab <- merge(lab2, lab1, by="SID")[,c(1, 4:7, 10:13)]
new.lab$MPO <- new.lab$MPO.x - new.lab$MPO.y
new.lab$Reg1b <- new.lab$Reg1b.x - new.lab$Reg1b.y
new.lab$sCD14 <- new.lab$sCD14.x - new.lab$sCD14.y
new.lab$CRP <- new.lab$CRP.x - new.lab$CRP.y
new.lab <- new.lab[,-(2:9)]
colnames(new.lab)[1] <- "sid"

# Export 3 datasets
write.csv(new.anthro,"anthro.csv", row.names = FALSE)
write.csv(new.lab,"lab.csv", row.names = FALSE)
write.csv(baseline,"baseline.csv", row.names = FALSE)

# Read combined data (186 obs)
anthro <- read.csv("anthro.csv")
lab <- read.csv("lab.csv")
baseline <- read.csv("baseline.csv")

# LASSO
library(glmnet)
lasso.haz = cv.glmnet(haz[,-1], haz$HAZ, nfolds = 10)
plot(lasso.fit)

# usually two tuning parameters are used 
coef(lasso.fit, s = "lambda.min")
coef(lasso.fit, s = "lambda.1se")



# model-based recursive partitioning
library("model4you")
mbase <- glm(abs(HAZ)~trt, data=haz, family=binomial())




