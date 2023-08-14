folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series2_W8/2022_01_10_Sp7mCherry/E13.5_tiff/";
files = newArray("100122_Sp7mCherry_E13,5_#1_left-Extended Depth of Focus-01.czi...122_Sp7mCherry_E13,5_#1_left-Extended Depth of Focus-01.czi #1.tif",
"100122_Sp7mCherry_E13,5_#1_right-Extended Depth of Focus-02.cz...22_Sp7mCherry_E13,5_#1_right-Extended Depth of Focus-02.czi #1.tif",
"100122_Sp7mCherry_E13,5_#2_left-Extended Depth of Focus-03.czi...122_Sp7mCherry_E13,5_#2_left-Extended Depth of Focus-03.czi #1.tif",
"100122_Sp7mCherry_E13,5_#2_right-Extended Depth of Focus-04.cz...22_Sp7mCherry_E13,5_#2_right-Extended Depth of Focus-04.czi #1.tif",
"100122_Sp7mCherry_E13,5_#3_left-Extended Depth of Focus-05.czi...122_Sp7mCherry_E13,5_#3_left-Extended Depth of Focus-05.czi #1.tif",
"100122_Sp7mCherry_E13,5_#3_right-Extended Depth of Focus-06.cz...22_Sp7mCherry_E13,5_#3_right-Extended Depth of Focus-06.czi #1.tif",
"100122_Sp7mCherry_E13,5_#4_right-Extended Depth of Focus-07.cz...22_Sp7mCherry_E13,5_#4_right-Extended Depth of Focus-07.czi #1.tif",
"100122_Sp7mCherry_E13,5_#5_left-Extended Depth of Focus-09.czi...122_Sp7mCherry_E13,5_#5_left-Extended Depth of Focus-09.czi #1.tif",
"100122_Sp7mCherry_E13,5_#5_right-Extended Depth of Focus-08.cz...22_Sp7mCherry_E13,5_#5_right-Extended Depth of Focus-08.czi #1.tif",
"100122_Sp7mCherry_E13,5_#6_right-Extended Depth of Focus-10.cz...22_Sp7mCherry_E13,5_#6_right-Extended Depth of Focus-10.czi #1.tif",
"100122_Sp7mCherry_E13,5_#7_left-Extended Depth of Focus-11.czi...122_Sp7mCherry_E13,5_#7_left-Extended Depth of Focus-11.czi #1.tif",
"100122_Sp7mCherry_E13,5_#7_right-Extended Depth of Focus-12.cz...22_Sp7mCherry_E13,5_#7_right-Extended Depth of Focus-12.czi #1.tif")


for (i=0; i< files.length; i++) {
	//run("Show Info...");
	file = files[i];
	open( folder+file );
	
	getImageInfo();
	output_folder = folder+"meta/"; //"/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series1_raw/E14.0/63x/";
	output_file = output_folder+file+".txt";
	//print(output_file);
	
	selectWindow("Log");
	saveAs("Text", output_file);
	
	//Table.deleteRows(0, 6000, "Log"); 
	close("Log");
}

run("Close All")