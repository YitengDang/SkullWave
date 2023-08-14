// Loop 2: align all to same reference
transformation_type = "Affine"
batch_id = "E15.5"
dir_originals = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/W8_2022_01_10_Sp7mCherry/"+batch_id+"_tiff_segmented/"
dir_output = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/W8_2022_01_10_Sp7mCherry/aligned_"+batch_id+"_"+transformation_type+"/"

all_ids = newArray("100122_BC_0_500_T_Otsu_02_manual_crop")
//all_ids = newArray("100122_BC_0_500_T_Otsu_01_manual_crop", "100122_BC_0_500_T_Otsu_02_manual_crop", "100122_BC_0_500_T_Otsu_03_manual_crop", "100122_BC_0_500_T_Otsu_04_manual_crop",
//"100122_BC_0_500_T_Otsu_05", "100122_BC_0_500_T_Otsu_06_manual_crop")

//fixed reference file
ref_img = dir_output+"E15.5_vs_E14.5_Otsu_aligned_ref.tif"; // manually set! 
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