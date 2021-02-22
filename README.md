# colony-image-analysis
Analyzes the colony growth using the GFP-labeled E.coli. Images were acquired using a Leica confocal microscope at the GFP channel. Then we export them to 8-bit tif files. If the acquisition is a tilescan, we first merged them into a single large tif file. If it is not a tilescan, then there's no need to merge. Then, we analyzed the final images using Gaussian filters to remove the noise, and thresholding to capture the full colony. For growth, we acquired z-stacks to obtain the height information, and combined the merged images to prepare a video of the z-stacks for visualization purposes.

## Todo before publish:
1. Have a test folder that has an acquisition for a one timepoint.
2. Make sure the instructions are clear and all the code is working.
_______________
## Dependencies working versions
Python 3.7.4, 3.8.5 (12/30/2020)  
opencv 4.5.0  
numpy 1.19.1, 1.19.4 (12/30/2020)  
matplotlib 3.3.2, 3.3.3 (12/30/2020)  
pandas 1.1.3, 1.1.5 (12/30/2020)  
_________
## Glossary
1. **Experiment**: A single .lif file taken by the microscope. It may include more than one uninterrupted run, or acquisitions. The name of the experiment is held at the variable {exp_name}.
2. **Acquisition**: Can be anything that is captured by the microscope uninterrupted. The name of the acquisition is held at the variable {acq_name}.
3. **Metadata**: The folder that keeps the parameters of each acquisition, in XML format. The name of the metadata folder is held at the variable {metadata_folder}
4. Add as necessary
_________
## Limitations
- For measuring the growth rates, we used a 10x lens, but the density of the cells and the convoluted PSF prevents a detailed morphology. To capture the cross-section of the colony, we had to submerge the colony with 4% agar and then slice open the middle. This way, we are able to see the detailed (even single-cell level) picture of the colony, but at an expense to lose it. So we have to prepare plates at different times in order to collect the cross-section at different timepoints.
