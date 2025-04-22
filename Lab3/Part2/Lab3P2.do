##############################################
# A simple .do file for Lab3 Part2           #
# a more advanced .do file uses Tcl commands #
##############################################

# Apply stimuli to input signals; 
# Draw waveform on paper first to help you think
# Modelsim is case sensitive
# The names here have to match the names in Objects window
# Copy your entity below to help you use the names
#port (    SW       : in  bit_vector(3 downto 0);
#          LEDR     : out bit_vector(3 downto 0);
#          HEX0     : out bit_vector(0 to 6));
#end entity;

force SW 0000   0 ns, 0001 20 ns,  0010 40 ns,  0011 60 ns
force SW 0100 100 ns, 0101 120 ns, 0110 140 ns, 0111 160 ns
force SW 1000 200 ns, 1001 220 ns, 1010 240 ns, 1011 260 ns 
force SW 1100 300 ns, 1101 320 ns, 1110 340 ns, 1111 360 ns

# The run time should be long enough to exercise all the input values 
run 400 ns


# More commonly used commands 
# Reset the simulator: restart -f
# Clock signals (Period: 20 ns): force clk 0 0 ns, 1 10 ns -r 20 ns
# 

