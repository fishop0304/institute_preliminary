source .synopsys_dc.setup
read_verilog STI_DAC.v
link
source STI_DAC.sdc
set_fix_multiple_port_nets -all -buffer_constants [get_designs *] 
set verilogout_no_tri     true 

# compile -inc
compile_ultra

report_timing  -delay_type max >> setup_timing_max.txt; 	#set up time
report_timing  -delay_type min >> setup_timing_min.txt;  	#hold time 
report_area >> area.txt

write -hierarchy -format verilog -output  STI_DAC_syn.v
write_sdf -version 2.1 -context verilog  STI_DAC_syn.sdf
write -hierarchy -format ddc -output STI_DAC_syn.ddc
