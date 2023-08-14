// Crop the raw images from the skull expansion series to obtain a segmented frontal bone
fileID = "20220317_BAPN_E14,5_OsxGFP_DAPI_#2-Stitching-25-Extended Depth of Focus-26.czi"
//20220317_BAPN_E14,5_OsxGFP_DAPI_#1-Stitching-23-Extended Depth of Focus-24.czi
//20220317_BAPN_E14,5_OsxGFP_DAPI_#2-Stitching-25-Extended Depth of Focus-26.czi

open("/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion_new/W8/2022_03_17/E14,5_OsxGFP_Phalloidin_DAPI/"+fileID)
run("Next Slice [>]");

run("Duplicate...", "title=temp1");

// image for shape extraction
run("Duplicate...", "title=temp2");

// (Optional) rescale intensity values
//setMinAndMax(0, 1000);
//run("Apply LUT");

// Set threshold and segment
setAutoThreshold("Otsu");
// setThreshold(0, 17000);
run("Convert to Mask");
run("Invert LUT");
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
save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_skull_expansion_new/W8/2022_03_17/segmented_Otsu_E14,5/"
imgId = "BAPN_E14.5_2L"
fname_out = "220317_"+imgId+"_T_Otsu.tif"
saveAs("Tiff", save_folder + fname_out);

// close windows
selectWindow("temp2");
close();
selectWindow(fname_out);
close();
