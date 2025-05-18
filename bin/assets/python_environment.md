
# Python environment setup for ROAST analysis
If you want to perform some analysis on the ROAST results using Python, you can set up a Python environment with the required libraries. This is optional, but it can be useful if you want to perform some custom analysis or visualisation of the ROAST results.

1) Download and install Miniconda
2) From VScode, open a new terminal and build the environment with the required libraries:

```bash
conda env create -f assets/environment.yml
# Verify that the environment was correctly created
conda env list
```

This should output: 
```console
# conda environments:
base                     C:\Users\User\miniconda3
tdcs_env                 C:\Users\User\miniconda3\envs\tdcs_env
```

To activate a environment:
```bash
conda activate tdcs_env
```