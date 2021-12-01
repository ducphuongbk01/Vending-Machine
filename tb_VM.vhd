LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_VM IS
END tb_VM;
 
ARCHITECTURE behavior OF tb_VM IS 
 
    -- Component Declaration for the Moore FSM Sequence Detector in VHDL
 
    COMPONENT Vending_Machine IS
		PORT (clk, reset, CR, finished_return_coin, finished_return_drink: IN std_logic;
      		in_coins, choose: IN std_logic_vector (1 downto 0);
      		water_out, soda_out, coin_return, coin_return_last: OUT std_logic;
      		change_out_1, change_out_2, change_out_5: OUT integer; 
		sta: OUT std_logic_vector (2 downto 0);
		SUM: BUFFER integer);
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal CR: std_logic:= '0';
   signal finished_return_coin: std_logic:= '0';
   signal finished_return_drink: std_logic:= '0';
   signal in_coins: std_logic_vector(1 downto 0):="00";
   signal choose: std_logic_vector(1 downto 0):="00";
   signal SUM: integer:=0;
   
   --Outputs
   signal water_out: std_logic:= '0';
   signal soda_out: std_logic:= '0';
   signal coin_return: std_logic:= '0';
   signal coin_return_last: std_logic:= '0';
   signal change_out_1: integer:= 0;
   signal change_out_2: integer:= 0;
   signal change_out_5: integer:= 0;
   signal sta: std_logic_vector (2 downto 0):= "000";

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
 -- Instantiate the Moore FSM Sequence Detector in VHDL
   uut: Vending_Machine PORT MAP (
          	clk => clk, 
		reset => reset, 
		CR => CR, 
		finished_return_coin => finished_return_coin, 
		finished_return_drink => finished_return_drink,
      		in_coins => in_coins, 
		choose => choose,
      		water_out => water_out, 
		soda_out => soda_out, 
		coin_return => coin_return, 
		coin_return_last => coin_return_last,
      		change_out_1 => change_out_1, 
		change_out_2 => change_out_2, 
		change_out_5 => change_out_5, 
		sta => sta, 
		SUM => SUM
        );

   -- Clock process definitions
   clock_process :process
   		begin
 			clk <= '0';
  			wait for clock_period/2;
  			clk <= '1';
  			wait for clock_period/2;
   		end process;
 

   -- Stimulus process
   stim_proc: process
   		begin  
     		 -- hold reset state for 100 ns. 
			reset <= '1'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";  			
 		 -- Wait 100 ns for global reset to finish
  			wait for 40 ns;

      			reset <= '0';
  			wait for 40 ns;

-------------- BOUGHT SODA -----------------------------

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "10"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "01"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "11"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "01"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "01";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '1';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '1'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

-------------- BOUGHT WATER -----------------------------

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "10"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "01"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "11"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "01"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "10";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '1';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '1'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

------------- RETURN COIN -------------------------------

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "10"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "01"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "11"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "01"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '1'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '1'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

------------------- REUTRN LAST COIN----------------------

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "11"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "11"; 
			choose <= "00";
  			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '0'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
 			wait for 20 ns;

			reset <= '0'; 
			CR <= '0'; 
			finished_return_coin <= '1'; 
			finished_return_drink <= '0';
      			in_coins <= "00"; 
			choose <= "00";
  			wait for 20 ns;

-------- 2x40 + 11x20 + 11x20 + 10x20 + 5*20 = 41x20ns delay ----------------

      		-- insert stimulus here 
      			wait;
   		end process;

END;
