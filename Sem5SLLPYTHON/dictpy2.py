mydict={"1ms17is074":"Nidhi","1ms17is075":"Nikhil","1ms17is076":"T Nikhil","1ms17is077":"Nimish"}
print "Enter name followed by USN: "
mydict[raw_input()] = raw_input()
print "Deleting students whose names start with T: "
for i in mydict.keys():
    if mydict[i][0]=='T':
        mydict.pop(i)

print mydict
for j in sorted(mydict.values()):
    print j