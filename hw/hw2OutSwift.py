import csv

numbers = [
	"first",
	"second",
	"third",
	"fourth",
	"fifth",
	"sixth",
	"seventh",
	"eighth",
	"ninth",
	"tenth",
	"eleventh",
	"twelfth",
	"thirteenth",
	"fourteenth",
	"fifteenth",
	"sixteenth",
	"seventeenth",
	"eighteenth",
	"nineteenth",
	"twentieth",
	"twentyFirst",
	"twentySecond",
	"twentyThird",
	"twentyFourth",
	"twentyFifth",
	"twentySixth",
	"twentySeventh",
	"twentyEighth",
	"twentyNinth",
	"thirtieth",
	"thirtyFirst",
	"thirtySecond",
	"thirtyThird",
	"thirtyFourth",
	"thirtyFifth",
	"thirtySixth",
	"thirtySeventh",
	"thirtyEighth",
	"thirtyNinth",
	"fortieth",
	"fortyFirst",
	"fortySecond",
	"fortyThird",
	"fortyFourth",
	"fortyFifth",
	"fortySixth",
	"fortySeventh",
	"fortyEighth",
	"fortyNinth",
	"fiftieth",
	"fiftyFirst",
	"fiftySecond",
	"fiftyThird",
	"fiftyFourth",
	"fiftyFifth",
	"fiftySixth",
	"fiftySeventh",
	"fiftyEighth",
	"fiftyNinth",
	"sixtieth",
	"sixtyFirst",
	"sixtySecond",
	"sixtyThird",
	"sixtyFourth",
	"sixtyFifth",
	"sixtySixth",
	"sixtySeventh",
	"sixtyEighth",
	"sixtyNinth",
	"seventieth",
	"seventyFirst",
	"seventySecond",
	"seventyThird",
	"seventyFourth",
	"seventyFifth",
	"seventySixth",
	"seventySeventh",
	"seventyEighth",
	"seventyNinth",
	"eightieth",
	"eightyFirst",
	"eightySecond",
	"eightyThird",
	"eightyFourth",
	"eightyFifth",
	"eightySixth",
	"eightySeventh",
	"eightyEighth",
	"eightyNinth",
	"ninetieth",
	"ninetyFirst",
	"ninetySecond",
	"ninetyThird",
	"ninetyFourth",
	"ninetyFifth",
	"ninetySixth",
	"ninetySeventh",
	"ninetyEighth",
	"ninetyNinth",
	"oneHundredth"
]
lineNames = ["Red", "Blue", "Green", "Brown", "Purple", "Yellow", "Pink", "Orange"]
special = [" ", "'", "&", "(", ")", ".", ",", "!", "?", ":", ";"]

stationNames = []
stationDescriptiveNames = []
stationMapIDs = []
stationCoords = []
stationIsADAComplient = []

isOnLines = {} #Dict based on stationMapID

for name in stationDescriptiveNames:
	print(name)

def readData():
	with open('lstops.csv', 'r') as csv_file:
		csv_reader = csv.reader(csv_file)
		next(csv_reader)
		for row in csv_reader:
			stationNames.append(row[3])
			stationDescriptiveNames.append(row[4])
			stationMapIDs.append(row[5])
			stationCoords.append(row[16])
			if int(row[5]) not in isOnLines:
				isOnLines[int(row[5])] = []
			
			if (row[6].lower() == "true"): 
				stationIsADAComplient.append(True)
			else:
				stationIsADAComplient.append(False)
			if (row[7].lower() == "true"): 
				if ("Red" not in isOnLines[int(row[5])]):
					isOnLines[int(row[5])].append("Red")
			if (row[8].lower() == "true"):
				if ("Blue" not in isOnLines[int(row[5])]):
					isOnLines[int(row[5])].append("Blue")
			if (row[9].lower() == "true"):
				if ("Green" not in isOnLines[int(row[5])]):
					isOnLines[int(row[5])].append("Green")
			if (row[10].lower() == "true"):
				if ("Brown" not in isOnLines[int(row[5])]):
					isOnLines[int(row[5])].append("Brown")
			if (row[11].lower() == "true"):
				if ("Purple" not in isOnLines[int(row[5])]):
					isOnLines[int(row[5])].append("Purple")
			if (row[12].lower() == "true"):
				if ("PurpleExp" not in isOnLines[int(row[5])]):
					isOnLines[int(row[5])].append("PurpleExp")
			if (row[13].lower() == "true"):
				if ("Yellow" not in isOnLines[int(row[5])]):
					isOnLines[int(row[5])].append("Yellow")
			if (row[14].lower() == "true"):
				if ("Pink" not in isOnLines[int(row[5])]):
					isOnLines[int(row[5])].append("Pink")
			if (row[15].lower() == "true"):
				if ("Orange" not in isOnLines[int(row[5])]):
					isOnLines[int(row[5])].append("Orange")

