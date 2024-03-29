-- learned from https://www.allaboutcircuits.com/technical-articles/implementing-a-finite-state-machine-in-vhdl/
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY SimpleFSM is
    PORT (clock:    IN STD_LOGIC;
          P:        IN STD_LOGIC;
          reset:    IN STD_LOGIC;
          R :       OUT STD_LOGIC);
    END SimpleFSM;
   
-- Architecture definition for the SimpleFSM entity
Architecture RTL of SimpleFSM is
    TYPE State_type IS (A, B, C, D);  -- Define the states
        SIGNAL State : State_Type;    -- Create a signal that uses 
                                      -- the different states
    BEGIN 
      PROCESS (clock, reset) 
      BEGIN 
        If (reset = ‘1’) THEN            -- Upon reset, set the state to A
        State <= A;
     
        ELSIF rising_edge(clock) THEN    -- if there is a rising edge of the
                 -- clock, then do the stuff below
     
        -- The CASE statement checks the value of the State variable,
        -- and based on the value and any other control signals, changes
        -- to a new state.
        CASE State IS
     
            -- If the current state is A and P is set to 1, then the
            -- next state is B
            WHEN A => 
                IF P='1' THEN 
                    State <= B; 
                END IF; 
     
            -- If the current state is B and P is set to 1, then the
            -- next state is C
            WHEN B => 
                IF P='1' THEN 
                    State <= C; 
                END IF; 
     
            -- If the current state is C and P is set to 1, then the
            -- next state is D
            WHEN C => 
                IF P='1' THEN 
                    State <= D; 
                END IF; 
     
            -- If the current state is D and P is set to 1, then the
            -- next state is B.
            -- If the current state is D and P is set to 0, then the
            -- next state is A.
            WHEN D=> 
                IF P='1' THEN 
                    State <= B; 
                ELSE 
                    State <= A; 
                END IF; 
            WHEN others =>
                State <= A;
        END CASE; 
        END IF; 
      END PROCESS;
    
    -- Decode the current state to create the output
    -- if the current state is D, R is 1 otherwise R is 0
    R <= ‘1’ WHEN State=D ELSE ‘0’;
    END RTL;
    