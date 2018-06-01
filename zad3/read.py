import matplotlib.pyplot as plt
import math as m

f = open('aaa.txt', 'r')
print(f)

myData=[]

for line in f:
 myData.append(float(line))

f.close()

f = open('bbb.txt', 'r')
print(f)

myData2=[]

for line in f:
 myData2.append(float(line))

f.close()
#print(myData)

f = open('ccc.txt', 'r')
print(f)

myData3=[]

for line in f:
 myData3.append(float(line))

f.close()
f = open('ddd.txt', 'r')
print(f)

myData4=[]

for line in f:
 myData4.append(float(line))

f.close()

plt.plot(map(lambda x: m.log(x,10),range(1,1001)),
        map(lambda x: m.log(x,10),myData),'bs',
        map(lambda x: m.log(x,10),range(1,1001)),
        map(lambda x: m.log(x,10), myData2),'r--',
        map(lambda x: m.log(x,10),range(1,1001)),
        map(lambda x: m.log(x,10), myData3),'g^',
        map(lambda x: m.log(x,10),range(1,1001)),
        map(lambda x: m.log(x,10), myData4),'r--')
plt.ylabel('Time')
plt.xlabel('N')
plt.show()
