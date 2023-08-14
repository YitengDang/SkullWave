run("Select None");
run("Duplicate...", " ");
run("Convolve...", "text1=[0 1 0 0 0 \n-1 0 1 0 0 \n0 -1 0 1 0 \n0 0 -1 0 1 \n0 0 0 -1 0 ] normalize");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
setMinAndMax(38, 1183);