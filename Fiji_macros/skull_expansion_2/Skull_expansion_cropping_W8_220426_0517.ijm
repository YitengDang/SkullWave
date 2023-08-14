// Crop the raw images from the skull expansion series to obtain a segmented frontal bone
//fileID = "20220317_BAPN_E14,5_OsxGFP_DAPI_#2-Stitching-25-Extended Depth of Focus-26.czi"
//20220317_BAPN_E14,5_OsxGFP_DAPI_#1-Stitching-23-Extended Depth of Focus-24.czi
//20220317_BAPN_E14,5_OsxGFP_DAPI_#2-Stitching-25-Extended Depth of Focus-26.czi

//open("/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion_new/W8/2022_03_17/E14,5_OsxGFP_Phalloidin_DAPI/"+fileID)
//run("Next Slice [>]");
run("Duplicate...", "title=temp1");

// image for shape extraction
run("Duplicate...", "title=temp2");

// (Optional) rescale intensity values
//setMinAndMax(0, 1000);
//run("Apply LUT");

// Set threshold and segment–
// Otsu
//setAutoThreshold("Otsu");
// setThreshold(0, 17000);
//run("Convert to Mask");
//run("Invert LUT");
s
// other
run("Auto Threshold", "method=Huang2 white");
run("Invert LUT");

// get 'particles'
roiManager("Deselect");
run("Analyze Particles...", "size=50000-Infinity pixel clear add");

// apply to original
selectWindow("temp1");
roiNum = getNumber("ROI to choose?", 1);
roiManager("Select", roiNum-1);
setBackgroundColor(0, 0, 0);
run("Clear Outside");

// Save new image
//save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/"
// save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series2_W8/2022_04_26/segmented_E14.75_BAPN/"
// save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series2_W8/2022_04_26/segmented_E14.75_CTRL/"
save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series2_W8/2022_05_17/segmented_E15.0_BAPN/"
//save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion/series2_W8/2022_05_17/segmented_E15.5_BAPN/"
imgId = "BAPN_E15.0_08L_precropped"
//fname_out = "220426_"+imgId+"_T_Huang2.tif"
fname_out = "220517_"+imgId+"_T_Huang2.tif"
 saveAs("Tiff", save_folder + fname_out);

// close windows
selectWindow("temp2");
close();
selectWindow(fname_out);
close();
