library(plm)
library(dplyr)
library(leaps)
library(qwraps2)
library(vtable)
library(stargazer)
setwd("C:/Users/Eduardo/Desktop/Programação/Python")
tcc_Resumofinal2010 = read.csv("tcc.Resumofinal2010.csv")


df = tcc_Resumofinal2010 %>%
  rename("Company" = "Ticker.Planilha") %>%
  #mutate(ControleCVM20 = pmax(Controle20, ControleCVM))
  mutate(ControleCVM50 = pmax(Controle50, ControleCVM))
df$ControleCVM20 = pmax(df$Controle20, df$ControleCVM)
df$ControleCVM25 = pmax(df$Controle25, df$ControleCVM)
df$ControleCVM30 = pmax(df$Controle30, df$ControleCVM)
df$ControleCVM35 = pmax(df$Controle35, df$ControleCVM)
df$ControleCVM40 = pmax(df$Controle40, df$ControleCVM)
df$ControleCVM45 = pmax(df$Controle45, df$ControleCVM)
df$ControleCVM50 = pmax(df$Controle50, df$ControleCVM)

Interesse = c('ControleCVM20','ControleCVM25','ControleCVM30','ControleCVM35','ControleCVM40','ControleCVM45','ControleCVM50','ControleCVM')
InteressesemCVM = c('Controle20','Controle25','Controle30','Controle35','Controle40','Controle45','Controle50')
vDatas = c('2010-12-30','2011-12-29','2012-12-28','2013-12-30','2014-12-30','2015-12-30','2016-12-29','2017-12-29', '2018-12-28', '2019-12-30', '2020-12-29', '2021-12-30')
p.df = pdata.frame(df,index = c("Company","Data"))


mean(na.omit(p.df$VariacaoAnual))


painel20 = plm(VariacaoAnual~Controle20+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV +ROIC ,data = p.df)
summary(painel20)

painel25 = plm(VariacaoAnual~Controle25+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painel25)

painel30 = plm(VariacaoAnual~Controle30+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC ,data = p.df)
summary(painel30)

painel35 = plm(VariacaoAnual~Controle35+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC ,data = p.df)
summary(painel35)

painel40 = plm(VariacaoAnual~Controle40+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC ,data = p.df)
summary(painel40)

painel45 = plm(VariacaoAnual~Controle45+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC ,data = p.df)
summary(painel45)

painel50 = plm(VariacaoAnual~Controle50+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC ,data = p.df)
summary(painel50)

#CVM PLM

painelCVM20 = plm(VariacaoAnual~ControleCVM20+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM20)

painelCVM25 = plm(VariacaoAnual~ControleCVM25+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM25)

painelCVM30 = plm(VariacaoAnual~ControleCVM30+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM30)

painelCVM35 = plm(VariacaoAnual~ControleCVM35+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM35)

painelCVM40 = plm(VariacaoAnual~ControleCVM40+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM40)

painelCVM45 = plm(VariacaoAnual~ControleCVM45+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM45)

painelCVM50 = plm(VariacaoAnual~ControleCVM50+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM50)

painelperc = plm(VariacaoAnual~PercControle+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelperc)

painelCVM = plm(VariacaoAnual~ControleCVM+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM)


#CVM LM

painelCVM20lm = lm(VariacaoAnual~ControleCVM20+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM20lm)

painelCVM25lm = lm(VariacaoAnual~ControleCVM25+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM25lm)

painelCVM30lm = lm(VariacaoAnual~ControleCVM30+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM30lm)

painelCVM35lm = lm(VariacaoAnual~ControleCVM35+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM35lm)

painelCVM40lm = lm(VariacaoAnual~ControleCVM40+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM40lm)

painelCVM45lm = lm(VariacaoAnual~ControleCVM45+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM45lm)

painelCVM50lm = lm(VariacaoAnual~ControleCVM50+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVM50lm)

painelperclm = lm(VariacaoAnual~PercControle+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelperclm)

