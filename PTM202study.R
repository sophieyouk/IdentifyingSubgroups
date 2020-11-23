ptm <- read.csv("PTM_data.csv") # 186 obs
ptm <- na.omit(ptm) # 178 obs

X.matrix <- as.matrix(ptm[,10:26])
par(mar=c(4,4,4,5))

##################################### LASSO
library(glmnet)

############### WAZ
lasso.WAZ = glmnet(ptm$trt*X.matrix, ptm$WAZ)
plot(lasso.WAZ, main="WAZ")
vn.WAZ <- colnames(X.matrix)
vnat.WAZ <- coef(lasso.WAZ)
vnat.WAZ <- vnat.WAZ[-1, ncol(vnat.WAZ)]
axis(4, at=vnat.WAZ, line=-0.5, label=vn.WAZ, las=1, tick=FALSE, cex.axis=0.8)
coef(lasso.WAZ)[,2]


############### MPO
lasso.MPO = glmnet(ptm$trt*X.matrix, ptm$MPO)
plot(lasso.MPO, main="MPO")
vn.MPO <- colnames(X.matrix)
vnat.MPO <- coef(lasso.MPO)
vnat.MPO <- vnat.MPO[-1, ncol(vnat.MPO)]
axis(4, at=vnat.MPO, line=-0.5, label=vn.MPO, las=1, tick=FALSE, cex.axis=0.8)
coef(lasso.MPO)[,2]

############### Reg1b
lasso.Reg1b = glmnet(ptm$trt*X.matrix, ptm$Reg1b)
plot(lasso.Reg1b, main="Reg1b")
vn.Reg1b <- colnames(X.matrix)
vnat.Reg1b <- coef(lasso.Reg1b)
vnat.Reg1b <- vnat.Reg1b[-1, ncol(vnat.Reg1b)]
axis(4, at=vnat.Reg1b, line=-0.5, label=vn.Reg1b, las=1, tick=FALSE, cex.axis=0.8)
coef(lasso.Reg1b)[,2]

############### sCD14
lasso.sCD14 = glmnet(ptm$trt*X.matrix, ptm$sCD14)
plot(lasso.sCD14, main="sCD14")
vn.sCD14 <- colnames(X.matrix)
vnat.sCD14 <- coef(lasso.sCD14)
vnat.sCD14 <- vnat.sCD14[-1, ncol(vnat.sCD14)]
axis(4, at=vnat.sCD14, line=-0.5, label=vn.sCD14, las=1, tick=FALSE, cex.axis=0.8)
coef(lasso.sCD14)[,2]

############### CRP
lasso.CRP = glmnet(ptm$trt*X.matrix, ptm$CRP)
plot(lasso.CRP, main="CRP")
vn.CRP <- colnames(X.matrix)
vnat.CRP <- coef(lasso.CRP)
vnat.CRP <- vnat.CRP[-1, ncol(vnat.CRP)]
axis(4, at=vnat.CRP, line=-0.5, label=vn.CRP, las=1, tick=FALSE, cex.axis=0.8)
coef(lasso.CRP)[,2]


############################### Model-based trees
library(palmtree)
library(partykit)

############### WAZ
ptm.WAZ <- ptm[,c(3,5:26)]

palmT.WAZ <- palmtree(WAZ ~ trt|treated_water|treated_water+member+hh_live+family_tp,
                      data=ptm, minsize=10)
plot(palmT.WAZ, terminal_panel=NULL)

glmT.WAZ <- glmtree(WAZ ~ trt+treated_water|treated_water+member+hh_live+family_tp, 
                    data=ptm, minsize=10)
plot(glmT.WAZ, terminal_panel=NULL)

############### MPO
palmT.MPO <- palmtree(MPO ~ trt|member|member+dad_edu+toilet_share+open_drain, 
                      data=ptm, minsize=10)
plot(palmT.MPO, terminal_panel=NULL)

glmT.MPO <- glmtree(MPO ~ trt+member|member+dad_edu+toilet_share+open_drain, 
                    data=ptm, minsize=10)
plot(glmT.MPO, terminal_panel=NULL)

############### Reg1b
palmT.Reg1b <- palmtree(Reg1b ~ trt|expen|expen+sex+open_drain, data=ptm,
                        minsize=10)
plot(palmT.Reg1b, terminal_panel=NULL)

glmT.Reg1b <- glmtree(Reg1b ~ trt+expen|expen+sex+open_drain, data=ptm,
                        minsize=10)
plot(glmT.Reg1b, terminal_panel=NULL)

############### sCD14
palmT.sCD14 <- palmtree(sCD14 ~ trt|children+sleep|children+sleep+mom_edu+dad_edu, 
                        data=ptm, minsize=10)
plot(palmT.sCD14, terminal_panel=NULL)

glmT.sCD14 <- glmtree(sCD14 ~ trt+children+sleep|children+sleep+mom_edu+dad_edu, 
                        data=ptm, minsize=10)
plot(glmT.sCD14, terminal_panel=NULL)

############### CRP
palmT.CRP <- palmtree(CRP ~ trt|mom_edu+dad_edu|mom_edu+dad_edu+septic_toilet+toilet_share,
                      data=ptm, minsize=10)
plot(palmT.CRP, terminal_panel=NULL)

glmT.CRP <- glmtree(CRP ~ trt+mom_edu+dad_edu|mom_edu+dad_edu+septic_toilet+toilet_share,
                      data=ptm, minsize=10)
plot(glmT.CRP, terminal_panel=NULL)


############################## HAZ
lasso.HAZ = glmnet(ptm$trt*X.matrix, ptm$HAZ)
plot(lasso.HAZ, main="HAZ")
vn.HAZ <- colnames(X.matrix)
vnat.HAZ <- coef(lasso.HAZ)
vnat.HAZ <- vnat.HAZ[-1, ncol(vnat.HAZ)]
axis(4, at=vnat.HAZ, line=-0.5, label=vn.HAZ, las=1, tick=FALSE, cex.axis=0.8)
coef(lasso.HAZ)[,2]

palmT.HAZ <- palmtree(HAZ ~ trt|treated_water+hh_live|treated_water+hh_live+children+family_tp,
                      data=ptm, minsize=10)
plot(palmT.HAZ, terminal_panel=NULL)

glmT.HAZ <- glmtree(HAZ ~ trt+treated_water+hh_live|treated_water+hh_live+children+family_tp,
                    data=ptm, minsize=10)
plot(glmT.HAZ, terminal_panel=NULL)


############################## WHZ
lasso.WHZ = glmnet(ptm$trt*X.matrix, ptm$WHZ)
plot(lasso.WHZ, main="WHZ")
vn.WHZ <- colnames(X.matrix)
vnat.WHZ <- coef(lasso.WHZ)
vnat.WHZ <- vnat.WHZ[-1, ncol(vnat.WHZ)]
axis(4, at=vnat.WHZ, line=-0.5, label=vn.WHZ, las=1, tick=FALSE, cex.axis=0.8)
coef(lasso.WHZ)[,2]

palmT.WHZ <- palmtree(WHZ ~ trt|member+children|member+children+hh_class+septic_toilet+toilet_share,
                      data=ptm, minsize=10)
plot(palmT.WHZ, terminal_panel=NULL)

glmT.WHZ <- glmtree(WHZ ~ trt+member+children|member+children+hh_class+septic_toilet+toilet_share,
                    data=ptm, minsize=10)
plot(glmT.WHZ, terminal_panel=NULL)



