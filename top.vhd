LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ENTITY lab1 IS
PORT(
            key_reset          : in  std_logic ;
            clk                : in  std_logic  ;                             
            key1_export    : in  std_logic ;                                
            led8_export    : out std_logic_vector(7 downto 0);                     -- export                        
            sw4_export     : in  std_logic_vector(3 downto 0)  );  -- export
END ENTITY lab1;


ARCHITECTURE ART OF lab1 IS

    component unsaved is
        port (
            clk_clk          : in  std_logic                    := 'X';             -- clk
            key1_export  : in  std_logic                    := 'X';             -- export
            led8_export  : out std_logic_vector(7 downto 0);                    -- export
            reset_reset_n    : in  std_logic                    := 'X';             -- reset_n
            sw4_export   : in  std_logic_vector(3 downto 0) := (others => 'X')  -- export
        );
    end component unsaved;

begin
    
    
    
    u0 : component unsaved
        port map (
            clk_clk          => clk,          --       clk.clk
            key1_export  => key1_export,  --  key1port.export
            led8_export  => led8_export,  --  led8port.export
            reset_reset_n    => key_reset,    --     reset.reset_n
            sw4_export   => sw4_export    --   sw4port.export
        );
    
    
 END ARCHITECTURE ART;