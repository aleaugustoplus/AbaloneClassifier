require("neuralnet")

x = read.csv("abalone.train")
x = x[,1:8]

print(x)
yd = read.csv("abalone.train")
yd = as.matrix(yd[,9])
#Normalization of value Between -1 and 1
#yd=(yd*0.068965517)-1
print(yd)

trainingdata <- cbind(x,yd)
colnames(trainingdata) <- c("x0","x1","x2","x3","x4","x5","x6","x7","Output")
trainingdata = as.matrix(trainingdata)
print("Treinando rede...")
net.abalone <- neuralnet(Output~x0+x1+x2+x3+x4+x5+x6+x7,trainingdata, linear.output=TRUE,hidden=30, threshold=0.1)
print("Rede treinada!")

#------Neural network tests--------------------------------------------

x = read.csv("abalone.train")
x = x[,1:8]
print("Classificando...")
net.results = compute(net.abalone, x)
print("Classificado!")
#print("Results")
#print(net.results)

test=read.csv("abalone.train")
test=test[,9:9]


i=1
error=0
for(net.result in net.results$net.result)
{
   
#	result=round((net.result+1)*14.05,0)	
	print(paste0("Resultado: ",result, " Esperado: ", test[i] ))
		
	if(result!=test[i])
		error=error+1
	i=i+1			
}
percent=error/i
percent=percent*100
print(paste0("Total de testes:", i))
print(paste0("Total de erros: ", error  ))
print(paste0("Percentual de erro: ", percent, "% "  ))

