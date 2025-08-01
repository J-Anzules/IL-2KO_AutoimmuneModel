# Modeling the homeostatic expansion of the immune system in a healthy and autoimmune system
### Jonathan M. Anzules, Kristen M. Valentine, Genevieve N. Mullins,  Lihong Zhao, Anh L. Diep, Suzanne S. Sindi, Katrina K. Hoyer.

This project explores the systemic differences between a healthy and autoimmune system. We represent the homeostatic dynamics that work properly during healthy development and the cascading failure seen in the IL-2 knock system that leads to autoimmune disease. Below is a diagram of the model:

![Alt text](./Images/ModelDiagram.png "Modeling Homeostatic Expansion")

-------------------------

## Where to Start
The /code/parameter_estimation/QuickSimulation.m script is the easiest place to start exploring the dynamics of the model.  This script references the file containing  **[TODO: insert total numbers]** parameter sets, identified by our optimization algorithm. Parameter set **[TODO: insert number]** represents our. _Describe the multiple sections and should be ran in the matlab GUI to take advantage of the different sections._ 

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


## Defining Folders and Scripts
1. **Code Folder** - Contains the scripts that run the simulation, optimization/minimizing algorithm, and sensitivity analysis. 
2. **RawData Folder** - Contains the data that my model attempts to replicate. Analyzed and prepared by scripts in the folder "Stats plots and data management"
3. Main Scripts definition
    * **Figure 1** - R script generating comparison figures of the phenotypic markers between WT and IL-2 KO mice
    * **Figure 3** - Takes the model output data (from parameter set 563) and generates the comparitive figures between model output and experimental data.
    * **ModelandCellGrowth.m** - The main script for minimizing the Rsquare value calculated by comparing the the simulation to the data.
    * **QuickSimulation.m** - Runs a simulation with the chosen parameter set and time frame. Plots are created for each run, if so desired. Individual values for each parameters can be edited to study the dynamics of the model
    * **LHSInitialConditions** - Performs a Latin hypercube sampling of any given population initial conditions and range. The 90th/10th percentile and one standard deviation above and below the mean is calculated. Plots displaying the area that the simulation results take is made for either percentiles or percentages.
    <!-- * **LHSParameters** - Performs a Latin hypercube sampling of any given parameter and a chosen range. The 90th/10th percentile and one standard deviation above and below the mean is calculated. Plots displaying the area that the simulation results take is made for either percentiles or percentages. Currently no free form LHS is available, but can be included  -->
    * **LHSParameters_Fig4** - Performs a Latin hypercube sampling specifically related to the Treg death rate. The 90th/10th percentile and one standard deviation above and below the mean is calculated. Plots displaying the area that the simulation results take is made for either percentiles or percentages.
    * **LHSParameters_Fig4** - Performs a Latin hypercube sampling specifically related Treg suppression. The 90th/10th percentile and one standard deviation above and below the mean is calculated. Plots displaying the area that the simulation results take is made for either percentiles or percentages. Three figures can be generated ("A", "B" or "C") and must be defined on line 36 (e.g. 36 fig_plot = "C";). This will show the results from either Treg clearance, naive T cell activation suppression, or none.
4. **Data** - Contains the data related to minimization/optimization, the most interesting parameter sets, and notes
    * **ObjectiveDataKO.csv, ObjectiveDataWT** - Contains all the data used for the calculation of the best parameter set chosen by fmincon(). This was used to explore how the data was used to calculate the objective, used for sanity checks.
    * **ParametersSets.csv** - Collection of parameters the display the most interesting dynamics seen in the model and progression towards the best fit of the model to data.


## Defining Folders and Scripts

<details>
<summary><strong>1. Code Folder</strong></summary>

Contains the scripts that run the simulation, optimization/minimizing algorithm, and sensitivity analysis.

</details>

<details>
<summary><strong>2. RawData Folder</strong></summary>

Contains the data that the model attempts to replicate. Analyzed and prepared by scripts in the folder "Stats plots and data management".

</details>

<details>
<summary><strong>3. Main Scripts Definition</strong></summary>

- **Figure 1** – R script generating comparison figures of phenotypic markers between WT and IL-2 KO mice  
- **Figure 3** – Generates comparative figures between model output (e.g. parameter set 563) and experimental data  
- **ModelandCellGrowth.m** – Minimizes the R² value between simulation and data  
- **QuickSimulation.m** – Runs simulation with chosen parameter set and time frame. Plots included.  
- **LHSInitialConditions** – Latin hypercube sampling over population initial conditions  
- **LHSParameters_Fig4** – LHS focused on Treg death rate or suppression; controlled by setting `fig_plot = "A"`, `"B"`, or `"C"` on line 36  

</details>

<details>
<summary><strong>4. Data</strong></summary>

Contains data related to model optimization, interesting parameter sets, and validation notes.

- **ObjectiveDataKO.csv**, **ObjectiveDataWT.csv** – Used to calculate objective for `fmincon()`
- **ParametersSets.csv** – Contains parameter sets showing dynamics approaching optimal fit

</details>
