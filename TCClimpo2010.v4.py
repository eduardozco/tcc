
import pandas as pd
import pandas_datareader as dr
import datetime as dt
import openpyxl as opy
from functools import reduce
import numpy as np
import scipy



n=0
stocks = ['YDUQ3.SA', 'WIZS3.SA', 'WEST3.SA', 'WEGE3.SA', 'VULC3.SA', 'VIVR3.SA', 'VIVA3.SA', 'VITT3.SA', 'VIIA3.SA', 'VAMO3.SA', 'VLID3.SA', 'VALE3.SA', 'FIQE3.SA', 'UCAS3.SA', 'UGPA3.SA', 'TUPY3.SA', 'TRIS3.SA', 'TTEN3.SA', 'TPIS3.SA', 'TOTS3.SA', 'TIMS3.SA', 'LAND3.SA', 'TGMA3.SA', 'TCSA3.SA', 'TECN3.SA', 'TRAD3.SA', 'SHOW3.SA', 'SYNE3.SA', 'SUZB3.SA', 'SGPS3.SA', 'SMFT3.SA', 'SLCE3.SA', 'SQIA3.SA', 'SIMH3.SA', 'SEER3.SA', 'SEQL3.SA', 'ASAI3.SA', 'SMTO3.SA', 'SCAR3.SA', 'STBP3.SA', 'RAIL3.SA', 'RSID3.SA', 'RDNI3.SA', 'LLIS3.SA', 'RDOR3.SA', 'RADL3.SA', 'QUAL3.SA', 'PFRM3.SA', 'PRNR3.SA', 'POSI3.SA', 'PSSA3.SA', 'FRTA3.SA', 'PLPL3.SA', 'RECV3.SA', 'BRDT3.SA', 'PRIO3.SA', 'PETZ3.SA', 'PDGR3.SA', 'PTBL3.SA', 'PMAM3.SA', 'PDTC3.SA', 'OFSA3.SA', 'OSXB3.SA', 'ORVR3.SA', 'ONCO3.SA', 'OMGE3.SA', 'ODPV3.SA', 'OPCT3.SA', 'GNDI3.SA', 'NGRD3.SA', 'NEOE3.SA', 'NTCO3.SA', 'MLAS3.SA', 'MRVE3.SA', 'ESPA3.SA', 'MOVI3.SA', 'MDNE3.SA', 'MOSI3.SA', 'MBLY3.SA', 'MMXM3.SA', 'MTRE3.SA', 'BEEF3.SA', 'MILS3.SA', 'FRIO3.SA', 'MELK3.SA', 'CASH3.SA', 'AMAR3.SA', 'MRFG3.SA', 'LEVE3.SA', 'MGLU3.SA', 'MDIA3.SA', 'LUPA3.SA', 'LPSB3.SA', 'LREN3.SA', 'LJQQ3.SA', 'LOGN3.SA', 'LOGG3.SA', 'LWSA3.SA', 'RENT3.SA', 'LVTC3.SA', 'LIGT3.SA', 'LAVV3.SA', 'KRSA3.SA', 'JSLG3.SA', 'JHSF3.SA', 'JBSS3.SA', 'JALL3.SA', 'IRBR3.SA', 'RANI3.SA', 'MYPK3.SA', 'MEAL3.SA', 'INTB3.SA', 'PARD3.SA', 'IFCM3.SA', 'ROMI3.SA', 'IGTA3.SA', 'HYPE3.SA', 'MATD3.SA', 'HBSA3.SA', 'HBOR3.SA', 'HBRE3.SA', 'HAPV3.SA', 'SBFG3.SA', 'GMAT3.SA', 'SOMA3.SA', 'GRND3.SA', 'GGPS3.SA', 'NINJ3.SA', 'GFSA3.SA', 'POWE3.SA', 'FLRY3.SA', 'FHER3.SA', 'EZTC3.SA', 'EVEN3.SA', 'ETER3.SA', 'EQTL3.SA', 'ENJU3.SA', 'EGIE3.SA', 'ENEV3.SA', 'ENAT3.SA', 'PGMN3.SA', 'EMBR3.SA', 'ELMD3.SA', 'ENBR3.SA', 'ECOR3.SA', 'DOTZ3.SA', 'DIRR3.SA', 'PNVL3.SA', 'DASA3.SA', 'DXCO3.SA', 'DESK3.SA', 'DMVF3.SA', 'CYRE3.SA', 'CVCB3.SA', 'CURY3.SA', 'CARD3.SA', 'CSED3.SA', 'CPFE3.SA', 'CSAN3.SA', 'TEND3.SA', 'CBAV3.SA', 'COGN3.SA', 'VVEO3.SA', 'CLSA3.SA', 'CIEL3.SA', 'CSMG3.SA', 'SBSP3.SA', 'LCAM3.SA', 'PCAR3.SA', 'AALR3.SA', 'CEAB3.SA', 'CCRO3.SA', 'CAML3.SA', 'CXSE3.SA', 'BRIT3.SA', 'BRFS3.SA', 'AGRO3.SA', 'BBRK3.SA', 'BRPR3.SA', 'BRML3.SA', 'BOAS3.SA', 'SOJA3.SA', 'BLAU3.SA', 'BKBR3.SA', 'BMOB3.SA', 'BBAS3.SA', 'BBSE3.SA', 'B3SA3.SA', 'ATMP3.SA', 'CRFB3.SA', 'ARML3.SA', 'ARZZ3.SA', 'ANIM3.SA', 'AMER3.SA', 'AMBP3.SA', 'AVLL3.SA', 'APER3.SA', 'ALPK3.SA', 'ALLD3.SA', 'ALSO3.SA', 'AGXY3.SA', 'AESB3.SA', 'AERI3.SA', 'RRRP3.SA']
start = '2009-12-30'
end = '2022-02-01'
preço = dr.data.get_data_yahoo(stocks, start, end,)


