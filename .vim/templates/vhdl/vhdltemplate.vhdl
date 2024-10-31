---------------------------------- Librarries ----------------------------------
Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

------------------------------ Entity declaration ------------------------------
entity $COMPONENT_NAME is
------------------------------- I/O declaration --------------------------------
port ( 
   Clk      : in  std_logic;
   Reset_n  : in  std_logic;
   Din      : in  std_logic_vector(7 downto 0);
   Dout     : out std_logic_vector(2 downto 0) 
);
end entity $COMPONENT_NAME;

--------------------------------- Architecture ---------------------------------
architecture RTL of $COMPONENT_NAME is
begin
   process (Clk)
      variable R : unsigned (Dout'range);
      begin
      R := (others=>'0');
      
      if Clk'event and Clk = '1' then
         for i in Din'range loop
            if Din(i)='1' then
               R := R or to_unsigned(i,R'length);
            end if;
         end loop;
      end if;
      
      Dout <= std_logic_vector(R);
   end process;

end architecture RTL;
