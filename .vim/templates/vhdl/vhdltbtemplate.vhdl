entity $COMPONENT_NAME is

end entity $COMPONENT_NAME;

architecture TB of $COMPONENT_NAME is
    signal clock  : std_logic := '0';
    signal reset  : std_logic := '1';
    signal and_in : std_logic_vector(1 downto 0) := (others => '0');
    alias in_a is and_in(0);
    alias in_b is and_in(1);
    signal out_q  : std_logic;
begin
  -- Reset and clock
    clock <= not clock after 1 ns;
    reset <= '1', '0' after 5 ns;

  -- Instantiate the design under test
    dut: entity work.example_design(rtl)
    port map (
        clk => clock,
        reset => reset,
        a => in_a,
        b => in_b,
        q => out_q
    );

  -- Generate the test stimulus
    stimulus: process begin
        -- Wait for the Reset to be released before 
        wait until (reset = '0');
        -- Generate each of in turn, waiting 2 clock periods between
        -- each iteration to allow for propagation times
        and_in <= "00";
        wait for 2 ns;
        and_in <= "01";
        wait for 2 ns;
        and_in <= "10";
        wait for 2 ns;
        and_in <= "11";
        -- Testing complete
        wait;
    end process stimulus;

end architecture test;