painelCVMlm = lm(VariacaoAnual~ControleCVM+Marketcap+Beta+EV.EBITDA + Estr..Capital + Alav..Operacional +EV + ROIC,data = p.df)
summary(painelCVMlm)


write.csv(df, "Database_Normal_TCCEDU.csv")

write.csv(p.df, "Databasepdf_Normal_TCCEDU.csv")

testeR40 = plm::vcovHC(painel40, "white2")

summary(painel40, testeR40)

painelCVM = lm(VariacaoAnual~ControleCVM+Marketcap+Beta+EV.EBITDA+EV + ROIC ,data = p.df)
summary(painelCVM)

Medianas = filter(na.omit(subset(p.df, select = -c(Marketcap,Beta,EV.EBITDA,EV,Estr..Capital,ROIC,Alav..Operacional,Preco,VariacaoAnual))), Data == '2021-12-30')
Ttest = filter(na.omit(subset(p.df, select = -c(Marketcap,Beta,EV.EBITDA,EV,Estr..Capital,ROIC,Alav..Operacional))))

#painel = lm(Variação.Anual~ControleCVM50+Marketcap+Beta,data = p.df)
#painel = plm(VariacaoAnual~ControleCVM50+Marketcap+Beta+EV.EBITDA ,data = p.df)


#MEDIANAS


Medianas%>%
  group_by(ControleCVM20, Data = '2021-12-30')%>% 
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))

Medianas%>%
  group_by(ControleCVM25, Data = '2021-12-30')%>% 
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))

Medianas%>%
  group_by(ControleCVM30, Data = '2021-12-30')%>% 
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))

Medianas%>%
  group_by(ControleCVM35, Data = '2021-12-30')%>% 
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))

Medianas%>%
  group_by(ControleCVM40, Data = '2021-12-30')%>% 
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))

Medianas%>%
  group_by(ControleCVM45, Data = '2021-12-30')%>% 
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))

Medianas%>%
  group_by(ControleCVM50, Data = '2021-12-30')%>% 
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))

Medianas%>%
  group_by(ControleCVM, Data = '2021-12-30')%>% 
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))

#Medianas Limpas
Medianaslimpas20 = Medianas%>%
  group_by(ControleCVM20, Data = '2021-12-30')%>%
  filter(!(abs(Precosbase100 - median(Precosbase100))> 2*sd(Precosbase100))) %>%
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))
  Medianaslimpas20 = cbind(Medianaslimpas20,'Classe' = "ControleCVM20")

Medianaslimpas25 = Medianas%>%
  group_by(ControleCVM25, Data = '2021-12-30')%>% 
  filter(!(abs(Precosbase100 - median(Precosbase100))> 2*sd(Precosbase100))) %>%
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))
  Medianaslimpas25 = cbind(Medianaslimpas25,'Classe' = "ControleCVM25")

Medianaslimpas30 = Medianas%>%
  group_by(ControleCVM30, Data = '2021-12-30')%>%
  filter(!(abs(Precosbase100 - median(Precosbase100))> 2*sd(Precosbase100))) %>%
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))
  Medianaslimpas30 = cbind(Medianaslimpas30,'Classe' = "ControleCVM30")

Medianaslimpas35 = Medianas%>%
  group_by(ControleCVM35, Data = '2021-12-30')%>%
  filter(!(abs(Precosbase100 - median(Precosbase100))> 2*sd(Precosbase100))) %>%
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))
  Medianaslimpas35 = cbind(Medianaslimpas35,'Classe' = "ControleCVM35")

Medianaslimpas40 = Medianas%>%
  group_by(ControleCVM40, Data = '2021-12-30')%>%
  filter(!(abs(Precosbase100 - median(Precosbase100))> 2*sd(Precosbase100))) %>%
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))
  Medianaslimpas40 = cbind(Medianaslimpas40,'Classe' = "ControleCVM40")

