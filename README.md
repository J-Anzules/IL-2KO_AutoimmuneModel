# Modeling the homeostatic expansion of the immune system in a healthy and autoimmune system
### Jonathan M. Anzules, Kristen M. Valentine, Genevieve N. Mullins,  Lihong Zhao, Anh L. Diep, Suzanne S. Sindi, Katrina K. Hoyer.

This project explores the systemic differences between a healthy and autoimmune system. We represent the homeostatic dynamics that work properly during healthy development and the cascading failure seen in the IL-2 knock system that leads to autoimmune disease. Below is a diagram of the model:

![Alt text](./Images/ModelDiagram.png "Modeling Homeostatic Expansion")

-------------------------

## Where to Start
QuickSimulation.m located in /code/Parameter Estimation/ folder the easiest place to start exploring the dynamics of the model.  This script references a list of parameter sets optimized by fmincon; parameter set 323 is the parameter set used in our manuscript. 



#### Below is a file tree of the most important parts of my project:

```bash
.
└── code
    ├── Figure1
    ├── Figure3
    ├── Figure4
    ├── Figure5
    ├── Parameter Estimation
    └── core_LHS
├── Data
│   ├── ModelOutputEverythingKO.csv
│   ├── ModelOutputEverythingWT.csv
│   ├── ModelOutputKO.csv
│   ├── ModelOutputWT.csv
│   ├── ObjectiveDataKO.csv
│   ├── ObjectiveDataWT.csv
│   ├── ParameterSearch_final.csv
│   ├── ParameterSearch_opnall5.csv
│   └── TCellActivationSummary.csv
├── Plots
│   ├── 1_WT_1_pops.png
│   ├── 2_KO_1_pops.png
│   ├── Figure1.pdf
│   ├── Figure3
│   ├── Figure4
│   ├── Figure5
│   └── PlottingEverything_out
├── README.md
├── RawData
│   ├── ActivatedKOSpleen.csv
│   ├── ActivatedWTSpleen.csv
│   ├── KOProl.csv
│   ├── WTProl.csv
│   └── color.pdf

```


<!-- ## Defining Folders and Scripts
1. **Code Folder** - Contains the scripts that run the simulation, optimization/minimizing algorithm, and sensitivity analysis. 
2. **RawData Folder** - Contains the data that my model attempts to replicate. Analyzed and prepared by scripts in the folder "Stats plots and data management"
3. Main Scripts definition
    * **Figure 1** - R script generating comparison figures of the phenotypic markers between WT and IL-2 KO mice
    * **Figure 3** - Takes the model output data (from parameter set 563) and generates the comparitive figures between model output and experimental data.
    * **ModelandCellGrowth.m** - The main script for minimizing the Rsquare value calculated by comparing the the simulation to the data.
    * **QuickSimulation.m** - Runs a simulation with the chosen parameter set and time frame. Plots are created for each run, if so desired. Individual values for each parameters can be edited to study the dynamics of the model
    * **LHSInitialConditions** - Performs a Latin hypercube sampling of any given population initial conditions and range. The 90th/10th percentile and one standard deviation above and below the mean is calculated. Plots displaying the area that the simulation results take is made for either percentiles or percentages.
    * **LHSParameters** - Performs a Latin hypercube sampling of any given parameter and a chosen range. The 90th/10th percentile and one standard deviation above and below the mean is calculated. Plots displaying the area that the simulation results take is made for either percentiles or percentages. Currently no free form LHS is available, but can be included 
    * **LHSParameters_Fig4** - Performs a Latin hypercube sampling specifically related to the Treg death rate. The 90th/10th percentile and one standard deviation above and below the mean is calculated. Plots displaying the area that the simulation results take is made for either percentiles or percentages.
    * **LHSParameters_Fig5** - Performs a Latin hypercube sampling specifically related Treg suppression. The 90th/10th percentile and one standard deviation above and below the mean is calculated. Plots displaying the area that the simulation results take is made for either percentiles or percentages. Three figures can be generated ("A", "B" or "C") and must be defined on line 36 (e.g. 36 fig_plot = "C";). This will show the results from either Treg clearance, naive T cell activation suppression, or none.
