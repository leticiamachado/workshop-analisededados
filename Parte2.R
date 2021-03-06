#=================================#
#        Mulheres da ci�ncia      #
#---------------------------------#
#             Oficina             #
#       An�lise de dados em R     # 
#---------------------------------#
#     D�vidas ou sugest�es:       #
# leticiamachado.maria@gmail.com  #
#---------------------------------#
#   Recife, 21 de agosto de 2018  #
#=================================#

install.packages("tydeverse")
library(ggplot2)

#=================================#
#  Explorando o banco de dados    #
#=================================#

(ggplot2::mpg)
View(mpg)

?mpg

class(mpg)
head(mpg)

#---------------------------------#
#       Tipos de vari�veis        #
#---------------------------------#

class(mpg$model)
class(mpg$displ)
class(mpg$year)
class(mpg$cyl)
class(mpg$trans)
class(mpg$drv)
class(mpg$cty)
class(mpg$hwy)
class(mpg$fl)
class(mpg$class)

#=================================#
#     Estat�stica descritiva      #
#=================================#

# calcular media do n�mero de cilindros (cyl)
mean(mpg$cyl)

# mediana do n�mero de cilindros (cyl)
median(mpg$cyl)

# desvio-padrao do n�mero de cilindros (cyl)
sd(mpg$cyl)

# funcao summary
summary(mpg$cyl)

# frequencia dos tipos de carro (class)
table(mpg$class)

#=================================#
#      Gr�ficos com o ggplot2     #
#=================================#

ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# barras
ggplot(data = mpg) + 
  geom_bar(mapping = aes(x= class))

# histograma 
ggplot(data = mpg) + 
  geom_histogram(mapping = aes(x= displ))

# gr�fico de dispers�o
ggplot(data = mpg) + 
  geom_point(mapping = aes(x= displ, y = hwy))

# gr�fico de linha
ggplot(data = mpg) + 
  geom_line(mapping = aes(x = displ, y = hwy))

# smooth line
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))


