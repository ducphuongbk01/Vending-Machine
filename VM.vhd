LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Vending_Machine IS
PORT (	clk, reset, CR, finished_return_coin, finished_return_drink: IN std_logic;
      	in_coins, choose: IN std_logic_vector (1 downto 0);
      	water_out, soda_out, coin_return, coin_return_last: OUT std_logic;
      	change_out_1, change_out_2, change_out_5: OUT integer; 
	sta: OUT std_logic_vector (2 downto 0);
	SUM: BUFFER integer );
END Vending_Machine;

ARCHITECTURE behavior OF Vending_Machine IS
	TYPE state IS (S0, S1, S2, S3, S4, S5);
	SIGNAL pr_state, nx_state: state;
	SIGNAL flag_bought: std_logic;
	SIGNAL in_coins_pass: std_logic_vector (1 downto 0);
BEGIN
	-- Thanh ghi trang thai
	regst: PROCESS(clk, reset)
		BEGIN
		IF reset = '1' THEN 
			pr_state <= S0;
		ELSIF (clk = '1' and clk'event) THEN
			pr_state <= nx_state;
		END IF;
		END PROCESS;

	nxst: PROCESS (in_coins, pr_state, choose, finished_return_coin, finished_return_drink, CR, SUM)
		BEGIN
		CASE pr_state IS
			WHEN S0 =>
				IF in_coins/="00" THEN
					nx_state <= S1;
				ELSE 
					nx_state <= S0;
				END IF;
			WHEN S1 =>
				IF SUM>9 THEN 
					nx_state <= S2;
				ELSIF in_coins="00" and ((choose="01" and SUM=9) or (choose="10" and SUM>6)) THEN 
					nx_state <= S3;
				ELSIF in_coins="00" and CR='1' and flag_bought='0' THEN 
					nx_state <= S4;
				ELSE 
					nx_state <= S1;
				END IF;
			WHEN S2 =>
				IF finished_return_coin='1' THEN 
					nx_state <= S1;
				ELSE 
					nx_state <= S2;
				END IF;
			WHEN S3 =>
				IF finished_return_drink='1' THEN 
					nx_state <= S5;
				ELSE 
					nx_state <= S3;
				END IF;
			WHEN S4 =>
				IF finished_return_coin='1' THEN 
					nx_state <= S0;
				ELSE 
					nx_state <= S4;
				END IF;
			WHEN S5 =>
				IF finished_return_coin='1' THEN 
					nx_state <= S0;
				ELSE 
					nx_state <= S5;
				END IF;
			END CASE;
		END PROCESS;

	Output: PROCESS(pr_state , in_coins, choose)
		BEGIN
		CASE pr_state IS
			WHEN S0 =>
					SUM<=0;
					in_coins_pass <= "00";
					water_out<='0'; 
					soda_out<='0'; 
					change_out_1<=0; 
					change_out_2<=0;
					change_out_5<=0;
					coin_return<='0'; 
					coin_return_last<='0';
					flag_bought <= '0';
					sta <= "000";
			WHEN S1 =>
					IF in_coins="01" THEN SUM <= SUM+1;
					ELSIF in_coins="10" THEN SUM <= SUM+2;
					ELSIF in_coins="11" THEN SUM <= SUM+5;
					END IF;
					in_coins_pass <= in_coins;
					water_out<='0'; 
					soda_out<='0'; 
					change_out_1<=0; 
					change_out_2<=0;
					change_out_5<=0; 
					coin_return<='0'; 
					coin_return_last<='0';
					sta <= "001";
			WHEN S2 =>
					IF in_coins_pass="01" THEN 
						SUM<=SUM-1;
						in_coins_pass<="00";
					ELSIF in_coins_pass="10" THEN 
						SUM<=SUM-2;
						in_coins_pass<="00";
					ELSIF in_coins_pass="11" THEN 
						SUM<=SUM-5;
						in_coins_pass<="00";
					ELSE in_coins_pass<="00";
					END IF;
					water_out<='0'; 
					soda_out<='0'; 
					change_out_1<=0; 
					change_out_2<=0;
					change_out_5<=0;
					coin_return<='0'; 
					coin_return_last<='1';
					sta <= "010";
			WHEN S3 =>
					IF choose="01" THEN 
						SUM<=SUM-9;
						soda_out<='1';
						water_out<='0';
					ELSIF choose="10" THEN 
						SUM<=SUM-7;
						soda_out<='0'; 
						water_out<='1';
					ELSE 
						soda_out<='0'; 
						water_out<='0';					
					END IF;
					change_out_1<=0; 
					change_out_2<=0;
					change_out_5<=0;
					coin_return<='0'; 
					coin_return_last<='0';
					flag_bought <= '1';
					sta <= "011";
			WHEN S4 =>
					water_out<='0'; 
					soda_out<='0'; 
					change_out_1<=0; 
					change_out_2<=0;
					change_out_5<=0;
					coin_return<='1'; 
					coin_return_last<='0';
					sta <= "100";
			WHEN S5 =>
					water_out<='0'; 
					soda_out<='0'; 
					change_out_1<=SUM/5; 
					change_out_2<=(SUM mod 5)/2;
					change_out_5<=(SUM mod 5) mod 2;				
					coin_return<='0'; 
					coin_return_last<='0';
					sta <= "101";
		END CASE;
		END PROCESS;
END behavior;
