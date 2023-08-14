// Crop the raw images from the skull expansion series to obtain a segmented frontal bone
run("Duplicate...", "title=temp1");

// image for shape extraction
run("Duplicate...", "title=temp2");
setThreshold(0, 2200);
run("Convert to Mask");
run("Invert LUT");
roiManager("Deselect");
run("Analyze Particles...", "size=50000-Infinity pixel clear add");

// apply to original 
selectWindow("temp1");
roiManager("Select", 0);
setBackgroundColor(0, 0, 0);
run("Clear Outside");

// Save new image
//save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/"
//save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_raw/Selected/temp/"
save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_raw/Selected/temp/"
fname_out = "temp_0_2200.tif"
saveAs("Tiff", save_folder + fname_out);

// close windows
selectWindow("temp2");
close();
selectWindow(fname_out);
close();
