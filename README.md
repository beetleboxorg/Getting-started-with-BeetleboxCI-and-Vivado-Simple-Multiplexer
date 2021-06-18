# Getting started with BeeltleboxCI and Vivado: Simple Multiplexer

This is a tutorial designed to show to get started using BeetleboxCI and Vivado, in which we will cover the following: 

- **Design** - Setting up a vivado project and make a multiplexer in VHLD 
- **Simulate**  - Simulating this in vivado by setting up a test bench 
- **BeetleboxCI Integratation** - Integrating our multiplexer and testbench with BeetleboxCI 
- **Review**  - To finish we will compare the simulation results 

## Overview

Multiplexers are one of the most fundamental devices in digital design and are found in a large amount of different applications. Its simplistic design and near ubiquity makes it a great example for getting started with BeetleboxCI. A multiplexer selects one of several different input signals<code>i0-3</code> and uses that input as its output<code>bitout</code>. The selection is based on a seperate input known as select or <code>sel</code>. Multiplexers may be represented as a logic table:

| Sel1        | Sel0        | Output      |
| ----------- | ----------- | ----------- |
| 0           | 0           | i0          |
| 0           | 1           | i1          |
| 1           | 0           | i2          |
| 1           | 1           | i3          |

In this tutorial, we will show how to implement a simple multiplexer and simulate it through BeetleboxCI as well as view its results.

## Tested Environment 
 - **OS:** Ubuntu 18.04
 - **Vivado version:** Vivado 2020.1
 - **FPGA used**: Zynq Ultrascale+ series ZCU104

## Installation Guide:
 - [A Github is required to use BeetleboxCI.](https://github.com/)
 - Vivado may be installed as part of the Vitis (SW Developer) from [Xilinx's website, which may be found here.](https://www.xilinx.com/support/download.html)
 - A BeetleboxCI account. Access may be requested from here.

## Design
1. Create a directory called workspace in the Vivado folder and change it to be the current working directory. Then we may launch Vivado. The following script assumes that Vivado was installed in the default directory. If it was not, then use the correct installation directory. 

```sh
# Make workspace
cd /tools/Xilinx/Vivado/2020.1 
mkdir workspace 
cd /tools/Xilinx/Vivado/2020.1/workspace
source /tools/Xilinx/Vivado/2020.1/settings64.sh
vivado
```

2. Clone the project 
   1. Enter the project root directory
   2. Run the following to simulate  <code>source /tools/Xilinx/Vivado/2020.1/settings64.sh</code>
   3. <code>vivado -mode tcl -source sim.tcl </code>

## Ci integration 
Now we have verified our Multiplexer locally, we will integrate it with BeetleboxCI. Using BeetleboxCI will allow us to regularly iterate on the Multiplexer, so any changes such as additional modules can be automatically tested. It will also allow us to run simulations for long periods of time without using local computing resources, allowing us too focus on other parts of a system.

1. [Create a new Github Repository.](https://docs.github.com/en/github/importing-your-projects-to-github/importing-source-code-to-github/adding-an-existing-project-to-github-using-the-command-line) Name the repository <code>test_fast_CI</code>. and upload the project to it.
2. [Now log into your BeetleboxCI account here.](https://app.beetleboxci.com/)



7. Fill in the details then click <code>Submit</code>. You will be presented with your personal github webhook and deploy key information.

1. Leave this information open and head to your git repo. From here go to the project settings, then click <code>Webhooks</code> then click <code>Add webhook</code>. 
2.  Copy the payload url from the CI to the github settings then change the content type to <code>application/json</code>, then copy over the secret from the ci to Github, then click <code>Add webhook</code>.

1.  We should then see a green tick to say the git repo has connected correctly.
2.  Now in the Github Settings, navigate to the <code>Deploy keys</code> and click <code>Add deploy keys</code>.
3.  Title the deploy key <code>testci</code> and copy and paste the deploy key from the CI into the key input. Then click finish.


1.  Now to run the project on the CI, we must commit to the git repo. This will trigger the webhook and the CI will start building. For this example we can simply edit the <code>readme.md</code> file.

2.  In the project repo there will be a button saying add readme file click this and follow the instruction.

3.  When you have committed the readme to the project the ci will pick this up and start building. When the build is finished the ci will tell you.

## Review

1. Open the project in the CI  
2. Navigate to the logs of the test-se-emulation
3. Click logs
4. Compare this to the simulation output of the vitis terminal 


