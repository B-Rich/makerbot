OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

BUILD_DIR = ./build
MCAD_DIR = ./MCAD

DXF_FILES = drive_gear_w_hub_holes.dxf \
	roller_gear_w_hub_holes.dxf \
	outer_gear.dxf \
	outer_gear_w_mount_holes.dxf \
	outer_tube_retainer.dxf \
	outer_tube_retainer_w_exit.dxf \
	roller_gear_tube_retainer.dxf \
	roller_gear_tube_compressor.dxf \
	roller_gear_rim.dxf \
	drive_gear_rim.dxf \
	outer_gear_rim.dxf \
	outer_stepper_spacer.dxf \
	outer_stepper_base.dxf

LAYER_FILES = layer0.dxf \
	layer1.dxf \
	layer2.dxf \
	layer3.dxf \
	layer4.dxf \
	layer5.dxf \
	layer6.dxf \
	layer7.dxf \
	layer8.dxf \
	layer9.dxf \
	layer10.dxf

STL_FILES = outer_gear_w_mount_holes.stl \
	roller_gear_w_hub_holes.stl \
	drive_gear_w_hub_holes.stl \
	outer_gear_w_mount_holes_quartered.stl

default : usage

usage :
	@echo "Usage:"
	@echo "  make all"
	@echo "  make dxf_files"
	@echo "  make dxf_files layer_files"
	@echo "  make mcad"
	@echo "  make stl_files"
	@echo "  make layer_stack.stl (not recommended)"
	@echo "DXF Files:"
	@echo "	$(DXF_FILES)"
	@echo "Layer Files:"
	@echo " $(LAYER_FILES)"

all :  $(MCAD_DIR) $(BUILD_DIR) $(DXF_FILES) $(LAYER_FILES)

dxf_files : $(BUILD_DIR) $(DXF_FILES)

layer_files : $(LAYER_FILES)

stl_files : $(STL_FILES)

$(BUILD_DIR) :
	mkdir -p $(BUILD_DIR)

$(MCAD_DIR) :
	mkdir -p $(MCAD_DIR)

mcad : $(MCAD_DIR)
	git clone git@github.com:hacklabto/MCAD.git

drive_gear_w_hub_holes.dxf : 
	$(OPENSCAD) -D render_part=1 -x $(BUILD_DIR)/$@ render_pump_parts.scad

roller_gear_w_hub_holes.dxf :
	$(OPENSCAD) -D render_part=2 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_gear.dxf :
	$(OPENSCAD) -D render_part=3 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_gear_w_mount_holes.dxf :
	$(OPENSCAD) -D render_part=4 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_tube_retainer.dxf :
	$(OPENSCAD) -D render_part=5 -x $(BUILD_DIR)/$@ render_pump_parts.scad

roller_gear_tube_retainer.dxf :
	$(OPENSCAD) -D render_part=6 -x $(BUILD_DIR)/$@ render_pump_parts.scad

roller_gear_tube_compressor.dxf :
	$(OPENSCAD) -D render_part=7 -x $(BUILD_DIR)/$@ render_pump_parts.scad

roller_gear_rim.dxf :
	$(OPENSCAD) -D render_part=8 -x $(BUILD_DIR)/$@ render_pump_parts.scad

drive_gear_rim.dxf :
	$(OPENSCAD) -D render_part=9 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_gear_rim.dxf :
	$(OPENSCAD) -D render_part=10 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_tube_retainer_w_exit.dxf :
	$(OPENSCAD) -D render_part=11 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_stepper_spacer.dxf :
	$(OPENSCAD) -D render_part=12 -x $(BUILD_DIR)/$@ render_pump_parts.scad

outer_stepper_base.dxf :
	$(OPENSCAD) -D render_part=13 -x $(BUILD_DIR)/$@ render_pump_parts.scad

layer0.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=0 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer1.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=1 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer2.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=2 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer3.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=3 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer4.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=4 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer5.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=5 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer6.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=6 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer7.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=7 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer8.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=8 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer9.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=9 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer10.dxf :
	$(OPENSCAD) -D render_stack=0 -D layer=10 -x $(BUILD_DIR)/$@ render_pump_parts_stack.scad

layer_stack.stl :
	$(OPENSCAD) -D render_stack=1 -D layer=0 -s $(BUILD_DIR)/$@ render_pump_parts_stack.scad

roller_gear_w_hub_holes.stl :
	$(OPENSCAD) -D render_part=15 -s $(BUILD_DIR)/$@ render_pump_parts.scad

outer_gear_w_mount_holes.stl :
	$(OPENSCAD) -D render_part=16 -s $(BUILD_DIR)/$@ render_pump_parts.scad

drive_gear_w_hub_holes.stl :
	$(OPENSCAD) -D render_part=17 -s $(BUILD_DIR)/$@ render_pump_parts.scad

outer_gear_w_mount_holes_quartered.stl :
	$(OPENSCAD) -D render_part=18 -s $(BUILD_DIR)/$@ render_pump_parts.scad

clean :
	$(RM) -r $(BUILD_DIR)
