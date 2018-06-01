import matplotlib.pyplot as plt
import math as m

f = open('aaa2.txt', 'r')
print(f)

myData=[]

for line in f:
 myData.append(float(line)+10)

f.close()

f = open('bbb2.txt', 'r')
print(f)

myData2=[]

for line in f:
 myData2.append(float(line)+10)

f.close()
#print(myData)

f = open('ccc2.txt', 'r')
print(f)

myData3=[]

for line in f:
 myData3.append(float(line)+10)

f.close()
f = open('ddd2.txt', 'r')
print(f)

myData4=[]

for line in f:
 myData4.append(float(line)+10)

f.close()

#plt.plot(map(lambda x: m.log(x,10),range(10,1010)),
#        map(lambda x: m.log(x,10)-1,myData),'bs',
#        map(lambda x: m.log(x,10),range(10,1010)),
 #       map(lambda x: m.log(x,10)-1, myData2),'r--',
  #      map(lambda x: m.log(x,10),range(10,1010)),
   #     map(lambda x: m.log(x,10)-1, myData3),'g^',
    #    map(lambda x: m.log(x,10),range(10,1010)),
     #   map(lambda x: m.log(x,10)-1, myData4),'yo')
plt.title('Niebieski=matmul, czerwony=both, zielony=cache, zolty=dotp')
plt.plot(range(1,1001),myData,'bo',
        range(1,1001),myData2,'ro',
        range(1,1001),myData3,'go',
        range(1,1001),myData4,'yo')
plt.axis([1,1000,10,13])
plt.ylabel('Time')
plt.xlabel('N')
plt.yscale('log')
plt.xscale('log')
plt.show()