def replaceDashesAndSlashesWithSpaces(name):
	name = name.replace("-", " ")
	name = name.replace("/", " ")
	return name

def formatStringNameAsVariable(name):
	for char in special:
		name = name.replace(char, "")
	# name = name[0]
	return name[0].lower() + name[1:]

def formatStreetNumberAsString(name):
	words = name.split()
	for i, word in enumerate(words):
		if word.endswith("st") or word.endswith("nd") or word.endswith("rd") or word.endswith("th") and word[:-2].isdigit():
			try:
				num = int(word[:-2])
			except:
				continue
			words[i] = numbers[num-1]
	return " ".join(words)

def createTuplesForArr(arr):
	for i in range(0, len(stationNames)):
		arr.append((stationNames[i], stationDescriptiveNames[i], stationMapIDs[i], stationCoords[i], isOnLines[int(stationMapIDs[i])], stationIsADAComplient[i]))

def removeDupsFromTupleArr(arr):
	uniques = []
	uniques = [tup for i, tup in enumerate(arr) if tup[1] not in [t[1] for t in arr[:i]]]
	return uniques

def formatArrays():
	for i in range(0, len(stationNames)):
		stationNames[i] = formatStringNameAsVariable(formatStreetNumberAsString(replaceDashesAndSlashesWithSpaces(stationNames[i])))
		stationDescriptiveNames[i] = formatStringNameAsVariable(formatStreetNumberAsString(replaceDashesAndSlashesWithSpaces(stationDescriptiveNames[i])))

readData()

tupsFullNames = []
createTuplesForArr(tupsFullNames)
tupsFullNames = removeDupsFromTupleArr(tupsFullNames)

formatArrays()
tupsVars = []
createTuplesForArr(tupsVars)
tupsVars = removeDupsFromTupleArr(tupsVars)

#Uncomment one of the following lines to generate cases in swift for specific data
for i in range(0, len(tupsVars)):
	# print("case " + tupsVars[i][1])
	# print("case " + tupsVars[i][1] + " = " + tupsFullNames[i][2])
	# print("case ." + tupsVars[i][1] + ": return \"" + tupsFullNames[i][0] + "\"")
	# print("case ." + tupsVars[i][1] + ": return \"" + tupsFullNames[i][1] + "\"")
	# print("case ." + tupsVars[i][1] + ": return " + tupsFullNames[i][2])
	# print("case ." + tupsVars[i][1] + ": return \"" + tupsFullNames[i][3] + "\"")
	# print("case ." + tupsVars[i][1] + ": return " + tupsFullNames[i][3].strip('()').split(', ')[0])
	# print("case ." + tupsVars[i][1] + ": return " + tupsFullNames[i][3].strip('()').split(', ')[1])

	# print("case ." + tupsVars[i][1] + ": return [\"" + "\", \"".join(tupsVars[i][4]) + "\"]")
	print("case ." + tupsVars[i][1] + ": return " + str(tupsVars[i][5]).lower())
