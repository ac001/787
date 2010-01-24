## Attempt at an autostart sequence. Displays prompts on screen

## listener for the APU == 2 ie running
setlistener("/controls/APU/off-start-run", func(foo){

	var state = getprop("/controls/APU/off-start-run");
	if(state == 2){
		screen.log.write("APU Running");

		setprop("/sim/model/Boeing-787-8/start-engines", 1);
		setprop("/controls/engines/start-engines", 1);
		screen.log.write("Engine AutoStart: On");
		settimer(start_engine_1, 2);
		settimer(start_engine_2, 6);
	}
},0,0);

## Main start 
var start = func {
    
	setprop("/controls/electric/engine[2]/generator", 1);
    screen.log.write("APU GEN: On");

    setprop("/sim/model/Boeing-787-8/apu-start", 1);
    screen.log.write("APU starting - standby");
}

## Start Engines
start_engine_1 = func {
	screen.log.write("Starting Engine One");
    setprop("/sim/model/Boeing-787-8/start-cycle[0]", 1);
}
start_engine_2 = func {
	screen.log.write("Starting Engine Two");
    setprop("/sim/model/Boeing-787-8/start-cycle[1]", 1);
}