folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series1_raw/E15.5/63x/";
//files = newArray("170919 SP7 mCherry Skullcap Overview E13.0 63x Skull 1.czi", "180220 SP7 mCherry Skullcap Overview E13.0 63x Skull 1 right.czi",
//"170919 SP7 mCherry Skullcap Overview E13.0 63x Skull 2.czi", "180220 SP7 mCherry Skullcap Overview E13.0 63x Skull 2 left.czi",
//"170919 SP7 mCherry Skullcap Overview E13.0 63x Skull 3.czi", "180220 SP7 mCherry Skullcap Overview E13.0 63x Skull 2 right.czi",
//"180220 SP7 mCherry Skullcap Overview E13.0 63x Skull 1 left.czi", "180220 SP7 mCherry Skullcap Overview E13.0 63x Skull 3.czi");
//files = newArray("170919 SP7 mCherry Skullcap Overview E13.0 63x Skull 1.czi", "180220 SP7 mCherry Skullcap Overview E13.0 63x Skull 1 right.czi")
//files = newArray("170919 SP7 mCherry Skullcap Overview E14.0 63x Skull 1 left.czi", "180220 SP7 mCherry Skullcap Overview E14.0 63x Skull 1 left.czi",
//"170919 SP7 mCherry Skullcap Overview E14.0 63x Skull 1 right.czi", "180220 SP7 mCherry Skullcap Overview E14.0 63x Skull 1 right.czi",
//"170919 SP7 mCherry Skullcap Overview E14.0 63x Skull 2 left.czi", "180220 SP7 mCherry Skullcap Overview E14.0 63x Skull 2.czi",
//"170919 SP7 mCherry Skullcap Overview E14.0 63x Skull 3.czi", "180220 SP7 mCherry Skullcap Overview E14.0 63x Skull 3.czi",
//"170919 SP7 mCherry Skullcap Overview E14.0 63x Skull 4.czi", "180220 SP7 mCherry Skullcap Overview E14.0 63x Skull 4.czi",
//"170919 SP7 mCherry Skullcap Overview E14.0 63x Skull 5.czi")
//files = newArray("170919 SP7 mCherry Skullcap Overview E14.5 63x Skull 1 left.czi",		"170919 SP7 mCherry Skullcap Overview E14.5 63x Skull 2 right.czi",
//"170919 SP7 mCherry Skullcap Overview E14.5 63x Skull 1 right.czi",	"180220 SP7 mCherry Skullcap Overview E14.5 63x Skull 1.czi",
//"170919 SP7 mCherry Skullcap Overview E14.5 63x Skull 2 left.czi",		"180220 SP7 mCherry Skullcap Overview E14.5 63x Skull 2.czi")
//files = newArray("071019 SP7 mCherry Skullcap E15.0 63x Skull 3 left.czi",		"071019 SP7 mCherry Skullcap E15.0 63x Skull 5 right.czi",
//"071019 SP7 mCherry Skullcap E15.0 63x Skull 3 right.czi",		"071019 SP7 mCherry Skullcap E15.0 63x Skull 6 left.czi",
//"071019 SP7 mCherry Skullcap E15.0 63x Skull 4 left.czi",		"071019 SP7 mCherry Skullcap E15.0 63x Skull 6 right.czi",
//"071019 SP7 mCherry Skullcap E15.0 63x Skull 4 right.czi",		"170919 SP7 mCherry Skullcap Overview E15.0 63x Skull 1.czi",
//"071019 SP7 mCherry Skullcap E15.0 63x Skull 5 left.czi")
files = newArray("170919 SP7 mCherry Skullcap Overview E15.5 63x Skull 1.czi", "170919 SP7 mCherry Skullcap Overview E15.5 63x Skull 5 left.czi",
"170919 SP7 mCherry Skullcap Overview E15.5 63x Skull 2.czi", "170919 SP7 mCherry Skullcap Overview E15.5 63x Skull 5 right.czi",
"170919 SP7 mCherry Skullcap Overview E15.5 63x Skull 3.czi", "170919 SP7 mCherry Skullcap Overview E15.5 63x Skull 6.czi",
"170919 SP7 mCherry Skullcap Overview E15.5 63x Skull 4.czi", "170919 SP7 mCherry Skullcap Overview E15.5 63x Skull 7.czi");

for (i=0; i< files.length; i++) {
	//run("Show Info...");
	file = files[i];
	open( folder+file );
	
	getImageInfo();
	output_folder = folder; //"/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series1_raw/E14.0/63x/";
	output_file = output_folder+file+".txt";
	//print(output_file);
	
	selectWindow("Log");
	saveAs("Text", output_file);
	
	//Table.deleteRows(0, 6000, "Log"); 
	close("Log");
}

run("Close All")