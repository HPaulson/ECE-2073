#   SW:   in  std_logic_vector(0 downto 0); -- SW(0) = reset
#   KEY:  in  std_logic_vector(0 downto 0); -- KEY(0) = clock
#   LEDR: out std_logic_vector(2 downto 0)  -- LEDR = Q
#
force SW  1 0 ns, 0 20 ns
force KEY 1 0 ns, 0 10 ns -r 20 ns
run 200 ns
