def atomicdictionary():
    atomic = {"H":"Hydrogen","He":"Helium","Li":"Lithium","Be":"Berrylium","B":"Boron","C":"Carbon","N":"Nitrogen","F":"Fluorine","Ne":"Neon"}
    print(atomic)
    sym = raw_input("Enter an existing symbol: ")
    name = raw_input("Enter an element name: ")
    atomic[sym] = name
    print(atomic)
    sym = raw_input("Enter a new symbol: ")
    name = raw_input("Enter a new element name: ")
    atomic[sym] = name
    print(atomic)
    print("No. of elements: ",len(atomic))
    ele=raw_input("Enter element to search: ")
    # for i in atomic:
    #     if(i==ele):
    #         print("Element found!")

    if ele in atomic:
        print("Element found")
    else:
        print("Element not found")

atomicdictionary()