package raygui
import rl "vendor:raylib"
import "core:fmt"
import "core:path/filepath"


GuiStyle :: enum {
	raylib,
	advance,
	cyber,
	rltech,
	amber,
	dark,
	sunny,
	ashes,
	enefete,
	terminal,
	bluish,
	genesis,
	turbo,
	brick,
	jungle,
	wisteria,
	candy,
	lavanda,
	cherry,
	pocket,
}

BAKE_STYLES :: true

when BAKE_STYLES {
	GuiStyleData : [GuiStyle][]u8 = {
		.raylib = 		{},
		.advance = 		#load("./styles/style_advance.rgs"),
		.cyber = 		#load("./styles/style_cyber.rgs"),
		.rltech = 		#load("./styles/style_rltech.rgs"),
		.amber = 		#load("./styles/style_amber.rgs"),
		.dark = 		#load("./styles/style_dark.rgs"),
		.sunny = 		#load("./styles/style_sunny.rgs"),
		.ashes = 		#load("./styles/style_ashes.rgs"),
		.enefete = 		#load("./styles/style_enefete.rgs"),
		.terminal = 	#load("./styles/style_terminal.rgs"),
		.bluish = 		#load("./styles/style_bluish.rgs"),
		.genesis = 		#load("./styles/style_genesis.rgs"),
		.turbo = 		#load("./styles/style_turbo.rgs"),
		.brick = 		#load("./styles/style_brick.rgs"),
		.jungle = 		#load("./styles/style_jungle.rgs"),
		.wisteria = 	#load("./styles/style_wisteria.rgs"),
		.candy = 		#load("./styles/style_candy.rgs"),
		.lavanda = 		#load("./styles/style_lavanda.rgs"),
		.cherry = 		#load("./styles/style_cherry.rgs"),
		.pocket = 		#load("./styles/style_pocket.rgs"),
	}
} else {
	GuiStyleData : [GuiStyle][]u8
}

//if "baked" parameter is true but BAKE_STYLES constant is false, user must populate GuiStyleData manually
switch_style :: proc(style: GuiStyle, style_folder := "./", baked := BAKE_STYLES) {
	//default style must be loaded first to avoid font size issues
	rl.GuiLoadStyleDefault()

	if style != .raylib {
		style_data := GuiStyleData[style]
		if baked {
			rl.GuiLoadStyleFromMemory(raw_data(style_data), i32(len(style_data)))
		} else {
			path, err := filepath.join({style_folder, fmt.tprintf("style_%v.rgs",style)})
			fmt.println(rl.GetWorkingDirectory())
			fmt.println(path)
			if err != nil {
				fmt.printf("could not load %v", path)
			}
			rl.GuiLoadStyle(fmt.ctprint(path))
		}
	}
}

