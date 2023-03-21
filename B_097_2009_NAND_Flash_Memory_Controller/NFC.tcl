source .synopsys_dc.setup
read_verilog NFC.v
link
source NFC.sdc
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]
# set_ideal_networks [get_clocks] 
set verilogout_no_tri     true 

compile -inc
# compile_ultra
# compile
# compile -map_effort high -area_effort high
# compile -map_effort high -area_effort high -inc

report_timing  -delay_type max >> setup_timing_max.txt; 	#set up time
report_timing  -delay_type min >> setup_timing_min.txt;  	#hold time 
report_area >> area.txt

write -hierarchy -format verilog -output  NFC_syn.v
write_sdf -version 2.1 -context verilog  NFC_syn.sdf
write -hierarchy -format ddc -output NFC_syn.ddc
