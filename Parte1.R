#=================================#
#        Mulheres da ciência      #
#---------------------------------#
#             Oficina             #
#       Análise de dados em R     # 
#---------------------------------#
#     Dúvidas ou sugestões:       #
# leticiamachado.maria@gmail.com  #
#---------------------------------#
#   Recife, 21 de agosto de 2018  #
#=================================#

#Definindo um local de trabalho

#setwd("INSIRA/SEU/CAMINHO/AQUI/Estudos em R")

setwd("C:/Users/letic/OneDrive/Área de Trabalho/Oficina de Análise de Dados em R")
getwd()
list.files()

#Calculadora

3 + 5               # soma
183082 - 21982      # subtracao
92 * 1.6            # multiplicacao
900 / 30            # divisao
40**2               # exponencial

#Operadores lógicos

2 == 3       # 2 igual a 3
2 != 3       # 2 diferente de 3
2 < 3        # 2 menor do que 3
2 <= 3       # 2 menor ou igual a 3
2 > 3        # 2 maior do que 3
2 >= 3       # 2 maior ou igual a 3

#Criando objetos

x <- 20 
x

#================================#
#        Tipos de objetos        #
#================================#

#Logical (lógico)
x1 <- c(TRUE, FALSE)   # combina os valores TRUE e FALSE e atribui a x1
x1

class(x1)


#Integer (quantitativa discreta)
x2 <- 1:1000             # combina os numeros inteiros de 1 a 1000 e atribui a x2 
x2

class(x2)

#Character (qualitativa nominal)
nome <- c("Fulano", "Sicrano", "Beltrano") 
nome
class(nome)

#Numeric (quantitativa continua)
altura <- c( 1.72, 1.58, 2.01) 
altura

class(altura)

#Data Frame (banco de dados)

dados_altura <- data.frame(nome, altura)
dados_altura

class(dados_altura)


#================================#
#       Banco de dados           #
#================================#

#--------------------------------#
#    Importar base de dados      #
#--------------------------------#

#csv
install.packages('base')
library(base)
<-read.csv()
View()

#xls
install.packages('readxl')
library(readxl)
<- read_excel()

#SPSS
install.packages('heaven')
library(heaven)
read_sav()

#STATA
install.packages('heaven')
library(heaven)
read_stata()

#SAS
install.packages('heaven')
library(heaven)
read_sas()

#================================#
#      Manipulação de dados      #  
#================================#

#--------------------------------#
#    Visualizar banco de dados   #
#--------------------------------#

str(acidentes_transito_2016)   # Nos retorna a estrutura do banco, com informacoes sobre o banco em si e suas variaveis
View(acidentes_transito_2016)  # Abre uma janela no RStudio na qual é possível visualizar uma planilha da base

head(acidentes_transito_2016)  # Visualizar primeira linhas do banco
tail(acidentes_transito_2016)  # Visualizar ultimas linhas do banco

#--------------------------------#
# Manipular a estrutura do banco #
#--------------------------------#

# selecionar primeira coluna no banco
acidentes_transito_2016[, 1]

# selecionar primeira linha no banco
acidentes_transito_2016[1, ]

# remover primeira coluna no banco e atribuir a novo objeto
acidentes_transito_2016.2 <- acidentes_transito_2016[, -1]

# remover 10 primeiras linha no banco
acidentes_transito_2016.2 <- acidentes_transito_2016.2[-c(1:10), ]

# visualizar banco acidentes_transito_2016.2
head(acidentes_transito_2016.2)

# selecionar coluna 'situacao' no banco
situacao <- acidentes_transito_2016[,"situacao"]

# visualizar situacao
situacao

# retirar primeiros 10 casos de situacao e atribuir a situacao2
situacao2 <- situacao[-c(1:10), ]

# visualizar situacao2
situacao2

#----------------------------------#
# Manipular dados com condicionais #
#----------------------------------#


# as.factor() transforma um vector em factor (vetor com informacao categorica)
acidentes_transito_2016$tipo <- as.factor(acidentes_transito_2016$tipo)

# ver categorias na variavel
levels(acidentes_transito_2016$tipo)
  
# Selecionar acidentes de transito com vitimas
acid_transit_vitima2016 <- acidentes_transito_2016[acidentes_transito_2016$tipo == "COM VÍTIMA",]

# transformar variavel em numerica
acidentes_transito_2016$ciclista <- as.numeric(acidentes_transito_2016$ciclista)

# Selecionar acidentes de transito envolvendo ciclista
acid_transit_ciclista2016 <- acidentes_transito_2016[acidentes_transito_2016$ciclista == 1,]

# Selecionar acidentes não envolvendo ciclista
acid_transit_ciclista2016 <- acidentes_transito_2016[acidentes_transito_2016$ciclista == FALSE,]

#==================================#
#       Visualização de dados      #
#==================================#

# table() conta o numero de vezes que um determinado valor aparece em uma variavel
table(acidentes_transito_2016$bairro)

# podemos fazer um dataframe com essa informacao e armezena-lo
bairro_acid_ciclista <- data.frame(table(acidentes_transito_2016$bairro))
View(bairro_acid_ciclista)

#como também alterar o nome das colunas no novo dataframe
colnames(bairro_acid_ciclista) <- c("bairro", "acidentes")
head(bairro_acid_ciclista)

# Selecionar apenas os 15 primeiros bairros com maior numero de acidentes
bairro_acid_ciclista2 <- bairro_acid_ciclista[1:15, ]

# visualizar banco manipulado
bairro_acid_ciclista2

# salvar banco de dados manipulado
write.csv(bairro_acid_ciclista2, file = "bairros_+15_acidentes_ciclistas.csv")


#----------------------------------#
#     Nosso primeiro gráfico       #
#----------------------------------#

install.packages("tydeverse")
library(ggplot2)


ggplot(data = bairro_acid_ciclista2,        # selecionar o banco de dados
       aes(x = bairro, y = acidentes) ) +   # selecionar variaveis do eixo x e y
  geom_col()                                # selecionar tipo de gráfico a ser plotado


#----------------------------------#
#       Editando o gráfico         #
#----------------------------------#

# tranformar nomes em fatores ordenados 
bairro_acid_ciclista2$bairro <- factor(bairro_acid_ciclista2$bairro, bairro_acid_ciclista2$bairro[order(bairro_acid_ciclista2$acidentes)])

# grafico ggplot
ggplot(data = bairro_acid_ciclista2, 
       aes(x = bairro, y = acidentes )) +    
  geom_col(fill = "black") +  # definir cor de preenchimento das barras
  coord_flip()                # inverter eixos do grafico