#importação da base diária de preços do Yahoo Finance

print("preço finalizado")


preço2 = preço.filter(like = "Adj Close", axis = 1)

#Exclui colunas não utilizadas da base de preços

print("Preço2 finalizado")
precobase100 = preço2.div(preço2.iloc[0])
precobase100anual = precobase100.query("index==20091230 or index==20101230 or index==20111229 or index==20121228 or index==20131230 or index==20141230 or index==20151230 or index==20161229 or index==20171229 or index==20181228 or index==20191230 or index==20201229 or index==20211230")
precobase100anual = precobase100anual.reset_index()
precobase100anual = pd.melt(precobase100anual,'Date')
precobase100anual = precobase100anual.drop(columns = 'Attributes').rename(columns = {'Date':'Data',"Symbols":'Ticker Planilha','value': 'Precosbase100'})

#Cria uma base que mostra o preço da ação em uma determinada data como uma porcentagem do preço inicial




print("Preçobase100 finalizado")

#preçocorrel prepara a base de dados para calcular retorno acumulado
preçocorrel = preço2.pct_change()

#usado para calcular o beta
print("Preçocorrel finalizado")

ibov = '^BVSP'
benchmark = dr.data.get_data_yahoo(ibov,start,end)
benchmark2 = benchmark.filter(like = "Adj Close", axis = 1)
benchmark2 = benchmark2.pct_change()
#usado para calcular o beta
print("Benchmark2 finalizado")
#cor = preçocorrel.corr(benchmark2)



consolidado_beta = pd.concat([preçocorrel,benchmark2], axis = 1)

consolidado_beta.rename(columns = {'Adj Close':'IBOV'}, inplace = True)
print("Consolidado Beta finalizado")

cov = consolidado_beta.cov()
cov = cov.filter(like = "IBOV", axis = 1)

var = benchmark2.var()

var = var.values
var = var[0]
Beta = cov/var
#Calcula o Beta
print("Beta finalizado")




preçopoucasdatas = preço.query("index==20091230 or index==20101230 or index==20111229 or index==20121228 or index==20131230 or index==20141230 or index==20151230 or index==20161229 or index==20171229 or index==20181228 or index==20191230 or index==20201229 or index==20211230")
preçopoucasdatas = preçopoucasdatas.filter(like = "Adj Close", axis = 1)
preçopoucasdatas['Data'] = preçopoucasdatas.index
preçopoucasdataslongo = pd.melt(preçopoucasdatas,'Data')
preçopoucasdataslongo = preçopoucasdataslongo.drop(columns= 'Attributes')
preçopoucasdataslongo = preçopoucasdataslongo.rename(columns={'Symbols': 'Ticker Planilha'})

