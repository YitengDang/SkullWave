#FILE_LIST=$(ls "/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series1_raw/E13.5/63x/" | grep ".txt")
#FILE_LIST=$(pwd)
# ls "/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series1_raw/E13.5/63x/" | grep ".txt" > "tmp.txt"
# cat -n "tmp.txt"
#echo ${FILE_LIST}

for file in (*.txt)
do
	echo $file
done
# example
# IN_FILE="Log.txt"
# OUT_FILE="Log_out.txt"
# grep "Title:" ${IN_FILE} >> ${OUT_FILE}
# grep "Magnification:" ${IN_FILE} >> ${OUT_FILE}

# grep -A 25 "(Fiji Is Just) ImageJ" Log.txt > Log_out.txt # multiple lines -B before or -A after