Medianaslimpas45 = Medianas%>%
  group_by(ControleCVM45, Data = '2021-12-30')%>%
  filter(!(abs(Precosbase100 - median(Precosbase100))> 2*sd(Precosbase100))) %>%
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))
  Medianaslimpas45 = cbind(Medianaslimpas45,'Classe' = "ControleCVM45")

Medianaslimpas50 = Medianas%>%
  group_by(ControleCVM50, Data = '2021-12-30')%>%
  filter(!(abs(Precosbase100 - median(Precosbase100))> 2*sd(Precosbase100))) %>%
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))
  Medianaslimpas50 = cbind(Medianaslimpas50,'Classe' = "ControleCVM50")

MedianaslimpasCVM = Medianas%>%
  group_by(ControleCVM, Data = '2021-12-30')%>%
  filter(!(abs(Precosbase100 - median(Precosbase100))> 2*sd(Precosbase100))) %>%
  summarise(Mean=mean(Precosbase100), Max=max(Precosbase100), Min=min(Precosbase100), Median=median(Precosbase100), Std=sd(Precosbase100))
  MedianaslimpasCVM = cbind(MedianaslimpasCVM,'Classe' = "ControleCVM")

Medianaslimpas = list(Medianaslimpas20,Medianaslimpas25,Medianaslimpas30,Medianaslimpas35,Medianaslimpas40,Medianaslimpas45,Medianaslimpas50,MedianaslimpasCVM)

Medianaslimpas
hist(SemControleCVM20$VariacaoAnual,xlim = c(-1,3),breaks = 500)
hist(ComControleCVM20$VariacaoAnual,xlim = c(-1,3),breaks = 500)


ComControleCVM20 = filter(Ttest,ControleCVM20 == 1)
SemControleCVM20 = filter(Ttest,ControleCVM20 == 0)
ComControleCVM25 = filter(Ttest,ControleCVM25 == 1)
SemControleCVM25 = filter(Ttest,ControleCVM25 == 0)
ComControleCVM30 = filter(Ttest,ControleCVM30 == 1)
SemControleCVM30 = filter(Ttest,ControleCVM30 == 0)
ComControleCVM35 = filter(Ttest,ControleCVM35 == 1)
SemControleCVM35 = filter(Ttest,ControleCVM35 == 0)
ComControleCVM40 = filter(Ttest,ControleCVM40 == 1)
SemControleCVM40 = filter(Ttest,ControleCVM40 == 0)
ComControleCVM45 = filter(Ttest,ControleCVM45 == 1)
SemControleCVM45 = filter(Ttest,ControleCVM45 == 0)
ComControleCVM50 = filter(Ttest,ControleCVM50 == 1)
SemControleCVM50 = filter(Ttest,ControleCVM50 == 0)
ComControleCVM = filter(Ttest,ControleCVM == 1)
SemControleCVM = filter(Ttest,ControleCVM == 0)

t.test(SemControleCVM20$VariacaoAnual,ComControleCVM20$VariacaoAnual)
t.test(SemControleCVM25$VariacaoAnual,ComControleCVM25$VariacaoAnual)
t.test(SemControleCVM30$VariacaoAnual,ComControleCVM30$VariacaoAnual)
t.test(SemControleCVM35$VariacaoAnual,ComControleCVM35$VariacaoAnual)
t.test(SemControleCVM40$VariacaoAnual,ComControleCVM40$VariacaoAnual)
t.test(SemControleCVM45$VariacaoAnual,ComControleCVM45$VariacaoAnual)
t.test(SemControleCVM50$VariacaoAnual,ComControleCVM50$VariacaoAnual)
t.test(SemControleCVM$VariacaoAnual,ComControleCVM$VariacaoAnual)





#Extrair Resumo Regressões plm

