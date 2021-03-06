
#script de synth�se syntheseTP1.tcl
cd C:/Users/gse4/Desktop/tp2/precision
set_input_dir C:/Users/gse4/Desktop/tp2/precision
setup_design -manufacturer Altera -family "CYCLONE II" -part EP2C35F672C -speed 6
setup_design -edif=true
setup_design -encoding=binary
setup_place_and_route -flow "Quartus II Modular" -command "Integrated Place and Route" -ba_format VHDL -install_dir C:/altera/13.0sp1/quartus
add_input_file {../ctrlrs232c/ctrlrs232c.vhd}
add_input_file {../ctrlrs232c/fsmsymb.vhd}
compile
create_clock { clk } -name clk -period 1000.0
set_input_delay 0.300 -clock clk {m}
set_output_delay 6.0 -clock clk {mad mam}
set_false_path-clock clk -to {cts dsr}
set_false_path-clock clk -from {rts dtr}
update_constraint_file
synthesize


set_attribute -name pin_number -value "N2" -port clk -design rtl
set_attribute -name pin_number -value "AE22" -port cts -design rtl 
set_attribute -name pin_number -value "AF22" -port dsr -design rtl 
set_attribute -name pin_number -value "N25" -port dtr -design rtl 
set_attribute -name pin_number -value "V2" -port m -design rtl 
set_attribute -name pin_number -value "T19" -port mad -design rtl 
set_attribute -name pin_number -value "U20" -port mam -design rtl 
set_attribute -name pin_number -value "W26" -port rst -design rtl
set_attribute -name pin_number -value "N26" -port rts -design rtl

place_and_route cl