



hub.registerInputCallback(function(cmd, arg)
    local acftName = hub.getSimString("MetadataStart/_ACFT_NAME")
   
		if cmd == "3_SW1" and arg == "0" then mode=0 end
		if cmd == "3_SW1" and arg == "1" then mode=1 end
		if cmd == "3_SW1" and arg == "2" then mode=2 end
		
		if acftName=="AJS37" then AJS37(cmd,arg,mode) end
		if acftName=="P-51D" then P51D(cmd,arg,mode) end
		if acftName=="F-16C_50" then F16C50(cmd,arg,mode) end
		if acftName=="F-14B" then F14B(cmd,arg,mode) end

end)

function F14B(cmd,arg,mode)

-- Global Switch Functions 
-- Define switch cmds here that are the same in all 3 modes

   if cmd == "4_SW4" then 
		hub.sendSimCommand("PLT_GEAR_LEVER", arg) 
		return true
	end

-- Mode 1 Switch Functions
  
  if mode==0 then
  
	if cmd == "1_SW1" then 
		if arg=="0" then 
			hub.sendSimCommand("PLT_OXY_ON", "DEC") else
			hub.sendSimCommand("PLT_OXY_ON", "INC") 
		end 
	end
	
	if cmd == "1_SW2" then 
		
		hub.sendSimCommand("PLT_EJECT_SEAT_SAFE", arg) 
		return true
	end
  
  end


end

function F16C50(cmd,arg,mode)

  if mode==0 then

    if cmd == "2_SW1" then 
		hub.sendSimCommand("MAIN_PWR_SW", arg) 
		return true
	end
			
	if cmd == "2_SW2" then 
		hub.sendSimCommand("CANOPY_SW", arg) 
		return true
		end
		
		if cmd == "2_SW3" then 
		hub.sendSimCommand("CANOPY_HANDLE", arg) 
		return true
		
		end
		
		if cmd == "2_SW4" then 
		hub.sendSimCommand("JFS_SW", arg) 
		return true
	end			
	end

  
end

function P51D(cmd,arg,mode)

if mode==0 then

	if cmd == "1_SW1" then
				hub.sendSimCommand("BAT", arg)
				return true
			end

	if cmd == "1_SW2" then
				hub.sendSimCommand("GEN", arg)
				return true
			end
	   
			if cmd == "1_SW3" then
				hub.sendSimCommand("FUEL_SHUT_OFF_VALVE", arg)
				return true
			end
			
			if cmd == "1_SW4" then
				hub.sendSimCommand("FUEL_BOOSTER", arg)
				return true
			end
			
			if cmd == "1_SW5" then
				if arg=="0" then hub.sendSimCommand("CANOPY_HAND_CRANK", "0") end
				if arg=="1" then hub.sendSimCommand("CANOPY_HAND_CRANK", "65536") end
				return true
			end
			
			
			
			
			if cmd == "4_SW1" then
				hub.sendSimCommand("PRIMER", arg)
				return true
			end
			
			if cmd == "4_SW2" then
				hub.sendSimCommand("STARTER", arg)
				return true
			end
			if cmd == "ROT1-CW" then
				
				hub.sendSimCommand("IGNITION", "INC")
				return true
			end
			
			if cmd == "ROT1-CCW" then
				
				hub.sendSimCommand("IGNITION", "DEC")
				return true
			end
			if cmd == "ROT2-CW" then
				
				hub.sendSimCommand("FUEL_SELECTOR_VALVE", "INC")
				return true
			end
			
			if cmd == "ROT2-CCW" then
				
				hub.sendSimCommand("FUEL_SELECTOR_VALVE", "DEC")
				return true
			end
			
			if cmd == "ROT3-CW" then
				
				hub.sendSimCommand("COCKPIT_LIGHTS", "+3200")
				return true
			end
			
			if cmd == "ROT3-CCW" then
				
				hub.sendSimCommand("COCKPIT_LIGHTS", "-3200")
				return true
			end
			
			if cmd == "ROT4-CW" then
				
				hub.sendSimCommand("LEFT_FLUORESCENT_LIGHT", "+3200")
				hub.sendSimCommand("RT_FLRES_LT", "+3200")
				return true
			end
			
			if cmd == "ROT4-CCW" then
				
				hub.sendSimCommand("LEFT_FLUORESCENT_LIGHT", "-3200")
				hub.sendSimCommand("RT_FLRES_LT", "-3200")
				return true
			end
			
			if cmd == "2_SW1" then
							
				hub.sendSimCommand("MIXTURE_CONTROL", arg)
				return true
			end
			
			if cmd == "2_SW2" then
							
				if arg=="0" then hub.sendSimCommand("TAIL_LTS", "1") end
				if arg=="1" then hub.sendSimCommand("TAIL_LTS", "0") end
				if arg=="2" then hub.sendSimCommand("TAIL_LTS", "2") end
				return true
			end
			if cmd == "2_SW3" then
							
				if arg=="0" then hub.sendSimCommand("WING_LTS", "1") end
				if arg=="1" then hub.sendSimCommand("WING_LTS", "0") end
				if arg=="2" then hub.sendSimCommand("WING_LTS", "2") end
				return true
			end
			
			if cmd == "4_SW3" then
				hub.sendSimCommand("LANDING_LIGHT", arg)
				return true
			end
			
			if cmd == "4_SW4" then
				hub.sendSimCommand("LANDING_GEAR_CONTR0L_HANDLE", arg)
				return true
			end
	end

	if	mode==1 then
	
		if cmd == "4_SW3" then
				hub.sendSimCommand("LANDING_LIGHT", arg)
				return true
			end
			
			if cmd == "4_SW4" then
				hub.sendSimCommand("LANDING_GEAR_CONTR0L_HANDLE", arg)
				return true
			end	
	
			if cmd == "3_SW2" then
				
				hub.sendSimCommand("CAGE_ROTARY", 0)
				return true
			end
	
			if cmd == "ROT1-CW" then
				
				hub.sendSimCommand("PITCH_ADJUST", "INC")
				return true
			end
			
			if cmd == "ROT1-CCW" then
				
				hub.sendSimCommand("PITCH_ADJUST", "DEC")
				return true
			end
	end


