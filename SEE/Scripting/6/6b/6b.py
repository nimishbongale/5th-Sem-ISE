class SentenceReverser:
	vowels = ["a","e","i","o","u"]
	sentence = ""
	reverse = ""
	vowelCount = 0
	def __init__(self,sentence):
		self.sentence = sentence
		self.reverseSentence()
	def reverseSentence(self):
		self.reverse = " ".join(reversed(self.sentence.split()))
	def getVowelCount(self):
		self.vowelCount = sum(s in self.vowels for s in self.sentence.lower())
		return self.vowelCount
	def getReverse(self):
		return self.reverse

items = []

for i in range(3):
	reverser = SentenceReverser(input("Enter a sentence :"))
	items.append(reverser)
	print(reverser.reverse)

print ("Sorted descending vowel count: ")
for i in sorted(items,key=lambda item:item.getVowelCount(),reverse=True):
	print (i.getReverse(),"->",i.getVowelCount())


