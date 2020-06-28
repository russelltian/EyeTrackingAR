file= open("calibration.txt","r")
dict = {}
for line in file: 
    x = [int(i) for i in line.split()]
    dict[(x[2], x[3])] = True
    # print((x[2], x[3]))

for i in range(250,1050,20):
    for j in range(1000,2000,20):
        if (i,j) not in dict.keys():
            print(i,j,"not here")