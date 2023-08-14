// Loop: align all subsequent references
transformation_type = "Euler"

dir_originals = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/reference_imgs/"
dir_output = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_transformed/ref_imgs_Euler_run2/"

all_ids = newArray("E13.0", "E14.0", "E14.5", "E15.0", "E15.5")
// all_ids = newArray("E15.5_170919_Skull_5R_thresholded")

for (i=1; i<all_ids.length; i++) {
    ref_id = all_ids[i-1];
	mov_id = all_ids[i];
	prev_id = "";
	if (i>1) {
		prev_id = all_ids[i-2];
	}
	print( "prev: "+prev_id+"fixed: "+ref_id+"mov: "+mov_id );

	ref_img = dir_output+ref_id+"_vs_"+prev_id+"-ch0.tif"; // manually set!
	ref_mask = "";
	mov_img = dir_originals+mov_id+".tif";
	mov_mask  = "";
	output_id = mov_id+"_vs_"+ref_id; // batch_id+"_"
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