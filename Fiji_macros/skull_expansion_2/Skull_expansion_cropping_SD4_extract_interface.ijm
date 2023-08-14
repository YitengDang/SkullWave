run("Invert LUT");

//setThreshold(33153, 65535);
setAutoThreshold("Otsu");
run("Analyze Particles...", "size=10000-Infinity pixel clear add");

// apply to original
//roiManager("Deselect");
roiNum = getNumber("ROI to choose?", 1);
roiManager("Select", roiNum-1);
setBackgroundColor(0, 0, 0);
run("Clear Outside");

// rotate and crop manually