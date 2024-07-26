# SkullWave
This repository contains all code accompanying the paper "Self-propagating wave drives noncanonical antidurotaxis of skull bones in vivo" by Yiteng Dang, Johanna Lattner, Adrian A. Lahola-Chomiak, Diana Alves Afonso, Anna Taubenberger, Elke Ulbricht, Steffen Rulands, Jacqueline M. Tabler. 

## Code for publication
In the folder "For_publication", you can find the main Mathematica script for simulating the mathematical model described in the supplement of the paper and for generating the paper figure plots related to the model. 

* Tissue_model_simulator.nb: Main Mathematica script used to simulate the mathematical model. Detailed instructions for running the model are found inside the script. The output of the simulations is stored as CSV files in the folder "Model_results".
* plot_heatmap.ipynb: Loads Mathematica output and generates the kymographs displaying simulation results in an aesthetically improved figures compared to the Mathematica plots.
* plot_results_with_data.Rmd: Loads Mathematica output and generates plots that combine experimental and simulation data.

In order to run the scripts, we recommend the following software:
* Mathematica 12.3.1.0
* Python 3.12.3 along with the conda environment specified in plot_simulation_kymograph_conda_env.yml.
* R 4.4.0 along with the packages displayed by sessionInfo() at the end of plot_results_with_data.Rmd. 

The folder "For_publication" contains the following subfolder:
* Data: Here experimental data is stored that is loaded into the scripts Tissue_model_simulator.nb and plot_results_with_data.Rmd for plotting purposes only.
* Figures: Output figures from the scripts are stored here.
* Model_results: Simulation results from Tissue_model_simulator.nb are stored here.
* Script_outputs: Outputs of the scripts are stored here in PDF or HTML format.

## Code for archiving
The rest of the repository contains code that is stored for archiving purposes but has not been actively maintained. This includes various intermediate results as well as additional research output that has not been included in the final publication of this work. The code is divided by programming language and consists of (1) analysis scripts in Python, used mainly for image analysis and quantification, (2) analysis scripts in R, used to plot certain sets of experimental data, (3) Fiji macros used for processing images and extracting features and quantities of interest, (4) Mathematica scripts for simulating other versions of the mathematical model not included in the publication.