// Extract interface profile from manually selected area
requires("1.30k");
getSelectionCoordinates(x, y);
toUnscaled(x, y); 
// for (i=0; i<x.length; i++)
    // print(i+" "+x[i]+" "+y[i]);
tolerance = 400;
sample = 1;
save_folder = "/Users/dang/Documents/Projects/Tabler_skull/Data_BAPN/Interface_thresholds/" // getDirectory("image")
fname_out = "MAX_PHD_Tabler_BAPN_E140_YD_tolerance_" + tolerance + "_2" // + "_sample_" + sample;
saveAs("xy Coordinates", save_folder + fname_out) // save coordinates as txt
// saveAs("selection", getDirectory("image") + fname_out) // save selection as ROI (for loading into ImageJ)