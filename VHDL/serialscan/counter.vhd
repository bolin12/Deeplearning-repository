library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
	port(clk:in std_logic;
			clr:in std_logic:='1';
			data:out std_logic_vector(3 downto 0):="0000";
			co:out std_logic:='0');
end counter;

architecture behavior of counter is
signal tmp:std_logic;
signal cnt:std_logic_vector(3 downto 0);
begin
	process(clk,clr)
	begin
		if( clr='0') then
			cnt<="0000";
			tmp<='0';
		
		elsif(clk'event and clk='1')then
			if(cnt="1001")then
				cnt<="0000";
				tmp<='0';
			elsif(cnt="1000")then
				cnt<=cnt+1;
				tmp<='1';
			else
				cnt<=cnt+1;
			end if;
		end if;
	end process;
	
	co<=tmp;
	data<=cnt;
end behavior;
		