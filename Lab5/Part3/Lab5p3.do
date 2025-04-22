# Because ModelSim is a Tcl-based tool, you must surround objects and signals with curly braces 
# ( {} ) when specifying array bits or slices with parentheses ( () ), spaces, or square brackets 
# ( [] ). For example:
# toggle add {data[3:0]} 
# toggle add {data(3 to 0)}
# force {bus1[1]}

#  SW:   in  std_logic_vector(1 downto 0); -- SW(0) = direction, SW(1) = reset
#  KEY:  in  std_logic_vector(0 downto 0); -- KEY(0) = clock
#  LEDR: out std_logic_vector(2 downto 0)  -- LEDR(9 downto 1) = Q, 

force {SW(1)}  1 0 ns, 0 20 ns
force KEY      1 0 ns, 0 10 ns -r 20 ns
# direction 
force {SW(0)}  0 0 ns, 0 40 ns, 0 60 ns, 1 80 ns, 1 100 ns, 1 120 ns, 0 140 ns, 0 160 ns 
run 300 ns