#filtra o dataframe de preços para exibir menos datas e para transformar as colunas com tickers de ações em uma única coluna

print("Preçopoucasdataslongo finalizado")


preçopctchangeanual = preçopoucasdatas.select_dtypes('float').pct_change()
preçopctchangeanual['Data'] = preçopctchangeanual.index
preçopctchangeanual = pd.melt(preçopctchangeanual,'Data')
preçopctchangeanual = preçopctchangeanual.replace('Adj Close','VariacaoAnual').rename(columns = {'Attributes': 'Categoria', 'Symbols':'Ticker Planilha','value': 'VariacaoAnual'})

#Calculo das variações anuais de preço e formatação do dataframe 

print("preçopctchangeanual finalizado")

Controle20 = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/controle20.xlsx',sheet_name="Resumo")
Controle25 = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/controle25.xlsx',sheet_name="Resumo")
Controle30 = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/controle30.xlsx',sheet_name="Resumo")
Controle35 = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/controle35.xlsx',sheet_name="Resumo")
Controle40 = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/controle40.xlsx',sheet_name="Resumo")
Controle45 = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/controle45.xlsx',sheet_name="Resumo")
Controle50 = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/controle50.xlsx',sheet_name="Resumo")
ControleCVM = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/CVM.xlsx',sheet_name="Resumo")
PercControle = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/PercControle.xlsx',sheet_name="%Controlador")
Economatica = pd.read_excel (r'C:\Users\Eduardo\Desktop\Tese\WIP\Excel Consolidado\Inputs Python % Controle2010Ajustado/Economatica.v2.xlsx',sheet_name="Sheet1")

#Importação dos arquivos que vão dar origem às variáveis de controle

print("planilhas de controle importadas")

Controle20 = Controle20[Controle20['Novo Mercado'].notna()]
Controle25 = Controle25[Controle25['Novo Mercado'].notna()]
Controle30 = Controle30[Controle30['Novo Mercado'].notna()]
Controle35 = Controle35[Controle35['Novo Mercado'].notna()]
Controle40 = Controle40[Controle40['Novo Mercado'].notna()]
Controle45 = Controle45[Controle45['Novo Mercado'].notna()]
Controle50 = Controle50[Controle50['Novo Mercado'].notna()]
ControleCVM = ControleCVM[ControleCVM['Novo Mercado'].notna()]
PercControle = PercControle[PercControle['Novo Mercado'].notna()]

#Filtra as linhas que não representam empresas do Novo Mercado


Controle20 = Controle20.drop(columns = ["Ticker", "CNPJ","Novo Mercado","Empresa"])
Controle20longo = pd.melt(Controle20,id_vars = 'Ticker Planilha',var_name= 'Ano',value_name = 'Controle20')

Controle25 = Controle25.drop(columns = ["Ticker", "CNPJ","Novo Mercado","Empresa"])
Controle25longo = pd.melt(Controle25,id_vars = 'Ticker Planilha',var_name= 'Ano',value_name = 'Controle25')

Controle30 = Controle30.drop(columns = ["Ticker", "CNPJ","Novo Mercado","Empresa"])
Controle30longo = pd.melt(Controle30,id_vars = 'Ticker Planilha',var_name= 'Ano',value_name = 'Controle30')

Controle35 = Controle35.drop(columns = ["Ticker", "CNPJ","Novo Mercado","Empresa"])
Controle35longo = pd.melt(Controle35,id_vars = 'Ticker Planilha',var_name= 'Ano',value_name = 'Controle35')

Controle40 = Controle40.drop(columns = ["Ticker", "CNPJ","Novo Mercado","Empresa"])
Controle40longo = pd.melt(Controle40,id_vars = 'Ticker Planilha',var_name= 'Ano',value_name = 'Controle40')

Controle45 = Controle45.drop(columns = ["Ticker", "CNPJ","Novo Mercado","Empresa"])
Controle45longo = pd.melt(Controle45,id_vars = 'Ticker Planilha',var_name= 'Ano',value_name = 'Controle45')

