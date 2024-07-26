// Automated thresholding using Otsu method

// Process image
//setThreshold(12, 65535); 
//run("Convert to Mask", "method=Default background=Dark black list");
run("Auto Threshold", "method=Otsu white stack use_stack_histogram");
run("Remove Outliers", "block_radius_x=20 block_radius_y=20 standard_deviations=2 stack");

// dates_all = ["190305", "190314", "200120", "170902"]
// Export individual images as txt files
/*
fname_out = "";
save_folder = "/Users/dang/Documents/TablerLab/Data_Live_Imaging/170902 Live Imaging/Processed_TXT_data_blurred";
for (i = 0; i <= nSlices; i++) {
	saveAs("Text Image", save_folder + fname_out + "_t" + i + ".txt");
	run("Next Slice [>]");
}
*/

// Extract the interface from each image from processed binary pictures 
setSlice(1);

// Convert to binary
setAutoThreshold("Default dark");
//setThreshold(124, 255);
run("Convert to Mask", "method=Default background=Dark black list");

// Analyze entire stack
// run("Analyze Particles...", "size=100000-Infinity clear add stack");

save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_Live_Imaging/221114 BAPN E14.0 live imaging/Processed_TXT_data_interface_Otsu/";
for (i = 0; i < nSlices; i++) {
	t=i;
	//t = i+49;
	run("Analyze Particles...", "size=20000-Infinity clear add slice");
	roiManager("Select", 0);	
	
	// delete rest of image	
	run("Make Inverse");
	setForegroundColor(255, 0, 0);
	run("Fill", "slice");
	//setAutoThreshold("Default dark");
	setThreshold(129, 255); // convert to binary
	run("Convert to Mask", "method=Default background=Dark only black list");	
	
	// save image
	//saveAs("Text Image", save_folder + "MaxProjected_Stitched_dataset(0-12hr)_YD_processed_interface_t" + t + ".txt");
	roiManager("Deselect");
	
	//wait(100);
	run("Next Slice [>]");	
}