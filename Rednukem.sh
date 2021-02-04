#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="Rednukem"
rp_module_desc="Rednukem - Blood source port"
rp_module_licence="GPL3 https://github.com/OpenMW/osg/blob/3.4/LICENSE.txt"
rp_module_help="you need to put the REDNECK.GRP, REDNECK.RTS, optionally CD audio tracks as OGG file in the format trackXX.ogg (where XX is the track number)
$romdir/ports/Nblood"
rp_module_section="exp"
rp_module_flags=""


function depends_Rednukem() {
   getDepends cmake build-essential build-essential nasm libgl1-mesa-dev libglu1-mesa-dev libsdl1.2-dev libsdl-mixer1.2-dev libsdl2-dev libsdl2-mixer-dev flac libflac-dev libvorbis-dev libvpx-dev libgtk2.0-dev freepats
  
}

function sources_Rednukem() {
	gitPullOrClone "$md_build" https://github.com/Exarkuniv/NBlood.git
}

function build_Rednukem() {
    cd $md_build/Rednukem
   make rr
	md_ret_require="$md_build"
}

function install_Rednukem() {
    md_ret_files=(        
        'rednukem'
		'nblood.pk3'
    )
}
	
function configure_Rednukem() {
	mkdir "$home/.config/rednukem"
	cp -v settings.cfg "$home/.config/nblood"
	cp -v nblood.cfg "$home/.config/nblood"
	
	mkRomDir "ports/Rednukem"
	
	addPort "$md_id" "rednukem" "Rednukem - Blood source port" "$md_inst/rednukem  -j /home/pi/RetroPie/roms/ports/Rednukem"	

}