stargazer( painelCVM30, painelCVM35, painelCVM40, painelCVM45, painelCVM50, painelCVM, summary = TRUE, type = "html", style = "all", column.labels = c("30","35","40","45","50","CVM"),out = "Regressões.html", font.size =  "footnotesize", column.sep.width =  "1pt", single.row =  TRUE, title = "Regressão Retornos e Controle", dep.var.labels =  "Limiar de Controle")


#Extrair Resumo Regressões lm

stargazer(painelCVM20lm,painelCVM25lm, painelCVM30lm, painelCVM35lm, painelCVM40lm, painelCVM45lm, painelCVM50lm, painelCVMlm, summary = TRUE, type = "html", style = "all", column.labels = c("20","25","30","35","40","45","50","CVM"),out = "Regressõeslm.html", font.size =  "footnotesize", column.sep.width =  "1pt", single.row =  TRUE, title = "Regressão Retornos e Controle (lm)", dep.var.labels =  "Limiar de Controle")



#Extrair Resumo Regressões sem cvm

stargazer( painel30, painel35, painel40, painel45, painel50, summary = TRUE, type = "html", style = "all", column.labels = c("25","30","35","40","45","50"),out = "Regressõessemcvm.html", font.size =  "footnotesize", column.sep.width =  "1pt", single.row =  TRUE, title = "Regressão Retornos e Controle", dep.var.labels =  "Limiar de Controle")


#Extrair número de empresas com e sem controle(CVM)
nomesvetores = c()
nomedias = c()
nomedataframe = c()
DataframeDias = data.frame('Sem Controle' = c(), 'Com Controle' = c())

for( x in Interesse){
  
  
  for (d in vDatas) {
    c = c(x,d)
    nome = paste(c, collapse = "")
    nomedias = c(nomedias, d)
    nomedataframe = c(nomedataframe, x)
    nomesvetores = c(nomesvetores, nome)
    quantidade = c()
    quantidade = c(quantidade,length(intersect(which(df[x] == 0), which(df['Data']== d))))
    quantidade = c(quantidade,length(intersect(which(df[x] == 1), which(df['Data']== d))))
    names(quantidade) = c("0", "1")
    assign(nome, quantidade)
    DataframeDias = rbind(DataframeDias,quantidade)
  }

}
DataframeDias = cbind(DataframeDias,nomedias, nomedataframe)

colnames(DataframeDias) = c('Sem Controle','Com Controle', 'Data', "Controle")


DataframeDias

sum(na.omit(df$ControleCVM20) == "0")

stargazer(DataframeDias, summary = FALSE, type = "html", out = "QuantidadeEmpresas.html")

#Extrair número de empresas (Sem tratamento CVM)

nomesvetores = c()
nomedias = c()
nomedataframe = c()
DataframeDias = data.frame('Sem Controle' = c(), 'Com Controle' = c())

for( x in InteressesemCVM){
  
  
  for (d in vDatas) {
    c = c(x,d)
    nome = paste(c, collapse = "")
    nomedias = c(nomedias, d)
    nomedataframe = c(nomedataframe, x)
    nomesvetores = c(nomesvetores, nome)
    quantidade = c()
    quantidade = c(quantidade,length(intersect(which(df[x] == 0), which(df['Data']== d))))
    quantidade = c(quantidade,length(intersect(which(df[x] == 1), which(df['Data']== d))))
    names(quantidade) = c("0", "1")
    assign(nome, quantidade)
    DataframeDias = rbind(DataframeDias,quantidade)
  }
  
}
DataframeDias = cbind(DataframeDias,nomedias, nomedataframe)

colnames(DataframeDias) = c('Sem Controle','Com Controle', 'Data', "Controle")


DataframeDias

sum(na.omit(df$Controle20) == "0")

stargazer(DataframeDias, summary = FALSE, type = "html", out = "QuantidadeEmpresassemCVM.html")

#
d
length(intersect(which(df['ControleCVM20'] == 1), which(df['Data']== d)))
length(intersect(which(df['ControleCVM'] == 1), which(df['Data']== d)))