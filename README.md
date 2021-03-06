# ornament_symmgroups

Code repository to reproduce analyses and figures published in the following papers:

Erbudak M and Onat S, 2020, Preprints
Erbudak M and Onat S, 2020, Arxiv

# Setup: 

Analyses were ran using Python 3.6.6, therefore this is the recommended Python interpreter version for this repository.

The easiest way to have Python 3.6.6 is to install a package manager for your operating system and install with it `PyEnv`. PyEnv let's you install different versions of Python to be used for different projects.

In Mac you can install `brew` for this purpose and use it to install `PyEnv` with `brew install pyenv`. Once this is done you can run pyenv to install Python 3.6.6 with `pyenv local 3.6.6` in the repository folder, this will effectively make 3.6.6 the default Python interpreter for this project.

You can test your installation with `python --version` which should return 3.6.6

In the second step you need to run `make setup` to install all the packages required for the analysis, which are listed in requirements.txt file. `Make setup` will install all the required packages to create the analyis environment, which you need to activate with `. .env/bin/activate`.

# Content 

Preprints Manuscript:
Data: data_Preprints.xlsx
Analysis: notebook_analysis_Preprints.ipynb

Arxiv Manuscript:
Data: data_paper_Arxiv.xlsx
Analysis: notebook_paper_Arxiv.ipynb


# Analysis 

The analyses were conducted in Jupyter notebooks, therefore you have to start a Jupyter server by issuing `jupyter notebook` and open one of the .ipynb files.

