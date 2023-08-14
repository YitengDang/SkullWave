// Create a binary mask from a pre-processed image with black background
run("Select None");
run("Duplicate...", " ");
//setAutoThreshold("Default");
setThreshold(0, 1);
run("Threshold...");

setOption("BlackBackground", false);
run("Convert to Mask");
//run("Close");
//run("Invert LUT");
saveAs("Tiff", "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_thresholded/E15.5 mask.tif");
close();
