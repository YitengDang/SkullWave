// Load image
folder_in = "/Users/dang/Documents/TablerLab/Data_Live_Imaging/190305 Live Imaging/Original/";
//fname_in = "MaxProjected_Stitched_dataset(0-12hr).tif";
fname_in = "MaxProjected_Stitched_Blurred_190305_ML1_OsxGFP_Explant_Video_1(0-12hr)";
ext = ".tif";
open(folder_in + fname_in + ext);

// Save modified image
folder_out = "/Users/dang/Documents/TablerLab/Data_Live_Imaging/190305 Live Imaging/";
fname_out = fname_in + "_YD_processed";
saveAs("Tiff", folder_out + fname_out);

// Process image
setThreshold(12, 65535); 
run("Convert to Mask", "method=Default background=Dark black list");
run("Remove Outliers", "block_radius_x=20 block_radius_y=20 standard_deviations=2 stack");

// Export individual images as txt files
save_folder = "/Users/dang/Documents/TablerLab/Data_Live_Imaging/190305 Live Imaging/Processed_TXT_data_blurred";
for (i = 0; i <= nSlices; i++) {
	saveAs("Text Image", save_folder + fname_out + "_t" + i + ".txt");
	run("Next Slice [>]");
}