4. **Data** - Contains the data related to minimization/optimization, the most interesting parameter sets, and notes
    * **ObjectiveDataKO.csv, ObjectiveDataWT** - Contains all the data used for the calculation of the best parameter set chosen by fmincon(). This was used to explore how the data was used to calculate the objective, used for sanity checks.
    * **ParametersSets.csv** - Collection of parameters the display the most interesting dynamics seen in the model and progression towards the best fit of the model to data. -->


## Defining Folders and Scripts

<details>
<summary><strong>1. Code Folder</strong></summary>

Contains the core scripts used to:

- Run simulations of the ODE-based IL-2/T cell model  
- Perform parameter optimization / minimization  
- Carry out Latin hypercube–based sensitivity and robustness analyses  

These scripts implement the full workflow from model specification to figure generation for the manuscript.
</details>

<details>
<summary><strong>2. RawData Folder</strong></summary>

Contains the experimental data that the model is calibrated to reproduce.  
These data were analyzed and pre-processed by scripts in the folder  
<code>Stats plots and data management</code> before being used for fitting and validation.
</details>

<details>
<summary><strong>3. Main Scripts Definition</strong></summary>

Key scripts for generating figures and running the core analyses:

- <strong>Figure 1</strong>  
  R script that generates comparison plots of phenotypic markers between WT and IL-2 KO mice.

- <strong>Figure 3</strong>  
  Uses model output (e.g., from parameter set 563) to generate comparative plots between simulations and experimental data.

- <strong>ModelandCellGrowth.m</strong>  
  Main MATLAB script for minimizing the R² (least-squares) error between simulations and data.  
  Uses <code>fmincon()</code> to search parameter space and identify the best-fit parameter set.

- <strong>QuickSimulation.m</strong>  
  Runs a single simulation with a chosen parameter set and time window.  
  Optionally generates plots for each run.  
  Individual parameter values can be edited directly in the script to explore how changes affect model dynamics.

- <strong>LHSInitialConditions</strong>  
  Performs Latin hypercube sampling over user-specified initial conditions and ranges for the cell populations.  
  For each ensemble, it computes the mean, 10th/90th percentiles, and ±1 standard deviation over time.  
  Produces plots showing the region occupied by the simulation trajectories, either as percentile bands or percentage-based envelopes.

- <strong>LHSParameters</strong>  
  Performs Latin hypercube sampling over user-selected parameters and parameter ranges.  
  As with <strong>LHSInitialConditions</strong>, it computes the mean, 10th/90th percentiles, and ±1 standard deviation and visualizes the spread of trajectories.  
  Currently, no fully generic “free-form” LHS wrapper is included, but the script can be extended to support additional parameters as needed.

- <strong>LHSParameters_Fig4</strong>  
  Specialized Latin hypercube sampling focused on parameters controlling the Treg death rate.  
  Computes the mean, 10th/90th percentiles, and ±1 standard deviation and generates plots summarizing how variation in Treg death rate influences model behavior, again using percentile or percentage-based envelopes.

- <strong>LHSParameters_Fig5</strong>  
  Specialized Latin hypercube sampling focused on Treg-mediated suppression.  
  As above, it computes the mean, 10th/90th percentiles, and ±1 standard deviation and visualizes the resulting bands of simulation trajectories.  
  The script can generate three different figure panels (<code>"A"</code>, <code>"B"</code>, or <code>"C"</code>), controlled by setting  
  <code>fig_plot = "A"</code>, <code>"B"</code>, or <code>"C"</code> on line 36.  
  These modes correspond to output views emphasizing:
  - Treg clearance of activated T cells  
  - Treg suppression of naive T cell activation  
  - or a control case with no additional suppression/clearance modifications
</details>

<details>
<summary><strong>4. Data</strong></summary>

Contains data associated with:

- Parameter minimization / optimization  
- Exploration of “interesting” parameter sets  
- Notes and intermediate outputs used to interpret the objective function and model behavior  

Files include:

- <strong>ObjectiveDataKO.csv</strong>, <strong>ObjectiveDataWT</strong>  
  Data used to compute the least-squares objective for <code>fmincon()</code>.  
  These files are useful for sanity checks and for understanding how individual data points contribute to the total error.

- <strong>ParametersSets.csv</strong>  
  Collection of parameter sets that display the most interesting model dynamics and the progression toward the best fit between model output and experimental data.
</details>

