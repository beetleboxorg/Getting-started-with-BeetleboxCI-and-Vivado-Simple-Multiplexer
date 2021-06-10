  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS
          SIGNAL i0,i1,i2,i3,bitout :  std_logic:='0';
          SIGNAL sel :  std_logic_vector(1 downto 0):="00";
  BEGIN
    UUT : entity work.multiplexer4_1 port map(i0,i1,i2,i3,sel,bitout);

     tb : PROCESS
     BEGIN
            i0<='1';
            i1<='0';
            i2<='1';
            i3<='0';
            sel <="00";
            wait for 2 ns;
            sel <="01";
            wait for 2 ns;
            sel <="10";
             wait for 2 ns;
             sel <="11";
              wait for 2 ns;
            --more input combinations can be given here.
     END PROCESS tb;

  END;