// Create a binary mask from a pre-processed image with black background
// Separate connected objects using Watershed

// Crop the raw images from the skull expansion series to obtain a segmented frontal bone
//run("Select None");
run("Duplicate...", "title=temp1");

// Option 1. Apply watershed algorithm
//// image for shape extraction
//run("Duplicate...", "title=temp2");
////setAutoThreshold("Default");
//setThreshold(0, 1);
//run("Threshold...");
//setOption("BlackBackground", false);
//run("Convert to Mask");
//
//run("Invert LUT");
//run("Watershed");
//// Get newly separated islands
//roiManager("Deselect");
//run("Analyze Particles...", "size=10000-Infinity pixel clear add");
//
//// Select regions to keep after watershed
//selectWindow("temp1");
//// roiNum = getNumber("ROI to choose?", 0);
//roiManager("Select", newArray(6, 8, 9) );
//roiManager("Combine");
//setBackgroundColor(0, 0, 0);
//run("Clear Outside");

// Option 2. Manually crop regions
selectWindow("temp1");
// -> manually select region, then
setBackgroundColor(0, 0, 0);
run("Clear Outside");

//run("Close");
//run("Invert LUT");
save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/W8/2022_01_10_Sp7mCherry/E15.5_tiff_segmented/"
imgNum = "06"
//saveAs("Tiff", save_folder+"100122_BC_0_500_T_Otsu_"+imgNum+"_watershed.tif");
saveAs("Tiff", save_folder+"100122_BC_0_500_T_Otsu_"+imgNum+"_manual_crop.tif");
close();
close();