Controle50 = Controle50.drop(columns = ["Ticker", "CNPJ","Novo Mercado","Empresa"])
Controle50longo = pd.melt(Controle50,id_vars = 'Ticker Planilha',var_name= 'Ano',value_name = 'Controle50')

ControleCVM = ControleCVM.drop(columns = ["Ticker", "CNPJ","Novo Mercado","Empresa"])
ControleCVMlongo = pd.melt(ControleCVM,id_vars = 'Ticker Planilha',var_name= 'Ano',value_name = 'ControleCVM')

PercControle = PercControle.drop(columns = ["Ticker", "CNPJ","Novo Mercado","Empresa"])
PercControlelongo = pd.melt(PercControle,id_vars = 'Ticker Planilha',var_name= 'Ano',value_name = 'PercControle')

Economatica = Economatica[Economatica['Ticker Planilha'].isin(stocks)]
Economatica = Economatica.drop(columns = ['Classe','Código','Nome','Unnamed: 0', 'Bolsa / Fonte' , 'Tipo de Ativo', 'Ativo / Cancelado', 'Bolsa / Fonte.1' , 'Tipo de Ativo.1', 'Ativo / Cancelado.1'])
Economaticalongo = pd.wide_to_long(Economatica,stubnames =['Marketcap','EV','Estr. Capital','ROIC', 'EV/EBITDA', 'Alav. Operacional'],i ='Ticker Planilha', j = 'Ano')
print("Controles Finalizados")

#Formatação dos diversos dataframes de controle para posterior consolidação

dfslongo  = [PercControlelongo, ControleCVMlongo, Controle20longo,Controle25longo,Controle30longo,Controle35longo,Controle40longo,Controle45longo,Controle50longo, Economaticalongo]

ControleConsolidado = reduce(lambda left, right: pd.merge(left, right, on = ['Ticker Planilha','Ano']),dfslongo)
#ControleConsolidado = reduce(lambda left, right: pd.merge(left, right, on = ['Ticker Planilha']),dfslongo)
ControleConsolidado = ControleConsolidado.replace('Não Consta',np.NaN)
#ControlePivot = pd.pivot_table(ControleConsolidado,,,,columns = {})


Beta_index = Beta.reset_index()
Beta_index[['index1','index2']] = Beta_index['index'].apply(pd.Series)
Beta_index = Beta_index.drop(columns = ["index","index1"])
Beta_index = Beta_index.rename(columns ={'index2' : 'Ticker Planilha', 'IBOV': 'Beta'})

print("tratamento Beta_index finalizado")

Resumo = ControleConsolidado.merge(Beta_index, left_on = 'Ticker Planilha', right_on= 'Ticker Planilha')
Resumodata = Resumo.replace(2009,'20091230').replace(2010,'20101230').replace(2011,'20111229').replace(2012,'20121228').replace(2013,'20131230').replace(2014,'20141230').replace(2015,'20151230').replace(2016,'20161229').replace(2017,'20171229').replace(2018,'20181228').replace(2019,'20191230').replace(2020,'20201229').replace(2021,'20211230')
Resumodata['Data']= pd.to_datetime(Resumodata['Ano'])
Resumodata = Resumodata.drop(columns = 'Ano')

#Adiciona os betas ao dataframe de controles

print("resumodata finalizado")




Resumofinal = reduce(lambda left, right: pd.merge(left, right, on = ['Ticker Planilha','Data']),[Resumodata,preçopoucasdataslongo,preçopctchangeanual,precobase100anual])
Resumofinal = Resumofinal.rename(columns = {'value':'Preco'})
Resumofinal = Resumofinal.drop(columns = 'Categoria')
Resumofinal = Resumofinal.replace('Não Consta',np.NaN).replace('-',np.NaN)

# Consolida todos os dataframes em um arquivo para exportação

from scipy.stats.mstats import winsorize
Resumofinal["VariacaoAnualWinsorizada"] = winsorize(Resumofinal.VariacaoAnual, limits = (0.05,0.05))
Resumofinal = Resumofinal[Resumofinal['Ticker Planilha']!= "OSXB3.SA"]



print("resumofinal finalizado")


Resumofinal.to_csv('tcc.Resumofinal2010Ajustado.csv')
print("exportação finalizada")

    
#exporta o dataframe consolidado