// Old thresholded
//ref_img = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/old_Allyson/sample/E13.0_63x.tif"
//ref_img = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_thresholded/E13.0.tif"
transformation_type = "Euler"

all_ids = []

prev_id = "E13.0" // image before ref
ref_id = "E14.0"
mov_id = "E14.5"
ref_img = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_elastix_out_"+transformation_type+"_no_mask/"+ref_id+"_vs_"+prev_id+"-ch0.tif"
ref_mask = ""
mov_img = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_thresholded/"+mov_id+".tif"
mov_mask  = ""
output_path = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_elastix_out_"+transformation_type+"_no_mask/"
output_id = mov_id+"_vs_"+ref_id
output_txt = output_path+output_id+".txt"
output_img = output_path+output_id+".tif"
use_mask = "false"

// New pilot
//ref = "E15.0"
//mov = "E15.5"
//ref_img = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_thresholded_prewit/"+ref+".tif"
//ref_mask = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_thresholded_prewit/"+ref+".tif"
//mov_img = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_thresholded_prewit/"+mov+".tif"
//mov_mask  = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_thresholded_prewit/"+mov+".tif"
//output_txt = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_thresholded_prewit/elastix_out/"+mov+"_vs_"+ref+"_masked.txt"
//output_img = "/Users/dang/Documents/Projects/Tabler_skull/Data_fixed_tissue/Skull_expansion_thresholded/pilot_thresholded_prewit/elastix_out/"+mov+"_vs_"+ref+"_masked.tif"
// transformation_type = "Similarity"

run("Elastix", "elastixdirectory=/Users/dang/Documents/Projects/Tabler_skull/elastix-5.0.1-mac tmpdir=/Users/dang/Documents/Projects/Tabler_skull/elastix-5.0.1-mac/tmp fixedimagefile="+ref_img+" movingimagefile="+mov_img+" transformationtype="+transformation_type+" bsplinegridspacing=50,50,50 numiterations=5000 numspatialsamples=10000 gaussiansmoothingsigmas=10,10,10 transformationoutputfile="+output_txt+" outputmodality=None usefixedmask="+use_mask+" fixedmaskfile=["+ref_mask+"] usemovingmask="+use_mask+" movingmaskfile=["+mov_mask+"] useinitialtransformation=false initialtransformationfile=None elastixparameters=Default finalresampler=FinalLinearInterpolator multichannelweights=1.0,3.0,1.0,1.0,1.0,1.0");
run("Transformix", "elastixdirectory=/Users/dang/Documents/Projects/Tabler_skull/elastix-5.0.1-mac tmpdir=/Users/dang/Documents/Projects/Tabler_skull/elastix-5.0.1-mac/tmp inputimagefile="+mov_img+ " transformationfile="+output_txt+" outputmodality=[Save as Tiff] outputfile="+output_img+" numthreads=1");