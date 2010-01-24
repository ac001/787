setlistener("/controls/APU/off-start-run", func(foo){
    print("listener()"); 
	print(getprop("/controls/APU/off-start-run"));
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

var start = func {
    print("start()");
	setprop("/controls/electric/engine[2]/generator", 1);
    screen.log.write("APU GEN: On");


    setprop("/sim/model/Boeing-787-8/apu-start", 1);
    screen.log.write("APU starting - standby");
    ## settimer(auto_poweron, 5);
}

#auto_poweron = func {
#    print("auto_poweron");#
#	screen.log.write("Engine Ignition switch enabled");
#    setprop("/sim/model/Boeing-787-8/start-engines", 1);
#    setprop("/controls/engines/start-engines", 1);
#    settimer(start_engines, 5);
#}

start_engine_1 = func {
	screen.log.write("Starting Engine One");
    setprop("/sim/model/Boeing-787-8/start-cycle[0]", 1);
}

start_engine_2 = func {
	screen.log.write("Starting Engine Two");
    setprop("/sim/model/Boeing-787-8/start-cycle[1]", 1);
}