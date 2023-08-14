// Loop 2: align all to same reference
transformation_type = "Euler"
batch_id = "E15.5"
dir_originals = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/"+batch_id+"_63x/"
dir_output = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_transformed/"+batch_id+"_"+transformation_type+"/";

// "170919_Skull_2", "170919_Skull_3", "180220_Skull_1L", "180220_Skull_1R", "180220_Skull_2L", "180220_Skull_2R", "180220_Skull_3"
// "E14.0_170919_Skull_3_thresholded","E14.0_170919_Skull_4_thresholded", "E14.0_170919_Skull_1R_thresholded", "E14.0_170919_Skull_2L_thresholded", "E14.0_180220_Skull_4_thresholded", "E14.0_180220_Skull_1L_thresholded", "E14.0_180220_Skull_1R_thresholded", "E14.0_180220_Skull_2_thresholded", "E14.0_180220_Skull_3_thresholded" 
// all_ids = newArray("E14.0_170919_Skull_3_thresholded","E14.0_170919_Skull_4_thresholded", "E14.0_170919_Skull_1R_thresholded", "E14.0_170919_Skull_2L_thresholded", "E14.0_180220_Skull_4_thresholded", "E14.0_180220_Skull_1L_thresholded", "E14.0_180220_Skull_1R_thresholded", "E14.0_180220_Skull_2_thresholded", "E14.0_180220_Skull_3_thresholded" );
// all_ids = newArray("E14.5_170919_Skull_1R_thresholded", "E14.5_170919_Skull_2L_thresholded", "E14.5_180220_Skull_2_thresholded")
// all_ids = newArray("E15.0_071019_Skull_1_thresholded", "E15.0_071019_Skull_3L_thresholded", "E15.0_071019_Skull_3R_thresholded", "E15.0_071019_Skull_4L_thresholded", "E15.0_071019_Skull_4R_thresholded", "E15.0_071019_Skull_5L_thresholded", "E15.0_071019_Skull_5R_thresholded", "E15.0_071019_Skull_6R_thresholded");  // list of all subsequent IDs to 
// all_ids = newArray("E15.5_170919_Skull_4_thresholded", "E15.5_170919_Skull_5L_thresholded", "E15.5_170919_Skull_5R_thresholded")
all_ids = newArray("E15.5_170919_Skull_5R_thresholded")

//fixed reference file
ref_img = dir_output+"E15.5_vs_E15.0-ch0.tif"; // manually set! 
ref_mask = "";
	
for (i=0; i<all_ids.length; i++) {
//  ref_id = all_ids[i-1];
	mov_id = all_ids[i];
//	prev_id = "";
//	if (i>1) {
//		prev_id = all_ids[i-2];
//	}
//	print( "prev: "+prev_id+"fixed: "+ref_id+"mov: "+mov_id );	
	
	mov_img = dir_originals+mov_id+".tif";
	mov_mask  = "";
	output_id = mov_id+"_aligned"; //batch_id+"_"+
	output_txt = dir_output+output_id+".txt";
	output_img = dir_output+output_id+".tif";
	use_mask = "false";

	open(ref_img);
	open(mov_img);
	waitForUser("Check result");
	close();
	close();
	
	run("Elastix", "elastixdirectory=/Users/dang/Documents/Projects/Tabler_skull/elastix-5.0.1-mac tmpdir=/Users/dang/Documents/Projects/Tabler_skull/elastix-5.0.1-mac/tmp fixedimagefile="+ref_img+" movingimagefile="+mov_img+" transformationtype="+transformation_type+" bsplinegridspacing=50,50,50 numiterations=3000 numspatialsamples=10000 gaussiansmoothingsigmas=10,10,10 transformationoutputfile="+output_txt+" outputmodality=None usefixedmask="+use_mask+" fixedmaskfile=["+ref_mask+"] usemovingmask="+use_mask+" movingmaskfile=["+mov_mask+"] useinitialtransformation=false initialtransformationfile=None elastixparameters=Default finalresampler=FinalLinearInterpolator multichannelweights=1.0,3.0,1.0,1.0,1.0,1.0");
	run("Transformix", "elastixdirectory=/Users/dang/Documents/Projects/Tabler_skull/elastix-5.0.1-mac tmpdir=/Users/dang/Documents/Projects/Tabler_skull/elastix-5.0.1-mac/tmp inputimagefile="+mov_img+ " transformationfile="+output_txt+" outputmodality=[Save as Tiff] outputfile="+output_img+" numthreads=1");
}