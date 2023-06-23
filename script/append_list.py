with open('a.txt', 'r') as file:
    list1 = file.readlines()
    list1 = [line.strip() for line in list1]

with open('b.txt', 'r') as file:
    list2 = file.readlines()
    list2 = [line.strip() for line in list2]

list3 = []
for i in range(len(list1)):
    sublist = [list1[i], list2[i]]
    list3.append(sublist)
print(list3)