if	mode==2 then

			
			if cmd == "1_SW1" then
				hub.sendSimCommand("RKT_DEL_SWITCH", arg)
				return true
			end
			
			if cmd == "4_SW3" then
				hub.sendSimCommand("LANDING_LIGHT", arg)
				return true
			end
			
			if cmd == "4_SW4" then
				hub.sendSimCommand("LANDING_GEAR_CONTR0L_HANDLE", arg)
				return true
			end	
			
			if cmd == "2_SW1" then
				hub.sendSimCommand("GUN_CONTROL", arg)
				return true
			end
			if cmd == "2_SW2" then
				hub.sendSimCommand("ROCKETS_BOMBS_MODES", arg)
				return true
			end
			
			if cmd == "2_SW3" then
				hub.sendSimCommand("RKT_REL_MODE", arg)
				return true
			end
			
			if cmd == "2_SW4" then
				hub.sendSimCommand("LEFT_BOMB_ARM_CHEM", arg)
				return true
			end
			
			if cmd == "2_SW5" then
				hub.sendSimCommand("RIGHT_BOMB_ARM_CHEM", arg)
				return true
			end
				if cmd == "ROT1-CW" then
				
				hub.sendSimCommand("GUNSIGHT_FIXED_GYRO", "DEC")
				return true
			end
			
			if cmd == "ROT1-CCW" then
				
				hub.sendSimCommand("GUNSIGHT_FIXED_GYRO", "INC")
				return true
			end
			
			if cmd == "3_SW2" then
				hub.sendSimCommand("GUNSIGHT_ON_OFF", arg)
				return true
			end


end
end

