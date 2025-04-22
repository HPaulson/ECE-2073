##############################################
# A simple .do file for Lab3 Part1           #
# a more advanced .do file uses Tcl commands #
##############################################

# Step 1. Apply stimuli to input signals; 
# Draw waveform on paper first to help you think the combination of the input signals at any time point
# Modelsim is case sensitive
# The names here have to match exactly the names in Objects window
# Copy your entity below to help you use the names
# 
# port(   CNTL:   in std_logic_vector (1 downto 0);
#         INP:    in std_logic_vector (3 downto 0);
#         OUTP:   out std_logic);
# 

force INP 1010 0 ns, 0101 100 ns
force CNTL 00 0 ns, 01 20 ns, 10 40 ns, 11 60ns -repeat 80 ns 

# Step 2: set the simulation run time 
# The run time should be long enough to exercise all the input values 

run 200 ns

# Step 3: Study the input and output signal waveforms in the ModelSim Wave window
# to see if they behave as what you expect from your  design

########################################################################
# More commonly used commands 
# Reset the simulator: restart -f
# Check current working folder: pwd
# Clock signals (Period: 20 ns): force clk 0 0 ns, 1 10 ns -r 20 ns
######################################################################## 
