source .synopsys_dc.setup
read_verilog CONV.v
link
source CONV.sdc
set_fix_multiple_port_nets -all -buffer_constants [get_designs *] 
set verilogout_no_tri     true 

compile
# compile -inc
# compile_ultra

report_timing  -delay_type max >> setup_timing_max.txt; 	#set up time
report_timing  -delay_type min >> setup_timing_min.txt;  	#hold time 
report_area >> area.txt

write -hierarchy -format verilog -output  CONV_syn.v
write_sdf -version 2.1 -context verilog  CONV_syn.sdf
write -hierarchy -format ddc -output CONV_syn.ddc
