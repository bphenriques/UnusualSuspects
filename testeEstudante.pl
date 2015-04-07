%testes pessoais

%(Voldemort,tricot, botas),(Krillin,NAIFA, Descalco), (MeganFox, PomPom, Sandalias), (Alladeen, Beard, Barbatana)





testespessoais:- 
N=[suspeito(X,ArmaV,CalcadoV),suspeito(NomeB,ArmaB,CalcadoB),suspeito(NomeMF,ArmaMF,CalcadoMF), suspeito(NomeAl, ArmaAl, CalcadoAl)],
lado(suspeito('Voldemort',_,_), suspeito('Krillin',_,_), N),
naoEntre(suspeito(_,'NAIFA',_),suspeito(_,'Tricot',_),suspeito(_,_,'Barbatanas'),N),
ou(suspeito(_,_,'Descalco'), suspeito('Krillin',_,_), suspeito(_,'PomPom',_),N),
entre(suspeito('Voldemort',_,_), suspeito(_,'NAIFA',_),suspeito(_,_,'Sandalias'), N),
esquerda(suspeito(_,_,'Botas'),suspeito('MeganFox',_,_), N),
direita(suspeito('Krillin',_,_), suspeito(_,'Tricot',_), N),
direita(suspeito(_,_,'Sandalias'), suspeito(_,'Tricot',_), N),
existe(suspeito('Alladeen',_,_), N),
esquerda(suspeito(_,_,'Descalco'),suspeito('Alladeen',_,_), N),
naoEntre(suspeito(_,_,'Botas'),suspeito(_,'Barba',_),suspeito(_,_,'Sandalias'),N),
lado(suspeito('MeganFox',_,_), suspeito(_,_,'Barbatanas'), N),
ou(suspeito('Alladeen',_,_), suspeito(_,'Barba',_),suspeito(_,_,'Descalco'), N),
write('NomeVoldi-'),write(X),
write('|ArmaVoldi-'),write(ArmaV),
write('|CalcadoVoldi-'),write(CalcadoV),
write('--------------'), 
write('|NomemeKrillin-'),write(NomeB),
write('|ArmaKrillin-'),write(ArmaB),
write('|CalcadoKrillin-'),write(CalcadoB),
write('--------------'), 
write('|NomeMeganFox-'),write(NomeMF),
write('|ArmaMeganFox-'),write(ArmaMF),
write('|CalcadoMeganFox-'),write(CalcadoMF),
write('--------------'), 
write('|NomeAlladeen-'),write(NomeAl),
write('|ArmaAlladeen-'),write(ArmaAl),
write('|CalcadoAlladeen-'),write(CalcadoAl).