function AJS37(cmd,arg,mode)
	local navbutton=0		
		if mode==0 then
		
			if cmd == "1_SW1" then
				hub.sendSimCommand("MAIN_ELECTRIC_POWER", arg)
				return true
			end
   
			if cmd == "1_SW2" then
				hub.sendSimCommand("LOW_PRES_FUEL_VALVE", arg)
				return true
			end
	   
			if cmd == "1_SW3" then
				hub.sendSimCommand("HIGH_PRES_FUEL_VALVE", arg)
				return true
			end
			
			if cmd == "1_SW4" then
				hub.sendSimCommand("START_SYSTEM", arg)
				return true
			end
			
			if cmd == "1_SW5" then
				hub.sendSimCommand("GENERATOR", arg)
				return true
			end
			
			if cmd == "2_SW1" then
							
				hub.sendSimCommand("OXYGEN_LEVER", arg)
				return true
			end
			
			if cmd == "2_SW2" then
				hub.sendSimCommand("CANOPY_OPEN_CLOSE", arg)
				return true	
			end
			
			if cmd == "2_SW3" then
				hub.sendSimCommand("EJECTION_SEAT_ARM", arg)
				return true
			end
			
			if cmd == "2_SW5" then
				if arg =="0" then
					hub.sendSimCommand("NAVIGATION_LIGHTS", 1)
					hub.sendSimCommand("TAXI_LANDING_LIGHTS", 0)
					hub.sendSimCommand("FORMATION_LIGHTS", 0)
					hub.sendSimCommand("POSITION_LIGHTS", 0)

				end
				if arg =="1" then
					hub.sendSimCommand("NAVIGATION_LIGHTS", 0)
					hub.sendSimCommand("TAXI_LANDING_LIGHTS", 1)
					hub.sendSimCommand("FORMATION_LIGHTS", 0)
					hub.sendSimCommand("POSITION_LIGHTS", 0)
					
					

				end
				if arg =="2" then
					hub.sendSimCommand("NAVIGATION_LIGHTS", 2)
					hub.sendSimCommand("TAXI_LANDING_LIGHTS", 1)
					hub.sendSimCommand("FORMATION_LIGHTS", 1)
					hub.sendSimCommand("POSITION_LIGHTS", 1)

				end
				return true 
			end
			
			if cmd == "4_SW3" then
						
				hub.sendSimCommand("REVERSAL", arg)
				return true
			end
			
			if cmd == "4_SW4" then
				if arg=="1" then hub.sendSimCommand("GEAR_HANDLE", 0) end 
				if arg=="0" then hub.sendSimCommand("GEAR_HANDLE", 1) end 
				return true
			end
			
			
			
			
			if cmd == "4_SW1" then
				hub.sendSimCommand("MASTER_CAUTION_RESET", arg)
				return true
			end
			
			if cmd == "4_SW2" then
				hub.sendSimCommand("WARNING_PANEL_TEST", arg)
				return true
			end
			
			
			if cmd == "ROT1-CW" then
				
				hub.sendSimCommand("MASTER_MODE_SELECT", "INC")
				return true
			end
			
			if cmd == "ROT1-CCW" then
				
				hub.sendSimCommand("MASTER_MODE_SELECT", "DEC")
				return true
			end
			
			if cmd == "ROT2-CW" then
				
				hub.sendSimCommand("FLOOD_LIGHTS", "+2500")
				return true
			end
			
			if cmd == "ROT2-CCW" then
				
				hub.sendSimCommand("FLOOD_LIGHTS", "-2500")
				return true
			end
			
			if cmd == "ROT3-CW" then
			
				hub.sendSimCommand("PANEL_LIGHTS", "+2500")
				return true
			end
			
			if cmd == "ROT3-CCW" then
				
				hub.sendSimCommand("PANEL_LIGHTS", "-2500")
				return true
			end
			
			if cmd == "ROT4-CW" then
				
				hub.sendSimCommand("INSTRUMENT_LIGHTS", "+2500")
				return true
			end
			
			if cmd == "ROT4-CCW" then
				
				hub.sendSimCommand("INSTRUMENT_LIGHTS", "-2500")
				return true
			end
			
			
	end	
		
	if mode==1 then

		if cmd == "4_SW1" and arg=="1" then
				hub.sendSimCommand("ATTITUDE_HOLD", "TOGGLE")
				return true
			end
			
			if cmd == "4_SW2" and arg=="1" then
				hub.sendSimCommand("ALTITUDE_HOLD", "TOGGLE")
				return true
			end

			if cmd == "4_SW3" then
						
				hub.sendSimCommand("REVERSAL", arg)
				return true
			end
			
			if cmd == "4_SW4" then
				if arg=="1" then hub.sendSimCommand("GEAR_HANDLE", 0) end 
				if arg=="0" then hub.sendSimCommand("GEAR_HANDLE", 1) end 
				return true
			end

		if cmd == "ROT1-CW" then
				
				hub.sendSimCommand("MASTER_MODE_SELECT", "INC")
				return true
			end
			
			if cmd == "ROT1-CCW" then
				
				hub.sendSimCommand("MASTER_MODE_SELECT", "DEC")
				return true
			end
			
		if cmd == "ROT2-CW" then
				
				if navbutton < 12 then navbutton=navbutton+1 end
				if navbutton == 1 then hub.sendSimCommand("NAV_SELECT_BTN_LS", 1) hub.sendSimCommand("NAV_SELECT_BTN_LS", 0) end
				if navbutton == 2 then hub.sendSimCommand("NAV_SELECT_BTN_B1", 1) hub.sendSimCommand("NAV_SELECT_BTN_B1", 0) end
				if navbutton == 3 then hub.sendSimCommand("NAV_SELECT_BTN_B2", 1) hub.sendSimCommand("NAV_SELECT_BTN_B2", 0) end
				if navbutton == 4 then hub.sendSimCommand("NAV_SELECT_BTN_B3", 1) hub.sendSimCommand("NAV_SELECT_BTN_B3", 0) end
				if navbutton == 5 then hub.sendSimCommand("NAV_SELECT_BTN_B4", 1) hub.sendSimCommand("NAV_SELECT_BTN_B4", 0) end
				if navbutton == 6 then hub.sendSimCommand("NAV_SELECT_BTN_B5", 1) hub.sendSimCommand("NAV_SELECT_BTN_B5", 0) end
				if navbutton == 7 then hub.sendSimCommand("NAV_SELECT_BTN_B6", 1) hub.sendSimCommand("NAV_SELECT_BTN_B6", 0) end
				if navbutton == 8 then hub.sendSimCommand("NAV_SELECT_BTN_B7", 1) hub.sendSimCommand("NAV_SELECT_BTN_B7", 0) end
				if navbutton == 9 then hub.sendSimCommand("NAV_SELECT_BTN_B8", 1) hub.sendSimCommand("NAV_SELECT_BTN_B8", 0) end
				if navbutton == 10 then hub.sendSimCommand("NAV_SELECT_BTN_B9", 1) hub.sendSimCommand("NAV_SELECT_BTN_B9", 0) end
				if navbutton == 11 then hub.sendSimCommand("NAV_SELECT_BTN_BX", 1) hub.sendSimCommand("NAV_SELECT_BTN_BX", 0) end
				if navbutton == 12 then hub.sendSimCommand("NAV_SELECT_BTN_L_MAL", 1) hub.sendSimCommand("NAV_SELECT_BTN_L_MAL", 0) end
				return true
			end
			
			if cmd == "ROT2-CCW" then
				
				if navbutton > 0 then navbutton=navbutton-1 end
				if navbutton == 1 then hub.sendSimCommand("NAV_SELECT_BTN_LS", 1) hub.sendSimCommand("NAV_SELECT_BTN_LS", 0) end
				if navbutton == 2 then hub.sendSimCommand("NAV_SELECT_BTN_B1", 1)  hub.sendSimCommand("NAV_SELECT_BTN_B1", 0)end
				if navbutton == 3 then hub.sendSimCommand("NAV_SELECT_BTN_B2", 1) hub.sendSimCommand("NAV_SELECT_BTN_B2", 0) end
				if navbutton == 4 then hub.sendSimCommand("NAV_SELECT_BTN_B3", 1) hub.sendSimCommand("NAV_SELECT_BTN_B3", 0) end
				if navbutton == 5 then hub.sendSimCommand("NAV_SELECT_BTN_B4", 1) hub.sendSimCommand("NAV_SELECT_BTN_B4", 0) end
				if navbutton == 6 then hub.sendSimCommand("NAV_SELECT_BTN_B5", 1) hub.sendSimCommand("NAV_SELECT_BTN_B5", 0) end
				if navbutton == 7 then hub.sendSimCommand("NAV_SELECT_BTN_B6", 1) hub.sendSimCommand("NAV_SELECT_BTN_B6", 0) end
				if navbutton == 8 then hub.sendSimCommand("NAV_SELECT_BTN_B7", 1) hub.sendSimCommand("NAV_SELECT_BTN_B7", 0) end
				if navbutton == 9 then hub.sendSimCommand("NAV_SELECT_BTN_B8", 1) hub.sendSimCommand("NAV_SELECT_BTN_B8", 0) end
				if navbutton == 10 then hub.sendSimCommand("NAV_SELECT_BTN_B9", 1) hub.sendSimCommand("NAV_SELECT_BTN_B9", 0) end
				if navbutton == 11 then hub.sendSimCommand("NAV_SELECT_BTN_BX", 1) hub.sendSimCommand("NAV_SELECT_BTN_BX", 0) end
				if navbutton == 12 then hub.sendSimCommand("NAV_SELECT_BTN_L_MAL", 1) hub.sendSimCommand("NAV_SELECT_BTN_L_MAL", 0) end
				return true
			end	
			
			if cmd == "ROT3-CW" then
				
				hub.sendSimCommand("TILS_CHANNEL_SELECT", "INC")
				return true
			end
			
			if cmd == "ROT3-CCW" then
				
				hub.sendSimCommand("TILS_CHANNEL_SELECT", "DEC")
				return true
			end

	end
	
	if mode==2 then
	
		if cmd == "1_SW1" then
				if arg=="1" then hub.sendSimCommand("WEAPON_REL_MODE", 0) end 
				if arg=="0" then hub.sendSimCommand("WEAPON_REL_MODE", 1) end 
				
				return true
			end
   
			if cmd == "1_SW2" then
				if arg=="1" then hub.sendSimCommand("RB_BK_REL_MODE", 0) end 
				if arg=="0" then hub.sendSimCommand("RB_BK_REL_MODE", 1) end
			
				return true
			end
	
	if cmd == "1_SW3" then
						
				hub.sendSimCommand("HUD_GLASS_POSITION", "TOGGLE")
				return true
			end
	
		if cmd == "4_SW3" then
						
				hub.sendSimCommand("REVERSAL", arg)
				return true
			end
			
			if cmd == "4_SW4" then
				if arg=="1" then hub.sendSimCommand("GEAR_HANDLE", 0) end 
				if arg=="0" then hub.sendSimCommand("GEAR_HANDLE", 1) end 
				return true
			end
			
		if cmd == "4_SW1" and arg=="1" then
				hub.sendSimCommand("ATTITUDE_HOLD", "TOGGLE")
				return true
			end
			
			if cmd == "4_SW2" and arg=="1" then
				hub.sendSimCommand("ALTITUDE_HOLD", "TOGGLE")
				return true
			end

			if cmd == "4_SW3" then
						
				hub.sendSimCommand("REVERSAL", arg)
				return true
			end
			
			if cmd == "4_SW4" then
				if arg=="1" then hub.sendSimCommand("GEAR_HANDLE", 0) end 
				if arg=="0" then hub.sendSimCommand("GEAR_HANDLE", 1) end 
				return true
			end
			
			if cmd == "ROT1-CW" then
				
				hub.sendSimCommand("MASTER_MODE_SELECT", "INC")
				return true
			end
			
			if cmd == "ROT1-CCW" then
				
				hub.sendSimCommand("MASTER_MODE_SELECT", "DEC")
				return true
			end
			
			if cmd == "ROT2-CW" then
				
				hub.sendSimCommand("WEAPON_SELECT", "DEC")
				return true
			end
			
			if cmd == "ROT2-CCW" then
				
				hub.sendSimCommand("WEAPON_SELECT", "INC")
				return true
			end
			
			if cmd == "ROT3-CW" then
				
				hub.sendSimCommand("WEAPON_INTERVAL", "INC")
				return true
			end
			
			if cmd == "ROT3-CCW" then
				
				hub.sendSimCommand("WEAPON_INTERVAL", "DEC")
				return true
			end
			
	end	

end
