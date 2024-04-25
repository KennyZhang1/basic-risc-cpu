import datetime

MemorySize = 40959+1  # 0x9FFF
ROMUpperAddressLimit = 32767  # 0x7FFF
InputFileName = "xor_test.txt"

# Define output files
Byte3FileName = "byte3_romfile"
Byte2FileName = "byte2_romfile"
Byte1FileName = "byte1_romfile"
Byte0FileName = "byte0_romfile"
Byte3File = open(Byte3FileName, "w")
Byte2File = open(Byte2FileName, "w")
Byte1File = open(Byte1FileName, "w")
Byte0File = open(Byte0FileName, "w")

# Write comments in file to explain file content.
x = datetime.datetime.now()
Byte3File.write("#Byte 3 ROM file. Automatically generated on "+x.strftime("%H:%M:%S %d %b, %Y")+"\n")
Byte3File.write("#Input file: " + InputFileName + "\n\n")
Byte3File.write("#address / data ;\n")
Byte3File.write("#----------------\n")

Byte2File.write("#Byte 2 ROM file. Automatically generated on "+x.strftime("%H:%M:%S %d %b, %Y")+"\n")
Byte2File.write("#Input file: " + InputFileName + "\n\n")
Byte2File.write("#address / data ;\n")
Byte2File.write("#----------------\n")

Byte1File.write("#Byte 1 ROM file. Automatically generated on "+x.strftime("%H:%M:%S %d %b, %Y")+"\n")
Byte1File.write("#Input file: " + InputFileName + "\n\n")
Byte1File.write("#address / data ;\n")
Byte1File.write("#----------------\n")

Byte0File.write("#Byte 0 ROM file. Automatically generated on "+x.strftime("%H:%M:%S %d %b, %Y")+"\n")
Byte0File.write("#Input file: " + InputFileName + "\n\n")
Byte0File.write("#address / data ;\n")
Byte0File.write("#----------------\n")

PrintString = "{:x}/{};\n"
InputFile = open(InputFileName)
for CurrentLine in InputFile:
    CurrentAddress = CurrentLine[0:8]  # characters 0-7, 8 is not included
    CurrentData = CurrentLine[9:17]  # characters 9-16, 17 is not included
    MemoryImageIndex = int(CurrentAddress, 16)
    if (MemoryImageIndex <= ROMUpperAddressLimit):
        ByteBoundary = MemoryImageIndex % 4
        CurrentData = CurrentData.strip()
        NumberOfBytes = len(CurrentData) >> 1  # avoids conversion of int to float

        if NumberOfBytes == 1:
            if ByteBoundary == 0:
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData))
            elif ByteBoundary == 1:
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData))
            elif ByteBoundary == 2:
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData))
            elif ByteBoundary == 3:
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData))
        elif NumberOfBytes == 2:
            if ByteBoundary == 0:
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:]))
            elif ByteBoundary == 1:
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:]))
            elif ByteBoundary == 2:
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:]))
            elif ByteBoundary == 3:
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:]))
        elif NumberOfBytes == 3:
            if ByteBoundary == 0:
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:4]))
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[4:]))
            elif ByteBoundary == 1:
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:4]))
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[4:]))
            elif ByteBoundary == 2:
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:4]))
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[4:]))
            elif ByteBoundary == 3:
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:4]))
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[4:]))
        elif NumberOfBytes == 4:
            if ByteBoundary == 0:
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:4]))
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[4:6]))
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[6:]))
            elif ByteBoundary == 1:
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:4]))
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[4:6]))
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[6:]))
            elif ByteBoundary == 2:
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:4]))
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[4:6]))
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[6:]))
            elif ByteBoundary == 3:
                Byte0File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[0:2]))
                Byte3File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[2:4]))
                Byte2File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[4:6]))
                Byte1File.write(PrintString.format(MemoryImageIndex >> 2, CurrentData[6:]))

Byte0File.close()
Byte1File.close()
Byte2File.close()
Byte3File.close()
InputFile.close()