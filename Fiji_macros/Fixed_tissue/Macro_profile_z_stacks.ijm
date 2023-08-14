selectImage("270120_mTmG_OsxCRE_FrontImaging_2020_01_31__09_50_39_Airyscan Processing_Stitch_Average.czi");
run("Clear Results");

// Set channel
channel = 1;
channel_name = "OsxGFP";
Stack.setChannel(channel); 

// Set save folder 
save_folder = "/Users/dang/Documents/Skull morphogenesis project/Data_Adrian/Profiles/Profile_";

// (1) Do single profile
/*
Stack.setChannel(1)
i = 1; // stack counter
Stack.setSlice(i)
run("Select All");
// get_save_profile(i, channel, save_folder);
*/

// (2) Loop over z-stack
nChannels = 3;
for (i = 0; i < nSlices/nChannels + 1; i++) {
	save_profile(i, channel_name, save_folder);
}

function save_profile(stack_counter, channel_name, save_folder) {
	// Get profile for one image
	Stack.setSlice(stack_counter);
	run("Select All");
	profile = getProfile();
	for (i=0; i<profile.length; i++)
	  setResult("Value", i, profile[i]);
	updateResults();
	wait(100);

	// Save result
	fname_out = save_folder + channel_name + "_zstack_" + stack_counter + ".csv";
	// saveAs("Measurements", "/Users/dang/Documents/Skull morphogenesis project/Data_Adrian/Profiles/Profile_channel_" + 
	// channel + "_zstack_" + stack_counter + ".csv");
	run("Clear Results");
}
