# Lab3P3.do
# PORT Signals:
#	count: in std_logic_vector ( 3 downto 0 )			-- 4-bit binary value input to give 16 cycles
#	lights: out std_logic_vector ( 5 downto 0 ) 		-- Traffic Lights: LR LY LG RR RY RG

# apply stimuli to my input count
force count 2#0000 0 ns, 2#0001 20 ns, 2#0010 40 ns, 2#0011 60 ns, 2#0100 80 ns, 2#0101 100 ns, 2#0110 120 ns, 2#0111 140 ns
force count 2#1000 160 ns, 2#1001 180 ns, 2#1010 200 ns, 2#1011 220 ns, 2#1100 240 ns, 2#1101 260 ns, 2#1110 280 ns, 2#1111 300 ns

run 340 ns
