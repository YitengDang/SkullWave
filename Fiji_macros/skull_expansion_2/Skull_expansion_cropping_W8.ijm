// Crop the raw images from the skull expansion series to obtain a segmented frontal bone
run("Duplicate...", "title=temp1");

// image for shape extraction
run("Duplicate...", "title=temp2");
// setThreshold(0, 2200);
setMinAndMax(0, 500);
run("Apply LUT");
setAutoThreshold("Otsu");
// setThreshold(0, 17000);
run("Convert to Mask");
run("Invert LUT");
roiManager("Deselect");
run("Analyze Particles...", "size=50000-Infinity pixel clear add");

// apply to original 
selectWindow("temp1");
roiNum = getNumber("ROI to choose?", 0);
roiManager("Select", roiNum);
setBackgroundColor(0, 0, 0);
run("Clear Outside");

// Save new image
//save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/"
save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/W8/2022_01_10_Sp7mCherry/E15.5_tiff_segmented/"
imgNum = "05"
fname_out = "100122_BC_0_500_T_Otsu_"+imgNum+".tif"
saveAs("Tiff", save_folder + fname_out);

// close windows
selectWindow("temp2");
close();
selectWindow(fname_out);
close();
