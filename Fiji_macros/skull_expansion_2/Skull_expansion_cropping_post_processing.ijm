// Post-processing of cropped images
run("Close All");
//dir = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/E15.5_63x/"
dir = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/W8/2022_01_10_Sp7mCherry/E13.5_tiff_segmented/tmp/"

//dir=getDirectory("Choose Directory");
list = getFileList(dir);

for (i=0; i<list.length; i+=1) {
	print(list[i]);
	open( dir+list[i] );
	
	run("Select None");
	run("Duplicate...", "title=temp");
	
	//run("Flip Horizontally");
	//run("Flip Vertically");
	
	// Flip image in X axis
	flip_bool = getNumber("Flip image in X axis? ", 0);
	if (flip_bool) {
		run("Flip Horizontally");
	}
	
	// Flip image in Y axis
	flip_bool = getNumber("Flip image in Y axis? ", 0);
	if (flip_bool) {
		run("Flip Vertically");
	}
	
	fname_out = list[i]; // same name
	saveAs("Tiff", dir + fname_out);

	waitForUser("Check result");
	
	// selectWindow("temp");
	close();
	close();
}