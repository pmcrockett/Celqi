   /*/\\\/////////// /|| \\\\\\\\\\/|\
 ////   \|    /\\\   |||    //\\
||||        ///  \\\ |||  /// \\/||\\*
||||       ||||///// ||| |||| |||  |||
 \\\\   /|  \\\      ||| \\\\ |||  |||
   \*\///\\\\\\\\\\\///\\\\\\/|||  |||
                              |||  |||
   Celqi - \\\\\\\\\\\\\\\\\\ |||  |||
   3D Map Editor for FUZE \\\ |||  |||
   ////// P.M. Crockett, 2023 *\\||//*

// ----------------------------------------------------------------
// USER MODIFIABLE FUNCTIONS

/* Add 3D model references to this function. Anything added here will appear
in the editor's object menu. If you delete or rename a model that is in 
use in a map or merged object, the editor will prompt you to relink the 
deleted definition to an existing definition. 

Merged object definitions, which combine an arbitrary number of objects into a
single object, exist only in the saved file and must be created in the editor 
rather then being defined here.

Object banks use the following format. Any number of objects can be added to a 
bank. If the first entry in a bank has a single element instead of two, it will 
be used as the bank name. If you give an empty string ("") as an object name, 
the name will be auto-generated from the filepath.

[
	["Bank 1 name"],
	["Object 1 name", "Object 1 filepath"],
	["Object 2 name", "Object 2 filepath"],
	etc.
],
[
	["Bank 2 name"],
	["", "Object 3 filepath"], // Object name will be auto-generated
	["", "Object 4 filepath"], // Object name will be auto-generated
	etc.
]
etc.

Please note that FUZE has an internal limit of 124 models loaded, so you cannot
have more than 124 object definitions. You can safely delete the 'Castle Demo' 
bank to free up space if you aren't using its definitions in your own maps.
*/
// CORE LOADER
function getModels()
	var models = [
		// Bank 1
		[
			["Castle Demo"], // Bank name (optional)
			["Floor Curved Lg", "Fertile Soil Productions/Floor_Curved_Large"],
			["Floor Curved Lg Outer", "Fertile Soil Productions/Floor_Curved_Large_Outer"],
			["Floor Curved Norm Sq", "Fertile Soil Productions/Floor_Curved_Normal_Square"],
			["Floor Grooved Corner", "Fertile Soil Productions/Prop_Floor_Grooved_Corner"],
			["Floor Grooved End", "Fertile Soil Productions/Prop_Floor_Grooved_End"],
			["Floor Grooved Straight", "Fertile Soil Productions/Prop_Floor_Grooved_Straight"],
			["Wall Curved Lg Mid", "Fertile Soil Productions/Wall_Curved_Large_Middle"],
			["Wall Curved Sm Base", "Fertile Soil Productions/Wall_Curved_Small_Base"],
			["Wall Curved Sm Etched", "Fertile Soil Productions/Wall_Curved_Small_Etched"],
			["Wall Curved Sm Mid", "Fertile Soil Productions/Wall_Curved_Small_Middle"],
			["Wall Curved Sm Window", "Fertile Soil Productions/Wall_Curved_Small_Window"],
			["Wall End Base", "Fertile Soil Productions/Wall_End_Base"],
			["Wall End Mid", "Fertile Soil Productions/Wall_End_Middle"],
			["Wall Straight Base", "Fertile Soil Productions/Wall_Straight_Base"],
			["Wall Straight Circle", "Fertile Soil Productions/Wall_Straight_Circle"],
			["Wall Straight Circle End", "Fertile Soil Productions/Wall_Straight_Circle_End"],
			["Wall Straight Circle Fill", "Fertile Soil Productions/Wall_Straight_Circle_Fill"],
			["Wall Straight Door", "Fertile Soil Productions/Wall_Straight_Door"],
			["Wall Straight Doorway", "Fertile Soil Productions/Wall_Straight_Doorway"],
			["Wall Straight Etched", "Fertile Soil Productions/Wall_Straight_Etched"],
			["Wall Straight Etched End", "Fertile Soil Productions/Wall_Straight_Etched_End"],
			["Wall Straight Mid", "Fertile Soil Productions/Wall_Straight_Middle"],
			["Wall Straight Window", "Fertile Soil Productions/Wall_Straight_Window"],
			["Wall Straight Windows", "Fertile Soil Productions/Wall_Straight_Windows"],
			["Pillar Lg Base", "Fertile Soil Productions/Pillar_Large_Base"],
			["Pillar Lg Beam", "Fertile Soil Productions/Pillar_Large_Beam"],
			["Pillar Lg Beam Attached", "Fertile Soil Productions/Pillar_Large_Beam_Attached"],
			["Pillar Lg Mid", "Fertile Soil Productions/Pillar_Large_Middle"],
			["Pillar Lg Top", "Fertile Soil Productions/Pillar_Large_Top"],
			["Pillar Wall Base", "Fertile Soil Productions/Pillar_Wall_Base"],
			["Pillar Wall Mid", "Fertile Soil Productions/Pillar_Wall_Middle"],
			["Pillar Wall Top", "Fertile Soil Productions/Pillar_Wall_Top"],
			["Stairs Newel Base", "Fertile Soil Productions/Stairs_Newel_Base"],
			["Stairs Newel Mid", "Fertile Soil Productions/Stairs_Newel_Middle"],
			["Stairs Newel Top", "Fertile Soil Productions/Stairs_Newel_Top"],
			["Stairs Railing Ramp Curved Lg", "Fertile Soil Productions/Stairs_Railing_Ramp_Curved_Large"],
			["Stairs Railing Ramp Curved Sm", "Fertile Soil Productions/Stairs_Railing_Ramp_Curved_Small"],
			["Stairs Railing Ramp Straight", "Fertile Soil Productions/Stairs_Railing_Ramp_Straight"],
			["Stairs Steps Curved", "Fertile Soil Productions/Stairs_Steps_Curved"],
			["Stairs Steps Straight", "Fertile Soil Productions/Stairs_Steps_Straight"],
			["Balcony Railing End", "Fertile Soil Productions/Balcony_Railing_End"],
			["Balcony Railing Straight", "Fertile Soil Productions/Balcony_Railing_Straight"],
			["Flag", "Fertile Soil Productions/Prop_Flag_1"],
			["Flag 2", "Fertile Soil Productions/Prop_Flag_2"],
			["Flag 3", "Fertile Soil Productions/Prop_Flag_3"],
			["Flag Stand Ext", "Fertile Soil Productions/Prop_Flag_Stand_Extension"],
			["Flag Stand Top", "Fertile Soil Productions/Prop_Flag_Stand_Top"],
			["Rug Corner Inner", "Fertile Soil Productions/Prop_Rug_Corner_Inner"],
			["Rug Corner Outer", "Fertile Soil Productions/Prop_Rug_Corner_Outer"],
			["Rug Corner Side", "Fertile Soil Productions/Prop_Rug_Corner_Side"],
			["Vase", "Fertile Soil Productions/Prop_Vase"],
			["Gate", "Kenney/metalGate"],
			["Dungeon Floor 1", "DinV Studio/Floor_01"],
			["Dungeon Floor 2", "DinV Studio/Floor_02"],
			["Dungeon Floor 3", "DinV Studio/Floor_03"],
			["Dungeon Wall 1", "DinV Studio/Wall_01"],
			["Dungeon Wall 2", "DinV Studio/Wall_02"],
			["Dungeon Wall 3", "DinV Studio/Wall_03"],
			["Dungeon Wall 3 Door", "DinV Studio/Wall_03_Door"],
			["Dungeon Wall 3 Doorway", "DinV Studio/Wall_03_Doorway"],
			["Dungeon Wall 4", "DinV Studio/Wall_04"],
			["Dungeon Door 1", "DinV Studio/Door_01"],
			["Dungeon Wall Border Upper", "DinV Studio/Wall_border_Upper"],
			["Dungeon Wall Corner Half", "DinV Studio/Wall_corner_Half"],
			["Dungeon Wall Corner Outer", "DinV Studio/Wall_corner_Outer"],
			["Dungeon Window", "DinV Studio/Wall_window_02"],
			["Torch", "DinV Studio/Torch_01"],
			["Torch Holder", "DinV Studio/Torch_holder"],
			["Dungeon Arch", "DinV Studio/Arc_01"],
			["Chandelier", "DinV Studio/Chandelier_01_Short"],
			["Barrel", "DinV Studio/Barrel_01"],
			["Broken Barrel", "DinV Studio/Barrel_broken"],
			["Treasure Chest", "DinV Studio/Chest_01"],
			["Wooden Chair 1", "DinV Studio/Wooden chair_01"],
			["Table 1", "DinV Studio/Table_01"],
			["Wooden Crate", "DinV Studio/Wooden_box_01"],
			["", "Fertile Soil Productions/Grass_Flat"],
			["", "Fertile Soil Productions/Hill_Corner_Outer_2x2"],
			["", "Fertile Soil Productions/Hill_Side"],
			["", "Fertile Soil Productions/Cliff_Mid_Corner_Inner_Lg"],
			["", "Fertile Soil Productions/Cliff_Mid_Corner_Outer_Lg"],
			["", "Fertile Soil Productions/Cliff_Mid_Corner_Outer_Sm"],
			["", "Fertile Soil Productions/Cliff_Top_Corner_Inner_Lg"],
			["", "Fertile Soil Productions/Cliff_Top_Corner_Outer_Lg"],
			["", "Fertile Soil Productions/Cliff_Top_Corner_Outer_Sm"]
		]
		// Add additional banks as desired
	]
	// The line below adds essential system banks. Do not modify it.
	models = insertArray(models, [ [ ["Clipboard"] ], [ ["Primitives"] ], [ ["Lights"] ] ], 0)
return models

/* Color themes can be added and modified in this function.

.textCol should be distinct from from .bgCol, and .textSelCol should be 
distinct from .bgSelCol. .inactiveCol needn't be distinct from anything, 
though using the same color as .bgCol will make menu borders and 
unselectable menu entries invisible. */
function getThemeDefs()
	var themeDef = [
		[
			.name = "Alpine",
			.bgCol = {0.5, 0.7, 0.9, 1},
			.textCol = {0.04, 0.04, 0.15, 1},
			.bgSelCol = white,
			.textSelCol = {0.5, 0.7, 0.9, 1},
			.inactiveCol = {0.75, 0.85, 0.9, 1}
		],
		[
			.name = "Darksign",
			.bgCol = {0.01, 0.01, 0.01, 1},
			.textCol = deepOrange,
			.bgSelCol = burgundy,
			.textSelCol = orange,
			.inactiveCol = pumpkin
		],
		[
			.name = "Dev Kit",
			.bgCol = {19, 32, 120, 255} / 255,
			.textCol = white,
			.bgSelCol = white,
			.textSelCol = {29, 52, 122, 255} / 255,
			.inactiveCol = white
		],
		[
			.name = "Gen One",
			.bgCol = {198, 194, 191, 255} / 255,
			.textCol = {204, 0, 0, 255} / 255,
			.bgSelCol = {56, 56, 56, 255} / 255,
			.textSelCol = {17, 17, 17, 255} / 255,
			.inactiveCol = {138, 135, 130, 255} / 255
		],
		[
			.name = "Gen Two",
			.bgCol = {193, 193, 193, 255} / 255,
			.textCol = {40, 40, 43, 255} / 255,
			.bgSelCol = {41, 28, 120, 255} / 255,
			.textSelCol = {173, 168, 222, 255} / 255,
			.inactiveCol = {138, 137, 145, 255} / 255
		],
		[
			.name = "Gen Three",
			.bgCol = {0.02, 0.02, 0.02, 1},
			.textCol = {225, 175, 33, 255} / 255,
			.bgSelCol = {0, 150, 41, 255} / 255,
			.textSelCol = {234, 6, 6, 255} / 255,
			.inactiveCol = {0, 42, 164, 255} / 255
		],
		[
			.name = "Gen Four",
			.bgCol = {59, 41, 109, 255} / 255,
			.textCol = {215, 214, 217, 255} / 255,
			.bgSelCol = {255, 221, 114, 255} / 255,
			.textSelCol = {252, 48, 83, 255} / 255,
			.inactiveCol = {6, 150, 50, 255} / 255
		],
		[
			.name = "Gen Five/Six",
			.bgCol = white,
			.textCol = {41, 42, 44, 255} / 255,
			.bgSelCol = {75, 200, 255, 255} / 255,
			.textSelCol = white,
			.inactiveCol = {162, 169, 179, 255} / 255
		],
		[
			.name = "Gen Seven",
			.bgCol = {8, 10, 11, 255} / 255,
			.textCol = {0, 189, 255, 255} / 255,
			.bgSelCol = {255, 31, 26, 255} / 255,
			.textSelCol = {8, 10, 11, 255} / 255,
			.inactiveCol = {52, 55, 57, 255} / 255
		],
		[
			.name = "Grape",
			.bgCol = charcoal,
			.textCol = lilac,
			.bgSelCol = grape,
			.textSelCol = white,
			.inactiveCol = amethyst
		],
		[
			.name = "Halcyon",
			.bgCol = lavender,
			.textCol = midnight,
			.bgSelCol = purple,
			.textSelCol = lavender,
			.inactiveCol = thistle
		],
		[
			.name = "Helms",
			.bgCol = {245, 169, 184, 255} / 255,
			.textCol = {0.06, 0.06, 0.1, 1},
			.bgSelCol = {91, 206, 250, 255} / 255,
			.textSelCol = white,
			.inactiveCol = white
		],
		[
			.name = "Inverse",
			.bgCol = black,
			.textCol = white,
			.bgSelCol = white,
			.textSelCol = black,
			.inactiveCol = lightGrey
		],
		[
			.name = "Michael",
			.bgCol = emerald,
			.textCol = armyGreen,
			.bgSelCol = pumpkin,
			.textSelCol = armyGreen,
			.inactiveCol = pine
		],
		[
			.name = "Mono",
			.bgCol = white,
			.textCol = black,
			.bgSelCol = black,
			.textSelCol = white,
			.inactiveCol = lightGrey
		],
		[
			.name = "Ninety-Five",
			.bgCol = platinum,
			.textCol = black,
			.bgSelCol = blue,
			.textSelCol = platinum,
			.inactiveCol = lightGrey
		],
		[
			.name = "Portable",
			.bgCol = {202, 244, 90, 255} / 255,
			.textCol = {15, 56, 15, 255} / 255,
			.bgSelCol = {28, 78, 28, 255} / 255,
			.textSelCol = {155, 188, 15, 255} / 255,
			.inactiveCol = {139, 172, 15, 255} / 255
		],
		[
			.name = "Prairie",
			.bgCol = bisque,
			.textCol = armyGreen,
			.bgSelCol = brass,
			.textSelCol = olive,
			.inactiveCol = tan
		],
		[
			.name = "Ross",
			.bgCol = white,
			.textCol = {179, 25, 66, 255} / 255,
			.bgSelCol = {10, 49, 97, 255} / 255,
			.textSelCol = white,
			.inactiveCol = {0.7, 0.7, 0.7, 1}
		],
		[
			.name = "Sunflower",
			.bgCol = {0, 87, 183, 255} / 255,
			.textCol = white,
			.bgSelCol = {255, 221, 0, 255} / 255,
			.textSelCol = black,
			.inactiveCol = {0.6, 0.6, 0.6, 1}
		],
		[
			.name = "Trinity",
			.bgCol = black,
			.textCol = white,
			.bgSelCol = lime,
			.textSelCol = black,
			.inactiveCol = black
		],
		[
			.name = "Vegas",
			.bgCol = black,
			.textCol = deepPink,
			.bgSelCol = watermelon,
			.textSelCol = ruby,
			.inactiveCol = denim
		]
	]
return themeDef

// ----------------------------------------------------------------
// GLOBAL SETUP

// System setup
var g_editor = true // Are we in the editor? false = game/core loader, true = editor
var g_version = "1.0.00"
var g_freezeFile = false // Setting to true will block file closure and freeze the save file in its current state
var g_breakpoint = true // Enable or disable debug breakpoints
var g_frame = 0 // Current frame number
var g_copyLimit = 32 // Max number of objects that can exist in the copy bank before old ones start getting removed
var g_pauseRequest = 0 // Set this to request sleep() after the frame is drawn
var g_lightBank = 2 // Bank number for lights
var g_intLen = 64 // Number of bits to use for binary variables. FUZE technically has 64-bit signed ints, but it's complicated

/* Default theme and background in case Ninety-Five has been deleted from the
getThemeDefs() function by the user. Superceded by loaded file data if present. */
var g_theme = [
	.name = "Ninety-Five",
	.bgCol = platinum,
	.textCol = black,
	.bgSelCol = blue,
	.textSelCol = platinum,
	.inactiveCol = lightGrey
]

var g_bg
initBg()

function initBg()
	g_bg = [
		.idx = 6,
		.col = {0.2, 0.2, 0.2, 1}
	]
	setEnvironment(g_bg.idx, g_bg.col)
return void

// Sprites
var g_imgCur = loadImage("Kenney/gameIcons", 0)
var g_imgPointLight = loadPointLightImg()
var g_imgPointShadowLight = loadPointShadowLightImg()
var g_imgSpotLight = loadSpotLightImg()
var g_imgWorldLight = loadWorldLightImg()
var g_imgWorldShadowLight = loadWorldShadowLightImg()
var g_imgMerged = initMergedImg()

var g_logo = [
	.frame = 0,
	.frameTime = time(),
	.spr = -1,
	.sprExists = false,
	.textSpr = -1,
	.textSprExists = false,
	.img = -1,
	.textImg = -1
]
initLogoSpr()
initLogoTextSpr()
setSpriteCamera(gwidth() / 2, gheight() / 2)

function initMergedImg()
	var sprCol = getSprThemeCol()
	g_imgMerged = loadMergedImg(sprCol.fill, sprCol.outline)
return void

/* Sets default values for the load/splash logo sprite. */
function initLogoSpr()
	if !g_logo.sprExists then
		g_logo.spr = createSprite()
	endif
	
	var sprCol = getSprThemeCol()
	
	if len(g_logo.img) then
		freeImage(g_logo.img[0])
		freeImage(g_logo.img[1])
	endif
	
	g_logo.img = [
		loadCelqiImg(0, sprCol.fill, sprCol.outline),
		loadCelqiImg(1, sprCol.fill, sprCol.outline)
	]
	
	setSpriteImage(g_logo.spr, g_logo.img[g_logo.frame])
	setSpriteScale(g_logo.spr, {4, 4, 4})
	g_logo.sprExists = true
return void

/* Sets default values for the splash text sprite. */
function initLogoTextSpr()
	if !g_logo.textSprExists then
		g_logo.textSpr = createSprite()
	endif
	
	var sprCol = getSprThemeCol()
	g_logo.textImg = loadLogoTextImg(sprCol.fill, sprCol.outline)
	setSpriteImage(g_logo.textSpr, g_logo.textImg)
	setSpriteScale(g_logo.textSpr, {4, 4, 4})
	g_logo.textSprExists = true
return void

/* Stores cells on the horizon of icon visibility so we know when to 
show and hide the spites. */
var g_lightIconLoader = [
	.show = [],
	.hide = []
]

// Display settings
var g_dispDec = 3 // Default number of decimal places to show
var g_sprAlpha = 0.7 // Alpha value for sprites drawn in 3D space
var g_menuBorderW
var g_menuTextSize
var g_dialogTextSize
var g_statusTextH
var g_statusBarH
initScreenRes()

// Call when resolution changes to make sure GUI elements are the correct size
function initScreenRes()
	g_menuBorderW = gwidth() / 450
	g_menuTextSize = gheight() / 32
	g_dialogTextSize = gheight() / 25.5
	textSize(g_menuTextSize)
	g_statusTextH = gheight() / 36
	g_statusBarH = g_statusTextH * 3
return void

/* A cell is the basic unit of space in a map. Cells are dynamically added as objects
are placed and store references to the objects they contain and to all other adacent 
cells.

Size of a grid cell. Must be an equal-sided cube whose dimension is a whole number. */
var g_cellExt = [
	.lo = {-2.5, -2.5, -2.5},
	.hi = {2.5, 2.5, 2.5}
]

var g_cellObjStart = 2 // First index of object storage in a cell. We don't store objects in a subarray because that would increase access time.
var g_cellBitLen = pow(getCellWidth(), 3)
var g_visibleCellOutlines = false
var g_cell // This is the array that stores all cell and map object data
array g_cellOutline[0]

/* Clears and resets the g_cell array for map initialization. */
function initCell()
	g_cell = []
	
	array newOutlineArr[2]
	g_cellOutline = newOutlineArr
	var outlineEntry = [ .isValid = false ]
	
	var i
	for i = 0 to len(g_cellOutline) loop
		g_cellOutline[i] = outlineEntry
	repeat
return void

/* List of selected objects. Contains entries in the form of
[ .cell = x, .idx = x ]. */
var g_sel
initSel()

/* Clears and resets the object selection state. */
function initSel()
	array newArr[0][0]
	g_sel = newArr
return void

// Camera
colContext g_newColCon
var g_cam = [
	.movSpd = 5,
	.rotSpd = 125,
	.pos = {0, 1, 1},
	.dir = {0, 1, 2},
	.fwd = {0, 0, 1},
	.r = {-1, 0, 0},
	.up = {0, 1, 0},
	.delta = {0, 0, 0}, // Movement difference from last frame
	.worldMovement = false, // Does camera movement happen on world axes (true) or camera axes (false)?
	.fov = 60,
	.cell = -1, // Current cell that the camera is in
	.cellPos = {2.5, 2.5, 2.5},
	.drawObjLabels = false,
	.collisionMode = 0,
	.lastColContext = g_newColCon,
	.collider = placeObject(cube, {0, 1, 1}, {0.3, 0.3, 0.3}),
	.ext = [ .lo = {-1, -1, -1}, .hi = {1, 1, 1} ] // Needs to match .collider's dimensions
]
setObjectVisibility(g_cam.collider, false)
setFov(g_cam.fov)
initCam()

/* Resets camera to default values. */
function initCam()
	g_cam.pos = {0, 1, 1}
	g_cam.dir = {0, 1, 2}
	g_cam.fwd = {0, 0, 1}
	g_cam.r = {-1, 0, 0}
	g_cam.up = {0, 1, 0}
	g_cam.delta = {0, 0, 0}
	g_cam.cell = -1
	g_cam.cellPos = getCellPosFromPos(g_cam.pos)
	g_cam.lastColContext = initColContext(g_cam.lastColContext, g_cam.collider, 
		g_cam.pos, g_cam.fwd, g_cam.up, {0.3, 0.3, 0.3}, 4,  
		0, {0, 0, 0}, 0.001, true, true, true)
return void

// Cursor
var g_cur = [
	.obj = -1, // Wireframe object visually indicating cursor grid position
	.activeObj = -1, // Current brush object
	.isMerged = false, // Whether brush object is a merged object
	.spr = createSprite(), // 2D cursor widget
	.rotator = [ .obj = [] ], // Object visualy indicating brush scale
	.scaler = [ .obj = [] ], // Object visualy indicating brush rotation
	.mode = "move",
	.posMode = 0,
	.posSnapMode = 2,
	.posSnapAmount = -1,
	.rotMode = 1,
	.rotSnapMode = 0,
	.rotSnapAmount = 45,
	.scaleMode = 0,
	.scaleSnapMode = 0,
	.scaleSnapAmount = 0.1,
	.scale = {1, 1, 1},
	.objGrp = createObjectGroup({0.5, 0.5, 0.5}),
	.xyz = createXYZObj({0.5, 0.5, 0.5}, 1), // Object indicating brush local axes
	.pos = {0.5, 0.5, 0.5},
	.prevPos = {0.5, 0.5, 0.5},
	.pos2d = worldPosToScreenPos({0.5, 0.5, 0.5}, g_cam.fwd, g_cam.up, g_cam.pos, g_cam.fov),
	.fwd = {0, 0, 1},
	.up = {0, 1, 0},
	.massSel = -1, // Data about mass selecion state
	.cell = -1, // Cell that the cursor is currently in
	.cellPos = {2.5, 2.5, 2.5},
	.lastColContext = g_newColCon, // Data about object collisions
	.collider = placeObject(cube, {0, 0, 0}, {0.5, 0.5, 0.5}),
	.ext = [ .lo = {-0.5, -0.5, -0.5}, .hi = {0.5, 0.5, 0.5} ] // Needs to match .collider's dimensions
]
setObjectVisibility(g_cur.collider, false)
initCurObj()
initCur()
setSpriteImage(g_cur.spr, g_imgCur, 374)
setSpriteColor(g_cur.spr, {g_theme.bgSelCol.r, g_theme.bgSelCol.g, g_theme.bgSelCol.b, g_sprAlpha})

/* Instantiates the compound wireframe object that outlines the current grid space. */
function initCurObj()
	g_cur.obj = createWireCubeObj({0, 0, 0}, 
		[ .lo = {-0.5, -0.5, -0.5}, .hi = {0.5, 0.5, 0.5} ], 0.01, 
		g_theme.bgSelCol, 0, 1, 0.55)
	setObjectParent(g_cur.obj.grp, g_cur.objGrp)
return void

/* Resets the cursor to the default values. */
function initCur()
	endCurMode(g_cur.mode)
	
	g_cur.activeObj = -1
	g_cur.isMerged = false
	g_cur.rotator = [ .obj = [] ]
	g_cur.scaler = [ .obj = [] ]
	g_cur.mode = "move"
	g_cur.posMode = 0
	g_cur.scale = {1, 1, 1}
	g_cur.pos = {0.5, 0.5, 0.5}
	g_cur.pos2d = worldPosToScreenPos({0.5, 0.5, 0.5}, g_cam.fwd, g_cam.up, g_cam.pos, g_cam.fov)
	g_cur.fwd = {0, 0, 1}
	g_cur.up = {0, 1, 0}
	g_cur.cell = -1
	g_cur.cellPos = getCellPosFromPos(g_cur.pos)
	
	/* g_cur.collider is a group member, and the relative pos offset interferes with finding 
	its ext in initColContext(), so temporarily zero the group pos first. */
	setObjectPos(g_cur.objGrp, {0, 0, 0})
	g_cur.lastColContext = initColContext(g_cur.lastColContext, g_cur.collider, 
		g_cur.pos, g_cur.fwd, g_cur.up, {0.5, 0.5, 0.5}, 1, 
		0, {0, 0, 0}, 0.001, true, true, true)
	setObjectPos(g_cur.objGrp, floorVec(g_cur.pos) + 0.5)
return void

// World state
initCell() // Don't init cell in the cell setup block because it needs camera and cursor info
var g_blink = [
	.state = 0, // Selection blink state
	.lastUpdateTime = 0, // Time blink state last changed
	.needUpdate = false, // Did the blink state change this frame?
	.dur0 = 0.25, // Duration of state 0
	.dur1 = 0.75 // Duration of state 1
]
var g_lastLoadUpdateTime = 0
var g_needWritePrefs = false // Set when a menu item wants to save itself as an editor preference
var g_photoMode = false // Whether the editor is in photo mode
var g_currentMapName = ""
var g_dirtyMap = false // Whether the open map has unsaved changes
var g_requestShallowStackAction = "" // Set this to queue a function that needs to run from as shallow a stack as possible
array g_worldLights[0] // Easy direct access to world lights so they can be disabled when opening the object menu
array g_debugLines[0] // Array of debug lines to check for deletion every frame
var g_lightIcons = [] // Array of objects near the camera that need to render a light sprite
array g_thrown[0] // Array of thrown physics objects
var g_viewport = createObjectGroup({0, 0, 0}) // Used to organize UI elements based on camera position
var g_compass = [
	.obj = createXYZObj({0, 0, 0}, 0.3),
	.scale = {0.17, 0.17, 0.17}
]	
setObjectScale(g_compass.obj.grp, g_compass.scale * getUiFovScale(g_cam.fov))

// Menus
var g_menuImg = createImage(1, 1, false)
var g_objMenu = initObjMenu()
var g_menuResult
var g_closeResult
var g_updatedMenu

// Keyboard mappings
var g_kb // Keyboard input buffer
var g_c // Controller input buffer

/* g_cDat is an array instead of a struct so that it can be iterated. g_cIdx
gives friendly masks for the indices -- e.g. g_cDat[g_cIdx.down] to access
the down button's data. */
var g_cIdx = [
	.a = 0,
	.b = 1,
	.x = 2,
	.y = 3,
	.l = 4,
	.r = 5,
	.zl = 6,
	.zr = 7,
	.up = 8,
	.down = 9,
	.left = 10,
	.right = 11,
	.lxPos = 12,
	.lxNeg = 13,
	.lyPos = 14,
	.lyNeg = 15,
	.rxPos = 16,
	.rxNeg = 17,
	.ryPos = 18,
	.ryNeg = 19,
	.lxy = 20,
	.rxy = 21
]

// Keyboard bindings
var g_bind = [
	.cam = [
		// [ keyboard key, [ controller button(s) ], hold until repeat rate fires ]
		[ "w", [ g_cIdx.zr ], true ], // Forward
		[ "s", [ g_cIdx.zl ], true ], // Backwards
		[ "a", [ g_cIdx.left ], true ], // Slide left
		[ "A", [ g_cIdx.left ], true ], // Slide left
		[ "d", [ g_cIdx.right ], true ], // Slide Right
		[ "D", [ g_cIdx.right ], true ], // Slide Right
		[ "W", [ g_cIdx.up ], true ], // Slide up
		[ "S", [ g_cIdx.down ], true ], // Slide down
		[ "E", [ g_cIdx.ryPos ], true ], // Rotate up
		[ "Q", [ g_cIdx.ryNeg ], true ], // Rotate down
		[ "e", [ g_cIdx.rxPos ], true ], // Rotate right
		[ "q", [ g_cIdx.rxNeg ], true ] // Rotate left
	],
	.menu = [
		[ chr(9), [ g_cIdx.x ], false ], // Open main menu
		[ "`", [ g_cIdx.y ], false ], // Open object menu
		[ chr(10), [ g_cIdx.a ], false ], // Enter
		[ chr(92), [ g_cIdx.b ], false ], // Cancel
		[ "w", [ g_cIdx.up ], false ], // Up
		[ "s", [ g_cIdx.down ], false ], // Down
		[ "a", [ g_cIdx.left ], false ], // Left
		[ "d", [ g_cIdx.right ], false ], // Right
		[ "e", [ g_cIdx.r ], false ], // Next bank
		[ "q", [ g_cIdx.l ], false ] // Previous bank
	],
	.edit = [
		[ chr(10), [ g_cIdx.a ], false ], // Add object
		[ chr(92), [ g_cIdx.b ], false ], // Mass select
		[ " ", [ g_cIdx.r ], false ], // Change edit tool
		[ "x", [ g_cIdx.l ], false ], // Toggle tool mode
		[ "i", [ g_cIdx.lyPos ], false ], // Up
		[ "k", [ g_cIdx.lyNeg ], false ], // Down
		[ "j", [ g_cIdx.lxNeg ], false ],  // Left
		[ "l", [ g_cIdx.lxPos ], false ] // Right
	],
	.cursor = [
		[ "i", [ g_cIdx.lyPos ], false ], // Forward
		[ "k", [ g_cIdx.lyNeg ], false ], // Backwards
		[ "j", [ g_cIdx.lxNeg ], false ], // Left
		[ "l", [ g_cIdx.lxPos ], false ], // Right
		[ "o", [ g_cIdx.l, g_cIdx.lyPos ], false ],// Up
		[ "u", [ g_cIdx.l, g_cIdx.lyNeg ], false ] // Down
	]
]

// Default button info
button g_btn
g_btn.lastTime = 0
g_btn.held = false
g_btn.kbHeld = false
g_btn.count = 0

// Extended data about controller button states
array g_cDat[22]
var g_rateInit = 0.2
var g_rateRep = 0.075
var g_kbRateRep = 0.1167

var i
for i = 0 to len(g_cDat) loop
	g_cDat[i] = g_btn
repeat

// ----------------------------------------------------------------
// LOAD OBJECT DEFINITIONS AND MAP

var g_mapFile = open() // Subsequent opens must use openFile() rather than open() to respect g_freezeFile's state
//clearFile(g_mapFile) // Uncomment to fully erase saved data on startup
//debugFile(g_mapFile) // Uncomment to view file before launching the editor

readEdPrefs(g_mapFile)

showSplash(4) // Change argument to 0 to disable splash screen

// Arrange model data in a code-readable format
var g_loadResult = loadObjDefs(g_mapFile)
removeLoadSpr()
var g_obj = g_loadResult.obj
var g_bankName = g_loadResult.bankName
var g_missingRefs = loadMergedObjDefs(g_mapFile)
removeLoadSpr()
resolveMergedObjDefChanges(g_missingRefs)
confirmUniqueDefNames()
writeObjDefs(g_mapFile)

active g_activeObj
createActiveObj(g_lightBank - 1, 0)

// Load map
g_currentMapName = ""
g_mapNames = getMapNames(g_mapFile)

if len(g_mapNames) then
	var queuedMap = triggerMapLoad(g_mapFile, true)
	
	if queuedMap != "" then
		clearMap()
		initEdForClearedMap()
		g_currentMapName = queuedMap
		var mapResult = readObjMap(g_mapFile, g_currentMapName)
		initEdForLoadedMap(mapResult)
	endif
endif

initCellOutlines()

g_loadResult = -1 // Free memory
g_missingRefs = -1 // Free memory
array g_menu[0]
closeFile(g_mapFile)

// ----------------------------------------------------------------
// MENU ARRAYS

var g_objMenuSidebar = [
	[
		.text = "Next bank (R)",
		.action = "nextbank",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = -1
	],
	[
		.text = "Previous bank (L)",
		.action = "prevbank",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = -1
	],
	[
		.text = "Close",
		.action = "closeobjmenu",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = -1
	]
]

var g_mergedObjMenu = [
	[
		.text = "Set brush (single merged)",
		.action = "brushmerged",
		.selAction = "",
		.active = true,
		.sel = true,
		.clicked = false,
		.submenu = -1
	],
	[
		.text = "Set brush (multiple unmerged)",
		.action = "brushunmerged",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = -1
	],
	[
		.text = "Delete definition",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = [
			[
				.text = "Delete and unmerge references",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "In this map only",
						.action = "deldefunmerge",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "In all maps",
						.action = "deldefunmergeallmaps",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Delete and remove references",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "In this map only",
						.action = "deldefremove",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "In all maps",
						.action = "deldefremoveallmaps",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Delete and replace references with current brush",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "In this map only",
						.action = "deldefreplace",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "In all maps",
						.action = "deldefreplaceallmaps",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			]
		]
	]
]

g_menu = [
	[
		.text = "File",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = true,
		.clicked = false,
		.submenu = [
			[
				.text = "New map ...",
				.action = "new",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Save map",
				.action = "save",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Save map as ...",
				.action = "saveas",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Load map ...",
				.action = "load",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Manage maps ...",
				.action = "manage",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "About ...",
				.action = "about",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Release notes ...",
				.action = "patchnotes",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			]
		]
	],
	[
		.text = "Objects under cursor",
		.action = "",
		.selAction = "",
		.active = false,
		.sel = false,
		.clicked = false,
		.submenu = -1
	],
	[
		.text = "Selection",
		.action = "",
		.selAction = "",
		.active = false,
		.sel = false,
		.clicked = false,
		.submenu = -1
	],
	[
		.text = "Brush properties",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = [
			[
				.text = "Object color",
				.action = "objcol",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Metallic",
				.action = "objmetal",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Roughness",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase (+0.01)",
						.action = "objrough0.01",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+0.1)",
						.action = "objrough0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-0.01)",
						.action = "objrough-0.01",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-0.1)",
						.action = "objrough-0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "objroughset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Emissiveness",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase (+0.01)",
						.action = "objemit0.01",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+0.1)",
						.action = "objemit0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-0.01)",
						.action = "objemit-0.01",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-0.1)",
						.action = "objemit-0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "objemitset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Brightness",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase (+0.1)",
						.action = "lightbrightness0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+1)",
						.action = "lightbrightness1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+5)",
						.action = "lightbrightness5",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-0.1)",
						.action = "lightbrightness-0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-1)",
						.action = "lightbrightness-1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-5)",
						.action = "lightbrightness-5",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "lightbrightnessset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Light color",
				.action = "lightcol",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Spread",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase (+1)",
						.action = "lightspread1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+5)",
						.action = "lightspread5",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+10)",
						.action = "lightspread10",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-1)",
						.action = "lightspread-1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-5)",
						.action = "lightspread-5",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-10)",
						.action = "lightspread-10",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "lightspreadset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Resolution",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase",
						.action = "lightresup",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease",
						.action = "lightresdown",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "lightresset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Range",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase (+1)",
						.action = "lightrange1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+10)",
						.action = "lightrange10",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+100)",
						.action = "lightrange100",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-1)",
						.action = "lightrange-1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-10)",
						.action = "lightrange-10",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-100)",
						.action = "lightrange-100",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "lightrangeset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			]
		]
	],
	[
		.text = "Camera options",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = [
			[
				.text = "Recenter cursor",
				.action = "centercursor",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Movement speed (" + int(g_cam.movSpd) + ")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase",
						.action = "cammovup",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease",
						.action = "cammovdown",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "cammovset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Rotation speed (" + int(g_cam.rotSpd) + ")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase",
						.action = "camrotup",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease",
						.action = "camrotdown",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "camrotset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Field of view (" + int(g_cam.fov) + ")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase",
						.action = "camfovup",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease",
						.action = "camfovdown",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "camfovset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Lock movement to world axes (" + getBoolStr(g_cam.worldMovement) + ")",
				.action = "camworldmovement",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			]
		]
	],
	[
		.text = "Position options",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = [
			[
				.text = "Snap mode (" + getSnapModeStr(g_cur.posSnapMode) + ")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "No snap",
						.action = "posnosnap",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Snap by",
						.action = "possnapby",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Snap to",
						.action = "possnapto",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Snap increment (" + getPosSnapAmountStr(g_cur.posSnapAmount, g_dispDec) + ")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "0.5",
						.action = "possnapamt0.5",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "0.25",
						.action = "possnapamt0.25",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "0.125",
						.action = "possnapamt0.125",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "0.0625",
						.action = "possnapamt0.0625",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Grid unit",
						.action = "possnapamtgrid",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+0.01)",
						.action = "possnapamt0.01",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+0.1)",
						.action = "possnapamt0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+1)",
						.action = "possnapamt1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-0.01)",
						.action = "possnapamt-0.01",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-0.1)",
						.action = "possnapamt-0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-1)",
						.action = "possnapamt-1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "possnapamtset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			]
		]
	],
	[
		.text = "Rotation options",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = [
			[
				.text = "Snap mode (" + getSnapModeStr(g_cur.rotSnapMode) + ")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "No snap",
						.action = "rotnosnap",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Snap by",
						.action = "rotsnapby",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Snap to",
						.action = "rotsnapto",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Snap increment (" + strRemoveTrailingZeroes(floatToStr(g_cur.rotSnapAmount, g_dispDec)) + chr(176) + ")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase (+1)",
						.action = "rotsnapamt1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+5)",
						.action = "rotsnapamt5",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+10)",
						.action = "rotsnapamt10",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-1)",
						.action = "rotsnapamt-1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-5)",
						.action = "rotsnapamt-5",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-10)",
						.action = "rotsnapamt-10",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "rotsnapamtset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			]
		]
	],
	[
		.text = "Scale options",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = [
			[
				.text = "Snap mode (" + getSnapModeStr(g_cur.scaleSnapMode) + ")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "No snap",
						.action = "scalenosnap",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Snap by",
						.action = "scalesnapby",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Snap to",
						.action = "scalesnapto",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Snap increment (" + strRemoveTrailingZeroes(floatToStr(g_cur.scaleSnapAmount, g_dispDec)) + ")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "Increase (+0.01)",
						.action = "scalesnapamt0.01",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+0.1)",
						.action = "scalesnapamt0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Increase (+1)",
						.action = "scalesnapamt1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-0.01)",
						.action = "scalesnapamt-0.01",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-0.1)",
						.action = "scalesnapamt-0.1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Decrease (-1)",
						.action = "scalesnapamt-1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Set ...",
						.action = "scalesnapamtset",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			]
		]
	],
	[
		.text = "Background",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = addBackgroundsToMenu(g_bg.idx)
	],
	[
		.text = "Theme",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = addThemesToMenu(g_theme.name)
	],
	[
		.text = "Advanced",
		.action = "",
		.selAction = "",
		.active = true,
		.sel = false,
		.clicked = false,
		.submenu = [
			[
				.text = "Screen resolution (" + gwidth() + "x" + gheight() +")",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "1920x1080",
						.action = "res1080p",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "* 1280x720",
						.action = "res720p",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Photo mode (" + getBoolStr(g_photoMode) + ")",
				.action = "photomode",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Show object labels (" + getBoolStr(g_cam.drawObjLabels) + ")",
				.action = "drawobjlabels",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Camera collisions (None)",
				.action = "",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = [
					[
						.text = "* None",
						.action = "camcol0",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Bounding box",
						.action = "camcol1",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Simple raycast",
						.action = "camcol2",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Complex raycast (spheroid)",
						.action = "camcol3",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					],
					[
						.text = "Complex raycast (cuboid)",
						.action = "camcol4",
						.selAction = "",
						.active = true,
						.sel = false,
						.clicked = false,
						.submenu = -1
					]
				]
			],
			[
				.text = "Show cell outlines (" + getBoolStr(g_visibleCellOutlines) + ")",
				.action = "showcells",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "Throw physics object",
				.action = "throw",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "View map stats ...",
				.action = "viewstats",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			],
			[
				.text = "View raw save file data ...",
				.action = "viewfile",
				.selAction = "",
				.active = true,
				.sel = false,
				.clicked = false,
				.submenu = -1
			]
		]
	]
]

// ----------------------------------------------------------------
// MAIN EXECUTION LOOP

loop
	updateBlink()
	g_kb = getKeyboardBuffer()
	/*drawObjects()

	if !g_photoMode then
		updateLightSpr()
		drawSprites()
		drawObjLabels()
	endif*/
	
	//debug()
	handleInput()
	updateThrow()
	
	if !g_photoMode then
		updateMassSel()
		updateActive()
		updateUnderCurObj()
		updateSelObj()
	endif
	
	drawObjects()
	
	if !g_photoMode then
		updateLightSpr()
		drawSprites()
		drawObjLabels()
	endif
	
	debug()
	handleMenus()
	
	update()
	g_frame += 1
	pause()
	
	/* Some function chains are complex enough that they may potentially
	cause a stack overflow via hitting the recursion limit. To guard against
	this, we run them from as shallow a stack as possible. */
	if len(g_requestShallowStackAction) then
		if g_requestShallowStackAction == "load" then
			resolveMapLoadAction()
		else
			resolveDelDefMenuAction(g_requestShallowStackAction)
		endif
		
		g_requestShallowStackAction = ""
	endif
repeat

// ----------------------------------------------------------------
// STRUCTS

/* Stores information about an object's collision state. */
// CORE LOADER

struct colContext
	int cell = -1
	vector cellPos = {float_max, float_max, float_max}
	vector comPos = {float_max, float_max, float_max}
	vector colPos = {float_max, float_max, float_max}
	vector scale = {1, 1, 1}
	vector colScale = {float_max, float_max, float_max}
	vector fwd = {0, 0, 1}
	vector colFwd = {float_max, float_max, float_max}
	vector up = {0, 1, 0}
	vector colUp = {float_max, float_max, float_max}
	extent ext = [ .lo = {0, 0, 0}, .hi = {0, 0, 0} ]
	float mass
	vector centerOfMass
	vector dir
	vector delta
	vector grav
	vector vel
	vector rotVel
	vector rotVelAxis
	array gridBit[0]
	array objList[0]
	array collision[0]
	array colDepth[0]
	array normal[0]
	str normAxis
	int colThisFrame = false
	var deflectThisFrame = false
	int allCollisions = true
	int collisionMode = 3
	var colDat
	var auxCollider = -1
	var auxColCon = -1
	var continuedCol = false
endstruct

/* Stores info about objects placed in the map. Distinct from active, which is
a reduced dataset, and objDef, which is the basic info need to instantiate an
active or a mapObj. */
// CORE LOADER
struct mapObj
	var obj // Handle of an object or a group, or -1 if the mapObj contains a light
	vector fwd
	vector up
	vector scale
	vector pos
	int bankIdx
	array gridBitList[0]
	int highlight
	array children[0]
	array lights[0]
	array cellIdx[0]
	vector col
	vector mat 
endStruct

// Points to the cell and index that contains the object's data
// CORE LOADER
struct mapObjRef
	int cellIdx
endStruct

/* active is a relic -- it used to e a reduced dataset of mapObj, but
now mostly just recreates mapObj. Due for deprecation. */
// CORE LOADER
struct active
	string name
	var obj
	vector pos
	vector scale
	vector fwd
	vector up
	int bankIdx
	array children[0]
	array lights[0]
	int cellIdx = -1
	array gridBitList[0]
	vector col
	vector mat
endStruct

/* Info about a light. lightObjs placed in the map are always contained in the lights 
array of mapObj or active. They do not exist on their own. All light types use the
same kind of lightObj (distinguished by the name field), so not all fields are always
relevant to a given light. */
// CORE LOADER
struct lightObj
	var light
	string name
	var spr
	vector sprScale
	vector pos
	vector fwd
	float brightness
	vector col
	int res
	float spread
	float range
endStruct

// Extended input data.
struct button
	float lastTime
	int held
	int kbHeld
	int count
endStruct

// Bounding box that describes the dimensions of an object.
// CORE LOADER
struct extent
	vector lo
	vector hi
endStruct

// Data used to instantiate a mapObj or an active.
// CORE LOADER
struct objDef
	string name
	string file
	var obj
	extent ext
	vector scale
	array children[0]
	array lights[0]
endStruct

// ----------------------------------------------------------------
// FILE FUNCTIONS

	// ----------------------------------------------------------------
	// FILE DEBUG

/* Prints all file data in human-readable form. */
function debugFile(_file)
	showLoadBox("Loading file ...", true, false, false)
	
	g_kb = getKeyboardBuffer()
	var c = controls(0)
	c = applyKb(c, g_bind.menu).c
	
	textSize(g_dialogTextSize)
	var viewLine = 0
	var viewH = tHeight()
	var scrollW = textWidth("*")
	var firstChunkIdx = 0
	var lastChunkIdx = getPrevFileChunk(_file, getEofIdx(_file)).prevIdx
	var secMap = createFileOverview(_file, lastChunkIdx)
	removeLoadSpr()
	
	var scroll
	var lineMov
	var movInc
	var i
	var chunk
	
	while !c.b loop
		ink(g_theme.textCol)
		clear(g_theme.bgCol)
		
		g_kb = getKeyboardBuffer()
		c = controls(0)
		c = applyKb(c, g_bind.menu).c
		
		viewLine = 0
		scroll = round((firstChunkIdx / lastChunkIdx) * viewH)
		lineMov = 0
		
		printAt(0, scroll, "*")
		ink(g_theme.bgSelCol * 0.7)
		drawFileOverview(secMap, scrollW)
		
		if scrollInputStarted(c) then
			movInc = floor(viewH / 3)
			lineMov = round(interpolate(ease_in, 0, movInc * getSign(c.ly), abs(c.ly))) 
				+ round(interpolate(ease_in, 0, 120 * getSign(c.ry), abs(c.ry))) 
				+ c.up * movInc 
				- c.down * movInc
		endif
		
		for i = 0 to abs(lineMov) loop
			if lineMov <= 0 then
				firstChunkIdx = clamp(getNextFileChunk(_file, firstChunkIdx).nextIdx,
					0, lastChunkIdx) // File
			else
				firstChunkIdx = clamp(getPrevFileChunk(_file, firstChunkIdx).prevIdx,
					0, lastChunkIdx) // File
			endif
		repeat
		
		chunk = getNextFileChunk(_file, firstChunkIdx - 1) // File
		while inFile(chunk) and viewLine <= viewH loop
			chunk = getNextFileChunk(_file, chunk.nextIdx) // Section
			printDebugFileEntry(chunk.marker, chunk.dat, viewLine)
			viewLine += 1
		repeat
		
		if c.b and !g_cDat[g_cIdx.b].held then
			g_cDat[g_cIdx.b].held = true
		else if !c.b then
			g_cDat[g_cIdx.b].held = false
		endif endif
		
		update()
	repeat
	
	ink(white)
	removeLoadSpr()
return void

/* Draws tickmarks next to the scrollbar in file debug view representing an overview
of the sections in the file. Longer marks are higher levels of the file tree. */
function createFileOverview(_file, _lastChunkIdx)
	array secMap[gheight()]
	var i
	for i = 0 to len(secMap) loop
		secMap[i] = ""
	repeat
	
	var chunk = getNextFileChunk(_file, -1)
	while inFile(chunk) loop
		if chunk.nextMarker != chr(28) and chunk.nextMarker != chr(29) then
			secMap[round((chunk.nextIdx / _lastChunkIdx) * gheight())] = 
				chunk.nextMarker
		endif
		
		chunk = getNextFileChunk(_file, chunk.nextIdx)
	repeat
return secMap

/* Visualizes the data from createFileOverview(). */
function drawFileOverview(_secMap, _xPos)
	var i
	for i = 0 to len(_secMap) loop
		if len(_secMap[i]) then
			var col = g_theme.bgSelCol
			var lineLen = _xPos
			if _secMap[i] == chr(17) then
				lineLen *= 0.66
				col = g_theme.textCol
			else if _secMap[i] == chr(30) then
				lineLen *= 0.33
				col = {1, 1, 1, 2} - g_theme.bgCol
			endif endif
			
			line({_xPos * 2 - lineLen, i + 1}, {_xPos * 2, i + 1}, col)
		endif
	repeat
return void

/* Diplays a line of data in the debug file reader. */
function printDebugFileEntry(_marker, _dat, _viewLine)
	ink(getFileMarkerCol(_marker))
	loop if _marker == chr(31) then
		printAt(2, _viewLine, "(section) " + _dat)
		break endif
	if _marker == chr(17) then
		printAt(4, _viewLine, "(block) " + _dat)
		break endif
	if _marker == chr(30) then
		printAt(6, _viewLine, "(unit) " + _dat)
		break endif
	if _marker == chr(29) then
		printAt(8, _viewLine, "(field) " + _dat)
		break endif
	if _marker == chr(28) then
		printAt(10, _viewLine, "(elem) " + _dat)
		break 
	endif break repeat
return void

/* Gets color coding for various file sections for the debug file reader. */
function getFileMarkerCol(_marker)
	var col = g_theme.bgCol
	loop if _marker == chr(31) then
		col = g_theme.bgSelCol * 0.7
		break endif
	if _marker == chr(17) then
		col = g_theme.bgSelCol * 0.8
		break endif
	if _marker == chr(30) then
		col = g_theme.bgSelCol * 0.9
		break endif
	if _marker == chr(29) then
		col = g_theme.bgSelCol
		break endif
	if _marker == chr(28) then
		col = g_theme.textCol
		break
	endif break repeat
return col

	// ----------------------------------------------------------------
	// FILE WRITING

/* If g_freezeFile is true, g_mapFile will remain open and will be passed
to anything requesting a file open instead of newly opening the file. Because 
the file never closes, writes won't persist on program close, and because 
g_mapFile is only opened once, the file will never be reloaded from its saved 
state during the session. The result is that file changes will persist for 
the session but will roll back when the session is terminated. */
function openFile()
	var file
	
	if g_freezeFile then
		file = g_mapFile
	else
		file = open()
	endif
return file

/* Allows a function to optionally open a file if it isn't passed one as 
an argument. */
function openFileIfNeeded(_file, _needed)
	if _needed then
		_file = openFile()
	endif
return _file

/* If a file was opened via openFileIfNeeded(), closes it. */
function closeFileIfNeeded(_file, _needed)
	if _needed then
		closeFile(_file)
	endif
return void

/* Clmses file, but only if allowed by g_freezeFile. */
function closeFile(_file)
	var closed = false
	if !g_freezeFile then
		close(_file)
		closed = true
	endif
return closed

/* An end buffer stores all file data past a given index and then writes that data 
to a new index when closed. This allows us to write data of an arbitrary size in the
middle of a file without worrying about overwriting what comes after it (if larger
than the original data) or leaving garbage data (if smaller than the original data). */
function openFileEndBuffer(_file, _idx)
	var unalloIdx = getEofIdx(_file)
	
	seek(_file, _idx)
return read(_file, unalloIdx - _idx)

/* Writes the file end buffer data back to the end of the file once other writes are done.  */
function closeFileEndBuffer(_file, _buffer, _idx)
	seek(_file, _idx)
	
	var lastData = len(_buffer) - 1
	if lastData > -1 then
		if lastData < len(_buffer) - 1 then
			_buffer = strSlice(_buffer, 0, lastData + 1)
		endif
		
		write(_file, _buffer)
		
		// Any data remaining in the file after the write point is garbage
		var i
		for i = _idx + lastData + 1 to len(_file) loop
			seek(_file, i)
			write(_file, chr(127))
		repeat
	/* If there's no buffer data, it means the buffer was taken from EOF, so erase
	everything from _idx on. */
	else
		var i
		for i = _idx to len(_file) loop
			seek(_file, i)
			write(_file, chr(127))
		repeat
	endif
return void

/* General-purpose file writer that automatically deals with the end buffer. */
function writeFileSegment(_file, _fileStr, _start, _end)
	var endBuf = openFileEndBuffer(_file, _end)
	seek(_file, _start)
	write(_file, _fileStr)
	closeFileEndBuffer(_file, endBuf, _start + len(_fileStr))
return void

/* Writes a map and its properties to file. */
function writeObjMap(_mapName)
return writeObjMap(-1, _mapName, true)

function writeObjMap(_file, _mapName)
return writeObjMap(_file, _mapName, false)

function writeObjMap(_file, _mapName, _needFileOpen)
	showLoadBox("Saving '" + _mapName + "' ...", true, false, false)
	_file = openFileIfNeeded(_file, _needFileOpen)
	
	var mapCells = encodeCellMap(_file, _mapName, versionStr())	
	var mapEnc = encodeObjMap(_file, _mapName, versionStr())
	var mapProps = encodeMapProperties(_file, _mapName, versionStr())
	var writeStr = mapCells.enc + mapEnc.enc + mapProps.enc
	writeFileSegment(_file, writeStr, mapCells.writeStart, mapProps.writeEnd)
	
	closeFileIfNeeded(_file, _needFileOpen)
	removeLoadSpr()
return void

/* Deletes a map and its properties from file. */
function deleteObjMap(_mapName)
return deleteObjMap(-1, _mapName, true)

function deleteObjMap(_file, _mapName)
return deleteObjMap(_file, _mapName, false)

function deleteObjMap(_file, _mapName, _needFileOpen)
	showLoadBox("Deleting '" + _mapName + "' ...", true, false, false)
	_file = openFileIfNeeded(_file, _needFileOpen)
	
	var sectionIdx = findFileSection(_file, "cellMap" + _mapName)
	
	// In the event that the map was saved without cells, jump to the map data
	if sectionIdx.start < 0 then
		sectionIdx = findFileSection(_file, "objectMap" + _mapName)
	endif
	
	if sectionIdx.start >= 0 then
		var propIdx = findFileSection(_file, "mapProperties" + _mapName)
		writeFileSegment(_file, "", sectionIdx.start, propIdx.end)
	endif
	
	closeFileIfNeeded(_file, _needFileOpen)
	removeLoadSpr()
return void

/* Writes object definitions to file. This includes both the calculated extents
of objects defined in code as well as merged objects defined in the editor. 
Object definitions are universal and can be used in any map. */
function writeObjDefs()
return writeObjDefs(-1, true)

function writeObjDefs(_file)
return writeObjDefs(_file, false)

function writeObjDefs(_file, _needFileOpen)
	showLoadBox("Updating object definitions ...", true, false, false)
	_file = openFileIfNeeded(_file, _needFileOpen)
	
	var defsEnc = encodeObjDefs(_file)
	writeFileSegment(_file, defsEnc.enc, defsEnc.writeStart, defsEnc.writeEnd)
	
	closeFileIfNeeded(_file, _needFileOpen)
	removeLoadSpr()
return void

/* Editor preferences are universal and are saved separately from any map. */
function writeEdPrefs()
return writeEdPrefs(-1, true)

function writeEdPrefs(_file)
return writeEdPrefs(_file, false)

function writeEdPrefs(_file, _needFileOpen)
	_file = openFileIfNeeded(_file, _needFileOpen)
	
	var sectionIdx = findFileSection(_file, "editorPrefs")
	if sectionIdx.start < 0 then
		sectionIdx.start = getEofIdx(_file)
		sectionIdx.end = sectionIdx.start
	endif
	
	var writeStr = sectionStr("editorPrefs" + versionStr())
	writeStr += blockStr("")
	writeStr += unitStr("")
	writeStr += fieldStr("g_cam.movSpd")
	writeStr += elemStr(g_cam.movSpd)
	writeStr += fieldStr("g_cam.rotSpd")
	writeStr += elemStr(g_cam.rotSpd)
	writeStr += fieldStr("g_cam.fov")
	writeStr += elemStr(g_cam.fov)
	writeStr += fieldStr("g_cam.drawObjLabels")
	writeStr += elemStr(g_cam.drawObjLabels)
	writeStr += fieldStr("g_cam.worldMovement")
	writeStr += elemStr(g_cam.worldMovement)
	writeStr += fieldStr("g_theme.name")
	writeStr += elemStr(g_theme.name)
	writeStr += fieldStr("g_cur.posSnapMode")
	writeStr += elemStr(g_cur.posSnapMode)
	writeStr += fieldStr("g_cur.posSnapAmount")
	writeStr += elemStr(g_cur.posSnapAmount)
	writeStr += fieldStr("g_cur.rotSnapMode")
	writeStr += elemStr(g_cur.rotSnapMode)
	writeStr += fieldStr("g_cur.rotSnapAmount")
	writeStr += elemStr(g_cur.rotSnapAmount)
	writeStr += fieldStr("g_cur.scaleSnapMode")
	writeStr += elemStr(g_cur.scaleSnapMode)
	writeStr += fieldStr("g_cur.scaleSnapAmount")
	writeStr += elemStr(g_cur.scaleSnapAmount)
	writeStr += fieldStr("g_visibleCellOutlines")
	writeStr += elemStr(g_visibleCellOutlines)
	writeFileSegment(_file, writeStr, sectionIdx.start, sectionIdx.end)
	
	closeFileIfNeeded(_file, _needFileOpen)
return void

/* There doesn't seem to be a way to delete characters, only 
overwrite them, so filesize cannot be reduced once expanded. 
As such, we just overwrite with Unicode delete chars to 
represent unallocated space. */
function clearFile(_file)
	var i
	for i = 0 to len(_file) loop
		seek(_file, i)
		write(_file, chr(127))
	repeat
return void

/* Deletes all of a given object in a map and returns a buffer with everything
that was deleted. */
function bufferAndDeleteMapObjInFile(_file, _mapName, _objName)
return bufferAndDeleteMapObjInFile(_file, _mapName, _objName, true)

function bufferAndDeleteMapObjInFile(_file, _mapName, _objName, _shouldBuffer)
	var inDelBlock = false
	var genObj = []
	
	var sectionIdx = findFileSection(_file, "objectMap" + _mapName)
	var chunk = getNextFileChunk(_file, sectionIdx.start) // Section
	
	var blockIdx
	var getLights
	var genResult
	var actObj
	var lightObj
	
	while inFileSection(chunk) loop
		chunk = getNextFileChunk(_file, chunk.nextIdx) // Block
		blockIdx = chunk.idx
		inDelBlock = false
		getLights = false
		while inFileBlock(chunk) loop
			chunk = getNextFileChunk(_file, chunk.nextIdx) // Unit
			
			genResult = getGenObjFromFile(_file, chunk)
			chunk = genResult.chunk
			if genResult.obj.name == _objName
					or (genResult.obj.brightness >= 0 and getLights) then
				inDelBlock = true
				if _shouldBuffer then
					// First entry in genObj[idx] is the object, subsequent entries are its lights
					if genResult.obj.brightness < 0 then
						actObj = createActiveFromGenericObj(genResult.obj)
						genObj = push(genObj, [ .obj = genResult.obj, .lights = [] ])
						getLights = true
					else
						lightObj = createLightObjFromGenericObj(genResult.obj)
						genObj[len(genObj) - 1].lights = push(genObj[len(genObj) - 1].lights, lightObj)
					endif
				endif
			endif
		repeat
		
		if inDelBlock then
			writeFileSegment(_file, "", blockIdx, chunk.nextIdx)
			break
		endif
	repeat
return genObj

/* Writes an encoded block of object data into the appropriate place in the 
map file. */
function writeIntoMapObjBlock(_file, _mapName, _enc, _blockObjName)
	var inObjBlock = false
	
	var sectionIdx = findFileSection(_file, "objectMap" + _mapName)
	var chunk = getNextFileChunk(_file, sectionIdx.start) // Section
	
	var blockIdx
	var genResult
	
	while inFileSection(chunk) loop
		chunk = getNextFileChunk(_file, chunk.nextIdx) // Block
		blockIdx = chunk.idx
		while inFileBlock(chunk) loop
			chunk = getNextFileChunk(_file, chunk.nextIdx) // Unit
			
			genResult = getGenObjFromFile(_file, chunk)
			chunk = genResult.chunk
			if genResult.obj.name == _blockObjName then
				inObjBlock = true
				break
			endif
		repeat
		
		// If a block for this object type already exists
		if inObjBlock then
			writeFileSegment(_file, _enc, blockIdx + 1, blockIdx + 1)
			break					
		endif
	repeat
	
	// If a block for this object type doesn't already exist
	if !inObjBlock then
		writeFileSegment(_file, chr(17) + _enc, sectionIdx.end, sectionIdx.end)
	endif
return void

/* Moves a merged object's first-level children out of the group, saves them
individually, and deletes the group for all maps.

We can't unmerge as a relinking option from map load, because at that point
we've already lost the data about what was in the merged object. As such, this
function needs to be selected from the object browser when the merged definition
is deleted even though it affects all map files and not just the loaded one. */
function unmergeObjInMaps(_name, _oldDef)
return unmergeObjInMaps(-1, _name, _oldDef, [], true)

function unmergeObjInMaps(_name, _oldDef, _excludeMaps)
return unmergeObjInMaps(-1, _name, _oldDef, _excludeMaps, true)

function unmergeObjInMaps(_file, _name, _oldDef, _excludeMaps, _needFileOpen)
	showLoadBox("Unmerging '" + _name + "' ...", true, false, false)
	
	_file = openFileIfNeeded(_file, _needFileOpen)	
	var mapNames = getMapNames(_file)
	
	// Buffer and delete file block containing deletion object
	var genObj
	var groupObj
	var lightObj
	var j
	var newObj
	var l
	var k
	var obj
	var enc
	
	var i
	for i = 0 to len(mapNames) loop
		if !contains(_excludeMaps, mapNames[i]) then
			showLoadBox("Unmerging '" + _name + "':" + chr(10) + "Reading merged object in '" + mapNames[i] + "'", true, false, false)
			genObj = bufferAndDeleteMapObjInFile(_file, mapNames[i], _name)
			
			// Build child objects from buffered generic object list.
			// Lights at an index in lightObj belong to the corresponding index in groupObj.
			showLoadBox("Unmerging '" + _name + "':" + chr(10) + "Building unmerged objects in '" + mapNames[i] + "'", true, false, false)
			groupObj = []
			lightObj = []
			for j = 0 to len(genObj) loop
				if genObj[j].obj.brightness == -1 then
					newObj = createActiveFromGenericObj(genObj[j].obj)
					// Top level parent doesn't have bank/idx info, so we need to search for it.
					newObj = activeFromObjDef(-1, -1, false, true, _oldDef)
					newObj.pos = genObj[j].obj.pos
					newObj.scale = genObj[j].obj.scale
					newObj.fwd = genObj[j].obj.fwd
					newObj.up = genObj[j].obj.up
					
					groupObj = push(groupObj, newObj)
					lightObj = push(lightObj, [])
				else if len(lightObj) then
					l = createLightObjFromGenericObj(genObj[j].obj)
					lightObj = push(lightObj[len(lightObj) - 1], l)
				endif endif
			repeat
			
			array objName[2]
			for j = 0 to len(groupObj) loop
				groupObj[j] = buildObjMapMergedLight(groupObj[j], lightObj[j]).obj
				
				// Split children from group
				for k = 0 to len(groupObj[j].children) loop
					obj = groupObj[j].children[k]
					obj = applyGrpTransform(obj, groupObj[j], true, true)
					
					// Arrange by object name
					var mapObjName
					getMapObjName(mapObjName, obj)
					var nameIdx = find(objName[0], mapObjName)
					if nameIdx < 0 then
						objName[0] = push(objName[0], mapObjName)
						objName[1] = push(objName[1], [])
						nameIdx = len(objName[0]) - 1
					endif
					objName[1][nameIdx] = push(objName[1][nameIdx], obj)
				repeat
			repeat
			
			// Write children to map file
			showLoadBox("Unmerging '" + _name + "':" + chr(10) + "Writing changes to '" + mapNames[i] + "'", true, false, false)
			for j = 0 to len(objName[0]) loop
				enc = ""
				for k = 0 to len(objName[1][j]) loop
					enc += encodeObjMapUnit(objName[1][j][k])
					enc += encodeObjLights(objName[1][j][k], true)
				repeat
				writeIntoMapObjBlock(_file, mapNames[i], enc, objName[0][j])
			repeat
		endif
	repeat
	
	closeFileIfNeeded(_file, _needFileOpen)
	removeLoadSpr()
return void

/* _template is an activeObj or a mapObj that replaces all instances of the
_bank/_idx object in all maps. The orginal object instances' transforms
are used. */
function replaceObjInMaps(_name, _template, _changed, _unmerge)
return replaceObjInMaps(-1, _name, _template, _changed, _unmerge, [], true)

function replaceObjInMaps(_name, _template, _changed, _unmerge, _excludeMaps)
return replaceObjInMaps(-1, _name, _template, _changed, _unmerge, _excludeMaps, true)

function replaceObjInMaps(_file, _name, _template, _changed, _unmerge, _excludeMaps, _needFileOpen)
	showLoadBox("Replacing '" + _name + "' ...", true, false, false)
	
	_file = openFileIfNeeded(_file, _needFileOpen)
	_changed = push(_changed, [ .name = _name ])
	
	var mapNames = getMapNames(_file)
	var i
	var j
	var genObj
	var unmerged
	var k
	var enc
	
	i = 0
	while i < len(mapNames) loop // Remove exclusions instead of using if check in next loop to save stack space
		if contains(_excludeMaps, mapNames[i]) then
			mapNames = remove(mapNames, i)
			i -= 1
		endif
		
		i += 1
	repeat
	
	for i = 0 to len(mapNames) loop
		for j = 0 to len(_changed) loop
			showLoadBox("Replacing '" + _name + "':" + chr(10) + "Reading object '"
				+ _changed[j].name + "' in '" + mapNames[i] + "'", true, false, false)
				
			genObj = bufferAndDeleteMapObjInFile(_file, mapNames[i], _changed[j].name)
			
			// Don't nest ifs here to save stack space
			if len(genObj) and _unmerge and len(_template.children) and _name == _changed[j].name then
				showLoadBox("Replacing '" + _name + "':" + chr(10) + "Modifying object '"
					+ _changed[j].name + "' in '" + mapNames[i] + "'", true, false, false)
				unmerged = unmergeObj(_template)
				
				for k = 0 to len(unmerged) loop
					unmerged[k] = applyGrpPos(unmerged[k], _template, false)
					
					encodeReplacementObject(enc, _name, unmerged[k], genObj, true, true)
					writeIntoMapObjBlock(_file, mapNames[i], enc, _changed[j].name)
				repeat
			else if len(genObj) then
				encodeReplacementObject(enc, _name, _template, genObj, true, false)
				writeIntoMapObjBlock(_file, mapNames[i], enc, _changed[j].name)
			endif endif
		repeat
	repeat
	
	closeFileIfNeeded(_file, _needFileOpen)	
	removeLoadSpr()
return void

/* When directly modifying object data in the save file, this returns an 
encoded replacement write string for any object entry that references the 
modified object. */
function encodeReplacementObject(_name, _genObj)
return encodeReplacementObject(-1, _name, -1, _genObj, false, false)

function encodeReplacementObject(_name, _template, _genObj)
return encodeReplacementObject(-1, _name, _template, _genObj, true, false)

function encodeReplacementObject(ref _in, _name, _template, _genObj, _useTemplate, _useTemplateTransform)
	_in = ""
	var k
	var bankIdx
	var newObj
	var buildResult
	
	for k = 0 to len(_genObj) loop
		bankIdx = getObjDefBankIdx(_genObj[k].obj.name)
		
		// Copy any of the old light data that's still relevant
		if _genObj[k].obj.name != _name and bankIdx.bank >= 0 then
			newObj = activeFromObjDef(bankIdx.bank, bankIdx.idx)
			
			/* We can assume this is a merged object, but if the system ever changes
			to allow deleting core object defs from the object menu, we'll need to
			check child/light array length. */
			buildResult = buildObjMapMergedLight(newObj, _genObj[k].lights)
			cloneObjLightDataRecursive(buildResult.obj, newObj, false)
		else if _useTemplate then
			newObj = _template
		endif endif
		
		if _genObj[k].obj.name != _name and bankIdx.bank >= 0 then
			newObj.pos = _genObj[k].obj.pos
			newObj.fwd = _genObj[k].obj.fwd
			newObj.up = _genObj[k].obj.up
			newObj.scale = _genObj[k].obj.scale
		else if _useTemplate then
			if !_useTemplateTransform then
				newObj.pos = _genObj[k].obj.pos
				newObj.fwd = _genObj[k].obj.fwd
				newObj.up = _genObj[k].obj.up
				newObj.scale = _genObj[k].obj.scale
				newObj.bankIdx = _template.bankIdx
			else
				newObj = applyGrpTransform(newObj, _genObj[k].obj)
				newObj.bankIdx = _template.bankIdx
			endif
		endif endif
		
		// Don't nest ifs here to save stack space
		if _useTemplate then
			cloneObjLightDataRecursive(_template, newObj, false)
			_in += encodeObjMapUnit(newObj)
			_in += encodeObjLights(newObj, true)
		endif
		
		if !_useTemplate and _genObj[k].obj.name != _name and bankIdx.bank >= 0 then
			_in += encodeObjMapUnit(newObj)
			_in += encodeObjLights(newObj, true)
		endif
	repeat
return _in

/* Completely removes an object from all maps without replacing it. */
function removeObjInMaps(_name, _changed)
return removeObjInMaps(-1, _name, _changed, [], true)

function removeObjInMaps(_name, _changed, _excludeMaps)
return removeObjInMaps(-1, _name, _changed, _excludeMaps, true)

function removeObjInMaps(_file, _name, _changed, _excludeMaps, _needFileOpen)
	showLoadBox("Deleting '" + _name + "' ...", true, false, false)
	
	_file = openFileIfNeeded(_file, _needFileOpen)
	_changed = push(_changed, [ .name = _name ])
	
	var mapNames = getMapNames(_file)
	var i
	var j
	var enc
	var geObj
	
	for i = 0 to len(mapNames) loop
		if !contains(_excludeMaps, mapNames[i]) then
			for j = 0 to len(_changed) loop
				showLoadBox("Deleting '" + _name + "':" + chr(10) + "Reading object '"
					+ _changed[j].name + "' in '" + mapNames[i] + "'", true, false, false)
					
				enc = ""
				genObj = bufferAndDeleteMapObjInFile(_file, mapNames[i], _changed[j].name)
				
				if len(genObj) then
					showLoadBox("Deleting '" + _name + "':" + chr(10) + "Modifying object '"
						+ _changed[j].name + "' in '" + mapNames[i] + "'", true, false, false)
					
					var addEnc
					encodeReplacementObject(addEnc, _name, -1, genObj, false, false)
					enc += addEnc
					writeIntoMapObjBlock(_file, mapNames[i], enc, _changed[j].name)
				endif
			repeat
		endif
	repeat
	
	closeFileIfNeeded(_file, _needFileOpen)	
	removeLoadSpr()
return void

	// ----------------------------------------------------------------
	// FILE READING

// Template for file reads
/*
function readFileTemplate(_file)
	var sectionIdx = findFileSection(_file, "section")
	var chunk = getNextFileChunk(_file, sectionIdx.start) // Section
	while inFileSection(chunk) loop
		chunk = getNextFileChunk(_file, chunk.nextIdx) // Block
		while inFileBlock(chunk) loop
			chunk = getNextFileChunk(_file, chunk.nextIdx) // Unit
			while inFileUnit(chunk) loop
				chunk = getNextFileChunk(_file, chunk.nextIdx) // Field
				while inFileField(chunk) loop
					chunk = getNextFileChunk(_file, chunk.nextIdx) // Elem
				repeat
			repeat
		repeat
	repeat
return void
*/

/* It is best practice to trigger a map load from as shallow a stack as possible
to avoid hitting FUZE's recursion and/or memory limits. */
function triggerMapLoad(_allowNew)
return triggerMapLoad(-1, true, _allowNew)

function triggerMapLoad(_mapFile, _allowNew)
return triggerMapLoad(_mapFile, false, _allowNew)

function triggerMapLoad(_mapFile, _needFileOpen, _allowNew)
	var continue = true
	var queuedMap = ""
	
	while continue loop
		update()
		var shouldLoad = true
		
		var confirmPrompt = [
			.idx = 3
		]
		if g_dirtyMap then
			confirmPrompt = showUnsavedPrompt()
		endif
		
		if confirmPrompt.idx > 0 then
			if confirmPrompt.idx == 1 then
				shouldLoad = showSave()
			else if confirmPrompt.idx == 2 then
				shouldLoad = showSaveAs()
			endif endif
			
			if shouldLoad then
				_mapFile = openFileIfNeeded(_mapFile, _needFileOpen)
				var mapNames = getMapNames(_mapFile)
				mapNames = insert(mapNames, ifElse(_allowNew, "Create new map", "Cancel"), 0)
				var mapPrompt = promptList(
					mapNames, 
					[
						"Load saved map:"
					]
				)
				
				if mapPrompt.idx > 0 then
					queuedMap = mapPrompt.text
					continue = false
				else
					continue = false
				endif
				closeFileIfNeeded(_mapFile, _needFileOpen)
			endif
		else
			continue = false
		endif
	repeat
	
	g_needLoad = false
return queuedMap

/* Light data are saved separately in the file from object data. This function
takes the object data and the light data and assembles them into a complete
object. */
// CORE LOADER
function buildObjMapMergedLight(_obj, _lightList)
	var i
	for i = 0 to len(_obj.lights) loop
		if len(_lightList) then
			_obj.lights[i] = _lightList[0]
			_lightList = remove(_lightList, 0)
		endif
	repeat
	
	var buildResult
	
	for i = 0 to len(_obj.children) loop
		if len(_lightList) then
			buildResult = buildObjMapMergedLight(_obj.children[i], _lightList)
			_obj.children[i] = buildResult.obj
			_lightList = buildResult.lights
		endif
	repeat
	
	var result = [
		.obj = _obj,
		.lights = _lightList
	]
return result

/* Constucts saved cell layout. */
// CORE LOADER
function readCellMap(_file, _mapName)
	var sectionIdx = findFileSection(_file, "cellMap" + _mapName)
	
	var field
	var chunk = getNextFileChunk(_file, sectionIdx.start) // Section
	
	while inFileSection(chunk) loop
		chunk = getNextFileChunk(_file, chunk.nextIdx) // Block
		while inFileBlock(chunk) loop
			chunk = getNextFileChunk(_file, chunk.nextIdx) // Unit
			array cellDat[2]
			
			while inFileUnit(chunk) loop
				chunk = getNextFileChunk(_file, chunk.nextIdx) // Field
				field = chunk.dat
				
				array elem[0]
				while inFileField(chunk) loop
					chunk = getNextFileChunk(_file, chunk.nextIdx) // Elem
					elem = push(elem, chunk.dat)
				repeat
				
				cellDat = decodeCellMap(field, elem, cellDat)
			repeat
			
			addCell(cellDat[0], cellDat[1])
		repeat
	repeat
return void

/* This stub function allows you to display a loading message based on the map
element that is currently loading. */
// CORE LOADER
function loadMapMsg(_mapName, _objName, _objPos)
	var loadStr = "Loading '" + _mapName + "':" + chr(10)
	if len(_objName) then
		loadStr +=  "Placing '" + _objName + "'" + chr(10) + vec3ToStr(_objPos, 2)
	else
		loadStr += "Creating cells"
	endif
	
	showLoadBox(loadStr, true, false, false)
return void

/* Restores a map from file. */
// CORE LOADER
function readObjMap(_file, _mapName)
	/* Objects are queued before placing them because lights are encoded as
	separate objects. We need to check subsequent objects to see if they're
	lights belonging to the current object before placing the current object. */
	function readObjMap_addQueued(_queued, _queuedLight, _mapName)
		/* If no lights have been loaded from file, load any lights
		from the obj def instead. */
		if len(_queuedLight[0].lights) == 0 then
			_queued[0].obj.lights = 
				g_obj[decodeBank(-1, _queued[0].obj.bankIdx)][decodeIdx(-1, _queued[0].obj.bankIdx)].lights
		endif
		
		var isGrp = false
		
		if (len(_queued[0].obj.children) or len(_queued[0].obj.lights)) and _queued[0].isMerged then
			isGrp = true
		endif
		
		_queued[0].obj = buildObjMapMergedLight(_queued[0].obj, _queuedLight[0].lights).obj
		placeObjFromTemplate(_queued[0].obj, isGrp)
		var mapObjName
		getMapObjName(mapObjName, _queued[0].obj)
		loadMapMsg(_mapName, mapObjName, _queued[0].obj.pos)
		
		_queued = remove(_queued, 0)
		_queuedLight = remove(_queuedLight, 0)
		
		var result = [
			.queuedObj = _queued,
			.queuedLight = _queuedLight
		]
	return result
	
	var loadTimer = time() // Debug timer
	var objTimer = 0
	var placementTimer = 0
	
	loadMapMsg(_mapName, "", 0)
	readCellMap(_file, _mapName)
	
	var redefHappened = false
	
	array queuedObj[0]
	array queuedLight[0]
	var fileLen = len(_file)
	var sectionIdx = findFileSection(_file, "objectMap" + _mapName)
	var currentDef = [
		.name = chr(127),
		.bank = -1,
		.idx = -1
	]
	
	var defResult
	var isMerged
	var isRedef
	var isDelDef
	var genResult
	var genObj
	var newObj
	var idxOffsetFromSection
	var nextIdxOffsetFromSection
	var redefResult = [
		.bank = -1,
		.idx = -1,
		.name = "",
		.isMerged = true
	]
	var addResult
	var lastIdx
		
	var chunk = getNextFileChunk(_file, sectionIdx.start) // Section
	while inFileSection(chunk) loop
		chunk = getNextFileChunk(_file, chunk.nextIdx) // Block
		currentDef.name = chunk.dat
		
		defResult = getObjDefBankIdx(currentDef.name)
		if defResult.bank >= 0 then
			currentDef.bank = defResult.bank
			currentDef.idx = defResult.idx
		endif
		
		isMerged = true
		isRedef = false
		isDelDef = false
		var gridBitList
		var mapObjName
		
		while inFileBlock(chunk) loop
			chunk = getNextFileChunk(_file, chunk.nextIdx) // Unit
			
			genResult = getGenObjFromFile(_file, chunk)
			chunk = genResult.chunk
			
			if !isDelDef then
				genObj = genResult.obj
				
				// If there's not a brightness value, this isn't a light object
				if genObj.brightness == -1 then
					
					newObj = createActiveFromGenericObj(genObj)
					
					if genObj.name != currentDef.name then
						defResult = getObjDefBankIdx(genObj.name)
						
						if defResult.bank >= 0 then
							currentDef.name = genObj.name
							currentDef.bank = defResult.bank
							currentDef.idx = defResult.idx
						endif
						
						if defResult.bank < 0 and g_editor then
							idxOffsetFromSection = chunk.idx - sectionIdx.start
							nextIdxOffsetFromSection = chunk.nextIdx - sectionIdx.start
							
							if !isRedef then
								edFunction(redefResult, "promptObjDefRelink", [ genObj.name, 1 ])
								
								/* The redef changed the file length, so refind our index 
								in the map section. */
								sectionIdx = findFileSection(_file, "objectMap" + _mapName)
								chunk.idx = sectionIdx.start + idxOffsetFromSection
								chunk.nextIdx = sectionIdx.start + nextIdxOffsetFromSection
							endif
							
							if redefResult.bank >= 0 then
								newObj = activeFromObjDef(redefResult.bank, redefResult.idx)
								
								getMapObjName(mapObjName, newObj)
								currentDef.name = mapObjName
								currentDef.bank = decodeBank(-1, newObj.bankIdx)
								currentDef.idx = decodeIdx(-1, newObj.bankIdx)
								isMerged = redefResult.isMerged
								isRedef = true
							else
								isDelDef = true
							endif
							
							redefHappened = true
						else if defResult.bank < 0 and !g_editor then // g_editor != 1: If an object def can't be found and we're in the Core Loader, ignore the def
							isDelDef = true
						endif endif
					endif
					
					if !isDelDef then
						newObj = activeFromObjDef(currentDef.bank, currentDef.idx)
						newObj.pos = genObj.pos
						newObj.scale = genObj.scale
						newObj.fwd = genObj.fwd
						newObj.up = genObj.up
						newObj.col = genObj.col
						newObj.mat = genObj.mat
						
						if decodeBank(-1, newObj.bankIdx) >= 0 and decodeIdx(-1, newObj.bankIdx) >= 0 then
							if len(queuedObj) then
								placementTimer = time()
								addResult = readObjMap_addQueued(queuedObj, queuedLight, _mapName)
								objTimer += time() - placementTimer
								queuedObj = addResult.queuedObj
								queuedLight = addResult.queuedLight
							endif
							
							queuedObj = push(queuedObj, [ .obj = newObj, .isMerged = isMerged ])
							queuedLight = push(queuedLight, [ .lights = [] ])
						endif
					endif
				else // If a light object
					var l = createLightObjFromGenericObj(genObj)
					
					if len(queuedObj) then
						lastIdx = len(queuedObj) - 1
						queuedLight[lastIdx].lights = push(queuedLight[lastidx].lights, l)
					endif
				endif
			endif
		repeat
		
		if len(queuedObj) then
			placementTimer = time()
			addResult = readObjMap_addQueued(queuedObj, queuedLight, _mapName)
			objTimer += time() - placementTimer
			queuedObj = addResult.queuedObj
			queuedLight = addResult.queuedLight
		endif
	repeat
	
	var props = readMapProperties(_file, _mapName)
	setEnvironment(props.bg.idx, props.bg.col)
	
	// Uncomment for load time stats
	/*
	debugPrint(0, ["Map read time: " + str(time() - loadTimer - objTimer),
		"Object placement time: " + str(objTimer),
		"Total load time: " + str(time() - loadTimer)])
	*/
	result = [
		.redefHappened = redefHappened,
		.props = props
	]
return result

/* Executes a queued map load. */
function resolveMapLoadAction()
	var queuedMap = triggerMapLoad(false)
	
	if queuedMap != "" then
		update()
		showLoadBox("Clearing current map ...", true, false, false)
		clearMap()
		initEdForClearedMap()
		var mapFile = openFile()
		
		g_currentMapName = queuedMap
		var mapResult = readObjMap(mapFile, g_currentMapName)
		initEdForLoadedMap(mapResult)
		
		var menuIdx = findMenuEntry(g_menu, "Background")
		g_menu[menuIdx].submenu = addBackgroundsToMenu(g_bg.idx)
		
		closeFile(mapFile)
	endif
return void

/* Sets editor elements to reflect a newly loaded map. */
function initEdForLoadedMap(_mapLoadResult)
	g_lightIconLoader.show = []
	g_lightIconLoader.hide = []
	removeLoadSpr()
	
	if _mapLoadResult.redefHappened then
		g_dirtyMap = true
	else
		g_dirtyMap = false
	endif
	
	g_bg.idx = _mapLoadResult.props.bg.idx
	g_bg.col = _mapLoadResult.props.bg.col
	g_cam.pos = _mapLoadResult.props.cam.pos
	g_cam.fwd = _mapLoadResult.props.cam.fwd
	g_cam.up = _mapLoadResult.props.cam.up
	g_cur.pos = _mapLoadResult.props.cur.pos
	
	g_cam.dir = g_cam.pos + g_cam.fwd
	g_cam.cell = getCellIdxFromPos(g_cam.pos)
	g_cam.cellPos = getCellPosFromPos(g_cam.pos)
	g_cur.cell = getCellIdxFromPos(g_cur.pos)
	g_cur.cellPos = getCellPosFromPos(g_cur.pos)
	updateViewport()
	pruneLightIcons()
	
	updateCamCollisions(true)
	updateCurContexts(true)
	initCellOutlines()
return void

/* Map properties are saved separately from map objects. */
// CORE LOADER
function readMapProperties(_file, _mapName)
	var propStruct = [
		.bg = [
			.col = {0.2, 0.2, 0.2},
			.idx = 6
		],
		.cam = [
			.pos = {0, 0, 0},
			.fwd = {0, 0, 1},
			.up = {0, 1, 0}
		],
		.cur = [ .pos = {0, 0, 0} ]
	]
	
	var sectionIdx = findFileSection(_file, "mapProperties" + _mapName)
	if sectionIdx.start >= 0 then
		var chunk = getNextFileChunk(_file, sectionIdx.start) // Section
		var field
		
		while inFileSection(chunk) loop
			chunk = getNextFileChunk(_file, chunk.nextIdx) // Block
			while inFileBlock(chunk) loop
				chunk = getNextFileChunk(_file, chunk.nextIdx) // Unit
				while inFileUnit(chunk) loop
					chunk = getNextFileChunk(_file, chunk.nextIdx) // Field
					field = chunk.dat
					
					array elem[0]
					while inFileField(chunk) loop
						chunk = getNextFileChunk(_file, chunk.nextIdx) // Elem
						elem = push(elem, chunk.dat)
					repeat
					
					propStruct = decodeMapProperties(field, elem, propStruct)
				repeat
			repeat
		repeat
	endif
return propStruct

/* Editor preferences apply regardless of what map is loaded. */
function readEdPrefs(_file)
	var sectionIdx = findFileSection(_file, "editorPrefs")
	var chunk = getNextFileChunk(_file, sectionIdx.start) // Section
	var field
	
	while inFileSection(chunk) loop
		chunk = getNextFileChunk(_file, chunk.nextIdx) // Block
		while inFileBlock(chunk) loop
			chunk = getNextFileChunk(_file, chunk.nextIdx) // Unit
			while inFileUnit(chunk) loop
				chunk = getNextFileChunk(_file, chunk.nextIdx) // Field
				field = chunk.dat
				
				array elem[0]
				while inFileField(chunk) loop
					chunk = getNextFileChunk(_file, chunk.nextIdx) // Elem
					elem = push(elem, chunk.dat)
				repeat
				
				loop if field == "g_cam.movSpd" then
					g_cam.movSpd = decodeElem(elem)
					break endif
				if field == "g_cam.rotSpd" then
					g_cam.rotSpd = decodeElem(elem)
					break endif
				if field == "g_cam.fov" then
					g_cam.fov = decodeElem(elem)
					setFov(g_cam.fov)
					break endif
				if field == "g_cam.drawObjLabels" then
					g_cam.drawObjLabels = decodeElem(elem)
					break endif
				if field == "g_cam.worldMovement" then
					g_cam.worldMovement = decodeElem(elem)
					break endif
				if field == "g_theme.name" then
					setTheme(decodeElem(elem), true)
					break endif
				if field == "g_cur.posSnapMode" then
					g_cur.posSnapMode = decodeElem(elem)
					break endif
				if field == "g_cur.posSnapAmount" then
					g_cur.posSnapAmount = decodeElem(elem)
					break endif
				if field == "g_cur.rotSnapMode" then
					g_cur.rotSnapMode = decodeElem(elem)
					break endif
				if field == "g_cur.rotSnapAmount" then
					g_cur.rotSnapAmount = decodeElem(elem)
					break endif
				if field == "g_cur.scaleSnapMode" then
					g_cur.scaleSnapMode = decodeElem(elem)
					break endif
				if field == "g_cur.scaleSnapAmount" then
					g_cur.scaleSnapAmount = decodeElem(elem)
					break endif
				if field == "g_visibleCellOutlines" then
					g_visibleCellOutlines = decodeElem(elem)
					break
				endif break repeat
			repeat
		repeat
	repeat
return void

/* Returns the end-of-file index or the index of the first unallocated space. */
function getEofIdx(_file)
	var eof = findFileChar(_file, chr(127))
	if eof < 0 then
		eof = len(_file)
	endif
return eof

/* A section is the highest-level file division, distinguishing between, for
example, map objects and map properties. */
// CORE LOADER
function findFileSection(_file, _section)
return findFileSection(_file, _section, 0, -1)

function findFileSection(_file, _section, _startAt, _endAt)
return findFileChunk(_file, chr(31) + _section, [ chr(31) ], _startAt, _endAt)

/* A chunk is a file section that exists between any two delimiters, which are
typically non-printing unicode characters. _endAt is non-inclusive. */
// CORE LOADER
function findFileChunk(_file, _searchStartStr, _searchEndStr, _startAt, _endAt)
	seek(_file, _startAt)
	fileStr = read(_file, len(_file) - _startAt)
	
	var startIdx = strFind(fileStr, _searchStartStr)
	var endIdx = -1
	
	if startIdx < _endAt or (_endAt < 0) then
		var i
		var newEnd
		
		for i = 0 to len(_searchEndStr) loop
			newEnd = strFind(fileStr[startIdx + 1:], _searchEndStr[i])
			
			if endIdx == -1 or newEnd < endIdx then
				endIdx = newEnd
			endif
		repeat
		
		if startIdx != -1 and endIdx == -1 then
			startIdx += _startAt
			endIdx = strFind(fileStr, chr(127)) // Find blank space in file.
			if endIdx == -1 then
				endIdx = len(fileStr)
			endif
		else if startIdx != -1 and (_endAt < 0 or endIdx < _endAt) then
			startIdx += _startAt
			endIdx += startIdx + 1 // Compensate for the search's string truncation.
		else
			endIdx = -1 // If there's no start, any end is invalid.
		endif endif
	else
		startIdx = -1
	endif
	
	var result = [
		.start = startIdx,
		.end = endIdx
	]
return result

/* Object definitions are saved to file under their names. Their bank and index
numbers are dynamically generated on program load and are not saved, so they must
be found in the file by name. */
function findFileObjDef(_file, _defName)
	var sectionIdx = findFileSection(_file, "objectDefs")
return findFileObjDef(_file, _defName, _sectionIdx.start, sectionIdx.end)

function findFileObjDef(_file, _defName, _defSectionStart, _defSectionEnd)
return findFileChunk(_file, 
	chr(17) + chr(30) + chr(29) + ".name" + chr(28) + "s" + chr(28) + _defName, 
	[ chr(17), chr(31) ], _defSectionStart, _defSectionEnd)

/* Gets the index of a character within the file. Bails out if unallocated
space is encountered. */
// CORE LOADER
function findFileChar(_file, _char)
return findFileChar(_file, _char, 0)

function findFileChar(_file, _char, _startAt)
	seek(_file, _startAt)
	
	var idx = _startAt
	var charBuf = ""
	while charBuf != _char and charBuf != chr(127) loop
		seek(_file, idx)
		
		charBuf = read(_file, 1)
		if charBuf != _char then
			idx += 1
		endif
		
		if idx > len(_file) then
			idx = -1
			break
		endif
	repeat
return idx

/* Returns an array of the map names in the file. */
// CORE LOADER
function getMapNames(_file)
	array names[0]
	var fileResult = [
		.start = -1,
		.end = 0
	]
	
	var eof = false
	var nameEndIdx
	var versionIdx
	var nameStartIdx
	var nextName
	
	while !eof loop
		fileResult = findFileSection(_file, "objectMap", fileResult.start + 1, -1)
		if fileResult.start >= 0 then
			// Parse to version indicator if it exists, otherwise use section end.
			nameEndIdx = findFileChar(_file, chr(17), fileResult.start)
			versionIdx = findFileChar(_file, chr(18), fileResult.start)
			
			if versionIdx < nameEndIdx and versionIdx >= 0 then
				nameEndIdx = versionIdx
			endif
			
			if nameEndIdx >= 0 then
				nameStartIdx = fileResult.start + len("objectMap") + 1
				seek(_file, nameStartIdx)
				nextName = read(_file, nameEndIdx - nameStartIdx)
				names = push(names, nextName)
			endif
		else
			eof = true
		endif
	repeat
return names

/* Return the next file chunk as delimited by certain non-printing unicode characters 
that signify data purpose. */
// CORE LOADER
function getNextFileChunk(_file, _startIdx)
	seek(_file, _startIdx)
	
	var marker = read(_file, 1)
	var nextMarker = ""
	var nextIdx = _startIdx
	var dat = ""
	var char = ""
	var fileLen = len(_file)
	
	while nextIdx < fileLen loop
		nextIdx += 1
		seek(_file, nextIdx)
		
		char = read(_file, 1)
		if char == chr(31)
				or char == chr(30)
				or char == chr(29)
				or char == chr(28)
				or char == chr(17)
				or char == chr(127) then
			nextMarker = char
			break
		endif
		
		dat += char
	repeat
	
	var result = [
		.marker = marker,
		.idx = _startIdx,
		.nextMarker = nextMarker,
		.nextIdx = nextIdx,
		.dat = dat,
		.fileLen = len(_file)
	]
return result

/* Like getNextFileChunk(), but in the other direction. */
function getPrevFileChunk(_file, _startIdx)
	seek(_file, _startIdx)
	
	var marker = read(_file, 1)
	var prevMarker = ""
	var prevIdx = _startIdx
	var dat = ""
	var char = ""
	var fileLen = len(_file)
	
	while prevIdx > 0 loop
		prevIdx -= 1
		seek(_file, PrevIdx)
		
		char = read(_file, 1)
		if char == chr(31)
				or char == chr(30)
				or char == chr(29)
				or char == chr(28)
				or char == chr(17) then
			prevMarker = char
			break
		endif
		
		dat = char + dat
	repeat
	
	var result = [
		.marker = marker,
		.idx = _startIdx,
		.prevMarker = prevMarker,
		.prevIdx = prevIdx,
		.dat = dat,
		.fileLen = len(_file)
	]
return result

/* The light definition bank cannot be modified by the user. These light
objects are fully defined in code and do not load from file. */
// CORE LOADER
function loadLightDefs()
	array defs[5]
	objDef newDef
	newDef.file = ""
	newDef.obj = -1
	newDef.ext.lo = {-0.25, -0.25, -0.25}
	newDef.ext.hi = {0.25, 0.25, 0.25}
	newDef.scale = {1, 1, 1}
	newDef.children = []
	lightObj l
	l = initLightObj()
	
	l.name = "point"
	newDef.name = "Point Light"
	newDef.lights = [ l ]
	defs[0] = newDef
	
	l.name = "pointshadow"
	newDef.name = "Point Shadow Light"
	newDef.lights = [ l ]
	defs[1] = newDef
	
	l.name = "spot"
	newDef.name = "Spot Light"
	newDef.lights = [ l ]
	defs[2] = newDef
	
	l.name = "world"
	newDef.name = "World Light"
	newDef.lights = [ l ]
	defs[3] = newDef
	
	l.name = "worldshadow"
	newDef.name = "World Shadow Light"
	newDef.lights = [ l ]
	defs[4] = newDef
return defs

/* The light definition bank cannot be modified by the user. These light
objects are fully defined in code and do not load from file. */
// CORE LOADER
function loadPrimitiveDefs()
	array defs[5]
	var objExt
	objDef newDef
	newDef.file = ""
	newDef.obj = -1
	newDef.scale = {1, 1, 1}
	newDef.children = []
	newDef.lights = []
	
	loadDefMsg("Primitives")
	
	newDef.name = "Cube"
	objExt = placeObject(cube, {0, 0, 0}, newDef.scale)
	newDef.ext = getObjExtent(objExt, {0, 0, 0}, newDef.scale, {0, 0, 1}, {0, 1, 0}, 0.001)
	removeObject(objExt)
	defs[0] = newDef
	
	newDef.name = "Cylinder"
	objExt = placeObject(cylinder, {0, 0, 0}, newDef.scale)
	newDef.ext = getObjExtent(objExt, {0, 0, 0}, newDef.scale, {0, 0, 1}, {0, 1, 0}, 0.001)
	removeObject(objExt)
	defs[1] = newDef
	
	newDef.name = "Hemisphere"
	objExt = placeObject(hemisphere, {0, 0, 0}, newDef.scale)
	newDef.ext = getObjExtent(objExt, {0, 0, 0}, newDef.scale, {0, 0, 1}, {0, 1, 0}, 0.001)
	removeObject(objExt)
	defs[2] = newDef
	
	newDef.name = "Sphere"
	objExt = placeObject(sphere, {0, 0, 0}, newDef.scale)
	newDef.ext = getObjExtent(objExt, {0, 0, 0}, newDef.scale, {0, 0, 1}, {0, 1, 0}, 0.001)
	removeObject(objExt)
	defs[3] = newDef
	
	newDef.name = "Wedge"
	objExt = placeObject(wedge, {0, 0, 0}, newDef.scale)
	newDef.ext = getObjExtent(objExt, {0, 0, 0}, newDef.scale, {0, 0, 1}, {0, 1, 0}, 0.001)
	removeObject(objExt)
	defs[4] = newDef
	
	/* FUZE cones and pyramids have incorrect bounding boxes, which causes glitchy collisions.
	This is not something that can be fixed on my end, so they're disabled. */
	/*
	newDef.name = "Cone"
	objExt = placeObject(cone, {0, 0, 0}, newDef.scale)
	newDef.ext = getObjExtent(objExt, {0, 0, 0}, newDef.scale, {0, 0, 1}, {0, 1, 0}, 0.001)
	removeObject(objExt)
	defs = push(defs, newDef)
	
	newDef.name = "Pyramid"
	objExt = placeObject(pyramid, {0, 0, 0}, newDef.scale)
	newDef.ext = getObjExtent(objExt, {0, 0, 0}, newDef.scale, {0, 0, 1}, {0, 1, 0}, 0.001)
	removeObject(objExt)
	defs = push(defs, newDef)
	*/
return defs

/* Loads unmerged object definitions from the banks created in getModels(). */
// CORE LOADER
function loadObjDefs(_file)
	var models = getModels()
	array obj[len(models)]
	array bankName[len(models)]
	var modelCount = 0 // Prevent user from loading more than FUZE's limit of 124 models
	
	var i
	var j
	
	for i = 0 to len(models) loop
		// Apply bank name from first entry or auto-generate
		if len(models[i][0]) != 2 then
			bankName[i] = models[i][0][0]
			models[i] = remove(models[i], 0)
		else
			bankName[i] = "Bank " + i
		endif
		
		objDef idx[len(models[i])]
		for j = 0 to len(idx) loop
			modelCount += 1
			
			if modelCount >= 125 then
				clear(black)
				ink(white)
				textSize(gheight() / 25)
				printAt(1, 1, 
"ERROR: FUZE has an internal limit of 124 3D models loaded, but you have more than 
124 object definitions.

Please exit Celqi, ensure that the getModels() function contains no more than 124 
object definitions, and restart Celqi.

If you have not already done so and are not using the definitions in your own maps, 
you may free up space by deleting the 'Castle Demo' bank from getModels(). You may 
also want to remove the 'Castle Demo' map using 'File > Manage maps ...' from within 
Celqi.

Press (+)/F5 to close Celqi."
				)
				update()
				
				// Force user to exit
				loop
				repeat
			endif
			
			idx[j] = loadObjDef(_file, models[i][j])
		repeat
		obj[i] = idx
	repeat
	
	obj[g_lightBank - 1] = loadPrimitiveDefs()
	obj[g_lightBank] = loadLightDefs()
	
	var result = [
		.obj = obj,
		.bankName = bankName
	]
return result

/* This stub function allows you to display a loading message based on the 
object defintion that is currently loading. */
// CORE LOADER
function loadDefMsg(_defName)
	showLoadBox("Loading object '" + _defName + "'", true, false, false)
return void

/* Loads an individual unmerged object definition, which includes calculating 
the extent. */
// CORE LOADER
function loadObjDef(_file, _modelDat)
	objDef def
	
	if len(_modelDat[0]) then
		def.name = _modelDat[0]
	else
		def.name = getDefaultDefName(_modelDat[1])
	endif
	
	loadDefMsg(def.name)
		
	def.file = _modelDat[1]
	def.obj = loadModel(_modelDat[1])
	var objExt = placeObject(def.obj, {0, 0, 0}, {1, 1, 1})
	def.ext = getObjExtent(objExt, {0, 0, 0}, {1, 1, 1}, {0, 0, 1}, {0, 1, 0}, 0.001)
	removeObject(objExt)
return def

/* Loads the merged object definitions, which are defined from within the program
rather than in getModels(). */
// CORE LOADER
function loadMergedObjDefs(_file)
	array mergedDefs[0]
	var sectionIdx = findFileSection(_file, "objectDefs")	
	var chunk = getNextFileChunk(_file, sectionIdx.start) // Section
	var isMerged
	var curChildIdx
	var bank
	var idx
	var bankStr
	var depth
	var maxDepth
	var parentResult
	var childResult
	var defRecord
		
	while inFileSection(chunk) loop
		chunk = getNextFileChunk(_file, chunk.nextIdx) // Block
		
		isMerged = true
		curChildIdx = -1
		bank = -1
		idx = -1
		bankStr = ""
		objDef def
		def.name = ""
		def.file = ""
		def.obj = -1
		def.ext.lo = {0, 0, 0}
		def.ext.hi = {0, 0, 0}
		def.scale = {1, 1, 1}
		def.children = []
		def.lights = []
		depth = [0]
		maxDepth = 0
		
		// Assemble parent
		while inFileBlock(chunk) and isMerged and def.name == "" loop
			parentResult = assembleMergedObjDefParent(_file, chunk, def)
			chunk = parentResult.chunk
			def = parentResult.def
			bankStr = parentResult.bankName
		repeat
		
		// Assemble children
		while inFileBlock(chunk) and def.name != "" loop
			childResult = assembleMergedObjDefChild(_file, chunk, def, curChildIdx)
			chunk = childResult.chunk
			def = childResult.def
			curChildIdx = childResult.curChildIdx
		repeat
		
		if len(def.children) or len(def.lights) then
			defRecord = loadAssembledMergedObjDef(def, bankStr)
			mergedDefs = push(mergedDefs, defRecord)
		endif
	repeat
	
	/* Construct merged defs' child references. This can't be done in the initial
	merged def load above because the children may point to other merged defs and 
	this can't happen until those defs actually exist. */
	var missingRefs = []
	var i
	var j
	var childName
	var defBankIdx
	
	for i = 0 to len(mergedDefs) loop
		for j = 0 to len(g_obj[mergedDefs[i].bank][mergedDefs[i].idx].children) loop
			// Read buffered name. .bankIdx's data gets correctly filled below.
			childName = g_obj[mergedDefs[i].bank][mergedDefs[i].idx].children[j].bankIdx
			defBankIdx = getObjDefBankIdx(childName)
			
			if defBankIdx.bank < 0 or defBankIdx.idx < 0 then
				if !contains(missingRefs, childName) then
					missingRefs = push(missingRefs, childName)
				endif
			else
				g_obj[mergedDefs[i].bank][mergedDefs[i].idx].children[j].bankIdx = encodeBankIdx(defBankIdx.bank, defBankIdx.idx)
			endif
		repeat
	repeat
return missingRefs

/* Loads a merged object's top-level container data. */
// CORE LOADER
function assembleMergedObjDefParent(_file, _chunk, _def)
	var isMerged = true
	var bankStr = ""
	var field
	var nameElem
	
	_chunk = getNextFileChunk(_file, _chunk.nextIdx) // Unit
	while inFileUnit(_chunk) and isMerged loop
		_chunk = getNextFileChunk(_file, _chunk.nextIdx) // Field
		field = _chunk.dat
		
		array elem[0]
		while inFileField(_chunk) and isMerged loop
			_chunk = getNextFileChunk(_file, _chunk.nextIdx) // Elem
			elem = push(elem, _chunk.dat)
		repeat
		
		if field == ".name" then
			nameElem = decodeElem(elem)
			
			_def.name = nameElem
		else if field == ".bankName" then
			bankStr = decodeElem(elem)
		endif endif
	repeat
	
	var result = [
		.chunk = _chunk,
		.def = _def,
		.bankName = bankStr
	]
return result

/* Loads a merged object's child data; that is, the actual object data that
fills the top-level container. */
// CORE LOADER
function assembleMergedObjDefChild(_file, _chunk, _def, _curChildIdx)
	_chunk = getNextFileChunk(_file, _chunk.nextIdx) // Unit
	var genResult = getGenObjFromFile(_file, _chunk)
	var genObj = genResult.obj
	_chunk = genResult.chunk
	
	// If not a light
	if genObj.brightness == -1 then
		var child = createActiveFromGenericObj(genObj)
		/* We temporarily store child name in .bankIdx so we can look up the
		correct objDef when loadMergedObjDefs fully constructs the child
		objects. */
		child.bankIdx = genObj.name
		_def.children = push(_def.children, child)
		_curChildIdx += 1
	// Else if a light
	else
		var l = createLightObjFromGenericObj(genObj)
		
		if _curChildidx == -1 then
			_def.lights = push(_def.lights, l)
		else
			_def.children[_curChildIdx].lights = push(_def.children[_curChildIdx].lights, l)
		endif
	endif
	
	var result = [
		.chunk = _chunk,
		.def = _def,
		.curChildIdx = _curChildIdx
	]
return result

/* Puts the merged object into the g_obj array so it can be used. If the
requested bank doesn't exist, it is created. */
// CORE LOADER
function loadAssembledMergedObjDef(_def, _savedBankName)
	loadDefMsg(_def.name)
	
	var bankFound = false
	var defBank
	var defIdx
	
	var j
	for j = 0 to len(g_bankName) loop
		// If the def's bank already exists, load it there
		if _savedBankName == g_bankName[j] then
			g_obj[j] = push(g_obj[j], _def)
			defBank = j
			defIdx = len(g_obj[j]) - 1
			bankFound = true
			
			break
		endif
	repeat
	
	// If the def's bank doesn't exist yet, create it
	if !bankFound then
		g_obj = push(g_obj, [])
		defBank = len(g_obj) - 1
		defIdx = 0
		g_bankName = push(g_bankName, _savedBankName)
		g_obj[len(g_obj) - 1] = push(g_obj[len(g_obj) - 1], _def)
	endif
	
	result = [ .bank = defBank, .idx = defIdx ]
return result

	// ----------------------------------------------------------------
	// FILE ENCODING

/* Encode section headers at various levels of the file tree. Each section header 
is identfied by a non-printing Unicode character that can't be placed with a 
standard keyboard, so user input can't create conflicts. 

The hierarchy from highest to lowest:
Section -- chr(31): Marks major chunks like maps and preferences
Version -- chr(18): Optional delimiter within a section listing the version of Celqi that saved the data
Block -- chr(17): Marks largest individual containers in a section (e.g. an object class within a map)
Unit -- chr(30): Division within a block (e.g. map objects of a type specified by block)
Field -- chr(29): The name of a varible whose value has been saved
Element -- chr(28): Part of the saved value of a variable */
function sectionStr(_str)
return chr(31) + _str

function blockStr(_str)
return chr(17) + _str

function unitStr(_str)
return chr(30) + _str

function fieldStr(_str)
return chr(29) + _str

function elemStr(_elem)
	var enc = encodeElem(_elem)
	var eStr = ""
	var i
	for i = 0 to len(enc) loop
		eStr += chr(28) + enc[i]
	repeat
return eStr

function versionStr()
	var ver = chr(18) + g_version
return ver

/* Given an input variable, returns an encoded elem string to be written
to file.

 Type designators:
"f": float
"i": int
"ia": array of ints
"3": vector3
"s": string */
function encodeElem(_dat)
	var type = getType(_dat)
	var enc
	
	loop if type == "vector" then
		var elem0 = str(_dat[0])
		strRemoveTrailingZeroes(elem0)
		var elem1 = str(_dat[1])
		strRemoveTrailingZeroes(elem1)
		var elem2 = str(_dat[2])
		strRemoveTrailingZeroes(elem2)
		if _dat[3] == 0 then
			enc = [
				"3",
				elem0,
				elem1,
				elem2
			]
		else
			var elem3 = str(_dat[3])
			strRemoveTrailingZeroes(elem3)
			
			enc = [
				"4",
				elem0,
				elem1,
				elem2,
				elem3
			]
		endif
		break endif
	if type == "float" then
		var elem = str(_dat)
		strRemoveTrailingZeroes(elem)
		enc = [
			"f",
			elem
		]
		break endif
	if type == "array" then
		enc = [ "ia" ]
		
		var i
		for i = 0 to len(_dat) loop
			enc = push(enc, str(_dat[i]))
		repeat
		
		break
	else
		var typeCode
		if type == "float" then
			typeCode = "f"
		else if type == "int" then
			typeCode = "i"
		else
			typeCode = "s"
		endif endif
		
		enc = [
			typeCode,
			str(_dat)
		]
		break
	endif break repeat
return enc

/* Returns a string that records the number and locations of the cells in the map. */
function encodeCellMap(_file,_mapName, _ver)
	var sectionIdx = findFileSection(_file, "cellMap" + _mapName)
	if sectionIdx.start < 0 then
		sectionIdx.start = getEofIdx(_file)
		sectionIdx.end = sectionIdx.start
	endif
	
	var writeStr = sectionStr("cellMap" + _mapName + _ver)
	writeStr += blockStr("")
	var i
	for i = 0 to len(g_cell) loop
		writeStr += unitStr(i)
		writeStr += fieldStr(".pos")
		writeStr += elemStr(forceVec3(g_cell[i][0]))
		writeStr += fieldStr(".adj")
		writeStr += elemStr(g_cell[i][1])
	repeat
	
	var result = [
		.enc = writeStr,
		.writeStart = sectionIdx.start,
		.writeEnd = sectionIdx.end
	]
return result

/* Returns a string encoded for writing map data to file. */
function encodeObjMap(_file, _mapName, _ver)
	var sectionIdx = findFileSection(_file, "objectMap" + _mapName)
	if sectionIdx.start < 0 then
		sectionIdx.start = getEofIdx(_file)
		sectionIdx.end = sectionIdx.start
	endif
	
	var writeStr = sectionStr("objectMap" + _mapName + _ver)
	array name[0]
	array block[0]
	
	var i
	var j
	var objName
	var nameIdx
	
	for i = 0 to len(g_cell) loop
		for j = g_cellObjStart to len(g_cell[i]) loop
			if !isMapObjRef(-1, g_cell[i][j]) then
				getMapObjName(objName, g_cell[i][j])
				nameIdx = find(name, objName)
				if nameIdx < 0 then
					name = push(name, objName)
					block = push(block, blockStr(""))
					nameIdx = len(name) - 1
				endif
				
				showLoadBox("Saving '" + _mapName + "':" 
					+ chr(10) + "Writing '" + objName + "'" + chr(10) + vec3ToStr(g_cell[i][j].pos, 2), true, false, false)
				block[nameIdx] += encodeObjMapUnit(g_cell[i][j])
				block[nameIdx] += encodeObjLights(g_cell[i][j], true)
			endif
		repeat
	repeat
	
	for i = 0 to len(block) loop
		writeStr += block[i]
	repeat
	
	removeLoadSpr()
	var result = [
		.enc = writeStr,
		.writeStart = sectionIdx.start,
		.writeEnd = sectionIdx.end
	]
return result

/* Encodes an object instance for file writing. */
function encodeObjMapUnit(_obj)
	// Avoid lengthy string concat in a single line because it can cause stack overflow
	var writeStr = unitStr("")
	writeStr += fieldStr(".name")
	writeStr += elemStr(getMapObjName(-1, _obj))
	writeStr += fieldStr(".pos")
	writeStr += elemStr(forceVec3(_obj.pos))
	writeStr += fieldStr(".fwd")
	writeStr += elemStr(forceVec3(_obj.fwd))
	writeStr += fieldStr(".up")
	writeStr += elemStr(forceVec3(_obj.up))
	writeStr += fieldStr(".scale")
	writeStr += elemStr(forceVec3(_obj.scale))
	writeStr += fieldStr(".col")
	writeStr += elemStr(_obj.col)
	writeStr += fieldStr(".mat")
	writeStr += elemStr(forceVec3(_obj.mat))
return writeStr

/* Encodes the light data for an object instance. This data is encoded separately
from the object it belongs to. */
function encodeObjLights(_obj, _encChildLights)
return encodeObjLights(_obj, _encChildLights, "")

function encodeObjLights(_obj, _encChildLights, _writeStr)
	var i
	for i = 0 to len(_obj.lights) loop
		_writeStr += unitStr("")
		_writeStr += fieldStr(".name")
		_writeStr += elemStr(_obj.lights[i].name)
		_writeStr += fieldStr(".pos")
		_writeStr += elemStr(forceVec3(_obj.lights[i].pos))
		_writeStr += fieldStr(".fwd")
		_writeStr += elemStr(forceVec3(_obj.lights[i].fwd))
		_writeStr += fieldStr(".brightness")
		_writeStr += elemStr(_obj.lights[i].brightness)
		_writeStr += fieldStr(".col")
		_writeStr += elemStr(forceVec3(_obj.lights[i].col))
		_writeStr += fieldStr(".spread")
		_writeStr += elemStr(_obj.lights[i].spread)
		_writeStr += fieldStr(".res")
		_writeStr += elemStr(_obj.lights[i].res)
		_writeStr += fieldStr(".range")
		_writeStr += elemStr(_obj.lights[i].range)
	repeat
	
	if _encChildLights then
		for i = 0 to len(_obj.children) loop
			if decodeBank(-1, _obj.children[i].bankIdx) >= 0 then
				_writeStr = encodeObjLights(_obj.children[i], _encChildLights, _writeStr)
			endif
		repeat
	endif
return _writeStr

/* Encodes map properties for file writing. These are saved in a separate block from the
map objects. */
function encodeMapProperties(_file, _mapName, _ver)
	showLoadBox("Saving '" + _mapName + "':" 
		+ chr(10) + "Writing map properties ...", true, false, false)
		
	var sectionIdx = findFileSection(_file, "mapProperties" + _mapName)
	var propStr = sectionStr("mapProperties" + _mapName + _ver)
	propStr += blockStr("")
	propStr += unitStr("")
	propStr += fieldStr("g_bg.idx")
	propStr += elemStr(g_bg.idx)
	propStr += fieldStr("g_bg.col")
	propStr += elemStr(forceVec3(g_bg.col))
	propStr += fieldStr("g_cam.pos")
	propStr += elemStr(forceVec3(g_cam.pos))
	propStr += fieldStr("g_cam.fwd")
	propStr += elemStr(forceVec3(g_cam.fwd))
	propStr += fieldStr("g_cam.up")
	propStr += elemStr(forceVec3(g_cam.up))
	propStr += fieldStr("g_cur.pos")
	propStr += elemStr(forceVec3(g_cur.pos))
	
	var result = [ 
		.enc = propStr,
		.writeStart = sectionIdx.start,
		.writeEnd = sectionIdx.end
	]
	removeLoadSpr()
return result

/* Encodes object definitions for file wrting. These include both the extent data for
unmerged definitions derived from getModels() as well as program-defined merged object
definitions. */
function encodeObjDefs(_file)
	var sectionIdx = findFileSection(_file, "objectDefs")
	if sectionIdx.start < 0 then
		sectionIdx.start = getEofIdx(_file)
		sectionIdx.end = sectionIdx.start
	endif
	
	var writeStr = sectionStr("objectDefs" + versionStr())
	var i
	var j
	var bankStr
	var k
	
	for i = g_lightBank + 1 to len(g_obj) loop
		for j = 0 to len(g_obj[i]) loop
			if len(g_obj[i][j].children) then
				writeStr += blockStr("")
				writeStr += unitStr("")
				writeStr += fieldStr(".name")
				writeStr += elemStr(g_obj[i][j].name)
				
				bankStr = ""
				if len(g_obj[i][j].children) then
					bankStr = g_bankName[i]
				endif
				
				if bankStr != "" then
					writeStr += fieldStr(".bankName")
						+ elemStr(bankStr)
				endif
				
				writeStr += encodeObjLights(g_obj[i][j], false)
				
				for k = 0 to len(g_obj[i][j].children) loop
					writeStr += encodeObjMapUnit(g_obj[i][j].children[k])
					writeStr += encodeObjLights(g_obj[i][j].children[k], false)
				repeat
			endif
		repeat
	repeat
	
	var result = [
		.enc = writeStr,
		.writeStart = sectionIdx.start,
		.writeEnd = sectionIdx.end
	]
return result

	// ----------------------------------------------------------------
	// FILE DECODING

/* Reconstructs a variable's value from encoded file string. */
// CORE LOADER
function decodeElem(_e)
	var dec
	loop if _e[0] == "f" then
		dec = float(_e[1])
		break endif
	if _e[0] == "i" then
		dec = int(_e[1])
		break endif
	if _e[0] == "3" then
		dec = {0, 0, 0}
		
		var i
		for i = 0 to 3 loop
			dec[i] = float(_e[i + 1])
		repeat
		break endif
	if _e[0] == "4" then
		dec = {0, 0, 0, 0}
		
		var i
		for i = 0 to 4 loop
			dec[i] = float(_e[i + 1])
		repeat
		break endif
	if _e[0] == "ia" then
		array newDec[len(_e) - 1]
		dec = newDec
		
		var i
		for i = 0 to len(dec) loop
			dec[i] = int(_e[i + 1])
		repeat
		break
	else
		dec = _e[1]
		break 
	endif break repeat
return dec

/* Reconstructs an object from encoded file string. This object may have the
properties of both a mapObj and a lightObj; the calling function needs to
determine how to parse the data. */
// CORE LOADER
function getGenObjFromFile(_file, _chunk)
	var genObj = initGenericObj()
	var field
	
	while inFileUnit(_chunk) loop
		_chunk = getNextFileChunk(_file, _chunk.nextIdx) // Field
		field = _chunk.dat
		
		array elem[0]
		while inFileField(_chunk) loop
			_chunk = getNextFileChunk(_file, _chunk.nextIdx) // Elem
			elem = push(elem, _chunk.dat)
		repeat
		
		genObj = fillGenericObj(genObj, field, decodeElem(elem))
	repeat
	
	var result = [
		.obj = genObj,
		.chunk = _chunk
	]
return result

/* Formats and initializes a struct to be filled by getGenObjFromFile(). */
// CORE LOADER
function initGenericObj()
return [
	.obj = -1,
	.name = "",
	.pos = {0, 0, 0},
	.scale = {1, 1, 1},
	.fwd = {0, 0, 1},
	.up = {0, 1, 0},
	.bankIdx = -1,
	.children = [],
	.lights = [],
	.brightness = -1,
	.col = {1, 1, 1, 1},
	.mat = {0, 1, 0},
	.spread = -1,
	.res = -1,
	.range = -1
]

/* Fills the generic object with data from getGenObjFromFile(). */
// CORE LOADER
function fillGenericObj(_genObj, _field, _elem)
	loop if _field == ".name" then
		_genObj.name = _elem
		break endif
	if _field == ".bankIdx" then
		_genObj.bankIdx = _elem
		break endif
	if _field == ".idx" then
		_genObj.bankIdx = encodeBankIdx(decodeBank(-1, _genObj.bankIdx), _elem)
		break endif
	if _field == ".bank" then
		_genObj.bankIdx = encodeBankIdx(_elem, decodeIdx(-1, _genObj.bankIdx))
		break endif
	if _field == ".pos" then
		_genObj.pos = _elem
		break endif
	if _field == ".fwd" then
		_genObj.fwd = _elem
		break endif
	if _field == ".up" then
		_genObj.up = _elem
		break endif
	if _field == ".scale" then
		_genObj.scale = _elem
		break endif
	if _field == ".brightness" then
		_genObj.brightness = _elem
		break endif
	if _field == ".col" then
		_genObj.col = _elem
		break endif
	if _field == ".mat" then
		_genObj.mat = _elem
		break endif
	if _field == ".spread" then
		_genObj.spread = _elem
		break endif
	if _field == ".res" then
		_genObj.res = _elem
		break endif
	if _field == ".range" then
		_genObj.range = _elem
		break
	endif break repeat
return _genObj

/* Pulls all the data from a generic object necessary for an active. */
// CORE LOADER
function createActiveFromGenericObj(_gen)
	active obj
	obj.obj = _gen.obj
	obj.pos = _gen.pos
	obj.scale = _gen.scale
	obj.fwd = _gen.fwd
	obj.up = _gen.up
	obj.col = _gen.col
	obj.bankIdx = _gen.bankIdx
return obj

/* Pulls all the data from a generic object necessary for a lightObj. */
// CORE LOADER
function createLightObjFromGenericObj(_gen)
	lightObj l
	l = initLightObj()
	l.name = _gen.name
	l.pos = _gen.pos
	l.fwd = _gen.fwd
	l.brightness = _gen.brightness
	l.col = _gen.col
	l.spread = _gen.spread
return l

/* Fills the appropriate variables from the file's saved map properties. */
// CORE LOADER
function decodeMapProperties(_field, _elem, _propStruct)
	loop if _field == "g_bg.idx" then
		_propStruct.bg.idx = decodeElem(_elem)
		break endif
	if _field == "g_bg.col" then
		_propStruct.bg.col = decodeElem(_elem)
		break endif
	if _field == "g_cam.pos" then
		_propStruct.cam.pos = decodeElem(_elem)
		break endif
	if _field == "g_cam.fwd" then
		_propStruct.cam.fwd = decodeElem(_elem)
		break endif
	if _field == "g_cam.up" then
		_propStruct.cam.up = decodeElem(_elem)
		break endif
	if _field == "g_cur.pos" then
		_propStruct.cur.pos = decodeElem(_elem)
		break
	endif break repeat
return _propStruct

/* Fills the appropriate variables from the file's saved cell properties. */
// CORE LOADER
function decodeCellMap(_field, _elem, _cellArr)
	loop if _field == ".pos" then
		_cellArr[0] = decodeElem(_elem)
		break endif
	if _field == ".adj" then
		_cellArr[1] = decodeElem(_elem)
		break
	endif break repeat
return _cellArr

/* Returns the version of Celqi that saved a given file section. */
function getSectionVersion(_file, _sectStart, _sectEnd)
	var verIdx = findFileChunk(_file, chr(18), chr(17), _sectStart, _sectEnd)
	seek(_file, verIdx.start)
	var ver = read(_file, verIdx.end - verIdx.start)[1:]
return ver

/* Returns true if the given chunk is within the file. */
// CORE LOADER
function inFile(_chunk)
return _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

/* Returns true if the given chunk is still within the same section. */
// CORE LOADER
function inFileSection(_chunk)
return _chunk.nextMarker != chr(31) 
		and _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

/* Returns true if the given chunk is still within the same block. */			
// CORE LOADER
function inFileBlock(_chunk)
return _chunk.nextMarker != chr(31) 
		and _chunk.nextMarker != chr(17) 
		and _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

/* Returns true if the given chunk is still within the same unit. */
// CORE LOADER
function inFileUnit(_chunk)
return _chunk.nextMarker != chr(31) 
		and _chunk.nextMarker != chr(17) 				
		and _chunk.nextMarker != chr(30) 
		and _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

/* Returns true if the given chunk is still within the same field. */
// CORE LOADER
function inFileField(_chunk)
return _chunk.nextMarker != chr(31) 
		and _chunk.nextMarker != chr(17) 				
		and _chunk.nextMarker != chr(30) 				
		and _chunk.nextMarker != chr(29) 
		and _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

// ----------------------------------------------------------------
// STRING FUNCTIONS

/* Converts string to lowercase. */
function lower(_str)
	var i
	var val = -1
	
	for i = 0 to len(_str) loop
		val = chrVal(_str[i])
		
		if val >= 65 and val <= 90 then
			_str[i] = chr(val + 32)
		endif
	repeat
return _str

/* Converts string to uppercase. */
function upper(_str)
	var i
	var val = -1
	
	for i = 0 to len(_str) loop
		val = chrVal(_str[i])
		
		if val >= 97 and val <= 122 then
			_str[i] = chr(val - 32)
		endif
	repeat
return _str

/* Puts two strings in alphabetical order. */
function alphabetize(_str1, _str2)
	var lower1 = lower(_str1)
	var lower2 = lower(_str2)
	var shortest = getShortestStr([ lower1, lower2 ])
	var ordered
	
	if shortest == lower1 then
		ordered = [ _str1, _str2 ]
	else
		ordered = [ _str2, _str1 ]
	endif
	
	var i = 0
	while i < len(shortest) loop
		if chrVal(lower1[i]) < chrVal(lower2[i]) then
			ordered[0] = _str1
			ordered[1] = _str2
			
			break
		else if chrVal(lower1[i]) > chrVal(lower2[i]) then
			ordered[0] = _str2
			ordered[1] = _str1
			
			break
		endif endif
		
		i += 1
	repeat
return ordered

/* Puts an array of strings in alphabetical order. */
function alphabetize(_arr)
	var i
	var j
	var ordered
	
	if len(_arr) then
		for i = 1 to len(_arr) loop
			for j = i to 0.9 step -1 loop
				ordered = alphabetize(_arr[j], _arr[j - 1])
				_arr[j] = ordered[1]
				_arr[j - 1] = ordered[0]
			repeat
		repeat
	endif
return _arr

/* The character at the _end index isn't included in the return string. */
function strSlice(_str, _start, _end)
	sliced  = ""
	
	if len(_str) > 0 and _start < len(_str) then
		if _end > len(_str) - 1 or _end < 0 then
			_end = len(_str)
		endif
		
		if _start < 0 then
			_start = 0
		endif
		
		var i
		for i = _start to _end loop
			sliced += _str[i]
		repeat
	endif
return sliced

/* Gets the longest string in an array. */
function getLongestStr(_strs)
	var longest = ""
	
	var i
	for i = 0 to len(_strs) loop
		if len(_strs[i]) > len(longest) then
			longest = _strs[i]
		endif
	repeat
return longest

/* Gets the shortest string in an array. An empty string will not
count as being shortest. */
function getShortestStr(_strs)
	var shortest = ""
	
	var i
	for i = 0 to len(_strs) loop
		if len(_strs[i]) < len(shortest) or shortest == "" then
			shortest = _strs[i]
		endif
	repeat
return shortest

/* Counts the number of a given character in a string. */
function getCharTypeCount(_str, _char)
	var count = 0
	
	var i
	for i = 0 to len(_str) loop
		if _str[i] == _char then
			count += 1
		endif
	repeat
return count

/* Removes all instances of a given character from a string. */
function strRemoveChar(_str, _char)
	var i = 0
	while i < len(_str) loop
		if _str[i] == _char then
			if i > 0 then
				_str = _str[:i - 1] + _str[i + 1:]
			else
				_str = _str[i + 1:]
			endif
			
			i -= 1
		endif
		
		i += 1
	repeat	
return _str

/* Given the width in characters, calculates how many lines a string will
fill. */
function getStrLineCount(_str, _width)
	var lines = 1
	var charIdx = 1
	var lastSpace = -1
	var longestLineLen = -1
	
	var i
	for i = 0 to len(_str) loop
		if _str[i] == " " then
			lastSpace = i
		endif
		
		if charIdx > _width or _str[i] == chr(10) or i == len(_str) - 1 then
			if charIdx > _width or _str[i] == chr(10) then
				lines += 1
				if _str[i] != " " and _str[i] != chr(10) 
						and lastSpace > i - _width then
					if i == len(_str) - 1 then
						charIdx -= i - lastSpace
						i = lastSpace + 1
					else if _str[i + 1] != " " and _str[i + 1] != chr(10) then
						charIdx -= i - lastSpace
						i = lastSpace + 1
					endif endif
				endif
			endif
			
			if charIdx > longestLineLen then
				longestLineLen = charIdx
			endif
			charIdx = 1
		endif
		charIdx += 1
	repeat
	
	var result = [ .count = lines, .longest = longestLineLen ]
return result

/* Calculates how wide a menu will be including the given bullet size */
function getMenuWidth(_menu, _bullet)
	textSize(g_menuTextSize)
	array texts[0]
	
	var i
	for i = 0 to len(_menu) loop
		texts = push(texts, _menu[i].text)
	repeat
return textWidth(getLongestStr(texts)) + getBulletWidth(_bullet) * 3

/* Returns the width of a menu selection bullet. */
function getBulletWidth(_bullet)
return textWidth(_bullet) * 1.4

/* Converts a vector3 to a string with the given number of decimal places */
function vec3ToStr(_v, _decimals)
	var vStr = "{"
	vStr += floatToStr(_v.x, _decimals)
	vStr += ", "
	vStr += floatToStr(_v.y, _decimals)
	vStr += ", "
	vStr += floatToStr(_v.z, _decimals)
	vStr += "}"
return vStr

/* Converts a vector3 to a string with the given number of decimal places */
function vec4ToStr(_v, _decimals)
	var vStr = "{"
	vStr += floatToStr(_v.x, _decimals)
	vStr += ", "
	vStr += floatToStr(_v.y, _decimals)
	vStr += ", "
	vStr += floatToStr(_v.z, _decimals)
	vStr += ", "
	vStr += floatToStr(_v.a, _decimals)
	vStr += "}"
return vStr

/* Converts a float to a string with the given number of decimal places. */
function floatToStr(_f, _decimals)
	str fStr = str(_f)
	var decIdx = strFind(fStr, ".")
	
	if _decimals == 0 then
		fStr = strSlice(fStr, 0, decIdx)
	else if _decimals > 0 then
		fStr = strSlice(fStr, 0, decIdx + 1 + _decimals)
	endif endif
return fStr

/* Returns menu display text. */
function getSnapModeStr(_mode)
	var snapModeStr
	if _mode == 0 then
		snapModeStr = "No snap"
	else if _mode == 1 then
		snapModeStr = "Snap by"
	else
		snapModeStr = "Snap to"
	endif endif
return snapModeStr

/* Returns menu display text. */
function getPosSnapAmountStr(_amount, _decimals)
	var amtStr
	if _amount < 0 then
		amtStr = "Grid unit"
	else
		amtStr = floatToStr(_amount, _decimals)
	endif
return amtStr

/* Returns menu display text. */
function getBoolStr(_bool)
	var boolStr
	if _bool then
		boolStr = "Yes"
	else
		boolStr = "No"
	endif
return boolStr

/* Returns menu display text. */
function getObjBrightnessStr(_obj)
return getObjBrightnessStr(_obj, "")

function getObjBrightnessStr(_obj, _str)
	var brStr = _str
	var targetStr
	
	var i
	for i = 0 to len(_obj.lights) loop
		targetStr = strRemoveTrailingZeroes(str(_obj.lights[i].brightness))
		
		if brStr != "" and brStr != targetStr then
			brStr = "Multiple"
			
			break
		else
			brStr = targetStr
		endif
	repeat
	
	if brStr != "Multiple" then
		for i = 0 to len(_obj.children) loop
			brStr = getObjBrightnessStr(_obj.children[i], brStr)
		repeat
	endif
return brStr

/* Returns menu display text. */
function getObjSpreadStr(_obj)
return getObjSpreadStr(_obj, "")

function getObjSpreadStr(_obj, _str)
	var spStr = _str
	var targetStr
	
	var i
	for i = 0 to len(_obj.lights) loop
		if _obj.lights[i].name == "spot" then
			targetStr = strRemoveTrailingZeroes(str(_obj.lights[i].spread))
			
			if spStr != "" and spStr != targetStr then
				spStr = "Multiple"
				
				break
			else
				spStr = targetStr
			endif
		endif
	repeat
	
	if spStr != "Multiple" then
		for i = 0 to len(_obj.children) loop
			spStr = getObjSpreadStr(_obj.children[i], spStr)
		repeat
	endif
return spStr

/* Returns menu display text. */
function getObjResStr(_obj)
return getObjResStr(_obj, "")

function getObjResStr(_obj, _str)
	var resStr = _str
	var targetStr
	
	var i
	for i = 0 to len(_obj.lights) loop
		targetStr = strRemoveTrailingZeroes(str(_obj.lights[i].res))
		
		if _obj.lights[i].name == "pointshadow" or _obj.lights[i].name == "worldshadow" then
			if resStr != "" and resStr != targetStr then
				resStr = "Multiple"
				
				break
			else
				resStr = targetStr
			endif
		endif
	repeat
	
	if resStr != "Multiple" then
		for i = 0 to len(_obj.children) loop
			resStr = getObjResStr(_obj.children[i], resStr)
		repeat
	endif
return resStr

/* Returns menu display text. */
function getObjRangeStr(_obj)
return getObjRangeStr(_obj, "")

function getObjRangeStr(_obj, _str)
	var rangeStr = _str
	var targetStr
	
	var i
	for i = 0 to len(_obj.lights) loop
		targetStr = strRemoveTrailingZeroes(str(_obj.lights[i].range))
		
		if _obj.lights[i].name == "worldshadow" then
			if rangeStr != "" and rangeStr != targetStr then
				rangeStr = "Multiple"
				
				break
			else
				rangeStr = targetStr
			endif
		endif
	repeat
	
	if rangeStr != "Multiple" then
		for i = 0 to len(_obj.children) loop
			rangeStr = getObjRangeStr(_obj.children[i], rangeStr)
		repeat
	endif
return rangeStr

/* Returns menu display text. */
function getObjCol(_obj)
return getObjCol(_obj, [ .col = {-1, -1, -1, -1}, .colStr = "" ])

function getObjCol(_obj, _result)
	var targetStr = vec4ToStr(_obj.col, 2)
	
	if (!len(_obj.lights) and !len(_obj.children)) or _obj.col != {-1, -1, -1, -1} then
		if _result.colStr != "" and _result.colStr != targetStr then
			_result.colStr = "(Multiple)"
		else
			_result.col = _obj.col
			_result.colStr = targetStr
		endif
	endif
	
	// If the parent has an override set, all children will match, so don't check them
	if _result.colStr != "(Multiple)" and len(_obj.children) and _obj.col == {-1, -1, -1, -1} then
		var i
		for i = 0 to len(_obj.children) loop
			_result = getObjCol(_obj.children[i], _result)
		repeat
	endif
return _result

/* Returns menu display text. */
function getObjLightCol(_obj)
return getObjLightCol(_obj, [ .col = {-1, -1, -1, 1}, .colStr = "" ])

function getObjLightCol(_obj, _result)
	var targetStr
	
	var i
	for i = 0 to len(_obj.lights) loop
		targetStr = vec3ToStr(_obj.lights[i].col, 2)
		
		if _result.colStr != "" and _result.colStr != targetStr then
			_result.colStr = "(Multiple)"
			
			break
		else
			_result.col = _obj.lights[i].col
			_result.colStr = targetStr
		endif
	repeat
	
	if _result.colStr != "(Multiple)" then
		for i = 0 to len(_obj.children) loop
			_result = getObjLightCol(_obj.children[i], _result)
		repeat
	endif
return _result

/* Returns menu display text. */
function getObjMatStr(_obj, _matIdx)
return getObjMatStr(_obj, _matIdx, "")

function getObjMatStr(_obj, _matIdx, _str)
	var targetStr = strRemoveTrailingZeroes(str(_obj.mat[_matIdx]))
	
	if (!len(_obj.lights) and !len(_obj.children)) or _obj.mat[_matIdx] != -1 then
		if _str != "" and _str != targetStr then
			_str = "Multiple"
		else
			_str = targetStr
		endif
	endif
	
	// If the parent has an override set, all children will match, so don't check them
	if _str != "Multiple" and len(_obj.children) and _obj.mat[_matIdx] == -1 then
		var i
		for i = 0 to len(_obj.children) loop
			_str = getObjMatStr(_obj.children[i], _matIdx, _str)
		repeat
	endif
return _str

/* drawTextEx() crashes if you pass it an empty string or a string comprised 
only of spaces. These functions automatically draw a non-crashy tab 
character instead of a crashy string. */
function safeDrawTextEx(_text, _location, _size)
return drawTextEx(padNullStr(_text), _location, _size)

function safeDrawTextEx(_text, _location, _size, _align)
return drawTextEx(padNullStr(_text), _location, _size, _align)

function safeDrawTextEx(_text, _location, _size, _align, _target_width)
return drawTextEx(padNullStr(_text), _location, _size, _align, _target_width)

function safeDrawTextEx(_text, _location, _size, _align, _target_width, _rotation, _scale)
return drawTextEx(padNullStr(_text), _location, _size, _align, _target_width, _rotation, _scale)

function safeDrawTextEx(_text, _location, _size, _align, _target_width, _rotation, _scale, _tint)
return drawTextEx(padNullStr(_text), _location, _size, _align, _target_width, _rotation, _scale, _tint)

function safeDrawTextEx(_text, _location, _size, _align, _target_width, _rotation, _scale, _tint, _origin)
return drawTextEx(padNullStr(_text), _location, _size, _align, _target_width, _rotation, _scale, _tint, _origin)

/* Draws a tab character instead of a null string. */
function padNullStr(_str)
	var needOverwrite = true
	
	var i
	for i = 0 to len(_str) loop
		if _str[i] != chr(32) then
			needOverwrite = false
			break
		endif
	repeat
	
	if needOverwrite then
		_str = chr(9)
	endif
return _str

/* Removes the trailing zeros and, if appropriate, the decimal point from a
stringified float. */
function strRemoveTrailingZeroes(ref _str)
	var newLen = len(_str) - 1
	var continue = strContains(_str, ".")
	var i
	
	for i = len(_str) - 1 to -0.1 step -1 loop
		if !continue then // Check inside of loop to reduce stack size
			break
		endif
		
		if _str[i] == "0" then
			newLen -= 1
		else
			if _str[i] == "." then
				newLen -= 1
			endif
			
			break
		endif
	repeat
	
	_str = _str[:newLen]
return _str

/* Generate a name based on a filepath. */
// CORE LOADER
function getDefaultDefName(_path)
	var name = _path
	var slashIdx = strFind(name, "/") + 1
	name = name[slashIdx:]
	name = strReplace(name, "_", " ")
return name

// ----------------------------------------------------------------
// NUMBER FUNCTIONS

/* 1 for 0 or positive, -1 for negative. */
// CORE LOADER
function getSign(_num)
	if _num >= 0 then
		_num = 1
	else
		_num = -1
	endif
return _num

/* Round a float to a given number of decimal places. */
// CORE LOADER
function roundDec(_num, _decimals)
	var factor = pow(10, _decimals)
	
	if _decimals <= 0 then
		factor = 1
	endif
	
	_num = _num * factor
	_num = round(_num)
	_num = _num / factor
	_num = str(_num)
return float(_num)

/* Wrap range is _min up to but not including _max. */
function wrap(_num, _min, _max)
	if _num < _min then
		_num = _max + mod((_num - _min), (_max - _min))
	endif
	if _num >= _max then
		_num = _min + mod((_num - _min), (_max - _min))
	endif
return _num

/* Wrap range is _min up to and including _max. */
function wrapInc(_num, _min, _max)
	if _num < _min then
		_num = _max + mod((_num - _min), (_max - _min))
	endif
	if _num > _max then
		_num = _min + mod((_num - _min), (_max - _min))
	endif
return _num

/* Wrap range is _min up to and including _max. Values above the max
clamp to the min; values below the min clamp to the max. */
function wrapIncClamp(_num, _min, _max)
	if _num < _min then
		_num = _max
	endif
	if _num > _max then
		_num = _min
	endif
return _num

/* The native mod function (%) truncates the result if it's a float, 
so use this for floats. */
// CORE LOADER
function mod(_num1, _num2)
	_num1 = roundDec(_num1, 6)
	_num2 = roundDec(_num2, 6)
	var decPart = fract(_num1 / _num2)
return decPart * _num2

/* Equality check with tolerance value. */
// CORE LOADER
function equals(_num1, _num2, _tolerance)
	var isEqual = true
	
	if strBeginsWith(str(_num1), "{") then // If a vector
		var i
		for i = 0 to 4 loop
			if abs(_num1[i] - _num2[i]) > abs(_tolerance) then
				isEqual = false
				
				break
			endif
		repeat
	else if abs(_num1 - _num2) > abs(_tolerance) then
		isEqual = false
	endif endif
return isEqual

/* Rounds a number (_num) to the closest multiple of another number (_mult), 
with the multiplication sequence offset by the given amount (_offset). */
// CORE LOADER
function roundToMultiple(_num, _mult, _offset)
	_mult = abs(_mult)
	var div = floor(_num / _mult)
return div * _mult - _offset

function roundVec3ToMultiple(_v, _mult, _offset)
	_v[0] = roundToMultiple(_v[0], _mult, _offset)
	_v[1] = roundToMultiple(_v[1], _mult, _offset)
	_v[2] = roundToMultiple(_v[2], _mult, _offset)
return _v

/* abs() for vector3. */
// CORE LOADER
function absVec3(_vec)
return {abs(_vec.x), abs(_vec.y), abs(_vec.z)}

/* Returns number of ints needed to store the given number of bits. */
// CORE LOADER
function bitLenToInt(_bitLen)
return ceil(_bitLen / g_intLen)

/* For an array of grid bits, sets the given bit. */
function bitSetLong(_bitIntArr, _bitIdx, _val)
	var intIdx = floor(_bitIdx / g_intLen)
	var _shortBitIdx = _bitIdx % g_intLen
	_bitIntArr[intIdx] = bitSet(_bitIntArr[intIdx], _shortBitIdx, _val)
return _bitIntArr

/* For an array of grid bits, get the given bit. */
function bitGetLong(_bitIntArr, _bitIdx)
	var intIdx = floor(_bitIdx / g_intLen)
	var _shortBitIdx = _bitIdx % g_intLen
return bitGet(_bitIntArr[intIdx], _shortBitIdx)

/* _val must be 0 or 1. This will fill a length of _count bits starting
at _bitIdx with the _val bit. */
// CORE LOADER
function bitFieldSetLong(_bitIntArr, _bitIdx, _count, _val)
	if _val != 0 then
		_val = int_max
	endif
	
	var intIdx = floor(_bitIdx / g_intLen)
	var shortIdx = _bitIdx - intIdx * g_intLen
	var shortCount = min(g_intLen - _bitIdx % g_intLen, _count)
	_count -= shortCount
	
	while shortCount > 0 and intIdx < len(_bitIntArr) loop
		_bitIntArr[intIdx] = bitFieldInsert(_bitIntArr[intIdx], shortIdx, shortCount, _val)
		intIdx += 1
		shortIdx = 0
		shortCount = min(g_intLen, _count)
		_count -= shortCount
	repeat
return _bitIntArr

/* Bitwise or for multi-int binary numbers. Assumes both bitInt arrays have the
same number of elements. */
// CORE LOADER
function bitOrLong(_bitIntArr1, _bitIntArr2)
	var i
	for i = 0 to len(_bitIntArr1) loop
		_bitIntArr1[i] = _bitIntArr1[i] | _bitIntArr2[i]
	repeat
return _bitIntArr1

/* Bitwise and for multi-int binary numbers. Assumes both bitInt arrays have the
same number of elements. */
function bitAndLong(_bitIntArr1, _bitIntArr2)
	var i
	for i = 0 to len(_bitIntArr1) loop
		_bitIntArr1 = _bitIntArr1 & _bitIntArr2
	repeat
return _bitIntArr1

/* Compact if statement that returns argument 2 or 3 depending on the truth of
argument 1. */
function ifElse(_cond, _if, _else)
	var result
	
	if _cond then
		result = _if
	else
		result = _else
	endif
return result

// ----------------------------------------------------------------
// ARRAY FUNCTIONS

// CORE LOADER
function contains(_arr, _item)
return contains(_arr, _item, false)

/* Can cast _item to a string before looking for it. */
function contains(_arr, _item, _castToStr)
	if _castToStr then
		_item = str(_item)
	endif
	
	var found = false
	if find(_arr, _item, _castToStr) > -1 then
		found = true
	endif
return found

/* When considering possible matches in _arr, tries to match _item with
_arr[i][_subIdx] instad of _arr[i]. */
function containsAtSubIdx(_arr, _item, _subIdx)
return containsAtSubIdx(_arr, _item, _subIdx, false)

function containsAtSubIdx(_arr, _item, _subIdx, _castToStr)
	if _castToStr then
		_item = str(_item)
	endif
	
	var found = false
	if findAtSubIdx(_arr, _item, _subIdx, _castToStr) > -1 then
		found = true
	endif
return found

/* Is _obj present in the array? */
function containsMapObj(_arr, _obj)
	var found = false
	
	if findMapObj(_arr, _obj) > -1 then
		found = true
	endif
return found

/* Finds the index of _item in _array, or -1 if not found. */
// CORE LOADER
function find(_arr, _item)
return find(_arr, _item, false)

function find(_arr, _item, _castToStr)
	var idx = -1
	
	var i
	for i = 0 to len(_arr) loop
		if _castToStr then
			_arr[i] = str(_arr[i])
		endif
		if _arr[i] == _item then
			idx = i
			
			break
		endif
	repeat
return idx

/* When considering possible matches in _arr, tries to match _item with
_arr[i][_subIdx] instad of _arr[i]. */
function findAtSubIdx(_arr, _item, _subIdx)
return findAtSubIdx(_arr, _item, _subIdx, false)

function findAtSubIdx(_arr, _item, _subIdx, _castToStr)
	var idx = -1
	
	var i
	for i = 0 to len(_arr) loop
		if _castToStr then
			_arr[i][_subIdx] = str(_arr[i][_subIdx])
		endif
		if _arr[i][_subIdx] == _item then
			idx = i
			break
		endif
	repeat
return idx

/* Looks for _obj in _arr. Can't be done with the normal find function because
mapObj needs a different equality check. */
function findMapObj(_arr, _obj)
	var idx = -1
	
	var i
	for i = 0 to len(_arr) loop
		if mapObjEquals(_arr[i], _obj) then
			idx = i
			break
		endif
	repeat
return idx

/* Removes item at _idx from _arr. */
// CORE LOADER
function remove(_arr, _idx)
	array newArr[len(_arr) - 1]
	var offset = 0
	
	var i
	for i = 0 to len(newArr) loop
		if i == _idx then
			offset = 1
		endif
		
		newArr[i] = _arr[i + offset]
	repeat
return newArr

/* Removes _item if it's present in _arr. */
function findRemove(_arr, _item)
return findRemove(_arr, _item, false)

function findRemove(_arr, _item, _castToStr)
	
	if _castToStr then
		_item = str(_item)
	endif
	
	var offset = 0
	array newArr[len(_arr) - 1]
	
	var i
	var checkItem
	
	for i = 0 to len(_arr) loop
		checkItem = _arr[i]
		
		if _castToStr then
			checkitem = str(checkItem)
		endif
		
		if checkItem == _item and offset == 0 then
			offset = 1
		endif
		
		if i < len(newArr) then
			newArr[i] = _arr[i + offset]
		endif
	repeat
	
	if offset == 1 then
		_arr = newArr
	endif
return _arr

/* Removes _item if it's present in _arr. When considering possible matches in 
_arr, tries to match _item with _arr[i][_subIdx] instad of _arr[i]. */
function findRemoveAtSubIdx(_arr, _item, _subIdx)
return findRemoveAtSubIdx(_arr, _item, _subIdx, false)

function findRemoveAtSubIdx(_arr, _item, _subIdx, _castToStr)
	array newArr[len(_arr) - 1]
	
	if _castToStr then
		_item = str(_item)
	endif
	
	var offset = 0
	var i
	var checkItem
	
	for i = 0 to len(_arr) loop
		checkItem = _arr[i][_subIdx]
		
		if _castToStr then
			checkitem = str(checkItem)
		endif
		
		if checkItem == _item and offset == 0 then
			offset = 1
		endif
		
		if i < len(newArr) then
			newArr[i] = _arr[i + offset]
		endif
	repeat
	
	if offset == 1 then
		_arr = newArr
	endif
return _arr

// CORE LOADER
/* Inserts _elem in _arr at index _idx, pushing items at _idx and higher back by one index place. */
function insert(_arr, _elem, _idx)
	array newArr[len(_arr) + 1]
	_idx = clamp(_idx, 0, len(_arr))
	var offset = 0
	
	var i
	for i = 0 to len(newArr) loop
		if i == _idx then
			newArr[i] = _elem
			offset = -1
		else
			newArr[i] = _arr[i + offset]
		endif
	repeat
return newArr

/* Explodes _elemArr into its constituent elements and inserts them into _arr. */
// CORE LOADER
function insertArray(_arr, _elemArr)
return insertArray(_arr, _elemArr, len(_arr))

function insertArray(_arr, _elemArr, _idx)
	array newArr[len(_arr) + len(_elemArr)]
	_idx = clamp(_idx, 0, len(_arr))
	var offset = 0
	
	var i
	for i = 0 to len(newArr) loop
		if i >= _idx and i < _idx + len(_elemArr) then
			newArr[i] = _elemArr[i - _idx]
			offset -= 1
		else
			newArr[i] = _arr[i + offset]
		endif
	repeat
return newArr

/* Returns true if each element in _arr1 equals each equivalent element
in _arr2. */
function arrayEquals(_arr1, _arr2)
	var eqs = true
	
	if len(_arr1) != len(_arr2) then
		eqs = false
	else
		var i
		for i = 0 to len(_arr1) loop
			if _arr1[i] != _arr2[i] then
				eqs = false
				break
			endif
		repeat
	endif
return eqs

/* Inserts _item at the end of _arr. */
// CORE LOADER
function push(_arr, _item)
	var arrBuffer = _arr
	var newArr[len(arrBuffer) + 1]
	_arr = newArr
	
	var i
	for i = 0 to len(arrBuffer) loop
		_arr[i] = arrBuffer[i]
	repeat
	
	_arr[len(arrBuffer)] = _item
return _arr

/* This won't literally return type -- a string containing an int value,
for example, will be read as an int -- but it sees the general patterns 
that distinguish data types and should be robust enough for most cases. 
FUZE will throw an error if you pass it a handle. */
function getType(_var)
	var type = "string"
	str varStr = str(_var)
	int varLen = len(varStr)
	var continue = true
	
	while continue loop
		if varLen > 2 then
			if varStr[:2] == "[ ." then
				type = "struct"
				break
			endif
		endif
		
		if varLen > 1 then
			if varStr[0] == "{" then
				type = "vector"
				break
			else if varStr[:1] == "[ " then
				type = "array"
				break
			endif endif
		endif
		
		if varLen > 0 then
			// Separating steps of the condition check may help avoid stack overflow?
			var cast = float(0)
			cast = str(cast)
			var cond0 = varStr != cast
			var cond1 = int(varStr) == 0
			var cond2 = strFind(varStr, "0.") != 0
			var cond3 = strFind(varStr, "-0.") != 0
			cast = int(varStr)
			cast = str(cast)
			cast = len(cast)
			var cond4 = cast != varLen
			cast = float(varStr)
			cast = str(cast)
			cast = len(cast)
			var cond5 = cast != varLen
			
			if varStr != "0" and cond0
					and ((cond1 and cond2 and cond3)
					or (cond4 and cond5)) then
				type = "string"
				break
			else if strContains(varStr, ".") then
				type = "float"
				break
			endif endif
			type = "int"
			break
		endif
		
		continue = false
	repeat
return type

/* Encloses _var in an array if it is not already an array. */
function encloseInArray(_var)
	if getType(_var) != "array" then
		_var = [ _var ]
	endif
return _var

// ----------------------------------------------------------------
// VECTOR FUNCTIONS

/* Normalized cross(), but avoids {nan, nan, nan} for a zeroed result. */
// CORE LOADER
function safeCross(_vec1, vec2)
	var vec3 = cross(_vec1, vec2)
	
	if vec3 != {0, 0, 0} then
		 vec3 = normalize(vec3)
	endif
return vec3

/* Notmalizes only if the result will not be {nan, nan, nan}. */
function safeNormalize(_vec)
	if _vec != {0, 0, 0, 0} then
		_vec = normalize(_vec)
	endif
return _vec

/* Makes a 3D unit vector 2D by removing the Y element. */
// CORE LOADER
function flattenY(_v)
return normalize({_v.x, 0, _v.z})

/* Converts degrees of rotation into a 3D unit vector. */
function vecFromRot(_hDeg, _vDeg)
	vector v
	
	/* Multiplying the XZ vector by the Z component of the YZ vector 
	effectively resizes it so it remains a proportionally correct unit 
	vector when we add the Y component */
	v.x = sin(_hDeg) * cos(_vDeg)
	v.z = cos(_hDeg) * cos(_vDeg)
	v.y = sin(_vDeg)
return v

/* Rotates 3D vector _v around 3D vector _axis by _deg degrees. */
// CORE LOADER
function axisRotVecBy(_v, _axis, _deg)
	// Euler-Rodrigues rotation formula
	var halfDeg = _deg / 2
	var w = _axis * sin(halfDeg)
	var crossWV = cross(w, _v)
return _v + 2 * cos(halfDeg) * crossWV + 2 * cross(w, crossWV)

/* Returns angle in degrees between two vectors. */
// CORE LOADER
function getAngleBetweenVecs(_v1, _v2)
	angle = 0
	
	if roundVec(_v1, 3) == roundVec(_v2 * -1, 3) then
		angle = 180	
	else if roundVec(_v1, 3) != roundVec(_v2, 3) 
			and roundVec(_v1, 3) != {0, 0, 0}
			and roundVec(_v2, 3) != {0, 0, 0} then
		angle = acos(dot(_v1, _v2) / (distance({0, 0, 0}, _v1) * distance({0, 0, 0}, _v2)))
	endif endif
return angle

/* Rounds an angle to closest multiple of _snapInc. */
function snapAngle(_deg, _snapInc)
return round(atan2(_deg.x, _deg.y) * (_snapInc / 360)) * (360 / _snapInc)

/* Rounds a vector to the given number of decimal places. */
// CORE LOADER
function roundVec(_v, _decimals)
	// Help avoid stack overflow by not using a loop
	_v[0] = roundDec(_v[0], _decimals)
	_v[1] = roundDec(_v[1], _decimals)
	_v[2] = roundDec(_v[2], _decimals)
	
	if _v[3] != 0 then
		_v[3] = roundDec(_v[3], _decimals)
	endif
return _v

/* Vector implementation of floor(). */
// CORE LOADER
function floorVec(_v)
	var i
	for i = 0 to 4 loop
		_v[i] = floor(_v[i])
	repeat
return _v

/* Vector implementation of ceil(). */
function ceilVec(_v)
	var i
	for i = 0 to 4 loop
		_v[i] = ceil(_v[i])
	repeat
return _v

/* Sets the fourth vector element to 0. */
function forceVec3(_vec)
	_vec = {_vec[0], _vec[1], _vec[2], 0}
return _vec

/* Remaps a 3D vector to a different context. */
// CORE LOADER
function changeVecSpace(_vec, _newFwd, _newUp, _newR, _newPos)
	var mapped = {0, 0 ,0}
	mapped.x = _vec.x * _newFwd.x + _vec.y * _newUp.x + _vec.z * _newR.x + _newPos.x
	mapped.y = _vec.x * _newFwd.y + _vec.y * _newUp.y + _vec.z * _newR.y + _newPos.y
	mapped.z = _vec.x * _newFwd.z + _vec.y * _newUp.z + _vec.z * _newR.z + _newPos.z
return mapped

/* Remaps a 3D vector to a different context. Accounts for the fact that
FUZE uses a Z-forward orientation. */
// CORE LOADER
function changeVecSpaceZFwd(_vec, _newFwd, _newUp, _newR, _newPos)
return changeVecSpace(_vec, _newR * -1, _newUp, _newFwd, _newPos)

/* Remaps a world vector as a local vector. */
// CORE LOADER
function worldVecToLocalVec(_vec, _locFwd, _locUp, _locPos)
	_vec -= _locPos
	_locFwd = axisRotVecBy(_locFwd, _locUp, 90)
	var r = cross(_locFwd, _locUp)
	
	// Calculate inverse matrix	
	var minFwd = {_locUp.y * r.z - r.y * _locUp.z, 
		(_locUp.x * r.z - r.x * _locUp.z) * -1, 
		_locUp.x * r.y - r.x * _locUp.y}
	var minUp = {(_locFwd.y * r.z - r.y * _locFwd.z) * -1, 
		_locFwd.x * r.z - r.x * _locFwd.z, 
		(_locFwd.x * r.y - r.x * _locFwd.y) * -1}
	var minR = {_locFwd.y * _locUp.z - _locUp.y * _locFwd.z, 
		(_locFwd.x * _locUp.z - _locUp.x * _locFwd.z) * -1, 
		_locFwd.x * _locUp.y - _locUp.x * _locFwd.y}
	var adjFwd = {minFwd.x, minUp.x, minR.x}
	var adjUp = {minFwd.y, minUp.y, minR.y}
	var adjR = {minFwd.z, minUp.z, minR.z}
	var det = 1 / (_locFwd.x * minFwd.x + _locUp.x * minUp.x + r.x * minR.x)
	var invFwd = det * adjFwd
	var invUp = det * adjUp
	var invR = det * adjR
	
	var newVec = changeVecSpace(_vec, invFwd, invUp, invR, _locPos * -1)
	newVec += _locPos
return newVec

/* Remaps a local vector as a world vector. */
// CORE LOADER
function localVecToWorldVec(_vec, _locFwd, _locUp, _locPos)
	var newVec = changeVecSpaceZFwd(_vec, _locFwd, _locUp, cross(_locFwd, _locUp), {0, 0, 0})
	newVec += _locPos
return newVec

/* Projects world vector to screen postion. */
function worldPosToScreenPos(_worldPos, _camFwd, _camUp, _camPos, _camFov)
	var screenPos = {float_min, float_min}
	var nearClip = 0.25
	var unadjScreenPos = worldVecToLocalVec(_worldPos, _camFwd, _camUp, _camPos)
	
	if unadjScreenPos.z >= nearClip then
		screenPos = {unadjScreenPos.x / (unadjScreenPos.z / 1),
			unadjScreenPos.y / (unadjScreenPos.z / 1),
			1}
		/* These silly calculations allow the screen position to scale with the FOV.
		They were chosen through trial and error and have been tested for FOVs of
		50-110. There's probably a better way to do it, but this works.*/
		var adj = (30 - abs(80 - _camFov)) / 2500
		screenPos = ((screenPos / pow(_camFov, 1.42 - adj)) * {gwidth() / 4, gheight() / 1.3 + adj * 2000, 1}) / {gwidth() / 1280, gheight() / 720}
		screenPos = {gwidth(), gheight()} - ((screenPos + 1) / 2) * {gwidth(), gheight()}
	endif
return {screenPos.x, screenPos.y}

/* Projects screen position to world vector. */
function screenPosToWorldPos(_scrPos, _zDepth, _camFwd, _camUp, _camPos, _camFov)
	var adj = (30 - abs(80 - _camFov)) / 2500
	_scrPos = (_scrPos - {gwidth(), gheight()}) / {gwidth(), gheight()} * -2 - 1
	_scrPos = ((_scrPos * pow(_camFov, 1.42 - adj)) / {gwidth() / 4, gheight() / 1.3 + adj * 2000, 1}) * {gwidth() / 1280, gheight() / 720}
	var locPos = {_scrPos.x * (_zDepth / 1), _scrPos.y * (_zDepth / 1), _zDepth}
return localVecToWorldVec(locPos, _camFwd, _camUp, _camPos)

/* Projects _v onto the line defined by _lineA and _lineB. */
function projectVec(_v, _lineA, _lineB)
return _lineA + dot(_v - _lineA, _lineB - _lineA) / 
		dot(_lineB - _lineA, _lineB - _lineA) * (_lineB - _lineA)

/* Projects a vector onto the plane defined by _planeOrig and _norm. */
// CORE LOADER
function projectVecToPlane(_v, _planeOrig, _norm)
	_norm = safeNormalize(_norm)
	var normDot = dot(_v - _planeOrig, _norm)
return _v - _norm * normDot

/* Finds rotation amount needed to snap an orientation defined by _fwd/_up on 
_axis to to a multiple of _snapAmount. */
function getSnapToDeg(_sign, _axis, _snapAmount, _fwd, _up)
	var zeroed = {0, 0, 1}
	var rot = 0
	var tol = 0.0005
	
	if equals(_axis.x, 0, tol) and equals(_axis.z, 0, tol)  
			and equals(abs(_axis.y), 1, tol) then
		zeroed = {0, 0, 1}
		
		if equals(_fwd.x, 0, tol) and equals(_fwd.z, 0, tol)  
			and equals(abs(_fwd.y), 1, tol) then
			rot = 90
		else
			rot = getAngleBetweenVecs(zeroed, flattenY(_fwd))
		endif
		
		if _axis != _fwd and !equals(axisRotVecBy(zeroed, _axis, rot), flattenY(_fwd), tol) then
			rot *= -1
		else if _axis == _fwd and !equals(axisRotVecBy(zeroed, _axis, rot), _up, tol) then
			rot *= -1
		endif endif
	else
		zeroed = axisRotVecBy(flattenY(_axis), {0, 1, 0}, 90)
		
		if _axis == _fwd then
			zeroed = axisRotVecBy(zeroed, _axis, 90)
			rot = getAngleBetweenVecs(zeroed, _up)
		else
			rot = getAngleBetweenVecs(zeroed, _fwd)
		endif
		
		if _axis != _fwd and !equals(axisRotVecBy(zeroed, _axis, rot), _fwd, tol) then
			rot *= -1
		else if _axis == _fwd and !equals(axisRotVecBy(zeroed, _axis, rot), _up, tol) then
			rot *= -1
		endif endif
	endif
	
	var deg
	
	var roundedRot = roundDec(rot, 1)
	if mod(roundedRot, _snapAmount) != 0 then
		var divRot = rot / _snapAmount
		
		if _sign >= 0 then
			deg = ceil(divRot)
		else
			deg = floor(divRot)
		endif
		
		deg *= _snapAmount - rot
	else
		deg = _snapAmount * _sign
	endif
return deg

// ----------------------------------------------------------------
// DIALOG BOXES

/* 3D UI elements need to adjust their scale based on the current FOV 
using this function. */
function getUiFovScale(_fov)
return _fov / 70

/* Draws a general-purpose UI box that can be filled with whatever or used
as the base for a menu. */
function drawUiBox(_pos, _posExt, _border, _bgAlpha)
	var borderCol
	
	if _border then
		borderCol = {g_theme.inactiveCol.x, g_theme.inactiveCol.y, 
			g_theme.inactiveCol.z, _bgAlpha}
	else
		borderCol = {g_theme.bgCol.x, g_theme.bgCol.y, g_theme.bgCol.z, 
			_bgAlpha}
	endif
	
	box(_pos.x, _pos.y, _posExt.x, _posExt.y, borderCol, 0)
	box(_pos.x + g_menuBorderW, _pos.y + g_menuBorderW, 
		_posExt.x - g_menuBorderW * 2, _posExt.y - g_menuBorderW * 2, 
		{g_theme.bgCol.x, g_theme.bgCol.y, g_theme.bgCol.z, _bgAlpha}, 0)	
return void

/* Shows a graphical color picker that returns the selected color and the 
accept/cancel state. */
function showColorPicker(_col, _showAlpha)
	// Discard alpha data.
	if !_showAlpha and _col.a < 1 then
		_col.a = 1
	endif
	
	var pos = {gwidth() / 4, gheight() / 6}
	var posExt = {gwidth() / 2, gheight() / 1.57}
	var sliderLen = gwidth() / 2 - gwidth() / 16
	var rPos = pos + {gwidth() / 32, gheight() / 16}
	var gPos = rPos + {0, gheight() / 10}
	var bPos = gPos + {0, gheight() / 10}
	var aPos = bPos + {0, gheight() / 10}
	var colPos = aPos + {0, gheight() / 10}
	textSize = g_menuTextSize
	var selItem = 0
	var result = [
		.col = _col,
		.accept = -1
	]
	
	g_kb = getKeyboardBuffer()
	var c = controls(0)
	c = applyKb(c, g_bind.menu).c
	
	var kbResult
	var moveRate
	
	while result.accept == -1 loop
		// Draw stuff that would get drawn in a normal frame cycle
		drawStatusBar()
		if imageSize(g_menuImg) != {1, 1} then
			drawImage(g_menuImg, 0, 0)
		endif
		
		g_kb = getKeyboardBuffer()
		c = controls(0)
		kbResult = applyKb(c, g_bind.menu)
		c = kbResult.c
		
		if menuDirInputStarted(c, kbResult.kbActive) then
			if g_cDat[g_cIdx.lxy].count > 1 then
				moveRate = 0.05
			else
				moveRate = 0.01
			endif
			
			loop if c.ly < -0.3 or c.down then
				if !_showAlpha and selItem <= 1 
						or (_showAlpha and (selItem <= 2 or (selItem == 3 and _col.a <= 0.7))) then
					selItem = int(clamp(selItem + 1, 0, 5))
				else if !_showAlpha and selItem == 2 and _col.z <= 0.7 then
					selItem = 4
				else if (!_showAlpha and selItem == 2)
						or (_showAlpha and selItem == 3) then
					selItem = 5
				endif endif endif
				break endif
			if c.ly > 0.3 or c.up then
				if (!_showAlpha and selItem <= 2) 
						or (_showAlpha and selItem <= 3) then
					selItem = int(clamp(selItem - 1, 0, 4))
				else if !_showAlpha and selItem >= 4 then
					selItem = 2
				else
					selItem = 3
				endif endif
				break endif
			if c.lx > 0.3 or c.right then
				if selItem <= 3 then
					_col[selItem] = clamp(_col[selItem] + moveRate, 0, 1)
				else if selItem == 4 then
					selItem += 1
				endif endif
				break endif
			if c.lx < -0.3 or c.left then
				if selItem <= 3 then
					_col[selItem] = clamp(_col[selItem] - moveRate, 0, 1)
				else if selItem == 5 then
					selItem -= 1
				endif endif
				break
			endif break repeat
		endif
		
		drawUiBox(pos, posExt, true, 1)
		createSlider(
			rPos, 
			sliderLen,
			selItem == 0,
			_col.x,
			"Red   | "
		)
		createSlider(
			gPos, 
			sliderLen,
			selItem == 1,
			_col.y,
			"Green | "
		)
		createSlider(
			bPos, 
			sliderLen,
			selItem == 2,
			_col.z,
			"Blue  | "
		)
		
		if _showAlpha then
			createSlider(
				aPos, 
				sliderLen,
				selItem == 3,
				_col.a,
				"Alpha  | "
			)
		endif
		
		box(
			colPos.x, 
			colPos.y, 
			gheight() / 8, 
			gheight() / 8, 
			_col, 
			false
		)
		
		array buttonPos[2]
		buttonPos[0] = colPos + {gheight() / 2.5, gheight() / 16 - g_menuTextSize / 2}
		buttonPos[1] = buttonPos[0] + {gheight() / 5, 0}
		
		if selItem >= 4 then
			box(buttonPos[selItem - 4].x, buttonPos[selItem - 4].y, textWidth("Cancel"), g_menuTextSize, g_theme.bgSelCol, false)
		endif
		
		drawText(buttonPos[0].x, buttonPos[0].y, g_menuTextSize, 
			ifElse(selItem == 4, g_theme.textSelCol, g_theme.textCol), "Cancel")
		drawText(buttonPos[1].x, buttonPos[1].y, g_menuTextSize, 
			ifElse(selItem == 5, g_theme.textSelCol, g_theme.textCol), "Accept")
		update()
		
		if c.b and !g_cDat[g_cIdx.b].held then
			g_cDat[g_cIdx.b].held = true
			result.accept = 0
		else if !c.b then
			g_cDat[g_cIdx.b].held = false
		endif endif
		
		if c.a and !g_cDat[g_cIdx.a].held then
			g_cDat[g_cIdx.a].held = true
			if selItem == 4 then
				result.accept = 0
			else if selItem == 5 then
				result.accept = 1
			endif endif
		else if !c.a then
			g_cDat[g_cIdx.a].held = false
		endif endif
	repeat
	
	result.col = _col
return result

// Creates a visual slider. _selPos is a value from 0 to 1. */
function createSlider(_pos, _len, _isSel, _selPos, _text)
	textSize(g_menuTextSize)
	var slider
	var lineH = gheight() / 128
	var sliderPos = {_len * _selPos + _pos.x, _pos.y}
	
	var sliderCol
	if _isSel then
		sliderCol = g_theme.bgSelCol
	else
		sliderCol = g_theme.inactiveCol
	endif
	
	box(_pos.x, _pos.y, _len, lineH, g_theme.inactiveCol, false)
	box(
		sliderPos.x - gheight() / 128, 
		sliderPos.y - gheight() / 64, 
		gheight() / 64, 
		gheight() / 32 + lineH, 
		sliderCol, 
		false
	)
	
	drawText(_pos.x, _pos.y + gheight() / 32, g_menuTextSize, g_theme.textCol, _text)
	drawText(_pos.x + textWidth(_text), _pos.y + gheight() / 32, g_menuTextSize, g_theme.textCol, floatToStr(_selPos, 2))
return slider

/* Simple non-scrolling text box without response prompt. Can be dismissed either 
with B/A or with a timer. */
function showNoticeBox(_text, _buttonCancels, _sleepLen)
return showNoticeBox(_text,_buttonCancels, _sleepLen, false, false)

function showNoticeBox(_text, _buttonCancels, _sleepLen, _drawStatusBar, _drawMenu)
	if _drawStatusBar then drawStatusBar() endif
	if _drawMenu and imageSize(g_menuImg) != {1, 1} then
		drawImage(g_menuImg, 0, 0)
	endif
	
	var props = getNoticeBoxProperties(_text, g_dialogTextSize)
	
	var loadBox = drawUiBox(
		props.boxPos, 
		props.boxSize, 
		true, 
		1
	)
	
	drawTextEx(
		_text,
		props.boxPos + {props.edgeSize, props.edgeSize},
		props.textH,
		align_top_left,
		props.targetW,
		0,
		{1, 1},
		g_theme.textCol
	)
	
	if _buttonCancels or _sleepLen then
		update()
		
		var timer = time()
		var c
		
		while time() - timer < _sleepLen or _buttonCancels loop
			g_kb = getKeyboardBuffer()
			c = controls(0)
			c = applyKb(c, g_bind.menu).c
			
			if c.b and !g_cDat[g_cIdx.b].held then
				g_cDat[g_cIdx.b].held = true
				break
			else if !c.b then
				g_cDat[g_cIdx.b].held = false
			endif endif
			
			if c.a and !g_cDat[g_cIdx.a].held then
				g_cDat[g_cIdx.a].held = true
				break
			else if !c.a then
				g_cDat[g_cIdx.a].held = false
			endif endif
		repeat
	endif
return void

/* Returns display size information for _text as formatted for a notice box. */
function getNoticeBoxProperties(_text, _textH)
	var lineCountText = _text
	textSize(_textH)
	var lineResult = getStrLineCount(_text, floor(tWidth() / 1.25))
	var lineCount = lineResult.count
	var textW = lineResult.longest * textWidth(" ")
	var targetW = gwidth() / 1.25
	
	if textW < targetW then
		targetW = textW
	endif
	
	var edgeSize = gheight() / 64
	var boxSize = {
			targetW + edgeSize * 2, 
			lineCount * _textH + edgeSize * 2
		}
	var boxPos = {gwidth() / 2 - boxSize.x / 2, gheight() / 2 - boxSize.y / 2}
	
	var props = [
		.textH = _textH,
		.lineCount = lineCount,
		.textW = textW,
		.targetW = targetW,
		.edgeSize = edgeSize,
		.boxSize = boxSize,
		.boxPos = boxPos
	]
return props

/* Displays loading box with spinning icon and custom text. */
function showLoadBox(_text, _clear)
return showLoadBox(_text, _clear, false, false)

function showLoadBox(_text, _clear, _drawStatusBar, _drawMenu)
	// Never refresh more than once a frame to avoid unneeded update() calls
	if time() - g_lastLoadUpdateTime >= 0.01667 then
		if _clear then
			clear(g_theme.bgCol)
			drawScreenBorder()
		else
			drawObjects()
		endif
		
		if _drawStatusBar then drawStatusBar() endif
		
		if _drawMenu then
			if imageSize(g_menuImg) != {1, 1} then
				drawImage(g_menuImg, 0, 0)
			endif
		endif
		
		var props = getNoticeBoxProperties(_text, g_dialogTextSize)
		initLogoSpr()
		var imgSize = getSpriteImageSize(g_logo.spr)
		var imgScale = (gheight() / imgSize.y) / 8
		imgScale = {imgScale, imgScale}
		props.boxSize = {props.boxSize.x + props.edgeSize + imgSize.x * imgScale.x, 
			props.edgeSize * 2 + imgSize.y * imgScale.y}
		props.boxPos = {gwidth() / 2 - props.boxSize.x / 2, gheight() / 2 - props.boxSize.y / 2}
		
		var loadBox = drawUiBox(
			props.boxPos, 
			props.boxSize, 
			true, 
			1
		)
		
		drawTextEx(
			_text,
			props.boxPos + {props.edgeSize * 2 + imgSize.x * imgScale.x, 
				props.boxSize.y / 2},
			props.textH,
			align_center_left,
			props.textW,
			0,
			{1, 1},
			g_theme.textCol,
			{0, 0}
		)
		
		animLoad((props.boxPos + {props.edgeSize, props.edgeSize}) + (imgSize * imgScale) / 2, 
			imgScale, 1, g_theme.bgCol)
		if !_clear then
			drawSprites()
		endif
		
		update()
		g_lastLoadUpdateTime = time()
	endif
return void

/* Deletes the loading sprite. Needs to be called when a load finishes. */
function removeLoadSpr()
	if g_logo.sprExists then
		removeSprite(g_logo.spr)
		g_logo.frameTime = 0
		g_logo.sprExists = false
	endif
return void

/* Presents relinking options for a deleted object definition.
_context can be 0 (prompt on boot) or 1 (prompt on map load). */
function promptObjDefRelink(ref _in, _delName, _context)
	_in = [
		.bank = -1,
		.idx = -1,
		.name = "",
		.isMerged = true
	]
	var mergedResult = [ .idx = 2, .text = "" ]
	var scopeResult = [ .idx = 0, .text = "" ]
	
	var lines
	var action
	var bankIdx
	var delInfo
	var objDefResult
	var repDef
	
	while !mergedResult.idx or !scopeResult.idx loop
		getRelinkList(lines, _delName)
		lines = insertArray(lines, 
			[
				"Delete all references to '" + _delName + "' without relinking"
			], 
			0)
			
		relinkResult = promptList(
			lines, 
			[
				"'" + _delName + "' has been renamed or removed.",
				"Relink references to the missing object" + ifElse(_context, " in '" + g_currentMapName + ":'", ":")
			]
		)
		
		mergedResult = [ .idx = 2, .text = "" ]
		bankIdx = [ .bank = -1, .idx = -1 ]
		
		if relinkResult.idx == 0 then
			action = "deleted without relinking."
		else
			bankIdx = getObjDefBankIdx(relinkResult.text)
			
			if len(g_obj[bankIdx.bank][bankIdx.idx].children) then
				mergedResult = promptList(
					["Cancel", "Yes, unmerge '" + relinkResult.text + "'", "No, leave '" + relinkResult.text +"' merged"], 
					[
						"'" + relinkResult.text + "' is a merged object definition.",
						"Would you like to unmerge it when replacing '" + _delName + "?'"
					]
				)
			endif
			
			action = "relinked to '" + relinkResult.text + ifElse(mergedResult.idx == 1, "' (unmerged).", "'.")
		endif
		
		var scopeOptions
		
		if _context then
			scopeOptions = ["Cancel", "In '" + g_currentMapName + "' only", "In all maps"]
		else
			scopeOptions = ["Cancel", "In object definitions only", "In object definitions and in all maps"]
		endif
		
		if mergedResult.idx then
			scopeResult = promptList(
				scopeOptions, 
				[
					"'" + _delName + "' will be " + action,
					"What scope do you want for this action?"
				]
			)
			
			if scopeResult.idx then
				delInfo = [ .bank = -1, .idx = -1, .name = _delName ]
				
				if relinkResult.idx == 0 then // No relink
					delInfo = getAllObjDefDeletions(delInfo)
					objDefResult = [ .changedDefs = [] ]
					
					if !_context then
						objDefResult = resolveObjDefDeletionForObjDefs(delInfo, [])
					endif
					
					/* Remove first element because it was never in g_obj
					in the first place. */
					removeObjDef(remove(delInfo, 0))
					
					if scopeResult.idx == 2 then
						removeObjInMaps(_delName, objDefResult.changedDefs, [ g_currentMapName ])
					endif
				else // Relink
					repDef = activeFromObjDef(bankIdx.bank, bankIdx.idx)
					objDefResult = [ .changedDefs = [] ]
					
					if !_context then
						if mergedResult.idx == 1 then
							objDefResult = resolveObjDefDeletionForObjDefs(delInfo, unmergeObj(repDef))
						else
							objDefResult = resolveObjDefDeletionForObjDefs(delInfo, [ repDef ])
						endif
					endif
					
					if scopeResult.idx == 2 then
						replaceObjInMaps(_delName, repDef, objDefResult.changedDefs, 
							mergedResult.idx == 1, [ g_currentMapName ])
					endif
					
					_in.bank = bankIdx.bank
					_in.idx = bankIdx.idx
					_in.name = repDef.name
					_in.isMerged = mergedResult.idx != 1
				endif
				
				if _context then
					g_dirtyMap = true
				endif
			endif
		endif
	repeat
return _in

/* Displays a scrollable list from which a selection can be made. */
function promptList(_lines, _promptLines)
	var result = [
		.idx = -1,
		.text = ""
	]
	
	textSize(g_dialogTextSize)
	var borderSizeY = 1
	var borderSizeX = borderSizeY * 2
	var selLine = 0
	var viewLine = 0
	var headerH = len(_promptLines) + 1 + borderSizeY
	var viewH = tHeight() - headerH - borderSizeY
	var scrollW = 0
	var needScroll = len(_lines) > viewH
	
	if needScroll then
		scrollW = 2
	endif
	
	g_kb = getKeyboardBuffer()
	var c = controls(0)
	c = applyKb(c, g_bind.menu).c
	
	var kbResult
	var maxLine
	var i
	
	while !c.a or g_cDat[g_cIdx.a].held == true loop
		clear(g_theme.bgCol)
		g_kb = getKeyboardBuffer()
		c = controls(0)
		kbResult = applyKb(c, g_bind.menu)
		c = kbResult.c
		
		if menuDirInputStarted(c, kbResult.kbActive) then
			if c.ly < -0.3 or c.down then
				selLine = min(selLine + 1, len(_lines) - 1)
			else if c.ly > 0.3 or c.up then
				selLine = max(selLine - 1, 0)
			endif endif
		endif
		
		if selLine >= viewLine + viewH then
			viewLine = min(viewLine + viewH - 1, len(_lines) - 1)
		else if selLine <= viewLine and viewLine > 0 then
			viewLine = max(viewLine - viewH + 1, 0)
		endif endif
		
		maxLine = min(viewLine + viewH, len(_lines) - 1)
		ink(g_theme.textCol)
		
		for i = 0 to len(_promptLines) loop
			printAt(borderSizeX, i + borderSizeY, _promptLines[i])
		repeat
		
		if needScroll then
			printAt(borderSizeX, headerH + getScroll(len(_lines), viewLine, viewH), "*")
		endif
		
		for i = viewLine to maxLine + 1 loop
			if i == selLine then 
				ink(g_theme.bgSelCol)
				printAt(scrollW + borderSizeX, headerH + i - viewLine, ">")
				printAt(2 + scrollW + borderSizeX, headerH + i - viewLine, _lines[i])
			else ink(g_theme.textCol)
				printAt(2 + scrollW + borderSizeX, headerH + i - viewLine, _lines[i])
			endif
		repeat
		
		if c.a and !g_cDat[g_cIdx.a].held then
			ink(g_theme.textCol)
			clear(g_theme.bgCol)
			result.idx = int(selLine)
			result.text = _lines[selLine]
		else if !c.a then
			g_cDat[g_cIdx.a].held = false
		endif endif
		
		drawScreenBorder()
		update()
	repeat
	
	g_cDat[g_cIdx.a].held = true
return result

/* Displays map save prompt; alerts user if the name already exists. */
function promptForSaveName(_file)
	var mapNames = getMapNames(_file)
	var newName = ""
	var promptForName = true
	var overwrite
	
	while promptForName loop
		promptForName = false
		while !len(newName) loop
			newName = input("New map name", false)
		repeat
		if contains(mapNames, newName) then
			overwrite = promptList(
				["No", "Yes", "Cancel"],
				["A map named '" + newName + "' already exists.", "Overwrite?"]
			)
			if overwrite.idx == 0 then
				promptForName = true
				newName = ""
			else if overwrite.idx == 2 then
				newName = ""
				break
			endif endif
		endif
	repeat
return newName

/* Gets scrollbar's progress through a passage of text. */
function getScroll(_lineCount, _lineIdx, _viewHeight)
	var scrollProgress = _lineIdx / (_lineCount - _viewHeight)
	var scroll = round(min(scrollProgress, 1) * _viewHeight)
return scroll

/* Displays a full-screen text box that can be scrolled if the text exceeds the 
screen height. A/B to dismiss the box. */
function showScrollText(_text)
	g_kb = getKeyboardBuffer()
	var c = controls(0)
	c = applyKb(c, g_bind.menu).c
	
	textSize(g_dialogTextSize)
	var borderSizeY = 1
	var borderSizeX = borderSizeY * 2
	var viewLine = 0
	var viewH = tHeight() - borderSizeY * 2
	var scrollW = borderSizeX * textWidth(" ")
	var lineCount = getStrLineCount(_text, tWidth() - borderSizeX * 2).count
	var needScroll = lineCount > viewH
	
	if needScroll then
		lineCount = getStrLineCount(_text, tWidth() - borderSizeX * 2 - 2).count
		scrollW += textWidth("* ")
	endif
	
	ink(g_theme.textCol)
	
	var lineMov
	var movInc
	
	loop
		clear(g_theme.bgCol)
		
		g_kb = getKeyboardBuffer()
		c = controls(0)
		c = applyKb(c, g_bind.menu).c
		
		if needScroll then
			printAt(borderSizeX, borderSizeY + getScroll(lineCount, viewLine, viewH), "*")
		endif
		
		lineMov = 0
		
		if scrollInputStarted(c) then
			movInc = floor(viewH / 5)
			lineMov = round(c.ly * movInc + c.ry * 30 + c.up * movInc - c.down * movInc)
		endif
		
		viewLine = clamp(viewLine - lineMov, 0, lineCount - viewH)
		
		drawTextEx(_text, {scrollW, (-viewLine - 1) * g_dialogTextSize + g_dialogTextSize * borderSizeY * 2}, g_dialogTextSize, 
			align_top_left, gwidth() - scrollW - g_dialogTextSize * borderSizeX, 0, {1, 1}, g_theme.textCol)
		box(0, 0, gwidth(), borderSizeY * g_dialogTextSize, g_theme.bgCol, false)
		box(0, gheight() - borderSizeY * g_dialogTextSize, gwidth(), borderSizeY * g_dialogTextSize, g_theme.bgCol, false)
		
		drawScreenBorder()
		update()
		
		if c.b and !g_cDat[g_cIdx.b].held then
			g_cDat[g_cIdx.b].held = true
			break
		else if !c.b then
			g_cDat[g_cIdx.b].held = false
		endif endif
		
		if c.a and !g_cDat[g_cIdx.a].held then
			g_cDat[g_cIdx.a].held = true
			break
		else if !c.a then
			g_cDat[g_cIdx.a].held = false
		endif endif
	repeat
return void

/* Draws a thin border around the edge of the screen. Use this to match full-screen 
borders to those of boxes drawn with drawUiBox(). */
function drawScreenBorder()
	box(0, 0, gwidth(), g_menuBorderW * 2, g_theme.inactiveCol, false)
	box(0, gheight() - g_menuBorderW * 2, gwidth(), g_menuBorderW * 2, g_theme.inactiveCol, false)
	box(0, 0, g_menuBorderW * 2, gheight(), g_theme.inactiveCol, false)
	box(gwidth() - g_menuBorderW * 2, 0, g_menuBorderW * 2, gheight(), g_theme.inactiveCol, false)
return void

/* Prompts user to save the map if the map has been changed. */
function showUnsavedPrompt()
	var mapName = ifElse(len(g_currentMapName), g_currentMapName, "untitled")
	confirmPrompt = promptList(
		[
			"Cancel",
			"Yes, save it",
			"Yes, save it with a new name",
			"No, don't save it"
		], 
		[
			"The current map ('" + mapName + "') has unsaved changes.",
			"Do you want to save it?"
		]
	)
return confirmPrompt

/* Logo/load sprite doesn't always apply theme colors the same way. This function decides the 
correct colors for the sprite. */
function getSprThemeCol()
	var fillCol = g_theme.inactiveCol
	var outlineCol = g_theme.textCol
	
	if fillCol == outlineCol then
		fillCol = g_theme.textSelCol
		outlineCol = g_theme.bgSelCol
	endif
	
	result = [
		.fill = fillCol,
		.outline = outlineCol
	]
return result

/* Displays the Celqi splash screen. */
function showSplash(_length)
	var rStick = false
	var timer = 0
	var sprCol = getSprThemeCol()
	
	initLogoSpr()
	initLogoTextSpr()
	
	var sprScale = {(gwidth() / 5) / 32, (gwidth() / 5) / 32}
	setSpriteScale(g_logo.spr, sprScale)
	setSpriteLocation(g_logo.spr, {gwidth() / 5 + 16 * sprScale.x, gheight() / 2})
	setSpriteColor(g_logo.spr, {1, 1, 1, 0})
	setSpriteScale(g_logo.textSpr, sprScale)
	setSpriteLocation(g_logo.textSpr, {gwidth() / 5 + (getSpriteImageSize(g_logo.textSpr).x / 2) 
		* sprScale.x + 32 * sprScale.x, gheight() / 2})
	setSpriteColor(g_logo.textSpr, {1, 1, 1, 0})
	
	var c
	
	while (timer < _length) loop
		clear(g_theme.bgCol)
		c = controls(0)
		
		// Spin the seal with the right stick :)
		if c.rx or c.ry then
			if !rStick then
				rStick = true
			endif
			
			aimLoad({c.rx, -c.ry})
		endif
		
		drawSprite(g_logo.spr)
		drawSprite(g_logo.textSpr)
		
		if timer < 0.75 then
			setSpriteColor(g_logo.spr, {1, 1, 1, interpolate(expo_in, 0, 1, timer / 0.75)})
			setSpriteColor(g_logo.textSpr, {1, 1, 1, interpolate(expo_in, 0, 1, timer / 0.75)})
		else if timer > _length - 0.75 then
			setSpriteColor(g_logo.spr, {1, 1, 1, interpolate(expo_in, 0, 1, (_length - timer) / 0.75)})
			setSpriteColor(g_logo.textSpr, {1, 1, 1, interpolate(expo_in, 0, 1, (_length - timer) / 0.75)})
		else
			setSpriteColor(g_logo.spr, {1, 1, 1, 1})
			setSpriteColor(g_logo.textSpr, {1, 1, 1, 1})
		endif endif
		
		if timer >= 1 and timer < 2.5 and !rStick then
			animLoad(getSpriteLocation(g_logo.spr), sprScale, 1, g_theme.bgCol)
		endif
		
		drawScreenBorder()
		update()
		timer += time() - timer
	repeat
	
	setSpriteColor(g_logo.spr, {1, 1, 1, 1})
	removeSprite(g_logo.textSpr)
	g_logo.textSprExists = false
return void

/* Shows the spinning load animation. */
function animLoad(_pos, _scale)
return animLoad(_pos, _scale, 0, {0, 0, 0, 1})

/*
_updateMode:
	0 = don't update screen
	1 = update sprite, clear locally with _col
	2 = update sprite, clear full screen with _col
*/
function animLoad(_pos, _scale, _updateMode, _col)
	if !g_logo.sprExists then
		setSpriteImage(g_logo.spr, g_logo.img[0])
	endif
	
	setSpriteLocation(g_logo.spr, _pos)
	setSpriteScale(g_logo.spr, _scale)
	
	if (g_logo.frame == 0 and round(getSpriteRotation(g_logo.spr)) % 360 == 0 and time() - g_logo.frameTime >= 0.75)
			or ((g_logo.frame != 0 or round(getSpriteRotation(g_logo.spr)) % 360 != 0) and time() - g_logo.frameTime >= 0.1) 
			then
		// Can't animate with tiles because we're loading images from code.
		g_logo.frame = (g_logo.frame + 1) % 2
		setSpriteImage(g_logo.spr, g_logo.img[g_logo.frame])
		
		if g_logo.frame == 0 then
			setSpriteRotation(g_logo.spr, getSpriteRotation(g_logo.spr) + 90)
		endif
		
		g_logo.frameTime = time()
		
		if _updateMode then
			if _updateMode == 1 then
				var boxDim = {32 * g_logo.spr.xscale, 32 * g_logo.spr.yscale}
				box(g_logo.spr.x - boxDim.x / 2, g_logo.spr.y - boxDim.y / 2, 
					boxDim.x, boxDim.y, _col, false)
			else
				clear(_col)
			endif
		endif
	endif
	
	if _updateMode then
		drawSprite(g_logo.spr)
	endif
return void

/* Just for fun, rotates the load sprite based on directional input. */
function aimLoad(_dir)
	if _dir != {0, 0} then
		var snapDir = snapAngle(_dir, 8)
		if round(snapDir) % 90 == 0 then
			g_logo.frame = 0
		else
			g_logo.frame = 1
		endif
		
		setSpriteImage(g_logo.spr, g_logo.img[g_logo.frame])
		
		if g_logo.frame == 0 then
			setSpriteRotation(g_logo.spr, -snapDir + 90)
		else
			setSpriteRotation(g_logo.spr, -snapDir + 45)
		endif
	endif
return void

/* If map hasn't been named yet, prompts the user for a name. */
function showSave()
	var mapFile = openFile()
	var cancelSave = false
	
	if g_currentMapName == "" then
		var newName = promptForSaveName(mapFile)
		if newName == "" then
			cancelSave = true
		else
			g_currentMapName = newName
		endif
	endif
	
	if !cancelSave then
		writeObjMap(mapFile, g_currentMapName)
		g_dirtyMap = false
	endif
	
	closeFile(mapFile)
return !cancelSave

/* Prompts the user for a map name even if the map already has a name. */
function showSaveAs()
	var mapFile = openFile()
	var newName = promptForSaveName(mapFile)
	
	if newName != "" then
		g_currentMapName = newName
		writeObjMap(mapFile, g_currentMapName)
		g_dirtyMap = false
	endif
	
	closeFile(mapFile)
return newName != ""

/* Scolds the user if more than one object definition has the same name. */
function confirmUniqueDefNames()
	array conflicts[0]
	var i
	var j
	var k
	var l
	
	for i = 0 to len(g_obj) loop
		for j = 0 to len(g_obj[i]) loop
			for k = 0 to len(g_obj) loop
				for l = 0 to len(g_obj[k]) loop
					if g_obj[i][j].name == g_obj[k][l].name 
							and (i != k or j != l) then
						if !contains(conflicts, g_obj[i][j].name) then
							conflicts = push(conflicts, g_obj[i][j].name)
						endif
					endif
				repeat
			repeat
		repeat
	repeat
	
	if len(conflicts) then
		var conflictsText = ""
		array plural[2]
		
		for i = 0 to len(conflicts) loop
			conflictsText += "  '" + conflicts[i] + "'" + chr(10)
		repeat
		
		if len(conflicts) == 1 then
			plural[0] = "name is"
			plural[1] = ""
		else
			plural[0] = "names are"
			plural[1] = "s"
		endif
		
		showScrollText(
"ERROR: The following " + plural[0] + " used for multiple object definitions:

" + conflictsText + "
Each object definition must have a unique name. Please close Celqi, resolve the name conflict" + plural[1] + " by editing the object definitions in the getModels() function, and then relaunch Celqi.

Press (+)/F5 to close Celqi."
)
		// Freeze and force user to exit and resolve the name conflict
		loop
		repeat
	endif
return void

/* Shows total object count and number of each object used. */
function showMapStats()
	var i
	var j
	var objCount = 0
	var name
	var nameIdx
	array objNames[0]
	array objNamesTextArr[0]
	var objNamesText = ""
	
	for i = 0 to len(g_cell) loop
		for j = g_cellObjStart to len(g_cell[i]) loop
			if !isMapObjRef(-1, g_cell[i][j]) then
				objCount += 1
				getMapObjName(name, g_cell[i][j])
				nameIdx = findAtSubIdx(objNames, name, 0)
				
				if nameIdx < 0 then
					objNames = push(objNames, [ name, 1 ])
					objNamesTextArr = push(objNamesTextArr, getMapStatsObjName(g_cell[i][j]))
				else
					objNames[nameIdx][1] += 1
				endif
			endif
		repeat
	repeat
	
	objNamesTextArr = alphabetize(objNamesTextArr)
	var statText = ""
	var newLineIdx
	
	for i = 0 to len(objNamesTextArr) loop
		newLineIdx = find(objNamesTextArr[i], chr(10))
		nameIdx = findAtSubIdx(objNames, objNamesTextArr[i][:newLineIdx - 1], 0)
		statText += "(" + objNames[nameIdx][1] + ") " + objNamesTextArr[i]
	repeat
	
	var mapExt = getMapExt()
	mapExtStr = floatToStr(abs(mapExt.hi.x - mapExt.lo.x), 0) + " x " + floatToStr(abs(mapExt.hi.y - mapExt.lo.y), 0) 
		+ " x " + floatToStr(abs(mapExt.hi.z - mapExt.lo.z), 0)
	
	statText = "Map: " + g_currentMapName + chr(10) + "Cell count: " + str(len(g_cell)) + chr(10) + 
		"Map dimensions: " + mapExtStr + chr(10) + 
		"Object count: " + str(objCount) + chr(10) + chr(10) + statText
	
	showScrollText(statText)
return void

/* Gets formatted object information for getMapStats(). */
function getMapStatsObjName(_obj)
return getMapStatsObjName(_obj, 0)

function getMapStatsObjName(_obj, _tabDepth)
	var name
	getMapObjName(name, _obj)
	
	if len(_obj.children) then
		name += chr(10)
		
		var i
		var j
		array nameTextArr[0]
		array nameArr[0][0]
		var childName
		var nameIdx
		
		for i = 0 to len(_obj.children) loop
			getMapObjName(childName, _obj.children[i])
			nameIdx = findAtSubIdx(nameArr, childName, 0)
			
			if nameIdx < 0 then
				nameArr = push(nameArr, [ childName, 1])
				nameTextArr = push(nameTextArr, getMapStatsObjName(_obj.children[i], _tabDepth + 1))
			else
				nameArr[nameIdx][1] += 1
			endif
		repeat
		
		nameTextArr = alphabetize(nameTextArr)
		var newLineIdx
		var tabs = ""
		
		for i = 0 to _tabDepth + 1 loop
			tabs += chr(9)
		repeat
		
		for i = 0 to len(nameTextArr) loop
			newLineIdx = find(nameTextArr[i], chr(10))
			nameIdx = findAtSubIdx(nameArr, nameTextArr[i][:newLineIdx - 1], 0)
			name += tabs + "(" + nameArr[nameIdx][1] + ") " + nameTextArr[i]
		repeat
	else
		name += chr(10)
	endif
return name

// ----------------------------------------------------------------
// OBJECT FUNCTIONS

	// ----------------------------------------------------------------
	// EXTENT

/* Builds extent data for an object. Reflects actual object hitbox within 
a margin of error. */
// CORE LOADER
function getObjExtent(_obj, _pos)
return getObjExtent(_obj, _pos, {1, 1, 1}, {0, 0, 1}, {0, 1, 0}, 0.001)

function getObjExtent(_obj, _pos, _scale, _fwd, _up, _res)
	setObjectPos(_obj, {0, 0, 0})
	setObjectScale(_obj, {1, 1, 1})
	setObjRot(_obj, {0, 0, 0}, {0, 0, 1}, {0, 1, 0})
	extent ext
	
	var startResult = findObjExtStartSize(_obj, {0, 0, 0})
	if startResult.isValid then
		ext = findAllObjExtDirs(_obj, {0, 0, 0}, startResult.colBox, startResult.scale, _res)
	else
		ext = [
			.lo = {-0.5, -0.5, -0.5},
			.hi = {0.5, 0.5, 0.5}
		]
	endif
	
	removeObject(startResult.colBox)
	setObjectPos(_obj, _pos)
	setObjectScale(_obj, _scale)
	setObjRot(_obj, _pos, _fwd, _up)
return ext

/* When finding an object's extent, we first need to know where the object is
in relation to its origin. This function creates a cube at the origin and
expands it until it collides with the object. */
// CORE LOADER
function findObjExtStartSize(_obj, _pos)
	var colBoxScale = {0, 0, 0}
	var colBox = placeObject(cube, _pos, colBoxScale)
	var hit = false
	var scaleLimit = 10
	
	while !hit and colBoxScale.x < scaleLimit loop
		colBoxScale += {1, 1, 1}
		setObjectScale(colBox, colBoxScale)
		hit = objectIntersect(colBox, _obj)
	repeat
	
	result = [
		.colBox = colBox,
		.scale = colBoxScale,
		.isValid = hit
	]
return result

/* Moves the collision box found by findObjExtStartSize() in a given direction
until it no longer intersects _obj, which tells us _obj's extent in that
direction. */
// CORE LOADER
function findObjExtDir(_obj, _pos, _colBox, _colBoxScale, _dir, _res)
	// Assume true to begin because findObjExtStartSize() succeeded
	var hit = true
	var colBoxPos = _pos
	var loopCount = 0
	
	while hit loop
		colBoxPos += _dir * _res
		setObjectPos(_colBox, colBoxPos)
		hit = objectIntersect(_colBox, _obj)
		loopCount += 1
	repeat
	
	var dirExt = colBoxPos + (_dir * -1 * _colBoxScale)
		* {abs(_dir.x), abs(_dir.y), abs(_dir.z)}
return dirExt

/* Finds an object's extents in all cardinal directions. */
// CORE LOADER
function findAllObjExtDirs(_obj, _pos, _colBox, _colBoxScale, _res)
	extent ext
	
	ext.lo = findObjExtDir(_obj, _pos, _colBox, _colBoxScale, {-1, 0, 0}, _res)
		+ findObjExtDir(_obj, _pos, _colBox, _colBoxScale, {0, -1, 0}, _res)
		+ findObjExtDir(_obj, _pos, _colBox, _colBoxScale, {0, 0, -1}, _res)
	ext.hi = findObjExtDir(_obj, _pos, _colBox, _colBoxScale, {1, 0, 0}, _res)
		+ findObjExtDir(_obj, _pos, _colBox, _colBoxScale, {0, 1, 0}, _res)
		+ findObjExtDir(_obj, _pos, _colBox, _colBoxScale, {0, 0, 1}, _res)
return ext

/* Gets the center position within an extent. */
// CORE LOADER
function getExtCenter(_ext)
	var ctr = {(_ext.hi.x + _ext.lo.x) / 2,
		(_ext.hi.y + _ext.lo.y) / 2,
		(_ext.hi.z + _ext.lo.z) / 2}
return ctr

/* Gets the longest dimension of an extent. */
// CORE LOADER
function getMaxDim(_ext)
return getMaxDim(_ext, {1, 1, 1})

function getMaxDim(_ext, _scale)
	var h = (_ext.hi.y - _ext.lo.y) * _scale.y
	var w = (_ext.hi.z - _ext.lo.z) * _scale.z
	var d = (_ext.hi.x - _ext.lo.x) * _scale.x
	var maxDim = h
	
	if w > maxDim then
		maxDim = w
	endif
	
	if d > maxDim then 
		maxdim = d
	endif
return maxDim

/* Gets the shortest dimension of an extent. */
// CORE LOADER
function getMinDim(_ext)
return getMinDim(_ext, {1, 1, 1})

function getMinDim(_ext, _scale)
	var h = (_ext.hi.y - _ext.lo.y) * _scale.y
	var w = (_ext.hi.z - _ext.lo.z) * _scale.z
	var d = (_ext.hi.x - _ext.lo.x) * _scale.x
	var minDim = h
	
	if w < minDim then
		minDim = w
	endif
	
	if d < minDim then 
		mindim = d
	endif
return minDim

/* Gets the corners of a scaled and rotated extent. */
// CORE LOADER
function getExtPoints(_ext, _scale, _fwd, _up)
	var r = safeNormalize(cross(_fwd, _up))
	var dim = {(_ext.hi.x - _ext.lo.x) * _scale.x,
		(_ext.hi.y - _ext.lo.y) * _scale.y,
		(_ext.hi.z - _ext.lo.z) * _scale.z}
	var loPos = localVecToWorldVec(_ext.lo * _scale, _fwd, _up, {0, 0, 0})
	var points = [
		loPos,
		loPos + r * -dim.x,
		loPos + _up * dim.y,
		loPos + r * -dim.x + _up * dim.y,
		loPos + _fwd * dim.z,
		loPos + _fwd * dim.z + r * -dim.x,
		loPos + _fwd * dim.z + _up * dim.y,
		loPos + _fwd * dim.z + _up * dim.y + r * -dim.x
	]
return points

/* Gets an extent's minimum and maximum on a single axis. Used for intersection
calculations. */
function getExtMinMaxOnAxis(_ext, _scale, _fwd, _up, _axis)
	var points = getExtPoints(_ext, _scale, _fwd, _up)
	var minMax = [
		.lo = float_max,
		.hi = float_min
	]
	
	var i
	var proj
	var sign
	
	for i = 0 to len(points) loop
		proj = projectVec(points[i], {0, 0, 0}, _axis)
		sign = getSign(dot(proj, _axis))
		
		if length(proj) * sign < minMax.lo then
			minMax.lo = length(proj) * sign
		endif
		
		if length(proj) * sign > minMax.hi then
			minMax.hi = length(proj) * sign
		endif
	repeat
return minMax

/* Gets the min and max values for each axis for a scaled, rotated extent. */
// CORE LOADER
function getExtMinMax(_ext, _scale, _fwd, _up)
	var minMax = [
		.lo = {
			float_max,
			float_max,
			float_max
		},
		.hi = {
			float_min,
			float_min,
			float_min
		}
	]
	var points = getExtPoints(_ext, _scale, _fwd, _up)
	
	var i
	var j
	
	for i = 0 to len(points) loop
		for j = 0 to 3 loop
			if points[i][j] < minMax.lo[j] then
				minMax.lo[j] = points[i][j]
			endif
			
			if points[i][j] > minMax.hi[j] then
				minMax.hi[j] = points[i][j]
			endif
		repeat
	repeat
return minMax

/* Checks if two scaled, roated, positioned extents intersect. */
function getExtIntersect(_ext1, _pos1, _scale1, _fwd1, _up1, 
		_ext2, _pos2, _scale2, _fwd2, _up2)
	var axis = [
		_fwd1,
		_up1,
		cross(_fwd1, _up1),
		_fwd2,
		_up2,
		cross(_fwd2, _up2)
	]
	var collision = true
	
	var i
	var minMax1
	var minMax2
	var projPos1
	var projPos2
	
	for i = 0 to len(axis) loop
		minMax1 = getExtMinMaxOnAxis(_ext1, _scale1, _fwd1, _up1, axis[i])
		minMax2 = getExtMinMaxOnAxis(_ext2, _scale2, _fwd2, _up2, axis[i])
		projPos1 = projectVec(_pos1, {0, 0, 0}, axis[i])
		projPos1 = length(projPos1) * getSign(dot(projPos1, axis[i]))
		projPos2 = projectVec(_pos2, {0, 0, 0}, axis[i])
		projPos2 = length(projPos2) * getSign(dot(projPos2, axis[i]))
		
		if minMax1.lo + projPos1 > minMax2.hi + projPos2 
				or minMax2.lo + projPos2 > minMax1.hi + projPos1 then
			collision = false
			break
		endif
	repeat
return collision

/* Builds an extent that includes multiple objects. */
function getGroupExt(_children)
	var grpExt = [
		.lo = {
			float_max,
			float_max,
			float_max
		},
		.hi = {
			float_min,
			float_min,
			float_min
		}
	]
	
	var i
	for i = 0 to len(_children) loop
		grpExt = addObjectToGrpExt(grpExt, _children[i])
	repeat
return grpExt

/* Recalculates extent to include an additional object. */
function addObjectToGrpExt(_grpExt, _obj)
	var inSitu = getExtMinMax(getObjDef(-1, _obj).ext, 
		_obj.scale, _obj.fwd, _obj.up)
	inSitu.lo += _obj.pos
	inSitu.hi += _obj.pos
	
	var i
	for i = 0 to 3 loop
		if inSitu.lo[i] < _grpExt.lo[i] then
			_grpExt.lo[i] = inSitu.lo[i]
		endif
		if inSitu.hi[i] > _grpExt.hi[i] then
			_grpExt.hi[i] = inSitu.hi[i]
		endif
	repeat
return _grpExt

/* Fully rebuilds extent for a merged object by referring only to extent data 
from the underlying unmerged objects instead of pulling cached extent data from
underlying merged objects. Used in cases where we aren't sure which merged object 
definitions have accurate extent data. */
function rebuildMergedObjExt(_obj)
	var grpExt = [
		.lo = {
			float_max,
			float_max,
			float_max
		},
		.hi = {
			float_min,
			float_min,
			float_min
		}
	]
	
	var i
	for i = 0 to len(_obj.children) loop
		grpExt = rebuildMergedObjExt(_obj.children[i], grpExt)
	repeat
return grpExt

function rebuildMergedObjExt(_obj, _grpExt)
	if !len(_obj.children) then
		_grpExt = addObjectToGrpExt(_grpExt, _obj)
	endif

	var i
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = applyGrpTransform(_obj.children[i], _obj, true, true)
		_grpExt = rebuildMergedObjExt(_obj.children[i], _grpExt)
	repeat
return _grpExt

/* Returns the extent of the loaded map. */
function getMapExt()
	var i
	var minDim = {float_max, float_max, float_max}
	var maxDim = {float_min, float_min, float_min}
	
	for i = 0 to len(g_cell) loop
		if g_cell[i][0].x < minDim.x then minDim.x = g_cell[i][0].x endif
		if g_cell[i][0].y < minDim.y then minDim.y = g_cell[i][0].y endif
		if g_cell[i][0].z < minDim.z then minDim.z = g_cell[i][0].z endif
		
		if g_cell[i][0].x > maxDim.x then maxDim.x = g_cell[i][0].x endif
		if g_cell[i][0].y > maxDim.y then maxDim.y = g_cell[i][0].y endif
		if g_cell[i][0].z > maxDim.z then maxDim.z = g_cell[i][0].z endif
	repeat
	
	minDim += g_cellExt.lo
	maxDim += g_cellExt.hi
	
	var ext = [
		.lo = minDim,
		.hi = maxDim
	]
return ext

	// ----------------------------------------------------------------
	// OBJECT DEFINITIONS

/* Returns total number of object definitions in g_obj. */
function countObjDefs()
	var count = 0
	var i
	var j
	
	for i = 0 to len(g_obj) loop
		for j = 0 to len(g_obj[i]) loop
			count += 1
		repeat
	repeat
return count

/* Returns an active built from an object definition. */
// CORE LOADER
function activeFromObjDef(_bank, _idx)
return activeFromObjDef(_bank, _idx, true, false, -1)

function activeFromObjDef(_bank, _idx, _createModel)
return activeFromObjDef(_bank, _idx, _createModel, false, -1)

function activeFromObjDef(_bank, _idx, _createModel, _useDef, _def)
	if !_useDef then
		_def = g_obj[_bank][_idx]
	endif
	
	active act
	act.pos = {0, 0, 0}
	act.scale = {1, 1, 1}
	act.fwd = {0, 0, 1}
	act.up = {0, 1, 0}
	act.bankIdx = encodeBankIdx(_bank, _idx)
	act.children = _def.children
	
	if len(act.children) then
		act.col = {-1, -1, -1, -1}
		act.mat = {-1, -1, -1}
	else
		act.col = {1, 1, 1, 1}
		act.mat = {0, 1, 0}
	endif
	
	if _createModel then
		act.obj = _def.obj
	else
		act.obj = -1
	endif
	
	var i
	var newChild
	
	for i = 0 to len(_def.children) loop
		newChild = activeFromObjDef(decodeBank(-1, act.children[i].bankIdx), 
			decodeIdx(-1, act.children[i].bankIdx), _createModel, false, -1)
		/* Children have saved material data, but activeFromObjDef() initializes a default, 
		so overwrite that default with the data saved in the parent. */
		newChild.col = act.children[i].col
		newChild.mat = act.children[i].mat
		act.children[i].children = newChild.children
	repeat
	
	act.lights = _def.lights
return act

/* Strips the top level container in a merged object and return its children. */
function unmergeObjDef(_bank, _idx)
return unmergeObj(g_obj[_bank][_idx])

/* Bank and index aren't saved into an object definition. Finds the bank and index
of the definition matching _name. */
// CORE LOADER
function getObjDefBankIdx(_name)
	var result = [
		.bank = -1,
		.idx = -1
	]
	
	var i
	var j
	
	for i = 0 to len(g_obj) loop
		for j = 0 to len(g_obj[i]) loop
			if g_obj[i][j].name == _name then
				result.bank = i
				result.idx = j
				
				break
			endif
		repeat
		if result.bank != -1 then break endif
	repeat
return result

/* Checks whether a given object type exists within an object definition's 
child structure. */
function isObjInObjDef(ref _in, _name, _def)
	_in = false
	var mapObjName
	
	if _def.name == _name then
		_in = true
	else
		var i
		for i = 0 to len(_def.children) loop
			getMapObjName(mapObjName, _def.children[i])
			
			if mapObjName == _name then
				_in = true
			else
				var objDef
				getObjDef(objDef, _def.children[i])
				isObjInObjDef(_in, _name, objDef)
			endif
			
			if _in then break endif
		repeat
	endif
return _in

/* Returns a list of definitions that are candidates for relinking missing 
definition _name. If a definition contains an instance of _name, it can't be 
used to relink _name. */
function getRelinkList(ref _in, _name)
	array list[0]
	_in = list
	
	var i
	var j
	
	for i = 1 to len(g_obj) loop
		for j = 0 to len(g_obj[i]) loop
			var inDef
			isObjInObjDef(inDef, _name, g_obj[i][j])
			
			if !inDef then
				_in = push(_in, g_obj[i][j].name)
			endif
		repeat
	repeat
return _in

/* Adds a new merged object definition to g_obj. */
function addMergedObjDef(_name, _bank, _allowNesting)
	objDef newDef
	newDef.name = _name
	newDef.file = ""
	newDef.obj = createObjectGroup({0, 0, 0})
	newDef.scale = {1, 1, 1}
	newDef.lights = []
	
	var i
	var newChild
	var childStartIdx
	var j
	var childEndIdx
	
	for i = len(g_sel) - 1 to -0.1 step -1 loop
		newChild = getMapObjFromRef(g_cell[g_sel[i][0].cell][g_sel[i][0].idx])
		childStartIdx = len(newDef.children)
		
		if len(newChild.children) and !_allowNesting then
			for j = 0 to len(newChild.children) loop
				newChild.children[j] = applyGrpTransform(newChild.children[j], newChild)
			repeat
			
			newDef.children = insertArray(newDef.children, newChild.children, len(newDef.children))
		else
			newDef.children = push(newDef.children, 
				newChild)
		endif
		
		childEndIdx = len(newDef.children)
		
		for j = childStartIdx to childEndIdx loop
			newDef.children[j] = removeObjModelRef(newDef.children[j])
			newDef.children[j].pos -= g_cur.pos
		repeat
	repeat
	
	newDef.ext = getGroupExt(newDef.children)
	g_obj[_bank] = push(g_obj[_bank], newDef)
return void

/* Removes object definitions from g_obj. _delArr is an array whose
elements are in the form [ .bank= BANK_NUM, .idx = IDX_NUM, .name = NAME ]. 
Objects that aren't found in g_obj are ignored. */
function removeObjDef(_delArr)
return removeObjDef(_delArr, -1, false)

function removeObjDef(_delArr, _objMenu)
return removeObjDef(_delArr, _objMenu, true)

function removeObjDef(_delArr, _objMenu, _updateObjMenu)
	_delArr = encloseInArray(_delArr)
	
	var i
	var bankIdx
	var j
	
	for i = 0 to len(_delArr) loop
		if _delArr[i].bank < 0 or _delArr[i].idx < 0 then
			bankIdx = getObjDefBankIdx(_delArr[i].name)
			_delArr[i].bank = bankIdx.bank
			_delArr[i].idx = bankIdx.idx
		endif
		
		if _delArr[i].bank >= 0 and _delArr[i].idx >= 0 then
			g_obj[_delArr[i].bank] = remove(g_obj[_delArr[i].bank], _delArr[i].idx)
			
			if !len(g_obj[_delArr[i].bank]) then
				g_obj = remove(g_obj, _delArr[i].bank)
				g_bankName = remove(g_bankName, _delArr[i].bank)
				
				if _updateObjMenu then
					if _objMenu.bank >= _delArr[i].bank then
						_objMenu.bank -= 1
					endif
				endif
			
				for j = i to len(_delArr) loop
					if _delArr[j].bank > _delArr[i].bank then
						_delArr[j].bank -= 1
					endif
				repeat
			else
				for j = i to len(_delArr) loop
					if _delArr[j].bank == _delArr[i].bank then
						if _delArr[j].idx > _delArr[i].idx then
							_delArr[j].idx -= 1
						endif
					endif
				repeat
			endif
		endif
	repeat
	
	/* _delArr is unchanged unless we had to search for a def whose bank/idx
	wasn't given. */
	var result = [
		.delArr = _delArr,
		.objMenu = _objMenu
	]
return result

/* Executes a queued object definition deletion. */
function resolveDelDefMenuAction(_action)
	var del = [ 
		[
			.bank = g_objMenu.bank,
			.idx = getObjMenuIdxFromPos(g_objMenu, g_objMenu.selPos),
			.name = "",
			.def = -1
		]
	]
	del[0].def = g_obj[del[0].bank][del[0].idx]
	del[0].name = g_obj[del[0].bank][del[0].idx].name
	
	array template[0]
	var templateObj
	
	if strFind(_action, "deldefremove") == 0 then
		del = getAllObjDefDeletions(del)
	else
		var isUnmerge = strFind(_action, "deldefunmerge") == 0
		
		if isUnmerge then
			templateObj = activeFromObjDef(del[0].bank, del[0].idx)
		else
			var bank
			decodeBank(bank, g_activeObj.bankIdx)
			var idx
			decodeIdx(idx, g_activeObj.bankIdx)
			templateObj = activeFromObjDef(bank, idx)
		endif
		
		if isUnmerge or (len(templateObj.children) and !g_cur.isMerged) then
			template = unmergeObj(templateObj)
			
			var i
			for i = 0 to len(template) loop
				template[i] = updateObjBankIdx(template[i], del[0]).obj
			repeat
		else
			templateObj = updateObjBankIdx(templateObj, del[0]).obj
			template = push(template, templateObj)
		endif
	endif
	
	var objDefResult = resolveObjDefDeletionForObjDefs(del, template)
	var changedDefs = objDefResult.changedDefs
	var changedIdxs = objDefResult.changedIdxs
	g_objMenu = removeObjDef(del, g_objMenu).objMenu
	
	resolveObjDefDeletionForActiveObj(del, changedDefs,
		del[0].bank, del[0].idx)
		
	var delAction = 0
	if strFind(_action, "deldefunmerge") == 0 then
		delAction = 1
	else if strFind(_action, "deldefreplace") == 0 then
		delAction = 2
	endif endif
	
	resolveObjDefDeletionForLoadedMap(del, changedDefs, delAction, templateObj)
	
	/* Unmerge and replace only check the first element of del because
	only outright removal has the potential to create additional deletions
	by leaving merged objects that now contain no object refs. */
	loop if _action == "deldefunmergeallmaps" then
		unmergeObjInMaps(del[0].name, del[0].def)
		break endif
	if _action == "deldefreplaceallmaps" then
		replaceObjInMaps(del[0].name, g_activeObj, changedDefs, !g_cur.isMerged)
		break endif
	if _action == "deldefremoveallmaps" then
		var i
		for i = 0 to len(del) loop
			removeObjInMaps(del[i].name, changedDefs)
		repeat
		break
	endif break repeat
	
	writeObjDefs()
return void

/* Rebuilds any merged object definitions that have changed because of changes to a 
child definition. */
function resolveMergedObjDefChanges(_missingRefs)
	var timer = time()
	showLoadBox("Resolving changes to merged object definitions ...", true, false, false)
	
	var i
	for i = 0 to len(_missingRefs) loop
		promptObjDefRelink(-1, _missingRefs[i], 0)
	repeat
	
	// Rebuild merged extents in case base filepaths were changed
	var j
	for i = 0 to len(g_obj) loop
		for j = 0 to len(g_obj[i]) loop
			if len(g_obj[i][j].children) then
				g_obj[i][j].ext = rebuildMergedObjExt(g_obj[i][j])
			endif
		repeat
	repeat
	
	removeLoadSpr()
return void

/* Modifies an object's child hierarchy to reflect the deletion of an object definition
that has changed other definition indices in its bank. */
function updateObjBankIdx(_obj, _delBankIdx)
return updateObjBankIdx(_obj, _delBankIdx, true)

function updateObjBankIdx(_obj, _delBankIdx, _recur)
	var idxChanged = false
	var bankChanged = false
	
	_delBankIdx = encloseInArray(_delBankIdx)
	
	var i
	var bankIdx
	
	for i = 0 to len(_delBankIdx) loop
		bankIdx = getObjBankIdx(_obj)
		if bankIdx.bank == _delBankIdx[i].bank then
			if bankIdx.idx > _delBankIdx[i].idx then
				_obj.bankIdx = encodeBankIdx(bankIdx.bank, bankIdx.idx - 1)
				idxChanged = true
			endif
		else if bankIdx.bank > _delBankIdx[i].bank then
			// The bank will be deleted if the deleted object was the last one in the bank
			if len(g_obj[_delBankIdx[i].bank]) <= 1 then
				_obj.bankIdx = encodeBankIdx(bankIdx.bank - 1, bankIdx.idx)
				bankChanged = true
			endif
		endif endif
	repeat
	
	if _recur then
		var updateResult
		
		for i = 0 to len(_obj.children) loop
			updateResult = updateObjBankIdx(_obj.children[i], _delBankIdx, _recur)
			_obj.children[i] = updateResult.obj
			idxChanged = updateResult.idxChanged
			bankChanged = updateResult.bankChanged
		repeat
	endif
	
	var result = [
		.obj = _obj,
		.idxChanged = idxChanged,
		.bankChanged = bankChanged
	]
return result

/* Updates the current map to reflect deletions of object definitions.
_delInfo is an array whose elements are in the form
[ .bank = BANK_NUM, .idx = IDX_NUM, .name = NAME ]. 
_delAction can be 0 (remove), 1 (unmerge), or 2 (replace). 
_template is an active and is only needed if _delAction is 2. */
function resolveObjDefDeletionForLoadedMap(_delInfo, _changedDefs, _delAction, _template)
	var j
	var jLimit
	var objFound
	var isRef
	var bank
	var idx
	var l
	var objBuf
	var k
	var child
	var repObj
	var newObj
	var changed
	var changedObj
	var cellLimit = len(g_cell)
	var delCells
	var i = 0
	
	while i < cellLimit loop
		j = g_cellObjStart
		jLimit = len(g_cell[i])
		
		while j < jLimit loop
			objFound = false
			isMapObjRef(isRef, g_cell[i][j])
			
			if !isRef then
				for l = 0 to len(_delInfo) loop
					// If this is the object itself
					decodeBank(bank, g_cell[i][j].bankIdx)
					decodeIdx(idx, g_cell[i][j].bankIdx)
					
					if bank == _delInfo[l].bank and idx == _delInfo[l].idx then
						objBuf = updateObjBankIdx(g_cell[i][j], _delInfo).obj
						delCells = edDeleteMapObj(i, j)
						var origI = i
						
						for k = 0 to len(delCells) loop
							if delCells[k] <= origI then
								i -= 1
							endif
						repeat
						
						if _delAction == 1 then // Unmerge
							for k = 0 to len(objBuf.children) loop
								child = applyGrpTransform(objBuf.children[k], objBuf)
								placeObjFromTemplate(child, true)
							repeat
						else if _delAction == 2 then // Replace
							repObj = applyGrpTransform(_template, objBuf)
							newObj = placeObjFromTemplate(repObj, g_cur.isMerged)
						endif endif
						
						cellLimit = len(g_cell)
						jLimit -= 1
						j -= 1
						objFound = true
						
						break
					endif
				repeat
					
				if !objFound then
					changed = false
					objBuf = updateObjBankIdx(g_cell[i][j], _delInfo).obj
					
					for k = 0 to len(_changedDefs) loop
						// If this object was changed by the def deletion, replace it
						decodeBank(bank, g_cell[i][j].bankIdx)
						decodeIdx(idx, g_cell[i][j].bankIdx)
						
						if bank == _changedDefs[k].bank and idx == _changedDefs[k].idx then
							edDeleteMapObj(i, j)
							
							if len(g_cell) != cellLimit then
								i -= (cellLimit - len(g_cell))
								cellLimit = len(g_cell)
							endif
							
							decodeBank(bank, objBuf.bankIdx)
							decodeIdx(idx, objBuf.bankIdx)
							
							changedObj = activeFromObjDef(bank, idx, false)
							changedObj.pos = objBuf.pos
							changedObj.fwd = objBuf.fwd
							changedObj.up = objBuf.up
							changedObj.scale = objBuf.scale
							cloneObjLightDataRecursive(objBuf, changedObj, false)
							newObj = placeObjFromTemplate(changedObj, true)
							
							changed = true
							jLimit -= 1
							j -= 1
							break
						endif
					repeat
					
					if !changed then
						g_cell[i][j] = objBuf
					endif
				endif
			endif
			j += 1
		repeat
		
		i += 1
	repeat
return void

/* Updates the brush object to reflect deletions of object definitions.
_delInfo is an array whose elements are in the form
[ .bank = BANK_NUM, .idx = IDX_NUM, .name = NAME ]. */
function resolveObjDefDeletionForActiveObj(_delInfo, _changedDefs, _newBank, _newIdx)
	var activeAffected = false
	var bank
	var idx
	
	// Clamp to new bank size in case the deleted object was the last in the bank
	_newBank = clamp(_newBank, g_lightBank, len(g_obj) - 1)
	_newIdx = clamp(_newIdx, 0, len(g_obj[_newBank]) - 1)
	g_objMenu.bank = _newBank
	g_objMenu.selPos = getObjMenuPosFromIdx(g_objMenu, _newIdx)
	
	var i
	for i = 0 to len(_delInfo) loop
		decodeBank(bank, g_activeObj.bankIdx)
		decodeIdx(idx, g_activeObj.bankIdx)
		
		if bank == _delInfo[i].bank and idx == _delInfo[i].idx then
			replaceActiveObj(_newBank, _newIdx)
			activeAffected = true
			
			break
		endif
	repeat
	
	if !activeAffected then
		var changed = false
		var objBuf = updateObjBankIdx(g_cur.activeObj, _delInfo).obj
		
		for i = 0 to len(_changedDefs) loop
			// If this object was changed by the def deletion, replace it
			decodeBank(bank, g_activeObj.bankIdx)
			decodeIdx(idx, g_activeObj.bankIdx)
			
			if bank == _changedDefs[i].bank 
					and idx == _changedDefs[i].idx then
				objBuf.fwd = g_cur.fwd
				objBuf.up = g_cur.up
				decodeBank(bank, objBuf.bankIdx)
				decodeIdx(idx, objBuf.bankIdx)
				
				replaceActiveObj(bank, idx, g_cur.scale, g_cur.fwd, g_cur.up, true, objBuf)
				
				changed = true
				break
			endif
		repeat
		
		if !changed then
			decodeBank(bank, objBuf.bankIdx)
			decodeIdx(idx, objBuf.bankIdx)
			
			replaceActiveObj(bank, idx, g_cur.scale, g_cur.fwd, g_cur.up, true, objBuf)
		endif
	endif
return void

/* Expands the deletion list by adding any definitions that ultimately contain
refs only to the def(s) in _del and would therefore be empty once the deletion 
of the def(s) in _del is carried out. E.g. if MergedShrub contains only two 
instances of Shrub and Shrub gets deleted, MergedShrub must also be queued for 
deletion. */
function getAllObjDefDeletions(_del)
	if !len(_del) then
		_del = [ _del ]
	endif

	var i = 0
	var j
	var objInDelList
	var k
	var childList
	var l
	
	while i < len(g_obj) loop
		j = 0
		while j < len(g_obj[i]) loop
			objInDelList = false
			
			for k = 0 to len(_del) loop
				if _del[k].name == g_obj[i][j].name then
					objInDelList = true
					
					break
				endif
			repeat
			
			/* Only consider merged objects, because a base object cannot be
			affected by a deletion other than its own. */
			if !objInDelList and len(g_obj[i][j].children) then
				childList = getAllChildNamesInObjDef(g_obj[i][j])
				
				k = 0
				while k < len(childList) loop
					for l = 0 to len(_del) loop
						if childList[k] == _del[l].name then
							childList = remove(childList, k)
							
							k -= 1
							break
						endif
					repeat
					
					k += 1
				repeat
				
				// If the object contains only deleted children
				if !len(childList) then
					_del = push(_del, [ .bank = i, .idx = j, .name = g_obj[i][j].name])
					
					// Restart the def check to include the newly added deletion
					i = -1
					j = -1
				endif
			endif
			
			j += 1
		repeat
		
		i += 1
	repeat
return _del

/* When an object definition is deleted, modifies all other definitions that reference
the deleted definition so they point to a different definition or to nothing. 
_delInfoArr elements are the form [ .bank = BANK_NUM, .idx = IDX_NUM, .name = NAME ]. */
function resolveObjDefDeletionForObjDefs(_delInfoArr, _repObjArr)
	var changedDefs = []
	var changedIdxs = []
	
	_delInfoArr = encloseInArray(_delInfoArr)
	
	var i
	var j
	var defHasChanged
	var idxHasChanged
	var extHasChanged
	var k
	var repResult
	var repObj
	
	for i = 0 to len(g_obj) loop
		for j = 0 to len(g_obj[i]) loop
			defHasChanged = false
			idxHasChanged = false
			extHasChanged = false
			
			k = 0
			while k < len(g_obj[i][j].children) loop
				repResult = replaceObjDefRecursive(g_obj[i][j].children[k], 
					_delInfoArr, _repObjArr, true)
				repObj = repResult.objs
				
				// If the child was or contained the deleted object
				if repResult.changed then
					if len(repObj) then
						if len(repObj) > 1 then
							g_obj[i][j].children = remove(g_obj[i][j].children, k)
							g_obj[i][j].children = insertArray(g_obj[i][j].children, repObj, k)
							k += len(repObj) - 1
						else
							g_obj[i][j].children[k] = repObj[0]
						endif
					else
						g_obj[i][j].children = remove(g_obj[i][j].children, k)
						
						k -= 1
					endif
				
					defHasChanged = true
				else if repResult.bankIdxChanged then
					//Even if the child wasn't the deleted object, its index within the bank may have changed.
					g_obj[i][j].children[k] = repObj[0]
					
					idxHasChanged = true
				endif endif
				
				if repResult.needExtUpdate then
					extHasChanged = true
				endif
				
				k += 1
			repeat
			
			loop if defHasChanged then
				g_obj[i][j].ext = rebuildMergedObjExt(g_obj[i][j])
				changedDefs = push(changedDefs, [ .bank = i, .idx = j, .name = g_obj[i][j].name ])
				break endif
			if idxHasChanged then
				changedIdxs = push(changedIdxs, [ .bank = i, .idx = j ])
				break endif
			if extHasChanged then
				g_obj[i][j].ext = rebuildMergedObjExt(g_obj[i][j])
				break
			endif break repeat
		repeat
	repeat
	
	var result = [
		.changedDefs = changedDefs,
		.changedIdxs = changedIdxs
	]
return result

/* An object can be deleted recursively by passing an empty _newObjs array. */
function replaceObjDefRecursive(_checkObj, _oldInfo, _newObjs, _returnObjs)
	array retObjs[0]
	var isChanged = false
	var bankIdxChanged = false
	var needExtUpdate = false
	
	var i
	var needReplace
	var bank
	var idx
	var mapObjName
	var j
	
	for i = 0 to len(_oldInfo) loop
		/* A missing definition will have its name stored in the .bankIdx
		field. */
		needReplace = false
		
		if len(_checkObj.bankIdx) then
			if _checkObj.bankIdx == _oldInfo[i].name then
				needReplace = true
			endif
		else
			decodeBank(bank, _checkObj.bankIdx)
			decodeIdx(idx, _checkObj.bankIdx)
			getMapObjName(mapObjName, _checkObj)
			
			if _checkObj.bankIdx == -1 
					or (bank >= 0 and bank == _oldInfo[i].bank 
					and idx >= 0 and idx == _oldInfo[i].idx) 
					or mapObjName == _oldInfo[i].name then
				needReplace = true
			endif
		endif
		
		if needReplace then
			if _returnObjs then
				for j = 0 to len(_newObjs) loop
					_newObjs[j] = applyGrpTransform(_newObjs[j], _checkObj)
				repeat
				
				retObjs = _newObjs
			endif
			
			isChanged = true
			needExtUpdate = true
		endif
	repeat
	
	if !isChanged and !len(_checkObj.bankIdx) then // Don't operate on objects whose .bankIdx contains a name, because they've been deleted
		/* If a def name is passed wihout a bank, we assume the bank/idx numbers 
		don't need to be adjusted. (This happens during initial program load, where 
		missing objects are simply never assigned bank/idx numbers but must still 
		be deleted from merged object defs.) */
		
		for i = 0 to len(_oldInfo) loop
			if _oldInfo[i].bank >= 0 then
				var updateResult = updateObjBankIdx(_checkObj, _oldInfo, false)
				_checkObj = updateResult.obj
				bankIdxChanged = updateResult.idxChanged or updateResult.bankChanged
				
				break
			endif
		repeat
		
		/* If the object contains an old object or a replacement object, mark it
		to have its extent rebuilt. Note that we include replacement objects even
		though this wll trigger false positives because we need to accommodate the
		fact that when replaing a missing base object, the original base object
		becomes undetectable after the first replacement -- so to be safe, we just
		include everything that might once have been the missing object. */
		array involvedObjs[len(_newObjs)]
		
		for i = 0 to len(involvedObjs) loop
			getMapObjName(mapObjName, _newObjs[i])
			involvedObjs[i] = mapObjName
		repeat
		
		for i = 0 to len(_oldInfo) loop
			involvedObjs = push(involvedObjs, _oldInfo[i].name)
		repeat
		
		var bank
		decodeBank(bank, _checkObj.bankIdx)
		var idx
		decodeIdx(idx, _checkObj.bankIdx)
		
		var checkActive = activeFromObjDef(bank, idx)
		for i = 0 to len(involvedObjs) loop
			if objContains(checkActive, involvedObjs[i]) then
				needExtUpdate = true
				
				break
			endif
		repeat
		
		retObjs = [ _checkObj ]
	endif
	
	var result = [
		.objs = retObjs,
		.changed = isChanged,
		.bankIdxChanged = bankIdxChanged,
		.needExtUpdate = needExtUpdate
	]
return result

/* Finds the definiton for an instantiated object or returns a default definition 
if none exists. */
// CORE LOADER
function getObjDef(ref _in, _obj)
	var defIsValid = false
	var realBankIdx = false
	
	/* During merged def loads, .bankIdx may temporarily contain a missing object's
	name, so we screen this with len(). */
	if !len(_obj.bankIdx) then
		realBankIdx = true
	endif
	
	var bankIdxStr = str(_obj.bankIdx) // Our if statements are a bit roundabout to help avoid excess stack entries
	
	if realBankIdx and bankIdxStr != "-1" then
		var idx
		decodeIdx(idx, _obj.bankIdx)
		var bank
		decodeBank(bank, _obj.bankIdx)
		var objBank = g_obj[bank]
		_in = objBank[idx]
		defIsValid = true
	endif
	
	if !defIsValid then
		objDef missing
		var zeroVec = {0, 0, 0}
		
		missing.name = str(_obj.bankIdx)
		missing.file = ""
		missing.obj = -1
		missing.ext = [ .lo = zeroVec, .hi = zeroVec ]
		missing.scale = {1, 1, 1}
		missing.children = []
		missing.lights = []
		
		_in = missing
	endif
return _in

	// ----------------------------------------------------------------
	// OBJECT PLACEMENT

/* Inserts a primitive into an object definition placement based on name,
since primitives can't be referenced by model handle. */
// CORE LOADER
function placeObjDef(_def, _pos, _scale)
	var newObj
	
	loop if _def.name == "Cone" then
		newObj = placeObject(cone, _pos, _scale)
		break endif
	if _def.name == "Cube" then
		newObj = placeObject(cube, _pos, _scale)
		break endif
	if _def.name == "Cylinder" then
		newObj = placeObject(cylinder, _pos, _scale)
		break endif
	if _def.name == "Hemisphere" then
		newObj = placeObject(hemisphere, _pos, _scale)
		break endif
	if _def.name == "Pyramid" then
		newObj = placeObject(pyramid, _pos, _scale)
		break endif
	if _def.name == "Sphere" then
		newObj = placeObject(sphere, _pos, _scale)
		break endif
	if _def.name == "Wedge" then
		newObj = placeObject(wedge, _pos, _scale)
		break
	else
		newObj = placeObject(_def.obj, _pos, _scale)
		break
	endif break repeat
return newObj

//* Places the current brush object. */
function placeActive(_c)
	_c = applyKb(_c, g_bind.edit).c
	
	if g_cur.mode != "masssel" then
		if _c.a and !g_cDat[g_cIdx.a].held then
			g_cDat[g_cIdx.a].held = true
			
			active template = g_activeObj
			template.pos = g_cur.pos
			template.scale = g_cur.scale
			template.fwd = g_cur.fwd
			template.up = g_cur.up
			template.lights = g_cur.activeObj.lights
			template.children = g_cur.activeObj.children
			
			placeObjFromTemplate(template, g_cur.isMerged)
			
			pruneLightIcons()
			updateCurContexts(true)
			updateCamCellContext(true)
			updateCamCellOutlinePos()
			
			g_dirtyMap = true
		else if !_c.a then
			g_cDat[g_cIdx.a].held = false
		endif endif
	endif
return void

/* Places an object into the map using an object _t as the template. */
// CORE LOADER
function placeObjFromTemplate(_t, _merged)
	array placedObj[0]
	
	var hasChild = len(_t.children)
	var hasLight = len(_t.lights)
	if (hasChild or hasLight) and _merged then
		var newPlacedObj = addMapObj(_t, _t.pos, _t.fwd, _t.up, _t.scale, true)
		placedObj = [ newPlacedObj ]
	else if hasChild or hasLight then
		var newObj
		var newPlacedObj
		var i
		var childIsGrp
		
		for i = 0 to len(_t.children) loop
			newObj = applyGrpTransform(_t.children[i], _t)
			childIsGrp = false
			
			if len(_t.children[i].children) or len(_t.children[i].lights) then
				childIsGrp = true
			endif
			
			newPlacedObj = addMapObj(newObj, newObj.pos, 
				newObj.fwd, 
				newObj.up, 
				newObj.scale, childIsGrp)
			placedObj = push(placedObj, newPlacedObj)
		repeat
		
		for i = 0 to len(_t.lights) loop
			newObj = getActiveLightFromName(_t.lights[i].name)
			newObj.pos = _t.pos
			newObj.fwd = _t.fwd
			newObj.up = _t.up
			newObj.lights = [ _t.lights[i] ]
			
			newPlacedObj = addMapObj(newObj, newObj.pos, 
				newObj.fwd, 
				newObj.up, 
				newObj.scale, true)
			placedObj = push(placedObj, newPlacedObj)
		repeat
	else
		newPlacedObj = addMapObj(_t, _t.pos, _t.fwd, _t.up, _t.scale, false)
		placedObj = [ newPlacedObj ]
	endif endif
return placedObj

/* Creates a light using light _t as a template. */
// CORE LOADER
function placeLightFromTemplate(_t)
	_t.light = placeLightByType(_t.name, _t.col, _t.pos, _t.brightness, _t.res, _t.fwd, _t.spread, _t.range)
	
	if g_editor then
		if _t.col.a != g_sprAlpha then _t.col.a = g_sprAlpha endif
		
		_t.spr = createSprite()
		
		loop if _t.name == "point" then
			setSpriteImage(_t.spr, g_imgPointLight)
			break endif
		if _t.name == "pointshadow" then
			setSpriteImage(_t.spr, g_imgPointShadowLight)
			break endif
		if _t.name == "spot" then
			setSpriteImage(_t.spr, g_imgSpotLight)
			break endif
		if _t.name == "world" then
			setSpriteImage(_t.spr, g_imgWorldLight)
			break
		else
			setSpriteImage(_t.spr, g_imgWorldShadowLight)
			break
		endif break repeat
		
		setSpriteColor(_t.spr, _t.col)
		setSpriteScale(_t.spr, _t.sprScale)
	endif
return _t

/* Universal light placement function. */
// CORE LOADER
function placeLightByType(_type, _pos, _dir, _col, _brightness, _range, _res)
return placeLightByType(_type, _col, _pos, _brightness, _res, _dir, 0, _range)

function placeLightByType(_type, _pos, _dir, _col, _brightness, _spread)
return placeLightByType(_type, _col, _pos, _brightness, 0, _dir, _spread, 0)

function placeLightByType(_type, _pos, _col, _brightness, _res)
return placeLightByType(_type, _col, _pos, _brightness, _res, {0, 0, 1}, 0, 0)

function placeLightByType(_type, _pos, _col, _brightness)
return placeLightByType(_type, _col, _pos, _brightness, 0, {0, 0, 1}, 0, 0)

function placeLightByType(_type, _col)
return placeLightByType(_type, _col, {0, 0, 0}, 0, 0, {0, 0, 1}, 0, 0)

function placeLightByType(_type, _col, _pos, _brightness, _res, _dir, _spread, _range)
	var newLight
	
	loop if _type == "point" then
		newLight = pointLight(_pos, _col, _brightness)
		break endif
	if _type == "pointshadow" then
		newLight = pointShadowLight(_pos, _col, _brightness, _res)
		break endif
	if _type == "spot" then
		newLight = spotLight(_pos, _dir, _col, _brightness, _spread)
		break endif
	if _type == "world" then
		newLight = worldLight(_dir, _col, _brightness)
		break endif
	if _type == "worldshadow" then
		newLight = worldShadowLight(_pos, _dir, _col, _brightness, _range, _res)
		break
	endif break repeat
return newLight

/* Places an object that contains children or lights from a template. */
// CORE LOADER
function placeGrpObj(_template, _appliedTemplate)
	var fov
	
	if g_editor then
		fov = g_cam.fov
	else
		fov = 70
	endif
return placeGrpObj(_template, _appliedTemplate, fov)

function placeGrpObj(_template, _appliedTemplate, _fov)
	var result = placeGrpObjNoLightTransform(_template, _appliedTemplate, _fov)
	
	var lightContainer = [ 
		.lights = result.lights, 
		.children = result.children, 
		.pos = _template.pos,
		.scale = _template.scale,
		.fwd = {0, 0, 1},
		.up = {0, 1, 0}]
		
	setGrpLightsPos(lightContainer, _fov)
	edFunction(-1, "setGrpLightsSprScale", [ lightContainer, lightContainer.scale ])
return result

// CORE LOADER
function placeGrpObjNoLightTransform(_template, _appliedTemplate, _fov)
	var newObj
	var children
	array lights[len(_template.lights)]
	
	if len(_template.children) or len(_template.lights) then
		newObj = createObjectGroup(_template.pos)
		setObjectScale(newObj, _template.scale)
		children = _template.children
		
		var bank
		var idx
		var newGrp
		var i
		
		for i = 0 to len(_template.children) loop
			decodeBank(bank, _template.children[i].bankIdx)
			decodeIdx(idx, _template.children[i].bankIdx)
			
			if len(_template.children[i].children) 
					or len(_template.children[i].lights) then
				newGrp = placeGrpObjNoLightTransform(
					_template.children[i],
					_appliedTemplate.children[i],
					_fov
				)
				children[i].obj = newGrp.obj
				children[i].children = newGrp.children
				children[i].lights = newGrp.lights
			else
				children[i].obj = placeObjDef(
					getObjDef(-1, _template.children[i]), 
					_template.children[i].pos,
					_template.children[i].scale
				)
			endif
			
			setObjRot(children[i].obj, children[i].pos,
				children[i].fwd, children[i].up)
			setObjectParent(children[i].obj, newObj)
		repeat
		
		for i = 0 to len(lights) loop
			lights[i] = placeLightFromTemplate(_template.lights[i])
		repeat
	else
		//DEBUG CONDITION; SHOULD NEVER OCCUR
		clear(black)
		ink(white)
		textSize(gheight() / 25)
		printAt(1, 1, "Error in placeGrpObjNoLightTransform():" + chr(10) +
			getMapObjName(-1, _template) + " is not a merged object." + chr(10) +
			"Creating placeholder waffle ...")
		update()
		sleep(1)
		
		var newModel = loadModel("Devils Garage/waffle") // Sorry, have a waffle instead :(
		newObj = placeObject(newModel, {0, 0, 0}, {1, 1, 1})
	endif
	
	var result = [
		.obj = newObj,
		.children = children,
		.lights = lights
	]
return result

/* Creates a cube collider of the same size as _obj's extent. */
// CORE LOADER
function createObjCollider(_obj)
	var ext = g_obj[decodeBank(-1, _obj.bankIdx)][decodeIdx(-1, _obj.bankIdx)].ext
	var colliderPos = getExtCenter(ext)
	var colliderScale = absVec3(ext.hi - ext.lo) / 2
	var colObj = [
		.obj = placeObject(cube, _obj.pos + colliderPos, colliderScale),
		.pos = colliderPos,
		.scale = colliderScale,
		.fwd = {0, 0, 1},
		.up = {0, 1, 0}
	]
	colObj = applyGrpTransform(colObj, _obj)
	setObjectPos(colObj.obj, colObj.pos)
	setObjectScale(colObj.obj, colObj.scale)
	setObjRot(colObj.obj, colObj.pos, colObj.fwd, colObj.up)
return colObj

/* Places instantiated object data in a cell that the object intersects. */
// CORE LOADER
function addCellToGridBitList(_obj, _objCollider, _midCell, _midCellPos)
	var cellW = getCellWidth()
	var cellHalfW = cellW / 2
	var cellCollider = placeObject(cube, _midCellPos, {cellHalfW, cellHalfW, cellHalfW})
	var added = false
	var allowCell = []
	
	var inter = mergedObjIntersect(_obj, cellCollider, false)
	if inter then
		if _midCell < 0 then
			_midCell = addCell(_midCellPos)
		endif
		
		_obj = getGrpCollisionBits(_obj, _midCell)
		added = true
	endif
	
	var dirs = [
		{1, 0, 0},
		{-1, 0, 0},
		{0, 1, 0},
		{0, -1, 0},
		{0, 0, 1},
		{0, 0, -1}
	]
	var adjIdx
	var adjArr = getAdj(_midCell, _midCellPos)
	
	/* If the object extends into an adjacent cell, allow checking gridBit for that cell. */
	var i
	for i = 0 to len(dirs) loop
		adjIdx = getAdjIdxFromOffset(dirs[i])
		setObjectPos(cellCollider, _midCellPos + dirs[i] * cellW)
		
		if objectIntersect(_objCollider, cellCollider) then
			allowCell = push(allowCell, [ adjArr[adjIdx], _midCellPos + dirs[i] * cellW ])
		endif
	repeat
	
	removeObject(cellCollider)
	
	var result = [
		.obj = _obj,
		.added = added,
		.cell = _midCell,
		.allow  = allowCell
	]
return result

/* Places an object in the map. */
// CORE LOADER
function addMapObj(_activeObj, _pos, _fwd, _up, _scale, _isGrp)
	_pos = roundVec(_pos, 6)
	mapObj newObj
	
	if _isGrp then
		var newGrp = placeGrpObj(_activeObj, _activeObj)
		newObj.obj = newGrp.obj
		newObj.children = newGrp.children
		newObj.lights = newGrp.lights
	else
		newObj.obj = placeObjDef(
			getObjDef(-1, _activeObj),
			_pos, 
			_scale
		)
		newObj.children = []
	endif
	
	newObj.fwd = _fwd
	newObj.up = _up
	newObj.scale = _scale
	newObj.pos = _pos
	newObj.bankIdx = _activeObj.bankIdx
	newObj.col = _activeObj.col
	newObj.mat = _activeObj.mat
	restoreDefaultObjCol(newObj)
	
	setObjectPos(newObj.obj, _pos)
	setObjRot(newObj.obj, _pos, _fwd, _up)
	setGrpLightsPos(newObj)
	
	var isRef
	var canPlaceObj = true
	var baseCell = -1
	var baseIdx = -1
	var refCellIdx = -1
	array cellIdx[0]
	array checkedCellPos[0]
	var i
	var addResult
	var newObjCell
	array allowCell[0]
	
	var bank
	decodeBank(bank, newObj.bankIdx)
	var idx
	decodeIdx(idx, newObj.bankIdx)
	var objDef = g_obj[bank][idx]
	var extCenter = getExtCenter(getExtMinMax(objDef.ext, newObj.scale, newObj.fwd, newObj.up))
	var objCollider = createObjCollider(newObj)
	var checkCell = getCellIdxFromPos(objCollider.pos)
	var toCheck = [ [ checkCell, getCellPosFromPos(objCollider.pos)] ]
	var toCheckCell
	var toCheckPos
	
	// Add object to all cells that it intersects
	while len(toCheck) loop
		toCheckCell = toCheck[0][0]
		toCheckPos = toCheck[0][1]
		
		if !contains(checkedCellPos, toCheckPos) then
			checkedCellPos = push(checkedCellPos, toCheckPos)
			addResult = addCellToGridBitList(newObj, objCollider.obj, toCheckCell, toCheckPos)
			// addResult.allow contains cells that the object might overlap
			toCheck = insertArray(toCheck, addResult.allow)
			
			if addResult.added then
				newObj = addResult.obj
				cellIdx = push(cellIdx, addResult.cell)
				
				// Base cell, where the object data is stored
				if len(cellIdx) == 1 then
					baseCell = addResult.cell
					
					// Ensure the object doesn't already exist
					for i = g_cellObjStart to len(g_cell[baseCell]) loop
						isMapObjRef(isRef, g_cell[baseCell][i])
						
						if !isRef then
							if mapObjEquals(g_cell[baseCell][i], newObj) then
								canPlaceObj = false
								
								break
							endif
						endif
					repeat
					
					if !canPlaceObj then break endif
					
					baseIdx = len(g_cell[addResult.cell])
					refCellIdx = encodeCellIdx(addResult.cell, baseIdx)
				// Additional cells, where object references are stored
				else
					mapObjRef newRef
					newRef.cellIdx = refCellIdx
					g_cell[addResult.cell] = push(g_cell[addResult.cell], newRef)
				endif
			endif
		endif
		
		toCheck = remove(toCheck, 0)
	repeat
	
	removeObject(objCollider.obj)
	
	if !canPlaceObj then
		newObj = removeGroupObj(newObj)
	else
		g_cell[baseCell] = push(g_cell[baseCell], newObj)
		
		// Add list of what cells the object exists in.
		array cellIdxList[len(cellIdx)]
		var lastObjIdx
		
		for i = 0 to len(cellIdx) loop
			lastObjIdx = len(g_cell[cellIdx[i]]) - 1
			cellIdxList[i] = [ .cell = cellIdx[i], .idx = lastObjIdx ]
		repeat
		
		array baseCellIdx[len(cellIdxList)]
		g_cell[baseCell][baseIdx].cellIdx = baseCellIdx
		
		for i = 0 to len(cellIdxList) loop
			g_cell[baseCell][baseIdx].cellIdx[i] = encodeCellIdx(cellIdxList[i].cell, cellIdxList[i].idx)
		repeat
		
		// Store data about light sprites if we're in the editor
		if g_editor then
			var lightTypes
			edFunction(lightTypes, "getGrpLightsTypes", [ newObj ])
			
			if len(lightTypes) then
				var objRef = [ .cell = cellIdx[0], .idx = len(g_cell[cellIdx[0]]) - 1 ]
				
				g_lightIcons = push(g_lightIcons, objRef)
				
				if contains(lightTypes, "world") or contains(lightTypes, "worldshadow") then
					g_worldLights = push(g_worldLights, objRef)
				endif
			endif
		endif
		
		// Uncomment to view gridBit data when an object is placed
		//debugGridBit3d(g_cell[cellIdx[0]][len(g_cell[cellIdx[0]]) - 1].gridBitList, 999)
		//debugGridBit(g_cell[cellIdx[0]][len(g_cell[cellIdx[0]]) - 1].gridBitList, 0)
	endif
return newObj

	// ----------------------------------------------------------------
	// OBJECT REMOVAL

/* Removes an object or merged object. */
// CORE LOADER
function removeGroupObj(_obj)
	var i
	for i = 0 to len(_obj.lights) loop
		deleteLightObj(_obj.lights[i])
	repeat
	
	for i = 0 to len(_obj.children) loop
		if len(_obj.children[i].children) or len(_obj.children[i].lights) then
			_obj.children[i] = removeGroupObj(_obj.children[i])
		else
			removeObject(_obj.children[i].obj)
			_obj.children[i].obj = -1
		endif
	repeat
	
	removeObject(_obj.obj)
	_obj.obj = -1
return _obj

/* Removes the instantiated model (.obj field) from an object without removing
the other object data. */
function removeObjModelRef(_obj)
	_obj.obj = -1
	
	var i
	for i = 0 to len(_obj.children) loop
		if len(_obj.children[i].children) then
			_obj.children[i] = removeObjModelRef(_obj.children[i])
		else 
			_obj.children[i].obj = -1
		endif
	repeat
return _obj

/* Adjusts indices in light records to account for an object definition whose
deletion has changes other definitions' indices. */
function adjustLightRecordsForRemovedObj(_cell, _delIdx, _lightRecords)
	var i
	for i = 0 to len(_lightRecords) loop
		if _lightRecords[i].cell == _cell then
			if _lightRecords[i].idx > _delIdx then
				_lightRecords[i].idx -= 1
			endif
		endif
	repeat
return _lightRecords

/* Rebuilds cell/idx list for an object when its index in a cell has changed
due to the deletion of a lower index object. */
function rebuildCellIdxList(_cell, _newIdx)
	if !isMapObjRef(-1, g_cell[_cell][_newIdx]) then
		var newCellIdx = encodeCellIdx(_cell, _newIdx)
		
		g_cell[_cell][_newIdx].cellIdx[0] = newCellIdx
		
		var i
		var refCell
		var refIdx
		
		for i = 1 to len(g_cell[_cell][_newIdx].cellIdx) loop
			refCell = decodeCell(g_cell[_cell][_newIdx].cellIdx[i])
			refIdx = decodeIdx(-1, g_cell[_cell][_newIdx].cellIdx[i])
			g_cell[refCell][refIdx].cellIdx = newCellIdx
		repeat
	else
		var newCellIdx = encodeCellIdx(_cell, _newIdx)
		var baseCell = decodeCell(g_cell[_cell][_newIdx].cellIdx)
		var baseIdx = decodeIdx(-1, g_cell[_cell][_newIdx].cellIdx)
		
		var i
		for i = 0 to len(g_cell[baseCell][baseIdx].cellIdx) loop
			if decodeCell(g_cell[baseCell][baseIdx].cellIdx[i]) == _cell then
				g_cell[baseCell][baseIdx].cellIdx[i] = newCellIdx
			endif
		repeat
	endif
return void

/* Removes an object from the map. */
function deleteMapObj(_obj)
	var delCell
	var delIdx
	
	if isMapObjRef(-1, _obj) then
		delCell = decodeCell(obj.cellIdx)
		delIdx = decodeIdx(-1, obj.cellIdx)
		_obj = getMapObjFromRef(g_cell[delCell][delIdx])
	endif
	
	removeGroupObj(_obj)
	
	var i
	var j
	var k
	var l
	
	for i = 0 to len(_obj.cellIdx) loop
		delCell = decodeCell(_obj.cellIdx[i])
		decodeIdx(delIdx, _obj.cellIdx[i])
		
		g_cell[delCell] = remove(g_cell[delCell], delIdx)
		
		for j = delIdx to len(g_cell[delCell]) loop
			rebuildCellIdxList(delCell, j)
		repeat
	repeat
return void

/* Removes instantiated object models from the world without cleaning up the
g_cell entries. Should only be used when clearing a map or in other cases
where record sanitation doesn't matter. */
// CORE LOADER
function fastDeleteMapObj(_obj)
	if !isMapObjRef(-1, _obj) then
		removeGroupObj(_obj)
	endif
return void

/* Removes an object from the map and reinitializes the editor after the removal. */
function edDeleteMapObj(_cell, _idx)
	var obj = getMapObjFromRef(g_cell[_cell][_idx])
	g_sel = adjustSelForRemovedObj(g_sel, _cell, 
		_idx)
	
	deleteMapObj(obj)
	
	var i
	var j
	var k
	var l
	var delCell
	var cellOffset = 0
	var delIdx
	var removedCells = []
	
	for i = 0 to len(obj.cellIdx) loop
		delCell = decodeCell(obj.cellIdx[i])
		decodeIdx(delIdx, obj.cellIdx[i])
		
		removeWorldLightRecord(delCell, delIdx)
		removeLightIconRecord(delCell, delIdx)
		g_lightIcons = adjustLightRecordsForRemovedObj(delCell, delIdx, g_lightIcons)
		g_worldLights = adjustLightRecordsForRemovedObj(delCell, delIdx, g_worldLights)
		
		if len(g_cell[delCell]) <= g_cellObjStart then
			for j = i + 1 to len(obj.cellIdx) loop
				if decodeCell(obj.cellIdx[j]) > delCell then
					obj.cellIdx[j] = encodeCellIdx(decodeCell(obj.cellIdx[j]) - 1, decodeIdx(-1, obj.cellIdx[j]))
				endif
			repeat
			
			g_cell = remove(g_cell, delCell)
			removedCells = push(removedCells, delCell)
			
			for j = 0 to len(g_cell) loop
				for k = g_cellObjStart to len(g_cell[j]) loop
					var obj = g_cell[j][k]
					
					// Fix objects' cellIdx entries
					if !isMapObjRef(-1, obj) then
						for l = 0 to len(obj.cellIdx) loop
							if decodeCell(obj.cellIdx[l]) > delCell then
								obj.cellIdx[l] = encodeCellIdx(decodeCell(obj.cellIdx[l]) - 1, decodeIdx(-1, obj.cellIdx[l]))
								obj.gridBitList[l][0] -= 1
							endif
						repeat
					else
						if decodeCell(obj.cellIdx) > delCell then
							obj.cellIdx = encodeCellIdx(decodeCell(obj.cellIdx) - 1, decodeIdx(-1, obj.cellIdx))
						endif
					endif
					
					g_cell[j][k] = obj
				repeat
				
				// Fix cells' adjacent lists
				for k = 0 to len(g_cell[j][1]) loop
					if g_cell[j][1][k] == delCell then
						g_cell[j][1][k] = -1
					else if g_cell[j][1][k] > delCell then
						g_cell[j][1][k] -= 1
					endif endif
				repeat
			repeat
			
			// Fix selected object entries' cells
			for k = 0 to len(g_sel) loop
				for l = 0 to len(g_sel[k]) loop
					if g_sel[k][l].cell > delCell then
						g_sel[k][l].cell -= 1
					endif
				repeat
			repeat
			
			// Fix light icon records' cells
			for k = 0 to len(g_lightIcons) loop
				if g_lightIcons[k].cell > delCell then
					g_lightIcons[k].cell -= 1
				endif
			repeat
			
			// Fix world light records' cells
			for k = 0 to len(g_worldLights) loop
				if g_worldLights[k].cell > delCell then
					g_worldLights[k].cell -= 1
				endif
			repeat
			
			// Fix cursor cell
			if g_cur.cell == delCell then
				g_cur.cell = -1
			else if g_cur.cell > delCell then
				g_cur.cell -= 1
			endif endif
			
			// Fix camera cell
			if g_cam.cell == delCell then
				g_cam.cell = -1
			else if g_cam.cell > delCell then
				g_cam.cell -= 1
			endif endif
		endif
	repeat
	
	updateCamCollisions(true)
	updateCurContexts(true)
	updateCurCellOutlinePos()
	updateCamCellOutlinePos()
	
	g_dirtyMap = true
return removedCells

/* Removes instantiated elements of a light object. */
// CORE LOADER
function deleteLightObj(_obj)
	removeLight(_obj.light)
	_obj.light = -1
	
	if g_editor then
		removeSprite(_obj.spr)
	endif
	
	_obj.spr = -1
return _obj

/* Resets the editor after the map has been cleared. */
function initEdForClearedMap()
return initEdForClearedMap(true)

function initEdForClearedMap(_resetActiveObj)
	initSel()
	
	for i = 0 to len(g_cellOutline) loop
		if g_cellOutline[i].isValid then
			removeCellOutlineObj(g_cellOutline[i])
		endif
	repeat
	
	initCam()
	
	if _resetActiveObj then removeActiveObj() endif
	
	initCur()
	initCell()
	g_lightIcons = []
	g_worldLights = []
	initBg()
	
	if _resetActiveObj then
		createActiveObj(g_lightBank - 1, 0)
	endif
return void

/* Deletes every object in the map. */
// CORE LOADER
function clearMap()
	var i
	var j
	
	for i = 0 to len(g_cell) loop
		j = g_cellObjStart
		while j < len(g_cell[i]) loop
			fastDeleteMapObj(g_cell[i][j])
			
			j += 1
		repeat
	repeat
	
	g_cell = []
return void

	// ----------------------------------------------------------------
	// OBJECT RETRIEVAL

/* If the object exists in the cell, gets its index. */
function getObjCopyFromCell(_obj, _cell, _skipCell)
	_obj = getMapObjFromRef(_obj)
	var found = false
	var idx = -1
	
	if _cell >= 0 then
		if !contains(_skipCell, _cell) then
			var i
			for i = g_cellObjStart to len(g_cell[_cell]) loop
				if mapObjEquals(_obj, getMapObjFromRef(g_cell[_cell][i])) then
					found = true
					idx = i
					break
				endif
			repeat
		endif
	endif
	
	_skipCell = push(_skipCell, _cell)
	
	var result = [
		.found = found,
		.idx = idx,
		.skip = _skipCell
	]
return result

/* Gets all cells/indices in which the object exists. */
function getAllObjCopies(_cell, _idx)
	array cellIdx[0]
	
	if _cell > -1 and _idx > -1 then
		var obj = getMapObjFromRef(g_cell[_cell][_idx])
		
		var i
		for i = 0 to len(obj.cellIdx) loop
			cellIdx = push(cellIdx, [ .cell = decodeCell(obj.cellIdx[i]), 
				.idx = decodeIdx(-1, obj.cellIdx[i]) ])
		repeat
	endif
return cellIdx

// _refList elements are structs in the form [ .cell = INT, .idx = INT ]
function getObjListFromCellIdxList(_refList, _filterDup)
	array objList[0]
	var baseObj
	var canAdd
	var j
	var i
	
	for i = 0 to len(_refList) loop
		baseObj = getMapObjFromRef(g_cell[_refList[i].cell][_refList[i].idx])
			
		if _filterDup then
			canAdd = true
			
			for j = 0 to len(objList) loop
				if objList[j].cellIdx[0] == baseObj.cellIdx[0] then
					canAdd = false
					
					break
				endif
			repeat
			
			if canAdd then
				objList = push(objList, baseObj)
			endif
		else
			objList = push(objList, baseObj)
		endif
	repeat
return objList

/* Copies the light data from one object to another similar object. The similar
object should have the same lights or a subset of lights from the original.

We assume no more than one light per object and that objects with lights
don't have children (which are both always the case as of v1.0.00). 

cloneObjLightData() copies only the top layer; in most cases, 
cloneObjLightDataRecursive() should be used. The former mostly exists as an
element of the latter.*/
function cloneObjLightData(_origObj, ref _destObj, _includeSpr)
	var destBank
	decodeBank(destBank, _destObj.bankIdx)
	var origBank
	decodeBank(origBank, _origObj.bankIdx)
	var continue = false
	
	// Don't nest ifs here to save stack space
	if len(_destObj.lights) and len(_origObj.lights) then
		if _destObj.lights[0].name == _origObj.lights[0].name 
				and _destObj.lights[0].pos == _origObj.lights[0].pos then
			continue = true
		endif
	endif
	
	if continue and origBank >= 0 and destBank >= 0 
			and mapObjEquals(_destObj, _origObj)  then
		_destObj.lights[0].fwd = _origObj.lights[0].fwd
		_destObj.lights[0].brightness = _origObj.lights[0].brightness
		_destObj.lights[0].col = _origObj.lights[0].col
		_destObj.lights[0].res = _origObj.lights[0].res
		_destObj.lights[0].spread = _origObj.lights[0].spread
		_destObj.lights[0].range = _origObj.lights[0].range
	else
		continue = false
	endif
	
	if continue and _includeSpr then
		setGrpLightsSprCol(_destObj, _destObj.lights[0].col)
	endif
return _destObj

function cloneObjLightDataRecursive(_origObj, ref _destObj)
return cloneObjLightDataRecursive(_origObj, _destObj, true)

function cloneObjLightDataRecursive(_origObj, ref _destObj, _includeSpr)
	cloneObjLightData(_origObj, _destObj, _includeSpr)
	
	var origBank
	var destBank
	var tempChild
	var i
	var j
	
	for i = 0 to len(_origObj.children) loop
		decodeBank(origBank, _origObj.children[i].bankIdx)
		
		// Don't nest ifs here to save stack space
		for j = 0 to len(_destObj.children) loop
			decodeBank(destBank, _destObj.children[j].bankIdx)
			
			if !len(_destObj.children[j].lights) and !len(_origObj.children[i].lights) 
					and origBank >= 0 and destBank >= 0 and mapObjEquals(_destObj.children[j], _origObj.children[i]) then
				tempChild = _destObj.children[j]
				cloneObjLightDataRecursive(_origObj.children[i], tempChild, _includeSpr)
				_destObj.children[j] = tempChild
			endif
			if len(_destObj.children[j].lights) and len(_origObj.children[i].lights) and origBank >= 0 then
				tempChild = _destObj.children[j]
				cloneObjLightData(_origObj.children[i], tempChild, _includeSpr)
				_destObj.children[j] = tempChild
			endif
		repeat
	repeat
return _destObj

/* Strips the top level container in a merged object and returns its children. */
function unmergeObj(_obj)
	var unmerged = []
	
	var i
	var newObj
	
	for i = 0 to len(_obj.children) loop
		newObj = _obj.children[i]
		unmerged = push(unmerged, newObj)
	repeat
return unmerged

/* Checks whether _obj is actually a reference to another object. */
// CORE LOADER
function isMapObjRef(ref _in, _obj)
	_in = false
	
	var cellIdxLen = len(_obj.cellIdx)
	var cellIdxStr = str(_obj.cellIdx) // Avoid multiple nested ifs to reduce stack size
	
	if !cellIdxLen and cellIdxStr != "-1" then
		_in = true
	endif
return _in

/* Returns the actual mapObj that a reference points to. */
// CORE LOADER
function getMapObjFromRef(_ref)
	var obj
	
	if isMapObjRef(-1, _ref) then
		var idx
		decodeIdx(idx, _ref.cellIdx)
		
		obj = g_cell[decodeCell(_ref.cellIdx)][idx]
	else
		obj = _ref
	endif
return obj

/* Returns the object's cell number. */
function getMapObjCell(_obj)
	var cell
	
	if !len(_obj.cellIdx) then
		cell = decodeCell(_obj.cellIdx)
	else
		cell = decodeCell(_obj.cellIdx[0])
	endif
return cell

/* Returns the object's index number. */
function getMapObjIdx(_obj)
	var idx
	
	if isMapObjRef(-1, _obj) then
		decodeIdx(idx, _obj.cellIdx)
	else
		decodeIdx(idx, _obj.cellIdx[0])
	endif
return idx

	// ----------------------------------------------------------------
	// LIGHT OBJECT

/* Returns an active light of the specifed name. */
// CORE LOADER
function getActiveLightFromName(_name)
	var newObj
	
	loop if _name == "point" then
		newObj = activeFromObjDef(g_lightBank, 0)
		break endif
	if _name == "pointshadow" then
		newObj = activeFromObjDef(g_lightBank, 1)
		break endif
	if _name == "spot" then
		newObj = activeFromObjDef(g_lightBank, 2)
		break endif
	if _name == "world" then
		newObj = activeFromObjDef(g_lightBank, 3)
		break endif
	if _name == "worldshadow" then
		newObj = activeFromObjDef(g_lightBank, 4)
		break
	endif break repeat
return newObj

/* Default values for a light object. */
// CORE LOADER
function initLightObj()
	var alpha
	
	if g_editor then
		alpha = g_sprAlpha
	else
		alpha = 1
	endif
	
	lightObj l
	l.light = -1
	l.spr = -1
	l.sprScale = {12, 12, 12}
	l.pos = {0, 0, 0}
	l.fwd = {0, 0, 1}
	l.brightness = 1
	l.col = {1, 1, 1, alpha}
	l.spread = 1
	l.res = 8
	l.range = 100
	l.name = ""
return l

/* Checks if a light sprite is within a visibile distance from the camera
and hides it if not. */
function hideLightSprIfOutOfRange(_obj, _cell, _cellPos)
	var hidden = false
	
	if !isObjInAdj(_obj, _cell, _cellPos) then
		setGrpLightsSprVisibility(_obj, false, [])
		hidden = true
	endif
return hidden

/* Removes any entry in g_lightIcons that's out of camera range and hides the light's
sprite. Needs to be called after adding object(s) to ensure any new sprites are correctly
dealt with. */
function pruneLightIcons()
	var i = 0
	while i < len(g_lightIcons) loop
		if hideLightSprIfOutOfRange(g_cell[g_lightIcons[i].cell][g_lightIcons[i].idx], 
				g_cam.cell, g_cam.cellPos) then
			g_lightIcons = remove(g_lightIcons, i)
			i -= 1
		endif
		
		i += 1
	repeat
return void

/* This function modifies properties of the object passed to it in order
to apply recursive transforms to lights to sync them with the rest of the
object. This is needed because lights can't be auto-modified as part of an 
object group like objects can. DO NOT modify this function to return the object, 
because these object modifications are only relevant in the context of this
specific function and should be discarded when done. */
// CORE LOADER
function setGrpLightsPos(_obj)
	var fov
	
	if g_editor then
		fov = g_cam.fov
	else
		fov = 70
	endif
return setGrpLightsPos(_obj, fov)

function setGrpLightsPos(_obj, _fov)
	var i
	var light2dPos
	
	for i = 0 to len(_obj.lights) loop
		_obj.lights[i] = applyGrpPos(_obj.lights[i], _obj)
		
		if g_editor then
			edFunction(light2dPos, "worldPosToScreenPos", [ _obj.lights[i].pos, 
				g_cam.fwd, g_cam.up, g_cam.pos, _fov ])
			setSpriteLocation(_obj.lights[i].spr, light2dPos)
		endif
		
		setLightPos(_obj.lights[i].light, _obj.lights[i].pos)
	repeat
	
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = applyGrpTransform(_obj.children[i], _obj, false, true)
		_obj.children[i].scale *= _obj.scale
		setGrpLightsPos(_obj.children[i], _fov)
	repeat
return void

/* Does the same thing as setGrpLightsPos() without setting the actual light
position. Use when you need to update the sprite position but don't need to 
reposition the light itself. */
function updateGrpLightsSprPos(_obj, _fov)
	var i
	var light2dPos
	
	for i = 0 to len(_obj.lights) loop
		_obj.lights[i] = applyGrpPos(_obj.lights[i], _obj)
		light2dPos = worldPosToScreenPos(_obj.lights[i].pos, 
			g_cam.fwd, g_cam.up, g_cam.pos, _fov)
		setSpriteLocation(_obj.lights[i].spr, light2dPos)
	repeat
	
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = applyGrpTransform(_obj.children[i], _obj, false, true)
		_obj.children[i].scale *= _obj.scale
		updateGrpLightsSprPos(_obj.children[i], _fov)
	repeat
return void

/* Sets scale for all light sprites in a merged object. */
function setGrpLightsSprScale(_obj, _scale)
	var i
	for i = 0 to len(_obj.lights) loop
		setSpriteScale(_obj.lights[i].spr, _scale * _obj.lights[i].sprScale)
	repeat
	
	for i = 0 to len(_obj.children) loop
		setGrpLightsSprScale(_obj.children[i], _scale)
	repeat
return void

/* Sets 3D scale for all light sprites in a merged object. */
function updateGrpLightsSprScale3d(_obj, _cam)
return updateGrpLightsSprScale3d(_obj, _cam, {1, 1})

function updateGrpLightsSprScale3d(_obj, _cam, _scale)
	var i
	var scale
	
	for i = 0 to len(_obj.lights) loop
		_obj.lights[i] = applyGrpPos(_obj.lights[i], _obj)
		scale = scale3dSprite(_obj.lights[i].pos, 0.002, _cam.fwd, _cam.up, _cam.pos) * _scale
		setSpriteScale(_obj.lights[i].spr, scale * _obj.lights[i].sprScale)
		setSpriteDepth(_obj.lights[i].spr, distance(_cam.pos, _obj.lights[i].pos) * -100)
	repeat
	
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = applyGrpTransform(_obj.children[i], _obj, false, true)
		_obj.children[i].scale *= _obj.scale
		updateGrpLightsSprScale3d(_obj.children[i], _cam, _scale)
	repeat
return void

/* Sets visibility for all light sprites in a merged object. */
function setGrpLightsSprVisibility(_obj, _vis, _cellFilter)
return setGrpLightsSprVisibility(_obj, _vis, _cellFilter, false)

function setGrpLightsSprVisibility(_obj, _vis, _cellFilter, _lightsExist)
	var i
	var isInCell
	var j
	
	for i = 0 to len(_obj.lights) loop
		isInCell = true
		
		if len(_cellFilter) then
			isInCell = false
			
			for j = 0 to len(_cellFilter) loop
				if isPosInCell(_obj.lights[i].pos, _cellFilter[j]) then
					isInCell = true
					break
				endif
			repeat
		endif
		
		if isInCell then
			setSpriteVisibility(_obj.lights[i].spr, _vis)
			_lightsExist = true
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_lightsExist = setGrpLightsSprVisibility(_obj.children[i], _vis, _cellFilter, _lightsExist)
	repeat
return _lightsExist

/* Sets color for all light sprites in a merged object. */
function setGrpLightsSprCol(_obj, _col)
	var i
	for i = 0 to len(_obj.lights) loop
		setSpriteColor(_obj.lights[i].spr, _col)
	repeat
	
	for i = 0 to len(_obj.children) loop
		setGrpLightsSprCol(_obj.children[i], _col)
	repeat
return void

/* Sets color for all light sprites in a merged object back to the color 
stored in _obj.lights[i].col. */
function restoreGrpLightsSprCol(_obj)
	var i
	for i = 0 to len(_obj.lights) loop
		setSpriteColor(_obj.lights[i].spr, _obj.lights[i].col)
	repeat
	
	for i = 0 to len(_obj.children) loop
		restoreGrpLightsSprCol(_obj.children[i])
	repeat
return void

/* Sets brightness for all lights in a merged object. */
function setGrpLightsBrightness(_obj, _br)
return setGrpLightsBrightness(_obj, _br, [])

function setGrpLightsBrightness(_obj, _br, _type)
	var i
	for i = 0 to len(_obj.lights) loop
		if !len(_type) or contains(_type, _obj.lights[i].name) then
			_obj.lights[i].brightness = _br
			setLightBrightness(_obj.lights[i].light, _br)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = setGrpLightsBrightness(_obj.children[i], _br, _type)
	repeat
return _obj

/* Offsets brightess of all light sprites in a merged object by the given amount. */
function offsetGrpLightsBrightness(_obj, _offset, _decimals)
	var i
	for i = 0 to len(_obj.lights) loop
		_obj.lights[i].brightness = roundDec(clamp(_obj.lights[i].brightness + _offset, 0, 9999), _decimals)
		setLightBrightness(_obj.lights[i].light, _obj.lights[i].brightness)
	repeat
	
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = offsetGrpLightsBrightness(_obj.children[i], _offset, _decimals)
	repeat
return _obj

/* Sets brightess of all world lights in the map. */
function setWorldLightsBrightness(_br, _writeBr)
	var i
	for i = 0 to len(g_worldLights) loop
		if _writeBr then
			g_cell[g_worldLights[i].cell][g_worldLights[i].idx] = setGrpLightsBrightness(
				g_cell[g_worldLights[i].cell][g_worldLights[i].idx], 
				_br,
				[ "world", "worldshadow" ]
			)
		else
			setGrpLightsBrightness(
				g_cell[g_worldLights[i].cell][g_worldLights[i].idx], 
				_br,
				[ "world", "worldshadow" ]
			)
		endif
	repeat
return void

/* Sets brightness of all lights in a merged object back to the value stored
in _obj.lights[i].brightness. */
function restoreGrpLightsBrightness(_obj)
return restoreGrpLightsBrightness(_obj, [])

function restoreGrpLightsBrightness(_obj, _type)
	var i
	for i = 0 to len(_obj.lights) loop
		if !len(_type) or contains(_type, _obj.lights[i].name) then
			setLightBrightness(_obj.lights[i].light, _obj.lights[i].brightness)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = restoreGrpLightsBrightness(_obj.children[i], _type)
	repeat
return _obj

/* Sets brightness of all world lights in the map back to the value stored
in _obj.lights[i].brightness. */
function restoreWorldLightsBrightness()
	var i
	for i = 0 to len(g_worldLights) loop
		restoreGrpLightsBrightness(
			g_cell[g_worldLights[i].cell][g_worldLights[i].idx],
			[ "world", "worldshadow" ]
		)
	repeat
return void

/* Sets spread for all lights in a merged object. */
function setGrpLightsSpread(_obj, _spread)
	var i
	for i = 0 to len(_obj.lights) loop
		if _obj.lights[i].name == "spot" then
			_obj.lights[i].spread = _spread
			setLightSpread(_obj.lights[i].light, _spread)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = setGrpLightsSpread(_obj.children[i], _spread)
	repeat
return _obj

/* Offsets spread for all lights in a merged object by the given amount. */
function offsetGrpLightsSpread(_obj, _offset)
	var i
	for i = 0 to len(_obj.lights) loop
		if _obj.lights[i].name == "spot" then
			_obj.lights[i].spread = clamp(_obj.lights[i].spread + _offset, 0, 9999)
			setLightSpread(_obj.lights[i].light, _obj.lights[i].spread)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = offsetGrpLightsSpread(_obj.children[i], _offset)
	repeat
return _obj

/* Sets resolution for all lights in a merged object. */
function setGrpLightsRes(_obj, _res)
return setGrpLightsRes(_obj, _res, _obj)

function setGrpLightsRes(_obj, _res, _objCopy)
	_res = int(clamp(_res, 2, 8192))
	var i
	for i = 0 to len(_obj.lights) loop
		_objCopy.lights[i].light = -1
		
		if _obj.lights[i].name == "pointshadow" or _obj.lights[i].name == "worldshadow" then
			_objCopy.lights[i] = applyGrpTransform(_objCopy.lights[i], _objCopy, false, false)
			_obj.lights[i].res = _res
			removeLight(_obj.lights[i].light)
			_obj.lights[i].light = placeLightByType(_obj.lights[i].name, _obj.lights[i].col, 
				_objCopy.pos + _obj.lights[i].pos, _obj.lights[i].brightness, _obj.lights[i].res, 
				_obj.lights[i].fwd, _obj.lights[i].spread, _obj.lights[i].range)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_objCopy.children[i] = applyGrpTransform(_objCopy.children[i], _objCopy, false, true)
		_objCopy.children[i].scale *= _objcopy.scale
		_obj.children[i] = setGrpLightsRes(_obj.children[i], _res, _objCopy.children[i])
	repeat
return _obj

/* Offsets resolution for all lights in a merged object by the given amount. */
function offsetGrpLightsRes(_obj, _offset)
return offsetGrpLightsRes(_obj, _offset, _obj)

function offsetGrpLightsRes(_obj, _offset, _objCopy)
	var i
	for i = 0 to len(_obj.lights) loop
		_objCopy.lights[i].light = -1
		
		if _obj.lights[i].name == "pointshadow" or _obj.lights[i].name == "worldshadow" then
			_objCopy.lights[i] = applyGrpTransform(_objCopy.lights[i], _objCopy, false, false)
			
			if _offset >= 0 then
				_obj.lights[i].res = clamp(_obj.lights[i].res * 2, 2, 8192)
			else
				_obj.lights[i].res = clamp(_obj.lights[i].res / 2, 2, 8192)
			endif
			
			removeLight(_obj.lights[i].light)
			_obj.lights[i].light = placeLightByType(_obj.lights[i].name, _obj.lights[i].col, 
				_objCopy.pos + _obj.lights[i].pos, _obj.lights[i].brightness, _obj.lights[i].res, 
				_obj.lights[i].fwd, _obj.lights[i].spread, _obj.lights[i].range)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_objCopy.children[i] = applyGrpTransform(_objCopy.children[i], _objCopy, false, true)
		_objCopy.children[i].scale *= _objcopy.scale
		_obj.children[i] = offsetGrpLightsRes(_obj.children[i], _offset, _objCopy.children[i])
	repeat
return _obj

/* Sets range for all lights in a merged object. */
function setGrpLightsRange(_obj, _range)
return setGrpLightsRange(_obj, _range, _obj)

function setGrpLightsRange(_obj, _range, _objCopy)
	_range = int(clamp(_range, 0, 9999))
	var i
	for i = 0 to len(_obj.lights) loop
		_objCopy.lights[i].light = -1
		
		if _obj.lights[i].name == "worldshadow" then
			_objCopy.lights[i] = applyGrpTransform(_objCopy.lights[i], _objCopy, false, false)
			_obj.lights[i].range = _range
			removeLight(_obj.lights[i].light)
			_obj.lights[i].light = placeLightByType(_obj.lights[i].name, _obj.lights[i].col, 
				_objCopy.pos + _obj.lights[i].pos, _obj.lights[i].brightness, _obj.lights[i].res, 
				_obj.lights[i].fwd, _obj.lights[i].spread, _obj.lights[i].range)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_objCopy.children[i] = applyGrpTransform(_objCopy.children[i], _objCopy, false, true)
		_objCopy.children[i].scale *= _objcopy.scale
		_obj.children[i] = setGrpLightsRange(_obj.children[i], _range, _objCopy.children[i])
	repeat
return _obj

/* Offsets range for all lights in a merged object by the given amount. */
function offsetGrpLightsRange(_obj, _offset)
return offsetGrpLightsRange(_obj, _offset, _obj)

function offsetGrpLightsRange(_obj, _offset, _objCopy)
	var i
	for i = 0 to len(_obj.lights) loop
		_objCopy.lights[i].light = -1
		
		if _obj.lights[i].name == "worldshadow" then
			_objCopy.lights[i] = applyGrpTransform(_objCopy.lights[i], _objCopy, false, false)
			_obj.lights[i].range = clamp(_obj.lights[i].range + _offset, 0, 9999)
			removeLight(_obj.lights[i].light)
			_obj.lights[i].light = placeLightByType(_obj.lights[i].name, _obj.lights[i].col, 
				_objCopy.pos + _obj.lights[i].pos, _obj.lights[i].brightness, _obj.lights[i].res, 
				_obj.lights[i].fwd, _obj.lights[i].spread, _obj.lights[i].range)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_objCopy.children[i] = applyGrpTransform(_objCopy.children[i], _objCopy, false, true)
		_objCopy.children[i].scale *= _objcopy.scale
		_obj.children[i] = offsetGrpLightsRange(_obj.children[i], _offset, _objCopy.children[i])
	repeat
return _obj

/* Sets color for all lights in a merged object. */
function setGrpLightsCol(_obj, _col)
	var i
	for i = 0 to len(_obj.lights) loop
		_obj.lights[i].col = _col
		setLightColor(_obj.lights[i].light, _col)
		if g_editor then
			setSpriteColor(_obj.lights[i].spr, _col)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = setGrpLightsCol(_obj.children[i], _col)
	repeat
return _obj

/* Gets a list of the light types present in a merged object. */
function getGrpLightsTypes(_obj)
return getGrpLightsTypes(_obj, [])

function getGrpLightsTypes(_obj, _types)
	var i
	for i = 0 to len(_obj.lights) loop
		if !contains(_types, _obj.lights[i].name) then
			_types = push(_types, _obj.lights[i].name)
		endif
	repeat
	
	for i = 0 to len(_obj.children) loop
		_types = getGrpLightsTypes(_obj.children[i], _types)
	repeat	
return _types

/* Check whether a merged object contains any lights. */
function objContainsLight(_obj)
return objContainsLight(_obj, false)

function objContainsLight(_obj, _result)
	if len(_obj.lights) then
		_result = true
	else
		var i
		for i = 0 to len(_obj.children) loop
			_result = objContainsLight(_obj.children[i], _result)
		repeat
	endif
return _result

/* Removes a given world light from the global list of world lights. */
function removeWorldLightRecord(_cell, _idx)
	g_worldLights = removeLightRecord(g_worldLights, _cell, _idx)
return void

/* Removes a given cell's lights from the global list of visible light icons. */
function removeLightIconRecord(_cell)
	g_lightIcons = removeLightRecord(g_lightIcons, _cell, -1)
return void

function removeLightIconRecord(_cell, _idx)
	g_lightIcons = removeLightRecord(g_lightIcons, _cell, _idx)
return void

/* General-purpose removal of specialized light record list entries. */
function removeLightRecord(_arr, _cell, _idx)
	var i = 0
	while i < len(_arr) loop
		if _arr[i].cell == _cell and (_arr[i].idx == _idx or _idx == -1) then
			_arr = remove(_arr, i)
			
			if _idx > -1 then break endif
			
			i -= 1
		endif
		
		i += 1
	repeat
return _arr

	// ----------------------------------------------------------------
	// ACTIVE OBJECT

/* Sets the brush to a given object defnition. */
function createActiveObj(_bank, _idx)
return createActiveObj(_bank, _idx, {1, 1, 1}, {0, 0, 1}, {0, 1, 0}, false, -1)

function createActiveObj(_bank, _idx, _scale)
return createActiveObj(_bank, _idx, _scale, {0, 0, 1}, {0, 1, 0}, false, -1)

function createActiveObj(_bank, _idx, _scale, _fwd, _up)
return createActiveObj(_bank, _idx, _scale, _fwd, _up, false, -1)

function createActiveObj(_bank, _idx, _scale, _fwd, _up, _useTemplate, _lightTemplateObj)
	var singleObjFromObjOrigin = false
	var lightBuffer = -1
	var defObj = g_obj[_bank][_idx]
	
	if len(defObj.children) == 1 then
		/* If this is a group with only one child that uses the child's origin,
		remove the group and use the child as the base object. This lets us
		fully restore the rotation state of the object to the cursor widget
		visualization instead of masking it with the group's zeroed state. */
		if equals(defObj.children[0].pos, {0, 0, 0}, 0.001) then
			singleObjFromObjOrigin = true
			g_activeObj = defObj.children[0]
			/* Removing the group means this object can't be fully recreated by 
			loading a def, so buffer the unique light data for reconstruction. */
			lightBuffer = g_activeObj.lights
			g_cur.fwd = defObj.children[0].fwd
			g_cur.up = defObj.children[0].up
			_scale = defObj.children[0].scale * _scale
			g_cur.scale = _scale
			decodeBank(_bank, g_activeObj.bankIdx)
			decodeIdx(_idx, g_activeObj.bankIdx)
			var defCol = defObj.children[0].col
			var defMat = defObj.children[0].mat
			getObjDef(defObj, g_activeObj)
			
			g_activeObj.col = defCol
			g_activeObj.mat = defMat
			
			if !g_cur.isMerged then
				g_cur.isMerged = true
			endif
		endif
	endif
	
	if !singleObjFromObjOrigin then	
		g_cur.fwd = _fwd
		g_cur.up = _up
		g_cur.scale = _scale
	endif
	
	if !len(defObj.children) and !len(defObj.lights) then
		g_activeObj.bankIdx = encodeBankIdx(_bank, _idx)
		g_activeObj.children = []
		g_activeObj.lights = []
		
		if !singleObjFromObjOrigin then
			g_activeObj.col = {1, 1, 1, 1}
			g_activeObj.mat = {0, 1, 0}
		endif
		
		g_cur.activeObj = g_activeObj
		g_activeObj.fwd = _fwd
		g_activeObj.up = _up
		
		g_activeObj.obj = placeObjDef(g_obj[_bank][_idx], 
			{0, 0, 0},
			g_cur.scale
		)
		g_cur.activeObj.obj = placeObjDef(g_obj[_bank][_idx], 
			{0, 0, 0},
			g_cur.scale
		)
	else
		g_activeObj = activeFromObjDef(_bank, _idx)
		
		/* If we've stripped a single light object out of a container group, our activeObj 
		no longer conforms to any existing definition; therefore, restore the buffered group 
		child light data to match what it was when the group existed, because calling 
		activeFromObjDef() has reset any lights to default. */
		if singleObjFromObjOrigin then
			g_activeObj.lights = lightBuffer
		endif
		
		g_cur.activeObj = g_activeObj
		
		var newGrp = placeGrpObj(g_activeObj, g_activeObj)
		g_activeObj.obj = newGrp.obj
		g_activeObj.children = newGrp.children
		g_activeObj.lights = newGrp.lights
		g_activeObj.col = {-1, -1, -1, -1}
		g_activeObj.mat = {-1, -1, -1}
		
		newGrp = placeGrpObj(g_cur.activeObj, g_cur.activeObj)
		g_cur.activeObj.obj = newGrp.obj
		g_cur.activeObj.children = newGrp.children
		g_cur.activeObj.lights = newGrp.lights
		g_cur.activeObj.col = {-1, -1, -1, -1}
		g_cur.activeObj.mat = {-1, -1, -1}
	endif
	
	/* Modified light properties aren't stored in a default definition, so there
	may be cases where we want to clone light data to the active object instead 
	of using the defaults. */
	if _useTemplate then
		cloneObjLightDataRecursive(_lightTemplateObj, g_activeObj)
		g_cur.activeObj = cloneObjLightDataRecursive(_lightTemplateObj, g_cur.activeObj)
	endif
	
	var maxDim = getMaxDim(getObjDef(-1, g_activeObj).ext, {1, 1, 1})
	var hudScale = 1
	if maxDim != 0 then
		hudScale = 0.07 / maxDim
	endif
	
	setObjRot(g_cur.activeObj.obj, {0, 0, 0}, g_cur.fwd, g_cur.up)
	g_activeObj.scale = {hudScale, hudScale, hudScale}
	updateActiveObjPos()
	setObjectParent(g_activeObj.obj, g_viewport)
	restoreDefaultObjCol(g_activeObj)
	restoreDefaultObjCol(g_cur.activeObj)
	
	g_cur.xyz = setXYZObjExt(g_cur.xyz, getObjDef(-1, g_activeObj).ext, 0.5)
	g_cur.scale = _scale
	updateCurMode()
	updateCurWidgets()
	updateViewport()
return void

/* Sets position and scale for the corner brush object visualization. Needs to
be rerun when the FOV changes. */
function updateActiveObjPos()
	setObjectScale(g_activeObj.obj, g_activeObj.scale * getUiFovScale(g_cam.fov))
	
	var scrPos = {gwidth() - gwidth() / 16, gheight() - g_statusBarH - gwidth() / 16}
	var zDepth = 0.5
	g_activeObj.pos = screenPosToWorldPos(scrPos, zDepth, g_cam.fwd, g_cam.up, g_cam.pos, g_cam.fov)
	setGrpLightsPos(g_activeObj, g_cam.fov)
	g_activeObj.pos = worldVecToLocalVec(g_activeObj.pos, g_cam.fwd, g_cam.up, g_cam.pos)	
	setObjectPos(g_activeObj.obj, g_activeObj.pos - {0, getActiveObjMidpoint().y, 0})
	
	setGrpLightsSprScale(g_activeObj, {0.2, 0.2, 0.2})
	setGrpLightsBrightness(g_activeObj, 0)
return void

/* Returns the extent midpoint of the brush's corner visualization. */
function getActiveObjMidpoint()
	var def
	getObjDef(def, g_activeObj)
	var ext = [
		.lo = def.ext.lo * g_activeObj.scale.x * getUiFovScale(g_cam.fov),
		.hi = def.ext.hi * g_activeObj.scale.x * getUiFovScale(g_cam.fov)
	]
return getExtCenter(ext)

/* Removes the current brush object and sets a new one. */
function replaceActiveObj(_bank, _idx)
return replaceActiveObj(_bank, _idx, {1, 1, 1}, {0, 0, 1}, {0, 1, 0}, false, -1)

function replaceActiveObj(_bank, _idx, _scale)
return replaceActiveObj(_bank, _idx, _scale, {0, 0, 1}, {0, 1, 0}, false, -1)

function replaceActiveObj(_bank, _idx, _scale, _fwd, _up)
return replaceActiveObj(_bank, _idx, _scale, _fwd, _up, false, -1)

function replaceActiveObj(_bank, _idx, _scale, _fwd, _up, _useTemplate, _lightTemplateObj)
	removeActiveObj()
	createActiveObj(_bank, _idx, _scale, _fwd, _up, _useTemplate, _lightTemplateObj)
return void

/* Removes the current brush object. */
function removeActiveObj()
	if len(g_activeObj.children) == 0 and len(g_activeObj.lights) == 0 then
		removeObject(g_activeObj.obj)
		removeObject(g_cur.activeObj.obj)
	else
		g_activeObj = removeGroupObj(g_activeObj)
		g_cur.activeObj = removeGroupObj(g_cur.activeObj)
	endif
return void

/* Applies rotation to the brush object.
Snap types: 0 -- no snap; 1 -- snap to; 2 -- snap by */
function rotateActiveObj(_axis, _deg, _snapType, _snapAmount, _isLocal)
	if _deg != 0 then
		var locAxis
		var worldAxis
		if _isLocal then
			locAxis = _axis
			worldAxis = localVecToWorldVec(_axis, g_cur.fwd, g_cur.up, {0, 0, 0})
		else
			locAxis = worldVecToLocalVec(_axis, g_cur.fwd, g_cur.up, {0, 0, 0})
			worldAxis = _axis
		endif
		
		if _snapType then
			if _snapType == 2 then
				_deg = getSnapToDeg(getSign(_deg), worldAxis, _snapAmount, 
					g_cur.fwd,g_cur.up)
			else
				_deg = _snapAmount * getSign(_deg)
			endif
		endif
		
		rotateObject(g_cur.activeObj.obj, locAxis, _deg)
		g_cur.fwd = axisRotVecBy(g_cur.fwd, worldAxis, _deg)
		g_cur.up = axisRotVecBy(g_cur.up, worldAxis, _deg)
		
		var i
		for i = 0 to len(g_cur.activeObj.lights) loop
			g_cur.activeObj.lights[i].fwd = 
				axisRotVecBy(g_cur.activeObj.lights[i].fwd, worldAxis, _deg)
			setLightDir(g_cur.activeObj.lights[i].light, g_cur.activeObj.lights[i].fwd)
		repeat
	endif
return void

/* Per-frame updates to brush objects -- rotates corner visualization and
flashes cursor. */
function updateActive()
	var def
	getObjDef(def, g_activeObj)
	var scaledExt = [
		.lo = def.ext.lo * g_activeObj.scale,
		.hi = def.ext.hi * g_activeObj.scale
	]
	var lightParent = [
		.fwd = g_cam.fwd,
		.up = g_cam.up,
		.pos = g_cam.pos,
		.scale = {1, 1, 1}
	]
	
	g_activeObj = updateMenuObjTransform(g_activeObj, scaledExt, g_cam.fov, deltaTime(), true, lightParent)
	
	if g_blink.needUpdate then
		var newCurCol = interpolate(expo_in_out, g_theme.bgSelCol, g_theme.bgCol, g_blink.state)
		
		var i
		for i = 0 to len(g_cur.obj.obj) loop
			setObjectMaterial(g_cur.obj.obj[i], newCurCol, 0, 0)
			setSpriteColor(g_cur.spr, {newCurCol.r, newCurCol.g, newCurCol.b, g_sprAlpha})
		repeat
		
		if g_blink.state then
			restoreDefaultObjCol(g_cur.activeObj)
			restoreGrpLightsSprCol(g_cur.activeObj)
		else
			applyGroupMaterial(g_cur.activeObj, {1, 1, 1, 0}, 0, 1, 0)
			setGrpLightsSprCol(g_cur.activeObj, {1, 1, 1, 0})
		endif
	endif
return void

	// ----------------------------------------------------------------
	// SELECTION

/* Finds _obj's index in the list of selected objects. */
function getSelIdx(_obj)
	_obj = getMapObjFromRef(_obj)
	var selidx = -1
	
	var i
	for i = 0 to len(g_sel) loop
		if mapObjEquals(_obj, 
				getMapObjFromRef(g_cell[g_sel[i][0].cell][g_sel[i][0].idx])) then
			selIdx = i
			break
		endif
	repeat
return selIdx

function getSelIdx(_cell, _idx)
	var obj = getMapObjFromRef(g_cell[_cell][_idx])
return getSelIdx(obj)

/* Adds an object to the selection list. */
function  addObjToSel(_cell, _idx)
	var cellIdx = getAllObjCopies(_cell, _idx)
	g_sel = push(g_sel, cellIdx)
return void

/* Removes all objects from the selection list. */
function clearSel(_sel, _objExists)
	if _objExists then
		var i
		var obj
		for i = 0 to len(_sel) loop
			obj = getMapObjFromRef(g_cell[_sel[i][0].cell][_sel[i][0].idx])
			restoreDefaultObjCol(obj)
			restoreGrpLightsSprCol(obj)
		repeat
	endif
	
	_sel = []
return _sel

/* Removes an object from the selection list. _idx can be index in sel or a 
mapObj struct. */
function removeObjFromSel(_sel, _idx, _objExists)
	if getType(_idx) == "struct" then
		_idx = getSelIdx(_obj)
	endif
	
	if _objExists then
		var obj = getMapObjFromRef(g_cell[_sel[_idx][0].cell][_sel[_idx][0].idx])
		restoreDefaultObjCol(obj)
		restoreGrpLightsSprCol(obj)
	endif
	
	_sel = remove(_sel, _idx)
return _sel

function removeObjFromSel(_sel, _cell, _idx, _objExists)
	var selIdx = getSelIdx(_cell, _idx)
	removeObjFromSel(_sel, _idx, _objExists)
return _sel

/* Gets a list of all mapObj structs in the selection. */
function getObjFromSel()
	array obj[len(g_sel)]
	var i
	for i = 0 to len(g_sel) loop
		if !isMapObjRef(-1, g_cell[g_sel[i][0].cell][g_sel[i][0].idx]) then
			obj[i] = g_cell[g_sel[i][0].cell][g_sel[i][0].idx]
		endif
	repeat
return obj

/* Removes the given object if it exists in the selection. Must be called
before the object is actually deleted because it needs to consult the object
to find all its references. */
function adjustSelForRemovedObj(_sel, _cell, _idx)
	var baseObj = getMapObjFromRef(g_cell[_cell][_idx])
	var h
	var refCell
	var refIdx
	var i
	var j

	for h = 0 to len(baseObj.cellIdx) loop
		refCell = decodeCell(baseObj.cellIdx[h])
		decodeIdx(refIdx, baseObj.cellIdx[h])
		
		i = 0
		while i < len(_sel) loop
			j = 0
			while j < len(_sel[i]) loop
				if _sel[i][j].cell == refCell then
					if _sel[i][j].idx > refIdx then
						_sel[i][j].idx -= 1
					else if _sel[i][j].idx == refIdx then
						if len(_sel[i]) <= 1 then
							_sel = removeObjFromSel(_sel, i, false)
							
							i -= 1
							break
						else
							_sel[i] = remove(_sel[i], j)
						endif
						
						j -= 1
					endif endif
				endif
				
				j += 1
			repeat
			
			i += 1
		repeat
	repeat
return _sel

	// ----------------------------------------------------------------
	// MASS SELECTION

/* Inits mass selection. */
function massSel()
	endCurMode(g_cur.mode)
	g_cur.mode = "masssel"
	
	var newExt = [ .lo = {0, 0, 0}, .hi = {0, 0, 0} ]
	var startCell = [ g_cur.cell, [] ]
	g_cur.massSel = [
		.obj = createWireCubeObj(g_cur.pos, 
			newExt, 0.015, g_theme.textSelCol, 0, 1, 0.55),
		.pos = g_cur.pos,
		.cursorPos = g_cur.pos,
		.prevCellPos = g_cur.cellPos,
		.ext = newExt,
		.cell = [ startCell ],
		.newlyAddedCell = -1,
		.contents = []
	]
return void

/* Handles starting and stopping mass selection. */
function startMassSel(_c)
	_c = applyKb(_c, g_bind.edit).c
	
	if _c.b and !g_cDat[g_cIdx.b].held then
		g_cDat[g_cIdx.b].held = true
		
		if g_cur.mode != "masssel" then
			massSel()
		else
			var selObj = getMassSelContentsCellIdx(g_cur.massSel.cell)
			var i
			var objRef
			
			for i = 0 to len(selObj) loop
				objRef = g_cell[selObj[i].cell][selObj[i].idx]
				if isMapObjRef(-1, objRef) then
					selObj[i].cell = decodeCell(objRef.cellIdx)
					selObj[i].idx = decodeIdx(-1, objRef.cellIdx)
				endif
				
				g_cell[selObj[i].cell][selObj[i].idx].highlight = false
				var obj = g_cell[selObj[i].cell][selObj[i].idx]
				restoreDefaultObjCol(obj)
				restoreGrpLightsSprCol(obj)
			repeat
			
			endCurMode(g_cur.mode)
			g_cur.mode = "move"
		endif
	else if !_c.b then
		g_cDat[g_cIdx.b].held = false
	endif endif
	
	if _c.a and !g_cDat[g_cIdx.a].held then
		g_cDat[g_cIdx.a].held = true
		
		if g_cur.mode == "masssel" then
			removeGenericObj(g_cur.massSel.obj)
			
			var selObj = getMassSelContentsCellIdx(g_cur.massSel.cell)
			var i
			var objRef
			var cellIdx
			
			for i = 0 to len(selObj) loop
				objRef = g_cell[selObj[i].cell][selObj[i].idx]
				if isMapObjRef(-1, objRef) then
					selObj[i].cell = decodeCell(objRef.cellIdx)
					selObj[i].idx = decodeIdx(-1, objRef.cellIdx)
				endif
				
				g_cell[selObj[i].cell][selObj[i].idx].highlight = false
				cellIdx = getAllObjCopies(selObj[i].cell, selObj[i].idx)
				
				if !strContains(str(g_sel), str(cellIdx[0])) then
					g_sel = push(g_sel, cellIdx)
				endif
			repeat
			
			g_cur.massSel = -1
			g_cur.mode = "move"
			g_blink.needUpdate = true
		endif
	else if !_c.a then
		g_cDat[g_cIdx.a].held = false
	endif endif
return void

/* Recalculates mass selection bounds if needed. */
function updateMassSel()
	if g_cur.mode == "masssel" then
		if g_cur.massSel.cursorPos != g_cur.pos then
			g_cur.massSel.ext = [
				.lo = {0, 0, 0},
				.hi = g_cur.pos - g_cur.massSel.pos
			]
			setWireCubeObjExt(g_cur.massSel.obj, g_cur.massSel.ext)
			
			var dir = getCellDir(g_cur.pos - g_cur.prevPos)
			updateAllMassSelContents(dir, g_cur.cell, g_cur.cellPos)
			g_cur.massSel.cursorPos = g_cur.pos
		endif
	endif
return void

/* Recalculates mass selection contents as a result of expansion or contraction
in a given direction. */
function updateAllMassSelContents(_dir, _curCell, _curCellPos)
	var cellW = getCellWidth()
	var cellDim = {0, 0, 0}
	var cursorCell = _curCell
	var cursorCellPos = _curCellPos
	var origCellPos = getCellPosFromPos(g_cur.massSel.pos)
	var prevCursorCellPos = g_cur.massSel.prevCellPos
	var axisStart = [ 0, 0, 0 ]
	
	cellDim.x = round((origCellPos.x - cursorCellPos.x) / cellW)
	cellDim.y = round((origCellPos.y - cursorCellPos.y) / cellW)
	cellDim.z = round((origCellPos.z - cursorCellPos.z) / cellW)
	
	var posShrink = {0, 0, 0}
	var negShrink = {0, 0, 0}
	var i = 0
	var j = 0
	var expanded

	if prevCursorCellPos != cursorCellPos then
		// Cull cells
		// For each global axis
		for i = 0 to 3 loop
			posShrink[i] = _dir[i] < 0 and prevCursorCellPos[i] > origCellPos[i]
			negShrink[i] = _dir[i] > 0 and prevCursorCellPos[i] < origCellPos[i]
			
			// If selection bounds are contracting on this axis
			if (posShrink[i] and cursorCellPos[i] < prevCursorCellPos[i])
					or (negShrink[i] and cursorCellPos[i] > prevCursorCellPos[i])
					then
				// Remove out-of-range cells
				j = 0
				while j < len(g_cur.massSel.cell) loop
					if (posShrink[i] and g_cell[g_cur.massSel.cell[j][0]][0][i] > cursorCellPos[i])
							or (negShrink[i] and g_cell[g_cur.massSel.cell[j][0]][0][i] < cursorCellPos[i])
							then
						removeMassSelHighlight(g_cur.massSel.cell[j][0])
						g_cur.massSel.cell = remove(g_cur.massSel.cell, j)
						
						j -= 1
					endif
					
					j += 1
				repeat
			endif
		repeat
		
		/* Update objects in previous frontier cells in case there are objects
		between the previous selection position within the cells and and the cells'
		bounds. */
		var skipArr = [ false, false, false ]
		for i = 0 to 3 loop
			if _dir[i] and posShrink[i] == 0 and negShrink[i] == 0 then
				getMassSelCellObj(i, skipArr, prevCursorCellPos)
				skipArr[i] = true
			endif
		repeat
		
		expanded = expandMassSelBoundary(0, _dir, cursorCell, cursorCellPos, cellDim, axisStart, posShrink, negShrink)
		if expanded then
			axisStart = getMassSelAxisStart(0, axisStart, _dir, cellDim)
		endif
		expanded = expandMassSelBoundary(1, _dir, cursorCell, cursorCellPos, cellDim, axisStart, posShrink, negShrink)
		if expanded then
			axisStart = getMassSelAxisStart(0, axisStart, _dir, cellDim)
		endif
		expandMassSelBoundary(2, _dir, cursorCell, cursorCellPos, cellDim, axisStart, posShrink, negShrink)
	endif

	if g_cur.massSel.newlyAddedCell >= 0 then
		if findAtSubIdx(g_cur.massSel.cell, g_cur.massSel.newlyAddedCell, 0) == -1 then
			g_cur.massSel.cell = push(g_cur.massSel.cell, [ g_cur.massSel.newlyAddedCell, [] ])
		endif
	endif
	
	skipArr = [ false, false, false ]
	for i = 0 to 3 loop
		if _dir[i] then
			getMassSelCellObj(i, skipArr, cursorCellPos)
			skipArr[i] = true
		endif
	repeat
	
	g_cur.massSel.contents = getMassSelContentsObj(g_cur.massSel.cell, false)
	g_cur.massSel.newlyAddedCell = -1
	g_cur.massSel.prevCellPos = cursorCellPos
return void

/* Gets cell objects for cells that are on the expanding boundary of the selection. */
function getMassSelCellObj(_axis, _skipArr, _focusCellPos)
	var collider = placeObject(cube, g_cur.massSel.pos, {0.5, 0.5, 0.5})
	
	var i
	var cellIdx
	var cellPos
	var colliderExt
	var colliderPos
	var colliderScale
	var j
	var obj
	var objCell
	var objIdx
	
	for i = 0 to len(g_cur.massSel.cell) loop
		cellIdx = g_cur.massSel.cell[i][0]
		
		/* If cell is on the given axis in the expanding boundary of the selection
		and hasn't already been checked. */
		if g_cell[cellIdx][0][_axis] == _focusCellPos[_axis] 
				and (!_skipArr[0] or g_cell[cellIdx][0][0] != _focusCellPos[0])
				and (!_skipArr[1] or g_cell[cellIdx][0][1] != _focusCellPos[1])
				and (!_skipArr[2] or g_cell[cellIdx][0][2] != _focusCellPos[2]) 
				and len(g_cell[cellIdx]) > g_cellObjStart 
				and cellIdx >= 0 then
			g_cur.massSel.cell[i][1] = []
			
			cellPos = g_cell[cellIdx][0]
			colliderExt = [
				.lo = {
					max(cellPos.x + g_cellExt.lo.x, g_cur.massSel.pos.x + g_cur.massSel.ext.lo.x),
					max(cellPos.y + g_cellExt.lo.y, g_cur.massSel.pos.y + g_cur.massSel.ext.lo.y),
					max(cellPos.z + g_cellExt.lo.z, g_cur.massSel.pos.z + g_cur.massSel.ext.lo.z)
				},
				.hi = {
					min(cellPos.x + g_cellExt.hi.x, g_cur.massSel.pos.x + g_cur.massSel.ext.hi.x),
					min(cellPos.y + g_cellExt.hi.y, g_cur.massSel.pos.y + g_cur.massSel.ext.hi.y),
					min(cellPos.z + g_cellExt.hi.z, g_cur.massSel.pos.z + g_cur.massSel.ext.hi.z)
				}
			]
			colliderPos = {
				(colliderExt.lo.x + colliderExt.hi.x) / 2,
				(colliderExt.lo.y + colliderExt.hi.y) / 2,
				(colliderExt.lo.z + colliderExt.hi.z) / 2
			}
			colliderScale = (colliderExt.hi - colliderExt.lo) / 2
			colliderScale = {abs(colliderScale.x), abs(colliderScale.y), abs(colliderScale.z)}
			
			// Collision won't be detected if one of the collider dimensions is 0
			for j = 0 to 3 loop
				if equals(colliderScale[j], 0, 0.0001) then
					colliderScale[j] += 0.0001
				endif
			repeat
			
			setobjectPos(collider, colliderPos)
			setObjectScale(collider, colliderScale)
			
			for j = g_cellObjStart to len(g_cell[cellIdx]) loop
				obj = getMapObjFromRef(g_cell[cellIdx][j])
				objCell = getMapObjCell(obj)
				objIdx = getMapObjIdx(obj)
				
				if mergedObjIntersect(obj, collider, false) then
					g_cur.massSel.cell[i][1] = push(g_cur.massSel.cell[i][1], j)
					g_cell[objCell][objIdx].highlight = cellIdx + 1 // Needs to evaluate to true, so cell 0 needs to be offset
				else
					if g_cell[objCell][objIdx].highlight == cellIdx + 1 then
						g_cell[objCell][objIdx].highlight = false
						var obj = g_cell[objCell][objIdx]
						restoreDefaultObjCol(obj)
						restoreGrpLightsSprCol(obj)
					endif
				endif
				
				g_blink.needUpdate = true
			repeat
		endif
	repeat
	
	removeObject(collider)
return void

/* Because axes overlap at the cursor position, evaluating the cells in sequential
axes will cover some cells multiple times. To avoid this duplication, this function
looks at whether the boundary's direction has caused evaluation on _axis, and if so,
sets a limit for future evaluation of that axis that will skip the cells that were
already evaluated. Because selection dimensions can be positive or negative, causing 
the evaluation order to be positive or negative, the cell skip boundary will also be
either positive or negative depending on dimensions and direction.

For _axis, 0 = x, 1 = y, 2 = z.*/
function getMassSelAxisStart(_axis, _axisStart, _dir, _cellDim)
	if _dir[_axis] then
		if _cellDim[_axis] >= 0 then
			_axisStart[_axis] = 1
		else
			_axisStart[_axis] = -1
		endif
	endif
return _axisStart

/* Expands or shrinks the mass selection box along a given axis, evaluating any new 
cells it now covers on that axis or removing those it no longer intersects. Passing
_axisStart data generated by getMassSelAxisStart() will cause the algorithm to skip
cells that were already evaluated in previous checks of different axes. */
function expandMassSelBoundary(_axis, _dir, _focusCell, _focusCellPos, _cellDim, _axisStart, _posShrink, _negShrink)
	var cellW = getCellWidth()
	var origCellPos = getCellPosFromPos(g_cur.massSel.pos)
	var curCell = _focusCell
	var curCellPos = _focusCellPos
	var curPushCell = _focusCell
	var curPushPos = _focusCellPos
	
	// Define secondary axes based on the primary axis. Secondaries are always in ascending order.
	// 0 = x, 1 = y, 2 = z
	array offAxis[2]
	if _axis == 0 then
		offAxis[0] = 1
		offAxis[1] = 2
	else if _axis == 1 then
		offAxis[0] = 0
		offAxis[1] = 2
	else
		offAxis[0] = 0
		offAxis[1] = 1
	endif endif
	
	var iAdjIdx = getMassSelCellDir(offAxis[0], _focusCellPos, origCellPos)
	var jAdjIdx = getMassSelCellDir(offAxis[1], _focusCellPos, origCellPos)
	
	var iCellPosInc = getMassSelCellPosInc(cellW, offAxis[0], _focusCellPos, origCellPos)
	var jPushPosInc = getMassSelCellPosInc(cellW, offAxis[1], _focusCellPos, origCellPos)
	
	/* If the axis boundary is expanding, check all cells in the boundary, excluding 
	those that have already been checked. The check accounts for both positive and 
	negative expansion directions. */
	var i = 0
	var j
	var updated = false
	
	while (_posShrink[_axis] == 0 and _negShrink[_axis] == 0 and _dir[_axis] and _cellDim[_axis] != 0) 
			and (i == 0 or (_cellDim[offAxis[0]] > 0 and i <= _cellDim[offAxis[0]]) or (_cellDim[offAxis[0]] < 0 and i >= _cellDim[offAxis[0]])) loop
		j = 0
		while j == 0 or (_cellDim[offAxis[1]] > 0 and j <= _cellDim[offAxis[1]]) or (_cellDim[offAxis[1]] < 0 and j >= _cellDim[offAxis[1]]) loop
			// Exclude i == 0 and/or j == 0 if those cells have previously been checked, as recorded in _axisStart
			if curPushCell >= 0 
					and (((_cellDim[offAxis[0]] >= 0 and i >= _axisStart[offAxis[0]]) or (_cellDim[offAxis[0]] < 0 and i <= _axisStart[offAxis[0]]))
					and ((_cellDim[offAxis[1]] >= 0 and j >= _axisStart[offAxis[1]]) or (_cellDim[offAxis[1]] < 0 and j <= _axisStart[offAxis[1]])))
					then
				g_cur.massSel.cell = push(g_cur.massSel.cell, [ curPushCell, [] ])
				updated = true
			endif
			
			/* Index update depends on whether this is a positive or a negative 
			expansion. We always check from the cursor position toward the selection 
			origin, so the check direction can increment or decrement depending on 
			the cursor's position relative to the selection origin. */
			if j != _cellDim[offAxis[1]] then
				curPushCell = getAdj(curPushCell, curPushPos)[jAdjIdx]
				curPushPos += jPushPosInc
			endif
			
			if _cellDim[offAxis[1]] >= 0 then
				j += 1
			else 
				j -= 1
			endif
		repeat
		
		if i != _cellDim[offAxis[0]] then
			curCell = getAdj(curCell, curCellPos)[iAdjIdx]
			curCellPos += iCellPosInc
			curPushPos = curCellPos
			curPushCell = curCell
		endif
		
		if _cellDim[offAxis[0]] >= 0 then
			i += 1
		else 
			i -= 1
		endif
	repeat
return updated

/* Returns an adjacent index corresponding to the checked cell's direction
from the origin cell on the given axis. Adjacent indices are numbered from
0 through 26 and increment from {-1, -1, -1} to {1, 1, 1} by increasing 
X, then Y, then Z, and represent all of the cells adjacent to a given cell
at {0, 0, 0} (which makes the cell adjacent index 13 relative to itself). */
function getMassSelCellDir(_axis, _focusCellPos, _origCellPos)
	var adjIdx
	
	if _focusCellPos[_axis] > _origCellPos[_axis] then
		loop if _axis == 0 then
			adjIdx = 12 // -X
			break endif
		if _axis == 1 then
			adjIdx = 10 // -Y
			break endif
		if _axis == 2 then
			adjIdx = 4 // -Z
			break
		endif break repeat
	else
		loop if _axis == 0 then
			adjIdx = 14 // +X
			break endif
		if _axis == 1 then
			adjIdx = 16 // +Y
			break endif
		if _axis == 2 then
			adjIdx = 22 // +Z
			break
		endif break repeat
	endif
return adjIdx

/* Determines the direction in which cells should be evaluated along
a given axis based on whether the selection dimension on that axis is
postive or negative. */
function getMassSelCellPosInc(_unit, _axis, _cursorCellPos, _origCellPos)
	var cellPosInc = {0, 0, 0}
	cellPosInc[_axis] = _unit
	
	if _cursorCellPos[_axis] > _origCellPos[_axis] then
		cellPosInc[_axis] = -_unit
	endif
return cellPosInc

/* Removes the highlight flash from objects in the given cell. */
function removeMassSelHighlight(_cellIdx)
	var i
	var obj
	var objCell
	var objIdx
	
	for i = g_cellObjStart to len(g_cell[_cellIdx]) loop
		objCell = getMapObjCell(g_cell[_cellIdx][i])
		objIdx = getMapObjIdx(g_cell[_cellIdx][i])
		
		g_cell[objCell][objIdx].highlight = false
		obj = g_cell[objCell][objIdx]
		restoreDefaultObjCol(obj)
		restoreGrpLightsSprCol(obj)
	repeat
return void

/* Returns a list of cells and indices within cells representing the
mass selected objects. There is no filtering of duplicates, so the
same object may be listed in multiple cells. */
function getMassSelContentsCellIdx(_cellArr)
	var contents = []
	var i
	var cell
	var j
	var idx
	
	for i = 0 to len(_cellArr) loop
		cell = _cellArr[i][0]
		for j = 0 to len(_cellArr[i][1]) loop
			idx = _cellArr[i][1][j]
			contents = push(contents, [ .cell = cell, .idx = idx ])
		repeat
	repeat
return contents

/* Returns the actual mapObj structs in the mass selection. This is slower than 
getMassSelContentsCellIdx(), especially if _filterDup is enabled. */
function getMassSelContentsObj(_cellArr, _filterDup)
	var contents = []
	var i
	var cell
	var j
	var idx
	var obj
	
	for i = 0 to len(_cellArr) loop
		cell = _cellArr[i][0]
		
		for j = 0 to len(_cellArr[i][1]) loop
			idx = _cellArr[i][1][j]
			obj = getMapObjFromRef(g_cell[cell][idx])
			
			if !_filterDup then
				contents = push(contents, obj)
			else if !containsMapObj(contents, obj) then
				contents = push(contents, obj)
			endif endif
		repeat
	repeat
return contents

/* This evaluates everything in the mass selection area. Call it to deal
with situations where the cursor warps or moves by more than one cell, which
would otherwise cause it to skip evaluation for those cells. */
function warpMassSelPos(_prevCurPos)
	function warpMassSelPos_moveAlongAxis(_axis, _newPos, _prevCurPos)
		var cellW = getCellWidth()
		var dir = {0, 0, 0}
		if g_cur.pos[_axis] > _prevCurPos[_axis] then
			dir[_axis] = 1
		else
			dir[_axis] = -1
		endif
		
		while (g_cur.pos[_axis] > _prevCurPos[_axis] and _newPos[_axis] <= g_cur.pos[_axis]) 
				or (g_cur.pos[_axis] < _prevCurPos[_axis] and _newPos[_axis] >= g_cur.pos[_axis]) loop
			showLoadBox("Recalculating mass selection area ...", false, true, false)
			
			g_cur.massSel.ext = [
					.lo = {0, 0, 0},
					.hi = _newPos - g_cur.massSel.pos
				]
				
				updateAllMassSelContents(dir, getCellIdxFromPos(_newPos), getCellPosFromPos(_newPos))
				g_cur.massSel.cursorPos = _newPos
			
			if _newPos[_axis] == g_cur.pos[_axis] then
				break
			endif
			
			if g_cur.pos[_axis] >= _prevCurPos[_axis] then
				_newPos[_axis] += cellW
				
				if _newPos[_axis] > g_cur.pos[_axis] then
					_newPos[_axis] = g_cur.pos[_axis]
				endif
			else
				_newPos[_axis] -= cellW
				
				if _newPos[_axis] < g_cur.pos[_axis] then
					_newPos[_axis] = g_cur.pos[_axis]
				endif
			endif
		repeat
	return _newPos
	
	var newPos = _prevCurPos
	newPos = warpMassSelPos_moveAlongAxis(0, newPos, _prevCurPos)
	newPos = warpMassSelPos_moveAlongAxis(1, newPos, _prevCurPos)
	newPos = warpMassSelPos_moveAlongAxis(2, newPos, _prevCurPos)
	
	setWireCubeObjExt(g_cur.massSel.obj, g_cur.massSel.ext)
	
	removeLoadSpr()
return void
	
	// ----------------------------------------------------------------
	// OBJECT PROPERTIES

/* Sets visibility for a merged object. */
function setGroupVisibility(_obj, _visible)
return setGroupVisibility(_obj, _visible, false)

function setGroupVisibility(_obj, _visible, _includeSpr)
	if len(_obj.children) then
		var i
		for i = 0 to len(_obj.children) loop
			setGroupVisibility(_obj.children[i], _visible, _includeSpr)
		repeat
	else
		if len(_obj.lights) then
			if _includeSpr then
				setGrpLightsSprVisibility(_obj, _visible, [])
			endif
		else
			setObjectVisibility(_obj.obj, _visible)
		endif
	endif
return void

/* Applies material for a merged object without setting the .col/.mat properties. */
// CORE LOADER
function applyGroupMaterial(_obj, _tint, _metal, _rough, _em)
	if len(_obj.children) then
		var i
		for i = 0 to len(_obj.children) loop
			if len(_obj.children[i].children) then
				applyGroupMaterial(_obj.children[i], _tint, _metal, _rough, _em)
			else
				setObjectMaterial(_obj.children[i].obj, _tint, _metal, _rough, _em)
			endif
		repeat
	else
		setObjectMaterial(_obj.obj, _tint, _metal, _rough, _em)
	endif
return void

/* Sets and applies material for a merged object. */
// CORE LOADER
function setGroupMaterial(_obj)
return setGroupMaterial(_obj, {-1, -1, -1, -1}, -1, -1, -1)

function setGroupMaterial(_obj, _overrideCol, _overrideMetal, _overrideRough, _overrideEm)
	var newMat = [
		ifElse(_overrideMetal == -1, _obj.mat[0], _overrideMetal),
		ifElse(_overrideRough == -1, _obj.mat[1], _overrideRough),
		ifElse(_overrideEm == -1, _obj.mat[2], _overrideEm)
	]
	
	var newCol = ifElse(_overrideCol == {-1, -1, -1, -1}, _obj.col, _overrideCol)
	_obj.mat = newMat
	_obj.col = newCol
	
	if !len(_obj.lights) and !len(_obj.children) then
		setObjectMaterial(_obj.obj, newCol, newMat[0], newMat[1], newMat[2])
	endif
	
	if len(_obj.children) then
		if _overrideCol == {-1, -1, -1, -1} then
			_overrideCol = _obj.col
		endif
		
		if _overrideMetal == -1 then
			_overrideMetal = _obj.mat[0]
		endif
		
		if _overrideRough == -1 then
			_overrideRough = _obj.mat[1]
		endif
		
		if _overrideEm == -1 then
			_overrideEm = _obj.mat[2]
		endif
	endif
	
	var i
	for i = 0 to len(_obj.children) loop
		_obj.children[i] = setGroupMaterial(_obj.children[i], _overrideCol, _overrideMetal, 
			_overrideRough, _overrideEm)
	repeat
return _obj

/* Sets rotation for a merged object. _pos is needed in order for
safeObjPointAt() to work; if the bug in objectPoinAt() is fixed in the
future, _pos will no longer be needed. */
// CORE LOADER
function setObjRot(_obj, _pos, _fwd, _up)
	/* A straight up or down forward wrecks the algorithm, so fudge the 
	vectors if necessary. */
	if equals(abs(_fwd.y ), 1, 0.000001) then
		_fwd = axisRotVecBy(_fwd, _up, 0.015)
	endif
	
	/* When called from any orientation, objectPointAt() will always 
	result in a positive-y up vector and a 0-y right vector, so it's 
	predictable enough that we can infer the object's up/right vectors 
	even without specific data about how they've been modified. */
	safeObjectPointAt(_obj, _pos, _pos + _fwd)
	
	var unrolledR
	unrolledR = axisRotVecBy(flattenY(_fwd), {0, 1, 0}, -90)
	
	var unrolledUp = axisRotVecBy(_fwd, unrolledR, 90)
	var roll = getAngleBetweenVecs(unrolledUp, _up)
	
	if roll and roll >= -360 and roll <= 360 then
		if roundVec(axisRotVecBy(unrolledUp, _fwd, roll), 2) != roundVec(_up, 2) then
			roll *= -1
		endif
		
		rotateObject(_obj, {0, 0, 1}, roll)
	endif
return void

/* objectPointAt() doesn't like straight up/down -- it will make the object
disappear, which we fix by never using an exact up/down rotation. */
// CORE LOADER
function safeObjectPointAt(_obj, _objPos, _dir)
	var dif = _dir - _objPos
	
	if dif.x == 0 and dif.z == 0 then
		_dir = _objPos + axisRotVecBy(dif, {1, 0, 0}, 0.015)
	endif
	
	objectPointAt(_obj, _dir)
return void

/* Objects in a group use the group's local space for scale. This function 
applies the group's scale modifier to a non-group object. */
// CORE LOADER
function applyGrpScale(_grpScale, _childScale, _childFwd, _childUp)
	var locR = cross(_childFwd, _childUp)
	var deg = getAngleBetweenVecs({-1, 0, 0}, locR)
	
	var locX = absVec3(axisRotVecBy({1, 0, 0}, cross({-1, 0, 0}, locR), 
		-deg))
	deg = getAngleBetweenVecs({0, 1, 0}, _childUp)
	var locY = absVec3(axisRotVecBy({0, 1, 0}, cross({0, 1, 0}, _childUp), 
		-deg))
	deg = getAngleBetweenVecs({0, 0, 1}, _childFwd)
	var locZ = absVec3(axisRotVecBy({0, 0, 1}, cross({0, 0, 1}, _childFwd), 
		-deg))
	
	appliedScale = absVec3(_grpScale.x * (locX * getSign(_grpScale.x)))
		+ absVec3(_grpScale.y * (locY * getSign(_grpScale.y)))
		+ absVec3(_grpScale.z * (locZ * getSign(_grpScale.z)))
	
	appliedScale = {appliedScale.x / (locX.x + locY.x + locZ.x) * getSign(_grpScale.x),
		appliedScale.y / (locX.y + locY.y + locZ.y) * getSign(_grpScale.y),
		appliedScale.z / (locX.z + locY.z + locZ.z) * getSign(_grpScale.z)}
return _childScale * appliedScale

/* Objects in a group use the group's local space for position, rotation, and
scale. This function applies the group's postion/rotation/scale modifiers to 
a non-group object. */
// CORE LOADER
function applyGrpTransform(_obj, _grpObj)
return applyGrpTransform(_obj, _grpObj, true, true)

function applyGrpTransform(_obj, _grpObj, _hasScale, _hasUp)
		
	if _hasScale then
		_obj.scale = applyGrpScale(_grpObj.scale, _obj.scale, _obj.fwd, _obj.up)
	endif
	
	var objR = cross(_grpObj.fwd, _grpObj.up)
	
	_obj.pos *= _grpObj.scale
	
	_obj.pos = changeVecSpaceZFwd(_obj.pos, _grpObj.fwd, _grpObj.up, 
		objR, {0, 0, 0})
	_obj.pos += _grpObj.pos
	_obj.fwd = changeVecSpaceZFwd(_obj.fwd, _grpObj.fwd, _grpObj.up, 
		objR, {0, 0, 0})
	
	if _hasUp then
		_obj.up = changeVecSpaceZFwd(_obj.up, _grpObj.fwd, _grpObj.up, 
			objR, {0, 0, 0})
	endif
return _obj

/* Objects in a group use the group's local space for position. This 
function applies the group's postion modifier to a non-group object. */
// CORE LOADER
function applyGrpPos(_obj, _grpObj)
return applyGrpPos(_obj, _grpObj, true)

function applyGrpPos(_obj, _grpObj, _scalePos)
	if _scalePos then
		_obj.pos *= _grpObj.scale
	endif
	
	var objR = cross(_grpObj.fwd, _grpObj.up)
	_obj.pos = changeVecSpaceZFwd(_obj.pos, _grpObj.fwd, _grpObj.up, 
		objR, {0, 0, 0})
	_obj.pos += _grpObj.pos
return _obj

/* Checks equality of two mapObjs. Does not consider equality among children or
lights within the object. */
// CORE LOADER
function mapObjEquals(_obj1, _obj2)
	var eq = _obj1.fwd == _obj2.fwd 
		and _obj1.up == _obj2.up 
		and _obj1.scale == _obj2.scale 
		and _obj1.pos == _obj2.pos 
		and _obj1.bankIdx == _obj2.bankIdx
return eq

/* Checks whether an object exists in an adjacent cell. */
function isObjInAdj(_obj, _cell, _cellPos)
	var found = false
	var adj = getAdj(_cell, _cellPos)
	var i
	var cellIdx
	var j
	
	for i = 0 to len(adj) loop
		cellIdx = adj[i]
		if cellIdx > -1 then
			for j = g_cellObjStart to len(g_cell[cellIdx]) loop
				if mapObjEquals(_obj, getMapObjFromRef(g_cell[cellIdx][j])) then
					found = true
					break
				endif
			repeat
		endif
		
		if found then break endif
	repeat
return found

/* If an object contains only a light with no rotation data, the object itself
can't rotate. */
function objCanRotate(_obj)
	var canRot = true
	if len(_obj.lights) then
		var i
		for i = 0 to len(_obj.lights) loop
			if _obj.lights[i].name == "spot" 
					or _obj.lights[i].name == "world" 
					or _obj.lights[i].name == "worldshadow" then
				canRot = true
				
				break
			endif
			
			canRot = false
		repeat
	endif
return canRot

/* If an object contains only lights, it cannot scale. */
function objCanScale(_obj)
	var canScale = true
	
	if len(_obj.lights) then
		canScale = false
	endif
return canScale

/* Gets a list of all children in a merged object, including recursive children
within children. Doesn't include self. */
function getAllChildNames(_obj)
	var mapObjName
	getMapObjName(mapObjName, _obj)
return getAllChildNames(_obj, mapObjName, [], false)

function getAllChildNames(_obj, _parentName, _children, _parentIsDef)
	var objName
	
	if !_parentIsDef then
		 getMapObjName(objName, _obj)
	else
		objName = _obj.name
	endif
	
	if objName != _parentName then
		if !contains(_children, objName) then
			_children = push(_children, objName)
		endif
	endif
	
	if len(_obj.children) then
		var i
		for i = 0 to len(_obj.children) loop
			_children = getAllChildNames(_obj.children[i], _parentName, _children, false)
		repeat
	endif
return _children

function getAllChildNamesInObjDef(_def)
return getAllChildNames(_def, _def.name, [], true)

/* Is the child present somewhere in the object's child hierarchy? */
function objContains(_obj, _childName)
return objContains(_obj, _childName, false)

function objContains(_obj, _childName, _hit)
	var mapObjName
	getMapObjName(mapObjName, _obj)
	
	if mapObjName == _childName then
		_hit = true
	endif
	
	if !_hit and len(_obj.children) then
		var i
		for i = 0 to len(_obj.children) loop
			_hit = objContains(_obj.children[i], _childName, _hit)
			
			if _hit then break endif
		repeat
	endif
return _hit

/* Applies highlight flash to appropriate objects. */
function updateUnderCurObj()
	if g_blink.needUpdate then
		var curObj = getObjListFromCellIdxList(g_cur.lastColContext.collision, true)
		
		if g_cur.mode == "masssel" then
			curObj = insertArray(curObj, g_cur.massSel.contents, len(curObj))
		endif
		
		var i
		for i = 0 to len(curObj) loop
			if curObj[i].highlight and g_blink.state >= 0.5 then
				applyHighlightCol(curObj[i])
			else if !curObj[i].highlight or g_blink.state < 0.5 then
				restoreDefaultObjCol(curObj[i])
				restoreGrpLightsSprCol(curObj[i])
			endif endif
		repeat
	endif
return void

/* Applies highlight color to an object. */
function applyHighlightCol(_obj)
	applyGroupMaterial(_obj, g_theme.bgCol, 0, 1, 1)
	setGrpLightsSprCol(_obj, g_theme.bgCol)
return void

/* Sets an object back to the default non-flashing color. An override color will replace the color of
any children below the point in the parent/child structure where it is given. */
function restoreDefaultObjCol(_obj)
	setGroupMaterial(_obj, {-1, -1, -1, -1}, -1, -1, -1)
return void

/* Applies selection flash to selected objects. */
function updateSelObj()
	if g_blink.needUpdate then
		var i
		for i = 0 to len(g_sel) loop
			var obj = getMapObjFromRef(g_cell[g_sel[i][0].cell][g_sel[i][0].idx])
			
			if g_blink.state >= 0.5 then
				applySelCol(obj)
			else if obj.highlight 
					and g_blink.state < 0.5 then
				applyHighlightCol(obj)
			else
				restoreDefaultObjCol(obj)
				restoreGrpLightsSprCol(obj)
			endif endif
		repeat
	endif
return void

/* Applies selection color to an object. */
function applySelCol(_obj)
	_obj = getMapObjFromRef(_obj)
	applyGroupMaterial(_obj, g_theme.bgSelCol, 0, 1, 1)
	setGrpLightsSprCol(_obj, g_theme.bgSelCol)
return void

/* To reduce variable count, bank and index numbers are stored together
in a single variable. They each occupy 16 bits of a 32-bit int, with the
16 MSBs representing the bank and the 16 LSBs representing the index. */
// CORE LOADER
function encodeBankIdx(_bank, _idx)
return bitFieldInsert(0, 0, 16, _idx) | bitFieldInsert(0, 16, 16, _bank)

function decodeBankIdx(_bankIdx)
	result = [
		.bank = bitFieldExtract(_bankIdx, 16, 16),
		.idx = bitFieldExtract(_bankIdx, 0, 16)
	]
return result

// CORE LOADER
function decodeBank(ref _in, _bankIdx)
	_in = bitFieldExtract(_bankIdx, 16, 16)
return _in

// CORE LOADER
function decodeIdx(ref _in, _bankIdx)
	_in = bitFieldExtract(_bankIdx, 0, 16)
return _in

function getObjBankIdx(_obj)
return decodeBankIdx(_obj.bankIdx)

function setObjBankIdx(_obj, _bank, _idx)
	_obj.bankIdx = encodeBankIdx(_bank, _idx)
return _obj

/* Cell and index work the same way as bank/index but are separate functions
both for clarity and in case the system changes. */
// CORE LOADER
function decodeCell(_cellIdx)
return bitFieldExtract(_cellIdx, 16, 16)

// CORE LOADER
function encodeCellIdx(_cell, _idx)
return bitFieldInsert(0, 0, 16, _idx) | bitFieldInsert(0, 16, 16, _cell)

function setMapObjRefCellIdx(_ref, _cell, _idx)
	_ref.cellIdx = encodeCellIdx(_cell, _idx)
return _ref

/* To reduce variable count, object names are stored only in the definition
and not cached in the object instantiation. This function reads the object's 
name out of the appropriate definition. */
// CORE LOADER
function getMapObjName(ref _in, _obj)
	var isRef
	isMapObjRef(isRef, _obj)
	
	if isRef then
		_obj = getMapObjFromRef(_obj)
	endif
	
	_in = ""
	
	/* During merged def loads, .bankIdx may temporarily contain a missing object's
	name, so we screen this with len(). */
	var bankIdxLen = len(_obj.bankIdx)
	var bankIdxStr = str(_obj.bankIdx) // Avoid multiple nested ifs to reduce stack size
	
	if !bankIdxLen and bankIdxStr != "-1" then
		var bank
		decodeBank(bank, _obj.bankIdx)
		var idx
		decodeIdx(idx, _obj.bankIdx)
		var objBank = g_obj[bank]
		var nameObj = objBank[idx]
		_in = nameObj.name
	else if bankIdxLen then
		_in = _obj.bankIdx
	endif endif
return _in

	// ----------------------------------------------------------------
	// COMPOSITE OBJECTS	

/* Removes a composite object with a standard structure. */
function removeGenericObj(_obj)
	var i
	for i = 0 to len(_obj.obj) loop
		removeObject(_obj.obj[i])
	repeat
	
	removeObject(_obj.grp)
return void

/* Sets visibility of a composite object with a standard structure. */
function setGenericObjVisibility(_obj, _isVis)
	var i
	for i = 0 to len(_obj.obj) loop
		setObjectVisibility(_obj.obj[i], _isVis)
	repeat
return void

/* Creates a torus made out of instances of _baseShape. Remove with 
removeGenericObj(). */
function createTorusObj(_pos, _fwd, _rad, _segCount, _w, _l, _baseShape, _col, _metal, _rough, _emit)
	var grp = createObjectGroup({0, 0, 0})
	var circ = 2 * _segCount * _rad * sin((pi / _segCount) * (180 / pi))
	var stepLen = (circ / _segCount) / 2
	var segDist = sqrt(pow(_rad, 2) - pow(stepLen, 2)) - _w / 2
	array segs[_segCount]
	var v = {segDist, 0, 0}
	
	var i
	for i = 0 to _segCount loop
		segs[i] = placeObject(_baseShape, v, { _w / 2, _l / 2, stepLen})
		rotateObject(segs[i], {1, 0, 0}, 90)
		rotateObject(segs[i], {0, 1, 0}, (360 / _segCount) * i)
		setObjectMaterial(segs[i], _col, _metal, _rough, _emit)
		v = axisRotVecBy(v, {0, 0, 1}, 360 / _segCount)
		setObjectParent(segs[i], grp)
	repeat
	
	safeObjectPointAt(grp, {0, 0, 0}, _fwd)
	setObjectPos(grp, _pos)
	
	var obj = [
		.grp = grp,
		.obj = segs
	]
return obj

/* Creates an arrow. Remove with removeGenericObj(). */
function createArrowObj(_pos, _fwd, _len, _rad, _headSize, _col, _metal, _rough, _emit)
	var grp = createObjectGroup({0, 0, 0})
	array shape[2]
	
	shape[0] = placeObject(cylinder, {0, 0, (_len / 2) * -1 - _headSize / 2}, {_rad / 2, _rad / 2, _len / 2 - _headSize / 2})
	shape[1] = placeObject(pyramid, {0, 0, _headSize * -1}, {_headSize / 2, _headSize, _headSize / 2})
	rotateObject(shape[1], {1, 0, 0}, 90)
	
	var i
	for i = 0 to 2 loop
		setObjectMaterial(shape[i], _col, _metal, _rough, _emit)
		setObjectParent(shape[i], grp)
	repeat
	
	safeObjectPointAt(grp, {0, 0, 0}, _fwd)
	setObjectPos(grp, _pos)
	
	var obj = [
		.grp = grp,
		.obj = shape,
		.l = _len,
		.rad = _rad,
		.headSize = _headSize
	]
return obj

function setArrowObjLen(_obj, _len)
	setObjectScale(_obj.obj[0], {_obj.rad / 2, _obj.rad / 2, _len / 2 - _obj.headSize / 2})
	setObjectPos(_obj.obj[0], {0, 0, (_len / 2) * -1 - _obj.headSize / 2})
	_obj.l = _len
return _obj

/* Creates a 3D axis visualization. */
function createXYZObj(_pos, _size)
	var xyz = createObjectGroup(_pos)
	var x = createArrowObj({_size, 0, 0}, {1, 0, 0}, _size, 0.02, 0.1, red, 0, 1, 1)
	setObjectParent(x.grp, xyz)
	var y = createArrowObj({0, _size, 0}, {0, 1, 0}, _size, 0.02, 0.1, lime, 0, 1, 1)
	setObjectParent(y.grp, xyz)
	var z = createArrowObj({0, 0, _size}, {0, 0, 1}, _size, 0.02, 0.1, cyan, 0, 1, 1)
	setObjectParent(z.grp, xyz)
	
	var obj = [
		.grp = xyz,
		.xObj = x,
		.yObj = y,
		.zObj = z
	]
return obj

/* Resizes the 3D axis visualization to fit the given extent. */
function setXYZObjExt(_obj, _ext, _pad)
	_obj.xObj = setArrowObjLen(_obj.xObj, _ext.hi.x + _pad)
	setObjectPos(_obj.xObj.grp, {_ext.hi.x + _pad, 0, 0})
	_obj.yObj = setArrowObjLen(_obj.yObj, _ext.hi.y + _pad)
	setObjectPos(_obj.yObj.grp, {0, _ext.hi.y + _pad, 0})
	_obj.zObj = setArrowObjLen(_obj.zObj, _ext.hi.z + _pad)
	setObjectPos(_obj.zObj.grp, {0, 0, _ext.hi.z + _pad})
return _obj

function removeXYZObj(_obj)
	removeObject(_obj.xObj)
	removeObject(_obj.yObj)
	removeObject(_obj.zObj)
	removeObject(_obj.grp)
return void

function setXYZObjVisibility(_obj, _isVis)
	setGenericObjVisibility(_obj.xObj, _isVis)
	setGenericObjVisibility(_obj.yObj, _isVis)
	setGenericObjVisibility(_obj.zObj, _isVis)
return void

/* Creates a circular rotation visualization. */
function createRotObj(_pos, _rad)
	var grp = createObjectGroup(_pos)
	array shape[2]
	
	shape[0] = createTorusObj({0, 0, 0}, {0, 1, 0}, _rad, 32, 0.1, 0.02, cylinder, red, 0, 1, 1)
	shape[1] = createTorusObj({0, 0, 0}, {0, 0, 1}, _rad, 32, 0.1, 0.02, cylinder, lime, 0, 1, 1)
	shape[2] = createTorusObj({0, 0, 0}, {1, 0, 0}, _rad, 32, 0.1, 0.02, cylinder, cyan, 0, 1, 1)
	shape[3] = createTorusObj({0, 0, 0}, {0, 1, 0}, _rad, 32, 0.1, 0.02, cylinder, peach, 0, 1, 1)
	
	var i
	for i = 0 to len(shape) loop
		setObjectParent(shape[i].grp, grp)
	repeat
	
	var obj = [
		.grp = grp,
		.obj = shape,
		.rad = _rad
	]
return obj

function removeRotObj(_obj)
	var i 
	for i = 0 to len(_obj.obj) loop
		removeGenericObj(_obj.obj[i])
	repeat
	
	removeObject(_obj.grp)
return void

/* Changes visible elements of the rotator to match the cursor's rotation mode. */
function setRotObjMode(_obj, _mode)
	var i
	var j
	
	for i = 0 to len(_obj.obj) loop
		for j = 0 to len(_obj.obj[i].obj) loop
			setObjectVisibility(_obj.obj[i].obj[j], mod((i + _mode), 2))
		repeat
	repeat
return _mode

function setRotObjVisibility(_obj, _vis)
	if !_vis then
		var i
		var j
		
		for i = 0 to len(_obj.obj) loop
			for j = 0 to len(_obj.obj[i].obj) loop
				setObjectVisibility(_obj.obj[i].obj[j], false)
			repeat
		repeat	
	else
		setRotObjMode(_obj, g_cur.rotMode)
	endif
return void

function getRotObjScale(_ext, _scale)
	var rotSize
	var loRad = distance({0, 0, 0}, _ext.lo * _scale)
	var hiRad = distance({0, 0, 0}, _ext.hi * _scale)
		
	if loRad > hiRad then
		rotSize = loRad
	else
		rotSize = hiRad
	endif
return rotSize

/* Creates a wireframe cube. Remove with removeGenericObj(). */
function createWireCubeObj(_pos, _ext, _w, _col, _metal, _rough, _emit)
	var grp = createObjectGroup(_pos)
	array shape[12]
	
	var i
	for i = 0 to len(shape) loop
		shape[i] = placeObject(cube, {0, 0, 0}, {1, 1, 1})
		setObjectMaterial(shape[i], _col, _metal, _rough, _emit)
		setObjectParent(shape[i], grp)
	repeat
	
	var obj = [
		.grp = grp,
		.obj = shape,
		.w = _w
	]
	setWireCubeObjExt(obj, _ext)
return obj

/* Changes the size of a wireframe cube. Frame thickness remains unchanged. */
function setWireCubeObjExt(_obj, _ext)
	array scale[3]
	scale[0] = {(_ext.hi.x - _ext.lo.x) / 2 + _obj.w, _obj.w, _obj.w}
	setObjectPos(_obj.obj[0], 
		{_ext.lo.x + (_ext.hi.x - _ext.lo.x) / 2, _ext.lo.y, _ext.lo.z})
	setObjectScale(_obj.obj[0], scale[0])
	setObjectPos(_obj.obj[1], 
		{_ext.lo.x + (_ext.hi.x - _ext.lo.x) / 2, _ext.lo.y, _ext.hi.z})
	setObjectScale(_obj.obj[1], scale[0])
	setObjectPos(_obj.obj[2], 
		{_ext.lo.x + (_ext.hi.x - _ext.lo.x) / 2, _ext.hi.y, _ext.lo.z})
	setObjectScale(_obj.obj[2], scale[0])
	setObjectPos(_obj.obj[3], 
		{_ext.lo.x + (_ext.hi.x - _ext.lo.x) / 2, _ext.hi.y, _ext.hi.z})
	setObjectScale(_obj.obj[3], scale[0])
	scale[1] = {_obj.w, _obj.w, (_ext.hi.z - _ext.lo.z) / 2 + _obj.w}
	setObjectPos(_obj.obj[4], 
		{_ext.lo.x, _ext.lo.y, _ext.lo.z + (_ext.hi.z - _ext.lo.z) / 2})
	setObjectScale(_obj.obj[4], scale[1])
	setObjectPos(_obj.obj[5], 
		{_ext.hi.x, _ext.lo.y, _ext.lo.z + (_ext.hi.z - _ext.lo.z) / 2})
	setObjectScale(_obj.obj[5], scale[1])
	setObjectPos(_obj.obj[6], 
		{_ext.lo.x, _ext.hi.y, _ext.lo.z + (_ext.hi.z - _ext.lo.z) / 2})
	setObjectScale(_obj.obj[6], scale[1])
	setObjectPos(_obj.obj[7], 
		{_ext.hi.x, _ext.hi.y, _ext.lo.z + (_ext.hi.z - _ext.lo.z) / 2})
	setObjectScale(_obj.obj[7], scale[1])
	scale[2] = {_obj.w, (_ext.hi.y - _ext.lo.y) / 2 + _obj.w, _obj.w}
	setObjectPos(_obj.obj[8], 
		{_ext.lo.x, _ext.lo.y + (_ext.hi.y - _ext.lo.y) / 2, _ext.lo.z})
	setObjectScale(_obj.obj[8], scale[2])
	setObjectPos(_obj.obj[9], 
		{_ext.lo.x, _ext.lo.y + (_ext.hi.y - _ext.lo.y) / 2, _ext.hi.z})
	setObjectScale(_obj.obj[9], scale[2])
	setObjectPos(_obj.obj[10], 
		{_ext.hi.x, _ext.lo.y + (_ext.hi.y - _ext.lo.y) / 2, _ext.lo.z})
	setObjectScale(_obj.obj[10], scale[2])
	setObjectPos(_obj.obj[11], 
		{_ext.hi.x, _ext.lo.y + (_ext.hi.y - _ext.lo.y) / 2, _ext.hi.z})
	setObjectScale(_obj.obj[11], scale[2])
return void

/* Creates a square in 3D. */
function createSquareObj(_pos, _w, _h, _thick, _fwd, _up, _col)
	var grp = createObjectGroup(_pos)
	array shape[4]
	
	shape[0] = placeObject(cube, {_w / 2, 0, 0}, {_thick, _h / 2, _thick})
	shape[1] = placeObject(cube, {-_w / 2, 0, 0}, {_thick, _h / 2, _thick})
	shape[2] = placeObject(cube, {0, _h / 2, 0}, {_w / 2, _thick, _thick})
	shape[3] = placeObject(cube, {0, -_h / 2, 0}, {_w / 2, _thick, _thick})
	
	var i
	for i = 0 to len(shape) loop
		setObjectMaterial(shape[i], _col, 0, 1, 0.55)
		setObjectParent(shape[i], grp)
	repeat
	
	setObjectPos(grp, _pos)
	setObjRot(grp, _pos, _fwd, _up)
	
	var obj = [
		.grp = grp,
		.obj = shape,
		.thick = _thick
	]
return obj

/* Creates an X in 3D */
function createXObj(_pos, _w, _h, _thick, _fwd, _up, _col)
	var grp = createObjectGroup({0, 0, 0})
	array shape[2]
	
	shape[0] = placeObject(cube, {0, 0, 0}, {sqrt(pow(_w / 2, 2) + pow(_h / 2, 2)), _thick, _thick})
	shape[1] = placeObject(cube, {0, 0, 0}, {sqrt(pow(_w / 2, 2) + pow(_h / 2, 2)), _thick, _thick})
	rotateObject(shape[0], {0, 0, 1}, 45)
	rotateObject(shape[1], {0, 0, 1}, -45)
	
	var i
	for i = 0 to 2 loop
		setObjectMaterial(shape[i], _col, 0, 1, 0.55)
		setObjectParent(shape[i], grp)
	repeat
	
	setObjectPos(grp, _pos)
	setObjRot(grp, _pos, _fwd, _up)
	
	var obj = [
		.grp = grp,
		.obj = shape
	]
return obj

/* Combines squares and Xs to createa cell outline. */
function createCellOutlineObj(_pos, _ext, _thick, _col)
	array shape[12]
	var grp = createObjectGroup(_pos)
	var wallCol = _col
	
	shape[0] = createXObj(_pos + {_ext.hi.x, 0, 0}, _ext.hi.z - _ext.lo.z, 
		_ext.hi.y - _ext.lo.y, _thick, {1, 0, 0}, {0, 1, 0}, _col)
	shape[1] = createXObj(_pos + {_ext.lo.x, 0, 0}, _ext.hi.z - _ext.lo.z, 
		_ext.hi.y - _ext.lo.y, _thick, {-1, 0, 0}, {0, 1, 0}, _col)
	shape[2] = createXObj(_pos + {0, _ext.hi.y, 0}, _ext.hi.x - _ext.lo.x, 
		_ext.hi.z - _ext.lo.z, _thick, {0, 1, 0}, {0, 0, 1}, _col)
	shape[3] = createXObj(_pos + {0, _ext.lo.y, 0}, _ext.hi.x - _ext.lo.x, 
		_ext.hi.z - _ext.lo.z, _thick, {0, -1, 0}, {0, 0, 1}, _col)
	shape[4] = createXObj(_pos + {0, 0, _ext.hi.z}, _ext.hi.x - _ext.lo.x, 
		_ext.hi.y - _ext.lo.y, _thick, {0, 0, 1}, {0, 1, 0}, _col)
	shape[5] = createXObj(_pos + {0, 0, _ext.lo.z}, _ext.hi.x - _ext.lo.x, 
		_ext.hi.y - _ext.lo.y, _thick, {0, 0, -1}, {0, 1, 0}, _col)
	shape[6] = createSquareObj(_pos + {_ext.hi.x, 0, 0}, _ext.hi.z - _ext.lo.z, 
		_ext.hi.y - _ext.lo.y, _thick, {1, 0, 0}, {0, 1, 0}, _col)
	shape[7] = createSquareObj(_pos + {_ext.lo.x, 0, 0}, _ext.hi.z - _ext.lo.z, 
		_ext.hi.y - _ext.lo.y, _thick, {-1, 0, 0}, {0, 1, 0}, _col)
	shape[8] = createSquareObj(_pos + {0, _ext.hi.y, 0}, _ext.hi.x - _ext.lo.x, 
		_ext.hi.z - _ext.lo.z, _thick, {0, 1, 0}, {0, 0, 1}, _col)
	shape[9] = createSquareObj(_pos + {0, _ext.lo.y, 0}, _ext.hi.x - _ext.lo.x, 
		_ext.hi.z - _ext.lo.z, _thick, {0, -1, 0}, {0, 0, 1}, _col)
	shape[10] = createSquareObj(_pos + {0, 0, _ext.hi.z}, _ext.hi.x - _ext.lo.x, 
		_ext.hi.y - _ext.lo.y, _thick, {0, 0, 1}, {0, 1, 0}, _col)
	shape[11] = createSquareObj(_pos + {0, 0, _ext.lo.z}, _ext.hi.x - _ext.lo.x, 
		_ext.hi.y - _ext.lo.y, _thick, {0, 0, -1}, {0, 1, 0}, _col)
	
	var i
	for i = 0 to len(shape) loop
		setObjectParent(shape[i].grp, grp)
	repeat
	
	var obj = [
		.grp = grp,
		.obj = shape,
		.state = [true, true, true, true, true, true],
		.isValid = true
	]
return obj

/* Sets wall visibility for the cell outline. */
function setCellOutlineObjState(_obj, _states)
	var i
	for i = 0 to len(_states) loop
		var j
		for j = 0 to len(_obj.obj[i].obj) loop
			setObjectVisibility(_obj.obj[i].obj[j], _states[i])
		repeat
		for j = 0 to len(_obj.obj[i + 6].obj) loop
			setObjectVisibility(_obj.obj[i + 6].obj[j], _states[i])
		repeat
	repeat
	_obj.state = _states
return _obj

/* Completely removes a cell outline. */
function removeCellOutlineObj(_obj)
	var i
	for i = 0 to len(_obj.obj) loop
		removeGenericObj(_obj.obj[i])
	repeat
	
	removeObject(_obj.grp)
return void

/* Creates all cell outlines if needed. */
function initCellOutlines()
	if g_visibleCellOutlines then
		showCellOutlines()
		updateCurCellOutlinePos()
		updateCamCellOutlinePos()
	endif
return void

/* Moves the cursor cell outline to the correct location. */
function updateCurCellOutlinePos()
return updateCellOutlinePos(0, g_cur.cell, g_cur.pos)

/* Moves the camera cell outline to the correct location. */
function updateCamCellOutlinePos()
return updateCellOutlinePos(1, g_cam.cell, g_cam.pos)

/* Moves the given cell outline to the correct location. */
function updateCellOutlinePos(_idx, _cell, _pos)
	if g_visibleCellOutlines then
		if g_cellOutline[_idx].isValid then
			if _cell >= 0 then
				setObjectPos(g_cellOutline[_idx].grp, g_cell[_cell][0])
				setCellOutlineCol(_idx, g_theme.inactiveCol)
			else
				setObjectPos(g_cellOutline[_idx].grp, getCellPosFromPos(_pos))
				setCellOutlineCol(_idx, g_theme.bgCol)
			endif
			
			combineCellOutlines(g_cur.cellPos, g_cam.cellPos)
		endif
	endif
return void

/* Shows outline for a cell. */
function showCellOutline(_idx)
	if g_cellOutline[_idx].isValid == false then
		g_cellOutline[_idx] = createCellOutlineObj({0, 0, 0}, g_cellExt, 0.02, g_theme.inactiveCol)
	endif
return void

/* Shows outlines for all cells. */
function showCellOutlines()
	var i
	for i = 0 to len(g_cellOutline) loop
		showCellOutline(i)
	repeat
return void

/* Removes outline for a cell. */
function hideCellOutline(_idx)
	if g_cellOutline[_idx].isValid then
		removeCellOutlineObj(g_cellOutline[_idx])
		g_cellOutline[_idx] = [ .isValid = false ]
	endif
return void

/* Removes outlines for all cells. */
function hideCellOutlines()
	var i
	for i = 0 to len(g_cellOutline) loop
		hideCellOutline(i)
	repeat
return void

/* Changes a cell outline's color. */
function setCellOutlineCol(_idx, _col)
	if g_visibleCellOutlines then
		if g_cellOutline[_idx].isValid then
			var i
			var j
			
			for i = 0 to len(g_cellOutline[_idx].obj) loop
				for j = 0 to len(g_cellOutline[_idx].obj[i].obj) loop
					setObjectMaterial(g_cellOutline[_idx].obj[i].obj[j], 
						_col, 0, 1, 0.55)
				repeat
			repeat
		endif
	endif
return void

/* Hides the common wall if the cells with outlines are adjacent. */
function combineCellOutlines(_cellPos0, _cellPos1)
	function combineCellOutlines_getState(_adjIdx)
		var state = [
			_adjIdx != 14,
			_adjIdx != 12,
			_adjIdx != 16,
			_adjIdx != 10,
			_adjIdx != 22,
			_adjIdx != 4
		]
	return state
	
	if _cellPos0 != _cellPos1 and distance(_cellPos0, _cellPos1) <= getCellWidth() + 0.1 then
		var dir = getCellDir(_cellPos1 - _cellPos0)
		var adjIdx = getAdjIdxFromOffset(dir)
		
		g_cellOutline[0] = 
			setCellOutlineObjState(g_cellOutline[0], combineCellOutlines_getState(adjIdx))
		
		adjIdx = getAdjIdxFromOffset(dir * -1)
		g_cellOutline[1] = 
			setCellOutlineObjState(g_cellOutline[1], combineCellOutlines_getState(adjIdx))
	else
		var state = [ true, true, true, true, true, true ]
		
		g_cellOutline[0] = 
			setCellOutlineObjState(g_cellOutline[0], state)
		g_cellOutline[1] = 
			setCellOutlineObjState(g_cellOutline[1], state)
	endif
return void

/* Creates object scale visualization. */	
function createScaleCubeObj(_pos, _ext)
	array shape[7]
	var grp = createObjectGroup(_pos)
	var arLen = 1
	var arRad = 0.1
	var arHSize = 0.3
	var arCol = lime
	
	shape[6] = createWireCubeObj({0, 0, 0}, _ext, 0.02, lime, 0, 1, 1)
	shape[0] = createArrowObj({0, 0, 0}, 
		{1, 0, 0}, arLen, arRad, arHSize, arCol, 0, 1, 1)
	shape[1] = createArrowObj({0, 0, 0}, 
		{-1, 0, 0}, arLen, arRad, arHSize, arCol, 0, 1, 1)
	shape[2] = createArrowObj({0, 0, 0}, 
		{0, 1, 0}, arLen, arRad, arHSize, arCol, 0, 1, 1)
	shape[3] = createArrowObj({0, 0, 0}, 
		{0, -1, 0}, arLen, arRad, arHSize, arCol, 0, 1, 1)
	shape[4] = createArrowObj({0, 0, 0}, 
		{0, 0, 1}, arLen, arRad, arHSize, arCol, 0, 1, 1)
	shape[5] = createArrowObj({0, 0, 0}, 
		{0, 0, -1}, arLen, arRad, arHSize, arCol, 0, 1, 1)
		
	var i
	for i = 0 to len(shape) loop
		setObjectParent(shape[i].grp, grp)
	repeat
	
	var obj = [
		.grp = grp,
		.obj = shape,
		.arLen = arLen,
		.state = [true, true, true, true, true, true]
	]
	setScaleCubeObjArrowExt(obj, _ext)
return obj

/* Shows or hides axis arrows arrows on the scale visualization. */
function setScaleCubeObjState(_obj, _states)
	var i
	for i = 0 to len(_states) loop
		var j
		for j = 0 to len(_obj.obj[i].obj) loop
			setObjectVisibility(_obj.obj[i].obj[j], _states[i])
		repeat
	repeat
	_obj.state = _states
return _obj

/* Sets the length of the arrows in the scale visualization. */
function setScaleCubeObjArrowExt(_obj, _ext)
	setObjectPos(_obj.obj[0].grp, {_ext.hi.x + _obj.arLen,
		_ext.lo.y + (_ext.hi.y - _ext.lo.y) / 2,
		_ext.lo.z + (_ext.hi.z - _ext.lo.z) / 2})
	setObjectPos(_obj.obj[1].grp, {_ext.lo.x - _obj.arLen,
		_ext.lo.y + (_ext.hi.y - _ext.lo.y) / 2,
		_ext.lo.z + (_ext.hi.z - _ext.lo.z) / 2})
	setObjectPos(_obj.obj[2].grp, {_ext.lo.x + (_ext.hi.x - _ext.lo.x) / 2,
		_ext.hi.y + _obj.arLen,
		_ext.lo.z + (_ext.hi.z - _ext.lo.z) / 2})
	setObjectPos(_obj.obj[3].grp, {_ext.lo.x + (_ext.hi.x - _ext.lo.x) / 2,
		_ext.lo.y - _obj.arLen,
		_ext.lo.z + (_ext.hi.z - _ext.lo.z) / 2})
	setObjectPos(_obj.obj[4].grp, {_ext.lo.x + (_ext.hi.x - _ext.lo.x) / 2,
		_ext.lo.y + (_ext.hi.y - _ext.lo.y) / 2,
		_ext.hi.z + _obj.arLen})
	setObjectPos(_obj.obj[5].grp, {_ext.lo.x + (_ext.hi.x - _ext.lo.x) / 2,
		_ext.lo.y + (_ext.hi.y - _ext.lo.y) / 2,
		_ext.lo.z - _obj.arLen})
return void

/* Sets the size of the scale visualization. */
function setScaleCubeObjExt(_obj, _ext)
	setWireCubeObjExt(_obj.obj[6], _ext)
	setScaleCubeObjArrowExt(_obj, _ext)
return void

function setScaleCubeObjVisibility(_obj, _vis)
	if !_vis then
		var i
		for i = 0 to len(_obj.obj) loop
			setGenericObjVisibility(_obj.obj[i], _vis)
		repeat
	else
		setGenericObjVisibility(_obj.obj[6], _vis) // Make cube visible
		setScaleCubeObjState(_obj, getScaleModeState(g_cur.scaleMode))
	endif
return void

function removeScaleCubeObj(_obj)
	var i
	for i = 0 to len(_obj.obj) loop
		removeGenericObj(_obj.obj[i])
	repeat
	
	removeObject(_obj.grp)
return void

/* Translates the scale mode into a state for showing/hiding arrows in the 
scale visualization. */
function getScaleModeState(_mode)
	var state
	
	loop if _mode == 1 then
		state = [true, true, false, false, true, true]
		break endif
	if _mode == 2 then
		state = [false, false, true, true, false, false]
		break endif
	if _mode == 3 then
		state = [false, false, false, false, true, true]
		break endif
	if _mode == 4 then
		state = [true, true, false, false, false, false]
		break
	else
		state = [true, true, true, true, true, true]
		break
	endif break repeat
return state

// ----------------------------------------------------------------
// CELLS

/* Adds a new cell in the map. The cell will snap to the closest appropriate
position to _pos. */
// CORE LOADER
function addCell(_pos)
return addCell(_pos, [])

function addCell(_pos, _savedAdj)
	var idx = len(g_cell)
	
	g_cell = push(g_cell, [ 0, [] ]) // [ pos, adjacent cells ]
	g_cell[idx][0] = getCellPosFromPos(_pos) // Cell position
	
	/* If _savedAdj contains data, we assume that all cells are being loaded from
	and that we don't need to update other cells' data, because their saved data
	will already be correct. */
	if !len(_savedAdj) then
		var adj = generateAdjacentCells(_pos)
		
		g_cell[idx][1] = adj // Adjacent cells
		/* Additional indices in g_cell[idx] contain objects within the cell. If you
		need to iterate objects in the cell, begin indexing at g_cellObjStart, which
		gives the first index in a cell that contains an object. */
		
		var i
		for i = 0 to len(adj) loop
			if adj[i] > -1 and i != 13 then
				updateAdjacentCell(adj[i], 
					getAdjIdxFromOffset(getOffsetFromAdjIdx(i) * -1), idx)
			endif
		repeat
	else
		g_cell[idx][1] = _savedAdj
	endif
return idx

/* Gets the width/height/depth of a cell. */
// CORE LOADER
function getCellWidth()
return abs(g_cellExt.lo.x) + abs(g_cellExt.hi.x)

/* Returns the adjacent indices that are on the sides of a cell in the given
direction. */
function getAdjAffectedByMovement(_dir)
	array adj[0]
	
	var continue = true
	while continue loop
		if _dir.x == -1 then
			if _dir.y == -1 then
				if _dir.z == -1 then
					adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 18, 19, 20, 21, 24]
					break
				endif
				
				if _dir.z == 0 then
					adj = [0, 1, 2, 3, 6, 9, 10, 11, 12, 15, 18, 19, 20, 21, 24]
					break
				endif
				
				adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 15, 16, 17, 18, 21, 24, 25, 26]
				break
			endif
			
			if _dir.y == 0 then
				if _dir.z == -1 then
					adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 15, 18, 21, 24]
					break
				endif
				
				if _dir.z == 0 then
					adj = [0, 3, 6, 9, 12, 15, 18, 21, 24]
					break
				endif
				
				adj = [0, 3, 6, 9, 12, 15, 18, 19, 20, 21, 22, 23, 24, 25, 26]
				break
			endif
			
			if _dir.z == -1 then
				adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 12, 15, 16, 17, 18, 21, 24, 25, 26]
				break
			endif
			
			if _dir.z == 0 then
				adj = [0, 3, 6, 7, 8, 9, 12, 15, 16, 17, 18, 21, 24, 25, 26]
				break
			endif
			
			adj = [0, 3, 6, 7, 8, 9, 12, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
			break
		endif
		
		if _dir.x == 0 then
			if _dir.y == -1 then
				if _dir.z == -1 then
					adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 18, 19, 20]
					break
				endif
				
				if _dir.z == 0 then
					adj = [0, 1, 2, 9, 10, 11, 18, 19, 20]
					break
				endif
				
				adj = [0, 1, 2, 9, 10, 11, 18, 19, 20, 21, 22, 23, 24, 25, 26]
				break
			endif
			if _dir.y == 0 then
				if _dir.z == -1 then
					adj = [0, 1, 2, 3, 4, 5, 6, 7, 8]
					break
				endif
				
				/* A null direction is taken to be a condition where the entire 
				frame of reference moves, so all adjacents are affected. */
				if _dir.z == 0 then
					adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
					break
				endif
				
				adj = [18, 19, 20, 21, 22, 23, 24, 25, 26]
				break
			endif
			
			if _dir.z == -1 then
				adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 15, 16, 17, 24, 25, 26]
				break
			endif
			
			if _dir.z == 0 then
				adj = [6, 7, 8, 15, 16, 17, 24, 25, 26]
				break
			endif
			
			adj = [6, 7, 8, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
			break
		endif
		
		if _dir.y == -1 then
			if _dir.z == -1 then
				adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14, 17, 18, 19, 20, 23, 26]
				break
			endif
			
			if _dir.z == 0 then
				adj = [0, 1, 2, 5, 8, 9, 10, 11, 14, 17, 18, 19, 20, 23, 26]
				break
			endif
			
			adj = [0, 1, 2, 5, 8, 9, 10, 11, 14, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
			break
		endif
		
		if _dir.y == 0 then
			if _dir.z == -1 then
				adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 11, 14, 17, 20, 23, 26]
				break
			endif
			
			if _dir.z == 0 then
				adj = [2, 5, 8, 11, 14, 17, 20, 23, 26]
				break
			endif
			
			adj = [2, 5, 8, 11, 14, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
			break
		endif
		
		if _dir.z == -1 then
			adj = [0, 1, 2, 3, 4, 5, 6, 7, 8, 11, 14, 15, 16, 17, 20, 23, 24, 25, 26]
			break
		endif
		
		if _dir.z == 0 then
			adj = [2, 5, 6, 7, 8, 11, 14, 15, 16, 17, 20, 23, 24, 25, 26]
			break
		endif
		
		adj = [2, 5, 6, 7, 8, 11, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
		break
		
		continue = false
	repeat
return adj

/* Discovers which cells are adjacent to the cell that contains the given 
position. */
// CORE LOADER
function generateAdjacentCells(_pos)
	array adj[27]
	var cellW = getCellWidth()
	var idx = 0
	var z
	var y
	var x
	
	for z = -1 to 2 loop
		for y = -1 to 2 loop
			for x = -1 to 2 loop
				// If no cell is adjacent in this direction, the cell index will be -1
				adj[idx] = getCellIdxFromPos(_pos + {cellW * x, cellW * y, cellW * z})
				
				idx += 1
			repeat
		repeat
	repeat
return adj

/* Assigns a neighbor cell to a cell's adj array and update cell oulines. */
// CORE LOADER
function updateAdjacentCell(_idx, _adjIdx, _neighborIdx)
	g_cell[_idx][1][round(_adjIdx)] = _neighborIdx
return void

/* Gets a cell's array of adjacent cells. _pos allows for a fallback check if
_midCell dosn't exist. */
// CORE LOADER
function getAdj(_midCell, _pos)
	array adj[27]
	
	if _midCell >= 0 and _midCell < len(g_cell) then
		adj = g_cell[_midCell][1]
	/* Fallback for when we are OOB and don't have a list of adjacents. Slower. */
	else
		var cellW = getCellWidth()
		var exactPos = getCellPosFromPos(_pos)
		var rangeCells = getCellsInRange(exactPos, sqrt(pow(cellW, 2) + (pow(cellW, 2) * 2)))
		var i
		var adjPos
		var j
		
		for i = 0 to len(adj) loop
			adjPos = exactPos + getOffsetFromAdjIdx(i) * cellW
			
			/* This is basically getCellIdxFromCellPos(), but duplicating the
			code instead of making the function call is faster, and speed is
			paramount here. */
			adj[i] = -1
			
			for j = 0 to len(rangeCells) loop
				if adjPos == g_cell[rangeCells[j]][0] then
					adj[i] = rangeCells[j]
					
					break
				endif
			repeat
		repeat
	endif
return adj

/* Converts an adjacent index to a cell position relative to the middle cell. */
// CORE LOADER
function getOffsetFromAdjIdx(_idx)
return {_idx % 3 - 1, floor((_idx % 9) / 3) - 1, floor(_idx / 9) - 1}

/* Returns an adjacent cell's position. */
function getCellPosFromAdjIdx(_midCell, _adjIdx)
return g_cell[_midCell][0] + getOffsetFromAdjIdx(_adjIdx) * getCellWidth()

/* Returns an array indices of cells whose midpoints are within the given
range from the origin. */
// CORE LOADER
function getCellsInRange(_origin, _range)
	array cells[0]
	
	var i
	for i = 0 to len(g_cell) loop
		if distance(_origin, g_cell[i][0]) <= _range then
			cells = push(cells, i)
		endif
	repeat
return cells

/* Converts a position offset from a cell into an index for adjacent positions. */
// CORE LOADER
function getAdjIdxFromOffset(_off)
	var adjIdx
	
	if abs(_off.x) <= 1 and abs(_off.y) <= 1 and abs(_off.z) <= 1 then
		adjIdx = (_off.x + 1) + (_off.y + 1) * 3 + (_off.z + 1) * 9
	else
		adjIdx = -1
	endif	
return adjIdx

/* Returns whether the position is within the given cell. */
// CORE LOADER
function isPosInCell(_pos, _cellIdx)
	var isInCell = true
	
	if _cellIdx > -1 then
		var cPos = g_cell[_cellIdx][0]
		
		var i
		for i = 0 to 3 loop
			if _pos[i] < cPos[i] + g_cellExt.lo[i] 
					or _pos[i] >= cPos[i] + g_cellExt.hi[i] then
				isInCell = false
				
				break
			endif 
		repeat
	else
		isInCell = false
	endif
return isInCell

/* Finds the position of the cell that does (or would) contain _pos. The
cell itself does not necessarily exist. */
// CORE LOADER
function getCellPosFromPos(_pos)
	// Assume cell is an equal-sided cube
	var cellW = getCellWidth()
	var cellPos = roundVec3ToMultiple(_pos, cellW, -cellW / 2)
return cellPos

/* Finds the cell that contains position _pos. */
// CORE LOADER
function getCellIdxFromPos(_pos)
	var idx = -1
	
	var i
	for i = 0 to len(g_cell) loop
		if isPosInCell(_pos, i) then
			idx = i
			
			break
		endif
	repeat
return idx

/* Finds the cell whose midpoint is _pos. */
function getCellIdxFromCellPos(_pos)
return getCellIdxFromCellPos(_pos, [])

function getCellIdxFromCellPos(_pos, _cellSubset)
	var idx = -1
	
	var i
	if len(_cellSubset) then
		for i = 0 to len(_cellSubset) loop
			if _pos == g_cell[_cellSubset[i]][0] then
				idx = i
				
				break
			endif
		repeat
	else
		for i = 0 to len(g_cell) loop
			if _pos == g_cell[i][0] then
				idx = i
				
				break
			endif
		repeat
	endif
return idx

/* Snaps a direction's axis values to 1, 0, or -1. Conceptually equivalent to
a unit vector for finding adjacent cells. */
// CORE LOADER
function getCellDir(_dir)
	var i
	for i = 0 to 3 loop
			var rounded = roundDec(_dir[i], 6)
		if rounded != 0 then
			_dir[i] = getSign(rounded)
		else
			_dir[i] = 0
		endif
	repeat
return _dir

/* Checks if a position has moved into an adjacent cell. */
// CORE LOADER
function updateCellContext(_oldCell, _oldCellPos, _newPos, _allowAddCell, _forceUpdate)
	var result = [
		.cell = _oldCell,
		.cellPos = _oldCellPos
	]
	
	var newCellPos = getCellPosFromPos(_newPos)
	if _oldCellPos != newCellPos or _forceUpdate then
		var cellIdx = -1
		var adjCells = getAdj(_oldCell, _oldCellPos)
		
		var i
		for i = 0 to len(adjCells) loop
			if isPosInCell(newCellPos, adjCells[i]) then
				cellIdx = adjCells[i]
				break
			endif
		repeat
		
		result.cellPos = newCellPos
		
		// If we're OOB
		if cellIdx < 0 then
			cellIdx = getCellIdxFromPos(_newPos)
			if cellIdx < 0 and _allowAddCell then
				cellIdx = addCell(_newPos)
			endif
		endif
		
		result.cell = cellIdx
	endif
return result

/* Checks if the camera has moved into a different cell. */
function updateCamCellContext(_forceUpdate)
	var oldCell = g_cam.cell
	var oldCellPos = g_cam.cellPos
	var camCellResult = updateCellContext(g_cam.cell, g_cam.cellPos, g_cam.pos, false, _forceUpdate)
	
	g_cam.cell = camCellResult.cell
	g_cam.cellPos = camCellResult.cellPos
return void

// ----------------------------------------------------------------
// MENUS

	// ----------------------------------------------------------------
	// MENU ACTIONS
	
/* Some action strings have index numbers at the end; this returns those
index numbers. */
function getActionIdx(_action, _str)
return int(getActionSubstr(_action, _str))

/* Some action strings have additional string data at the end; this returns 
those string data. */
function getActionSubstr(_action, _str)
	var l = len(_action)
return _str[l:]

/* Code for executing main menu selections. */
function triggerMenuAction(_sel, _menu)
	var continue = true
	var result = [
		.needClose = false,
		.menu = _menu,
		.needWritePrefs = false,
		.action = _sel.action
	]
	
	while continue loop
		if _sel.action == "new" then
			var continue = true
			while continue loop
				update()
				
				var confirmPrompt = [
					.idx = 3
				]
				
				if g_dirtyMap then
					confirmPrompt = showUnsavedPrompt()
				endif
				
				var shouldClear = true
				if confirmPrompt.idx > 0 then
					if confirmPrompt.idx == 1 then
						shouldClear = showSave()
					else if confirmPrompt.idx == 2 then
						shouldClear = showSaveAs()
					endif endif
					if shouldClear then
						showLoadBox("Clearing current map ...", true, false, false)
						clearMap()
						removeLoadSpr()
						initEdForClearedMap()
						initCellOutlines()
						g_currentMapName = ""
						g_dirtyMap = false
						continue = false
					else
						continue = false
					endif
				else
					continue = false
				endif
			repeat
			
			result.needClose = true
			break
		endif
		
		if _sel.action == "save" then
			showSave()
			result.needClose = true
			break
		endif
		
		if _sel.action == "saveas" then
			showSaveAs()
			result.needClose = true
			break
		endif
		
		if _sel.action == "load" then
			g_requestShallowStackAction = _sel.action
			result.needClose = true
			break
		endif
		
		if _sel.action == "manage" then
			var mapFile = openFile()
			
			var continue = true
			while continue loop
				var mapNames = getMapNames(mapFile)
				mapNames = insert(mapNames, "Cancel", 0)
				var mapPrompt = promptList(
					mapNames, 
					[
						"Select map to delete."
					]
				)
				
				if mapPrompt.idx > 0 then
					var confirmPrompt = promptList(
						[
							"Cancel",
							"Yes, delete"
						], 
						[
							"Do you want to delete '" + mapPrompt.text + "'?",
							"Deletion cannot be undone."
						]
					)
					
					if confirmPrompt.idx > 0 then
						deleteObjMap(mapFile, mapPrompt.text)
						/* Deleting an open map will not clear the map in the editor but 
						will remove its name as though it were built from an unsaved new map. */
						if g_currentMapName == mapPrompt.text then
							g_currentMapName = ""
							g_dirtyMap = true
						endif
					endif
				else
					continue = false
				endif
			repeat
			
			closeFile(mapFile)
			result.needClose = true
			break
		endif
		
		if _sel.action == "about" then
			showNoticeBox(
				"Celqi - 3D Map Editor for FUZE"  + chr(10) +
				"by P.M. Crockett (mozipha)" + chr(10) + chr(10) +
				"Version 1.0.00" + chr(10) + chr(10) +
				"Help documents available at https://github.com/pmcrockett/celqi/"+ chr(10) + chr(10) +
				"To get in touch, message me via GitHub or via the FUZE forum:" + chr(10) +
				"https://fuzearena.com/forum/user/mozipha/", 
				true, 0, true, false)
				
			result.needClose = true
			break
		endif
		
		if _sel.action == "patchnotes" then
			/* The weird formatting is because FUZE reads line breaks and tabs 
			as written. I'm not inserting chr(10) between multiple strings like
			I do elsewhere because this is a long text segment and we eventually 
			hit a recusion limit when using the + operator to join strings. */
			showScrollText(
"Celqi - 3D Map Editor (1.0.00)

This is the initial release, so it likely has bugs. Known issues:

* 1080p in docked mode is available in the Advanced menu and should theoretically work, but it hasn't been tested because Celqi is developed on a Switch Lite.

* FUZE has a memory leak that occurs when a program is run repeatedly (see forum thread: https://fuzearena.com/forum/topic/1598/). This leak is particularly evident in Celqi because its codebase is so large. If Celqi's performance degrades or you get an 'Out of memory: Cannot create new context' error after running it multiple times, close and restart FUZE.

* Cone and pyramid shapes are not included in the Primitives bank because they have incorrect built-in collision boxes. If you want to enable them anyway, uncomment the related code in the loadPrimitiveDefs() function. Collision detection with cones and pyramids will be glitchy, but using them won't cause any other problems.

* Mass select sometimes won't include objects within the selection bounds.

* Metallic and roughness values seem to apply only to primitive objects (i.e. those found in the Primitives bank). Celqi still allows editing these values for non-primitives because I'm not 100% certain there aren't any models they affect; just understand that it's normal for metallic and roughness not to affect models.
"
			)
			
			result.needClose = true
			break
		endif
		
		if strFind(_sel.action, "objaddselection") == 0 then
			var idx = getActionIdx("objaddselection", _sel.action)
			var objList = getObjListFromCellIdxList(g_cur.lastColContext.collision, true)
			var selIdx = getSelIdx(objList[idx])
			
			if selIdx == -1 then
				addObjToSel(decodeCell(objList[idx].cellIdx[0]), decodeIdx(-1, objList[idx].cellIdx[0]))
			else
				g_sel = removeObjFromSel(g_sel, selIdx, true)
			endif
			
			// Rebuild menu to reflect selection
			var menuSel = getMenuSel(_menu).idxChain
			_menu = rebuildCurMenu(_menu, menuSel, 1)
			_menu = rebuildSelMenu(_menu, menuSel, 2)
			forceCurrentMenuSelAction(_menu)
			result.menu = _menu
			break
		endif
		
		if strFind(_sel.action, "objdelete") == 0 then
			var idx = getActionIdx("objdelete", _sel.action)
			var obj = getObjListFromCellIdxList(g_cur.lastColContext.collision, true)
			edDeleteMapObj(decodeCell(obj[idx].cellIdx[0]), decodeIdx(-1, obj[idx].cellIdx[0]))
			
			// Rebuild menu to reflect deletion
			var menuSel = getMenuSel(_menu).idxChain
			_menu = rebuildCurMenu(_menu, menuSel, 1)
			_menu = rebuildSelMenu(_menu, menuSel, 2)
			forceCurrentMenuSelAction(_menu)
			result.menu = _menu
			break
		endif
		
		if strFind(_sel.action, "selremove") == 0then
			var selIdx = getActionIdx("selremove", _sel.action)
			var objRef = getMapObjFromRef(g_cell[g_sel[selIdx][0].cell][g_sel[selIdx][0].idx]) 
			g_cell[getMapObjCell(objRef)][getMapObjIdx(objRef)].highlight = false
			
			g_sel = removeObjFromSel(g_sel, selIdx, true)
			
			// Rebuild menu to reflect selection
			var menuSel = getMenuSel(_menu).idxChain
			_menu = rebuildCurMenu(_menu, menuSel, 1)
			_menu = rebuildSelMenu(_menu, menuSel, 2)
			forceCurrentMenuSelAction(_menu)
			result.menu = _menu
			break
		endif
		
		if _sel.action == "selclear" then
			g_sel = clearSel(g_sel, true)
			
			// Rebuild menu to reflect selection
			var menuSel = getMenuSel(_menu).idxChain
			_menu = rebuildCurMenu(_menu, menuSel, 1)
			_menu = rebuildSelMenu(_menu, menuSel, 2)
			forceCurrentMenuSelAction(_menu)
			result.menu = _menu
			break
		endif
		
		if _sel.action == "seldelete" then
			// mapObj deletion code automatically removes the object from g_sel
			while len(g_sel) loop
				edDeleteMapObj(g_sel[0][0].cell, g_sel[0][0].idx)
			repeat
			
			// Rebuild menu to reflect deletions
			var menuSel = getMenuSel(_menu).idxChain
			_menu = rebuildCurMenu(_menu, menuSel, 1)
			_menu = rebuildSelMenu(_menu, menuSel, 2)
			forceCurrentMenuSelAction(_menu)
			result.menu = _menu
			break
		endif
		if strFind(_sel.action, "selcopy") == 0 
				or strFind(_sel.action, "selcut") == 0 then
			// Save current time as clipboard object name
			var minute = string(clock().minute)
			if len(minute) == 1 then
				minute = "0" + minute
			endif
			
			var newName = string(clock().hour) + ":" + minute 
				+ " " + string(clock().month) 
				+ "-" + string(clock().day) + "-" + string(clock().year)
			
			if _sel.action == "selcopyfromobj" or _sel.action == "selcutfromobj" then
				g_cur.pos = getObjFromSel()[0].pos
				updateCurWidgets()
			endif
			
			addMergedObjDef(newName, 0, true)
			
			if len(g_obj[0]) > g_copyLimit then
				g_obj[0] = remove(g_obj[0], 0)
			endif
			
			g_cur.isMerged = false
			replaceActiveObj(0, len(g_obj[0]) - 1)
			
			if strFind(_sel.action, "selcut") == 0 then
				// mapObj deletion code automatically removes the object from g_sel
				while len(g_sel) loop
					edDeleteMapObj(g_sel[0][0].cell, g_sel[0][0].idx)
				repeat
				
				updateCurContexts(true)
			else
				updateCurContexts(false)
			endif
			
			// Rebuild menu to reflect deletions
			var menuSel = getMenuSel(_menu).idxChain
			_menu = rebuildCurMenu(_menu, menuSel, 1)
			_menu = rebuildSelMenu(_menu, menuSel, 2)
			_menu = updateBrushMenu(_menu)
			forceCurrentMenuSelAction(_menu)
			result.menu = _menu
			break
		endif
		
		if strFind(_sel.action, "selmerge") == 0 then
			var selIdx
			
			if _sel.action == "selmergenew" then
				var newName = ""
				var promptText = "New bank name"
				
				while !len(newName) or contains(g_bankName, newName) loop
					newName = input(promptText, false)
					if contains(g_bankName, newName) then
						promptText = "Bank '" + newName + "' already exists! Choose another name"
					endif
				repeat
				
				g_bankName = push(g_bankName, newName)
				selIdx = len(g_obj)
				g_obj = push(g_obj, [])
				
				// Rebuild menu to reflect bank addition
				var menuSel = getMenuSel(_menu).idxChain
				_menu = rebuildSelMenu(_menu, menuSel, 2)
				forceCurrentMenuSelAction(_menu)
				result.menu = _menu
			else
				selIdx = getActionIdx("selmerge", _sel.action)
			endif
			
			var objName
			var promptText = "Merged object name"
			var nameExists = false
			
			while !len(objName) or nameExists loop
				nameExists = false
				objName = input(promptText, false)
				
				var i
				var j
				
				for i = 0 to len(g_obj) loop
					for j = 0 to len(g_obj[i]) loop
						if g_obj[i][j].name == objName then
							nameExists = true
							promptText = "Object '" + objName + "' already exists! Choose another name"
							
							break
						endif
					repeat
					
					if nameExists then
						break
					endif
				repeat
			repeat
			
			addMergedObjDef(objName, selIdx, true)
			writeObjDefs()
			break
		endif
		
		if _sel.action == "centercursor" then
			var curFract = {fract(g_cur.pos.x), fract(g_cur.pos.y), fract(g_cur.pos.z)}
			
			var i
			for i = 0 to 3 loop
				if curFract[i] < 0 then
					curFract[i] = 1 + curFract[i]
				endif
			repeat
			
			var prevCurPos = g_cur.pos
			g_cur.pos = screenPosToWorldPos({gwidth() / 2, gheight() / 2}, 5, 
				g_cam.fwd, g_cam.up, g_cam.pos, g_cam.fov)
			g_cur.pos = {floor(g_cur.pos.x) + curFract.x, floor(g_cur.pos.y) + curFract.y, 
				floor(g_cur.pos.z) + curFract.z}
			updateCurContexts(false)
			
			if g_cur.mode == "masssel" then
				warpMassSelPos(prevCurPos)
			endif
			
			result.needClose = true
			break
		endif
		
		if strFind(_sel.action, "cammov") == 0 then
			if _sel.action == "cammovup" then
				g_cam.movSpd = wrapIncClamp(g_cam.movSpd + 1, 1, 100)
			else if _sel.action == "cammovdown" then
				g_cam.movSpd = wrapIncClamp(g_cam.movSpd - 1, 1, 100)
			else
				var newSpd = input("Camera movement speed", false)
				g_cam.movSpd = clamp(int(newSpd), 1, 100)
			endif endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Movement speed (" + int(g_cam.movSpd) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if strFind(_sel.action, "camrot") == 0 then
			if _sel.action == "camrotup" then
				g_cam.rotSpd = wrapIncClamp(g_cam.rotSpd + 25, 25, 1000)
			else if _sel.action == "camrotdown" then
				g_cam.rotSpd = wrapIncClamp(g_cam.rotSpd - 25, 25, 1000)
			else
				var newSpd = input("Camera rotation speed", false)
				g_cam.rotSpd = clamp(int(newSpd), 25, 1000)
			endif endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Rotation speed (" + int(g_cam.rotSpd) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if strFind(_sel.action, "camfov") == 0 then
			if _sel.action == "camfovup" then
				g_cam.fov = wrapIncClamp(g_cam.fov + 10, 50, 110)
			else if _sel.action == "camfovdown" then
				g_cam.fov = wrapIncClamp(g_cam.fov - 10, 50, 110)
			else
				var newFov = input("Camera field of view", false)
				g_cam.fov = clamp(int(newFov), 50, 110)
			endif endif
			
			setFov(g_cam.fov)
			updateCompassPos()
			updateActiveObjPos()
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Field of view (" + int(g_cam.fov) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if _sel.action == "camworldmovement" then
			g_cam.worldMovement = !g_cam.worldMovement
			
			var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 1]].text =
				"Lock movement to world axes (" + getBoolStr(g_cam.worldMovement) + ")"
			result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
		endif
		
		if _sel.action == "posnosnap" or _sel.action == "possnapby" 
				or _sel.action == "possnapto" then
			if _sel.action == "posnosnap" then
				g_cur.posSnapMode = 0
			else if _sel.action == "possnapby" then
				g_cur.posSnapMode = 1
			else
				g_cur.posSnapMode = 2
			endif endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Snap mode (" + getSnapModeStr(g_cur.posSnapMode) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if strFind(_sel.action, "possnapamt") == 0 then
			var unitSnap = false
			var actionStr = getActionSubstr("possnapamt", _sel.action)
			
			if g_cur.posSnapAmount < 0 then
				g_cur.posSnapAmount = 0
			endif
			
			loop if actionStr == "grid" then
				g_cur.posSnapAmount = -1
				unitSnap = true
				result.needClose = true
				break endif
			if actionStr == "set" then
				var newAmt = input("Position snap amount", false)
				g_cur.posSnapAmount = clamp(float(newAmt), 0, 10)
				result.needClose = true
				break endif
			if actionStr == "0.5" or actionStr == "0.25" or actionStr == "0.125" 
					or actionStr == "0.0625" then
				g_cur.posSnapAmount = float(actionStr)
				result.needClose = true
				break
			else
				g_cur.posSnapAmount += float(actionStr)
				break
			endif break repeat
			
			if !unitSnap then
				g_cur.posSnapAmount = wrapIncClamp(g_cur.posSnapAmount, 0, 10)
			endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Snap increment (" 
					+ strRemoveTrailingZeroes(getPosSnapAmountStr(g_cur.posSnapAmount, g_dispDec)) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if _sel.action == "rotnosnap" or _sel.action == "rotsnapby" 
				or _sel.action == "rotsnapto" then
			if _sel.action == "rotnosnap" then
				g_cur.rotSnapMode = 0
			else if _sel.action == "rotsnapby" then
				g_cur.rotSnapMode = 1
			else
				g_cur.rotSnapMode = 2
			endif endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Snap mode (" + getSnapModeStr(g_cur.rotSnapMode) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if strFind(_sel.action, "rotsnapamt") == 0 then
			var actionStr = getActionSubstr("rotsnapamt", _sel.action)
			
			if actionStr == "set" then
				var newAmt = input("Rotation snap amount", false)
				g_cur.rotSnapAmount = clamp(float(newAmt), 0, 360)
				result.needClose = true
			else
				g_cur.rotSnapAmount += float(actionStr)
				g_cur.rotSnapAmount = wrapIncClamp(g_cur.rotSnapAmount, 0, 360)
			endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Snap increment (" + strRemoveTrailingZeroes(floatToStr(g_cur.rotSnapAmount, g_dispDec))
				 + chr(176) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if _sel.action == "scalenosnap" or _sel.action == "scalesnapby" 
				or _sel.action == "scalesnapto" then
			if _sel.action == "scalenosnap" then
				g_cur.scaleSnapMode = 0
			else if _sel.action == "scalesnapby" then
				g_cur.scaleSnapMode = 1
			else
				g_cur.scaleSnapMode = 2
			endif endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Snap mode (" + getSnapModeStr(g_cur.scaleSnapMode) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if strFind(_sel.action, "scalesnapamt") == 0 then
			var actionStr = getActionSubstr("scalesnapamt", _sel.action)
			
			if actionStr == "set" then
				var newAmt = input("Scale snap amount", false)
				g_cur.scaleSnapAmount = clamp(float(newAmt), 0, 10)
				result.needClose = true
			else
				g_cur.scaleSnapAmount += float(actionStr)
				g_cur.scaleSnapAmount = wrapIncClamp(g_cur.scaleSnapAmount, 0, 10)
			endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Snap increment (" 
				+ strRemoveTrailingZeroes(floatToStr(g_cur.scaleSnapAmount, g_dispDec)) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if _sel.action == "objcol" then
			var colResult = getObjCol(g_cur.activeObj)
			
			if colResult.colStr != "" then
				var picked = showColorPicker(colResult.col, true)
				picked.col = {picked.col.r, picked.col.g, picked.col.b, picked.col.a}
				
				if picked.accept == 1 then
					g_cur.activeObj = setGroupMaterial(g_cur.activeObj, picked.col, -1, -1, -1)
					g_activeObj = setGroupMaterial(g_activeObj, picked.col, -1, -1, -1)
					
					var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
					actionMenu[_sel.idxChain[len(_sel.idxChain) - 1]].text =
						"Object color " + vec4ToStr(picked.col, 2) + " ..."
					result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
				endif
			endif
			
			break
		endif
		
		if _sel.action == "objmetal" then
			var newMetal = clamp(1 - g_cur.activeObj.mat[0], 0, 1)
			
			g_cur.activeObj = setGroupMaterial(g_cur.activeObj, {-1, -1, -1, -1}, newMetal, 
				-1, -1)
			g_activeObj = setGroupMaterial(g_activeObj, {-1, -1, -1, -1}, newMetal, -1, -1)
			
			var matStr = getObjMatStr(g_cur.activeObj, 0)
			
			if matStr != "Multiple" then
				matStr = getBoolStr(g_cur.activeObj.mat[0])
			endif
			
			var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 1]].text = "Metallic (" + matStr + ")"
			result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
		endif
		
		if strFind(_sel.action, "objrough") == 0 then
			var actionStr = getActionSubstr("objrough", _sel.action)
			var newAmt = 0
			
			if actionStr == "set" then
				newAmt = float(input("Roughness amount", false))
				newAmt = clamp(newAmt, 0, 1)
			else
				newAmt = getObjMatStr(g_cur.activeObj, 1)
				
				if newAmt != "" and newAmt != "Multiple" then
					newAmt = float(newAmt)
				else
					newAmt = abs(g_cur.activeObj.mat[1])
				endif
				
				newAmt = wrapIncClamp(newAmt + float(actionStr), 0, 1)
			endif
			
			g_cur.activeObj = setGroupMaterial(g_cur.activeObj, {-1, -1, -1, -1}, -1, 
				newAmt, -1)
			g_activeObj = setGroupMaterial(g_activeObj, {-1, -1, -1, -1}, -1, 
				newAmt, -1)
				
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Roughness (" + getObjMatStr(g_cur.activeObj, 1) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			break
		endif
		
		if strFind(_sel.action, "objemit") == 0 then
			var actionStr = getActionSubstr("objemit", _sel.action)
			var newAmt = 0
			
			if actionStr == "set" then
				newAmt = float(input("Emissiveness amount", false))
				newAmt = clamp(newAmt, 0, 1)
			else
				newAmt = getObjMatStr(g_cur.activeObj, 2)
				
				if newAmt != "" and newAmt != "Multiple" then
					newAmt = float(newAmt)
				else
					newAmt = abs(g_cur.activeObj.mat[2])
				endif
				
				newAmt = wrapIncClamp(newAmt + float(actionStr), 0, 1)
			endif
			
			g_cur.activeObj = setGroupMaterial(g_cur.activeObj, {-1, -1, -1, -1}, -1, 
				-1, newAmt)
			g_activeObj = setGroupMaterial(g_activeObj, {-1, -1, -1, -1}, -1, 
				-1, newAmt)
				
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Emissiveness (" + getObjMatStr(g_cur.activeObj, 2) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			break
		endif
		
		if strFind(_sel.action, "lightbrightness") == 0 then
			var actionStr = getActionSubstr("lightbrightness", _sel.action)
			var newAmt = 0
			
			if actionStr == "set" then
				newAmt = float(input("Brightness amount", false))
				newAmt = clamp(newAmt, 0, 9999)
				g_cur.activeObj = setGrpLightsBrightness(g_cur.activeObj, newAmt)
			else
				var offset = float(actionStr)
				g_cur.activeObj = offsetGrpLightsBrightness(g_cur.activeObj, offset, 1)
			endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Brightness (" + getObjBrightnessStr(g_cur.activeObj) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			break
		endif
		
		if _sel.action == "lightcol" then
			var colResult = getObjLightCol(g_cur.activeObj)
			
			if colResult.colStr != "" then
				var picked = showColorPicker(colResult.col, false)
				picked.col = {picked.col.r, picked.col.g, picked.col.b, g_sprAlpha}
				
				if picked.accept == 1 then
					g_cur.activeObj = setGrpLightsCol(g_cur.activeObj, picked.col)
					g_activeObj = setGrpLightsCol(g_activeObj, picked.col)
					
					var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
					actionMenu[_sel.idxChain[len(_sel.idxChain) - 1]].text =
						"Light color " + vec3ToStr(picked.col, 2) + " ..."
					result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
				endif
			endif
			
			break
		endif
		
		if strFind(_sel.action, "lightspread") == 0 then
			var actionStr = getActionSubstr("lightspread", _sel.action)
			var newAmt = 0
			
			if actionStr == "set" then
				newAmt = float(input("Spread amount", false))
				newAmt = clamp(newAmt, 0, 9999)
				g_cur.activeObj = setGrpLightsSpread(g_cur.activeObj, newAmt)
			else
				var offset = float(actionStr)
				g_cur.activeObj = offsetGrpLightsSpread(g_cur.activeObj, offset)
			endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Spread (" + getObjSpreadStr(g_cur.activeObj) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if strFind(_sel.action, "lightres") == 0 then
			var actionStr = getActionSubstr("lightres", _sel.action)
			var newAmt = 0
			
			if actionStr == "set" then
				newAmt = int(input("Resolution amount", false))
				newAmt = int(clamp(newAmt, 2, 8192))
				g_cur.activeObj = setGrpLightsRes(g_cur.activeObj, newAmt)
			else
				var offset = -1
				
				if actionStr == "up" then
					offset = 1
				endif
				
				g_cur.activeObj = offsetGrpLightsRes(g_cur.activeObj, offset)
			endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Resolution (" + getObjResStr(g_cur.activeObj) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			break
		endif
		
		if strFind(_sel.action, "lightrange") == 0 then
			var actionStr = getActionSubstr("lightrange", _sel.action)
			var newAmt = 0
			
			if actionStr == "set" then
				newAmt = float(input("Range amount", false))
				newAmt = clamp(newAmt, 0, 9999)
				g_cur.activeObj = setGrpLightsRange(g_cur.activeObj, newAmt)
			else
				var offset = float(actionStr)
				g_cur.activeObj = offsetGrpLightsRange(g_cur.activeObj, offset)
			endif
			
			var actionMenu = getParentFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Range (" + getObjRangeStr(g_cur.activeObj) + ")"
			result.menu = updateMenuChainParent(_sel.idxChain, _menu, actionMenu)
			break
		endif
		
		if strFind(_sel.action, "background") == 0 then
			if getActionSubstr("background", _sel.action) == "tint" then
				var colResult = showColorPicker(g_bg.col, false)
				
				if colResult.accept == 1 then
					g_bg.col = colResult.col
					g_dirtyMap = true
					_menu = updateMenuChain(_sel.idxChain, _menu, addBackgroundsToMenu(g_bg.idx))
					result.menu = setSelMenuChain(_menu, _sel.idxChain)
				endif
			else
				var newBg = getActionIdx("background", _sel.action)
				
				if g_bg.idx != newBg then
					g_bg.idx = newBg
					g_dirtyMap = true
				endif
				
				_menu = updateMenuChainParent(_sel.idxChain, _menu, addBackgroundsToMenu(g_bg.idx))
				_sel.idxChain[len(_sel.idxChain) - 1] = g_bg.idx
				result.menu = setSelMenuChain(_menu, _sel.idxChain)
			endif
			
			setEnvironment(g_bg.idx, g_bg.col)
			break
		endif
		
		if strFind(_sel.action, "theme") == 0 then
			setTheme(getActionSubstr("theme", _sel.action), true)
			
			var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
			var themeDefs = getThemeDefs()
			
			var i
			for i = 0 to len(actionMenu) loop
				actionMenu[i].text = themeDefs[i].name
				
				if i == _sel.idxChain[len(_sel.idxChain) - 1] then
					actionMenu[i].text = "* " + actionMenu[i].text
				endif
			repeat
			
			result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if strFind(_sel.action, "res") == 0 then
			var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
			var selResStr
			var unselResStr
			
			if _sel.action == "res1080p" then
				setMode(1920, 1080)
				selResStr = "* 1920x1080"
				unselResStr = "1280x720"
			else
				setMode(1280, 720)
				selResStr = "* 1280x720"
				unselResStr = "1920x1080"
			endif
			
			/* Need to reset draw target after resolution change to ensure sprites will
			draw in the correct location. */
			setDrawTarget(framebuffer)
			
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 1]].text =
				selResStr
			actionMenu[(_sel.idxChain[len(_sel.idxChain) - 1] + 1) % 2].text =
				unselResStr
			result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
			actionMenu = getParentFromChain(result.menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
				"Screen resolution (" + gwidth() + "x" + gheight() +")"
			initScreenRes()
			result.menu = updateMenuChainParent(_sel.idxChain, result.menu, actionMenu)
			result.needClose = true
		endif
		
		if _sel.action == "photomode" then
			setPhotoMode(!g_photoMode)
			
			var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 1]].text =
				"Photo mode (" + getBoolStr(g_photoMode) + ")"
			result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
		endif
		
		if _sel.action == "drawobjlabels" then
			g_cam.drawObjLabels = !g_cam.drawObjLabels
			
			var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 1]].text =
				"Draw object labels (" + getBoolStr(g_cam.drawObjLabels) + ")"
			result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
			break
		endif
		
		if strFind(_sel.action, "camcol") == 0 then
			var colIdx = getActionIdx("camcol", _sel.action)
			
			if colIdx != g_cam.collisionMode then
				var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
				var menuStr = actionMenu[colIdx].text
				
				actionMenu[colIdx].text = "* " + actionMenu[colIdx].text
				actionMenu[g_cam.collisionMode].text = actionMenu[g_cam.collisionMode].text[2:]
				result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
				
				g_cam.collisionMode = colIdx
				/* Update physics info so the engine doesn't scan for a first collision using 
				garbage delta values. */
				if colIdx > 0 then
					g_cam.lastColContext.comPos = g_cam.pos
					g_cam.lastColContext.fwd = g_cam.fwd
					g_cam.lastColContext.up = g_cam.up
				endif
				
				actionMenu = getParentFromChain(result.menu, _sel.idxChain)
				actionMenu[_sel.idxChain[len(_sel.idxChain) - 2]].text =
					"Camera collisions (" + menuStr + ")"
				result.menu = updateMenuChainParent(_sel.idxChain, result.menu, actionMenu)
			endif
		endif
		
		if _sel.action == "throw" then
			startThrow(g_cam.pos, g_cam.fwd, g_cam.up)
			
			result.needClose = true
			break
		endif
		
		if _sel.action == "showcells" then
			g_visibleCellOutlines = !g_visibleCellOutlines
			
			if g_visibleCellOutlines then
				initCellOutlines()
			else
				hideCellOutlines()
			endif
			
			var actionMenu = getMenuFromChain(_menu, _sel.idxChain)
			actionMenu[_sel.idxChain[len(_sel.idxChain) - 1]].text =
				"Show cell outlines (" + getBoolStr(g_visibleCellOutlines) + ")"
			result.menu = updateMenuChain(_sel.idxChain, _menu, actionMenu)
			result.needWritePrefs = true
		endif
		
		if _sel.action == "viewstats" then
			showMapStats()
			
			result.needClose = true
			break
		endif
		
		if _sel.action == "viewfile" then
			var mapFile = openFile()
			debugFile(mapFile)
			closeFile(mapFile)
			
			result.needClose = true
			break
		endif
		
		/* Obj menu actions. These have the effect of closure on the 2D 
		dropdown menu but are subsequently passed to and further resolved 
		by triggerObjMenuAction(). */
		if strFind(_sel.action, "brush") == 0 then
			result.needClose = true
			break
		endif
		
		if strFind(_sel.action, "deldef") == 0 then
			result.needClose = true
			break
		endif
		
		continue = false
	repeat
return result

function triggerObjMenuAction(_objMenu, _action)
	var result = [
		.needClose = false,
		.menu = _objMenu,
		.needWritePrefs = false,
		.action = _action
	]
	
	var continue = true
	while continue loop
		var minBank
		
		if len(g_obj[0]) then
			minBank = 0
		else
			minBank = 1
		endif
		
		if _action == "nextbank" then
			result.menu.bank = int(wrap(_objMenu.bank + 1, minBank, len(g_obj)))
			result.menu = updateObjMenuBank(result.menu)
			break
		endif
		
		if _action == "prevbank" then
			result.menu.bank = int(wrap(_objMenu.bank - 1, minBank, len(g_obj) + 0.1))
			result.menu = updateObjMenuBank(result.menu)
			break
		endif
		
		if strFind(_action, "brush") != -1 then
			if _action == "brushmerged" then
				g_cur.isMerged = true
			else
				g_cur.isMerged = false
			endif
			
			var objIdx = getObjMenuIdxFromPos(_objMenu, _objMenu.selPos)
			replaceActiveObj(_objMenu.bank, objIdx)
			
			result.needClose = true
			break
		endif
		
		if strFind(_action, "deldef") == 0 then
			g_requestShallowStackAction = _action
			result.needClose = true
			break
		endif
		
		if _action == "closeobjmenu" then
			result.needClose = true
			break
		endif
		
		continue = false
	repeat	
return result

/* Some menu items trigger an action just by being highlighted. */
function triggerMenuSelAction(_sel, _menu, _isSel)
	var result = [
		.needClose = false,
		.menu = _menu,
		.needWritePrefs = false,
		.selAction = _sel.selAction
	]
	
	var continue = true
	while continue loop
		if strFind(_sel.selAction, "highlight") != -1 then
			var idx = getActionIdx("objhighlight", _sel.selAction)
			var i
			var obj
			
			if _sel.action[:2] == "obj" then
				obj = getObjListFromCellIdxList(g_cur.lastColContext.collision, true)[idx]
			else
				array list[len(g_sel)]
				
				for i = 0 to len(g_sel) loop
					list[i] = g_sel[i][0]
				repeat
				
				obj = getMapObjFromRef(g_cell[list[idx].cell][list[idx].idx])
			endif
			
			g_cell[getMapObjCell(obj)][getMapObjIdx(obj)].highlight = _isSel
			
			if !_isSel then
				restoreDefaultObjCol(obj)
				restoreGrpLightsSprCol(obj)
			endif
			
			g_blink.needUpdate = true
			break
		endif
		
		continue = false
	repeat
return result

/* Ensures that a menu selection action gets triggered even in circumstances
that wouldn't otherwise check for the trigger (e.g. reopening the menu with
a cached position). */
function forceCurrentMenuSelAction(_menu)
	var result = [
		.needClose = false,
		.menu = _menu,
		.needWritePrefs = false,
		.selAction = ""
	]
	
	var menuSel = getMenuSel(_menu)
	
	if menuSel.selAction != "" then
		result = triggerMenuSelAction(menuSel, _menu, true)
	endif
return result

	// ----------------------------------------------------------------
	// MAIN MENU

/* Checks whether the main menu needs to be opened or closed and handles the
case. */
function openMenu(_pos, _menu, _menuImg, _txtSize)
	var c = controls(0)
	c = applyKb(c, g_bind.menu).c
	
	if c.x and !g_cDat[g_cIdx.x].held then
		g_cDat[g_cIdx.x].held = true
		
		if imageSize(_menuImg) == {1, 1} then
			freeImage(_menuImg)
			
			// Insert dynamic menu for objects under cursor
			var curMenu = createCurMenu(g_cur.cell, g_cur.pos,
				 _menu[1].submenu)
			_menu = insertDynMenu(curMenu, _menu, [1])
			
			// Insert dynamic menu for selected objects
			var selMenu = createSelMenu(_menu[2].submenu)
			
			_menu = insertDynMenu(selMenu, _menu, [2])
			_menu = updateBrushMenu(_menu)
			_menu = updateResolutionMenu(_menu)
			_menuImg = createMenuImg(_pos, _menu, true, _txtSize, 1)
			forceCurrentMenuSelAction(_menu)
		else
			var closeResult = closeMenu(_menu, _menuImg, g_needWritePrefs, [[1], [2]])
			g_needWritePrefs = false
			_menu = closeResult.menu
			_menuImg = closeResult.menuImg
		endif
	else if !c.x then
		g_cDat[g_cIdx.x].held = false
	endif endif
	
	var result = [
		.menuImg = _menuImg,
		.menu = _menu
	]
return result

/* Closes the main menu and resolves any pending preference writes. */
function closeMenu(_menu, _menuImg, _writePrefs, _dynIdxChain)
	var unsel = getMenuSel(_menu)
	if unsel.selAction != "" then
		var unselActionResult = triggerMenuSelAction(unsel.menu[unsel.idx], _menu, false)
	endif
	
	freeImage(_menuImg)
	_menuImg = createImage(1, 1, false)
	
	if _writePrefs then
		writeEdPrefs()
	endif
	
	// Remove dynamic menu for objects under cursor
	var i
	for i = 0 to len(_dynIdxchain) loop
		_menu = removeDynMenu(_menu, _dynIdxChain[i], getMenuSel(_menu).idxChain)
	repeat
	
	var result = [
		.menu = _menu,
		.menuImg = _menuImg
	]
return result

/* Ensures that menus are never drawn partially off screen. */
function adjustOffscreenMenuPos(_pos, _posExt)
	if _pos.x + _posExt.x > gwidth() then
		_pos.x -= _pos.x + _posExt.x - gwidth()
	endif
	if _pos.y + _posExt.y > gheight() then
		_pos.y -= _pos.y + _posExt.y - gheight()
	endif
return _pos

/* Draws an image of the current menu state. Currently draws a full-screen 
image, which may not be the most efficient, but it's more convenient than 
continually recalculating the image size to accommodate menu changes. */
function createMenuImg(_pos, _menu, _border, _txtSize, _bgAlpha)
	var target = getDrawTarget()
	textSize(_txtSize)
	var bullet = ">"
	var bulletW = getBulletWidth(bullet)
	var textW = getMenuWidth(_menu, bullet)
	var menuImg = createImage(gwidth(), gheight(), false)
	setDrawTarget(menuImg)	
	var borderCol
	var posExt = {textW, _txtSize * len(_menu)}
	_pos = adjustOffscreenMenuPos(_pos, posExt)
	array submenuIdx[0]
	
	drawUiBox(_pos, posExt, _border, _bgAlpha)
	
	var i
	var submenu
	
	for i = 0 to len(_menu) loop
		var col
		
		if _menu[i].sel then
			box(_pos.x, _pos.y + i * _txtSize, textW, _txtSize, 
				g_theme.bgSelCol, 0)
			if _menu[i].active then
				col = g_theme.textSelCol
				
				if _menu[i].clicked and menuExists(_menu[i].submenu) then
					// Defer drawing submenus so they draw on top of parents
					submenuIdx = push(submenuIdx, i)
				endif
			else
				col = g_theme.inactiveCol
			endif
		else
			if _menu[i].active then
				col = g_theme.textCol
			else
				col = g_theme.inactiveCol
			endif
		endif
		
		drawText(_pos.x + bulletW, _pos.y + i * _txtSize, _txtSize, col, 
			_menu[i].text)
		
		if menuExists(_menu[i].submenu) and _menu[i].active then
			drawText(_pos.x + textW - bulletW, _pos.y + i * _txtSize, 
				_txtSize, col, bullet)
		endif
	repeat
	
	// Draw submenus
	for i = 0 to len(submenuIdx) loop
		submenu = createMenuImg({_pos.x + textW, _pos.y + submenuIdx[i] * _txtSize}, 
			_menu[submenuIdx[i]].submenu, _border, _txtSize, _bgAlpha)
		drawImage(submenu, 0, 0)
		freeImage(submenu)		
	repeat
	
	setDrawTarget(target)
return menuImg

/* Checks validity of a menu array. */
function menuExists(_menu)
	var exists = false
	if len(_menu) > 0 then
		if getType(_menu[0]) == "struct" then
			exists = true
		endif
	endif
return exists

/* Finds the currently highlighted menu item. */
function getMenuSel(_menu)
	var menuSel = [
		.menu = 0,
		.idx = -1,
		.idxChain = [],
		.up = -1,
		.down = -1,
		.text = "",
		.action = "",
		.selAction = ""
	]
	
	/* Walk through the menu recursively and build a chain that tells 
	us the hierarchy of open menu panes. */
	var i
	var chain
	var j
	
	for i = 0 to len(_menu) loop
		if _menu[i].sel then
			if _menu[i].clicked and menuExists(_menu[i].submenu) then
				chain = push(menuSel.idxChain, i)
				menuSel = getMenuSel(_menu[i].submenu)
				
				for j = 0 to len(menuSel.idxChain) loop
					chain = push(chain, menuSel.idxChain[j])
				repeat
				
				menuSel.idxChain = chain
				
				break
			else
				menuSel.menu = _menu
				menuSel.idx = i
				menuSel.idxChain = push(menuSel.idxChain, i)
				menuSel.up = clamp(i - 1, 0, len(_menu) - 1)
				menuSel.down = clamp(i + 1, 0, len(_menu) - 1)
				menuSel.text = _menu[i].text
				menuSel.action = _menu[i].action
				menuSel.selAction = _menu[i].selAction
				
				break
			endif
		endif
	repeat
return menuSel

/* Works through a chain representing the menu selection hierarchy and
sets each item to an unselected state, resetting the selection hierarchy. 
Performed non-recursively. */
function unselectSelChain(_menu, _selChain)
	var submenuAssemble = [ _menu ]
	
	if len(_selChain) then
		var submenu = _menu[_selChain[0]].submenu
		
		var i
		for i = 1 to len(_selChain) loop
			submenu[_selChain[i]].sel = false
			submenu[_selChain[i]].clicked = false
			
			// Push each successive submenu to array
			submenuAssemble = push(submenuAssemble, submenu)
			submenu = submenu[_selChain[i]].submenu
		repeat
		if len(submenuAssemble) >= 2 then
			for i = len(submenuAssemble) - 1 to 0.1 step -1 loop
				// Work backwards through array and recombine modified submenus
				submenuAssemble[i - 1][_selChain[i - 1]].submenu = submenuAssemble[i]
			repeat
		endif
	endif
return submenuAssemble[0]

/* Performs per-frame updates to the menu. */
function updateMenu(_pos, _menu, _menuImg, _border, _txtSize, _forceRefresh, _dynIdxChain, _bgAlpha)
	var needRefresh = _forceRefresh
	var selHasMoved = false
	var action = ""
	var unsel = getMenuSel(_menu)
	
	var c = controls(0)
	var kbResult = applyKb(c, g_bind.menu)
	c = kbResult.c
	
	// Move selection
	if menuDirInputStarted(c, kbResult.kbActive) then
		loop if c.ly < -0.3 or c.down then
			_menu = moveMenuDown(_menu)
			break endif
		if c.ly > 0.3 or c.up then
			_menu = moveMenuUp(_menu)
			break endif
		if c.lx > 0.3 or c.right then
			_menu = moveMenuRight(_menu)
			break endif
		if c.lx < -0.3 or c.left then
			_menu = moveMenuLeft(_menu)
			break
		endif break repeat
		
		selHasMoved = true
		needRefresh = true
	endif
	
	// Trigger menu action
	if !needRefresh and c.a and !g_cDat[g_cIdx.a].held then
		g_cDat[g_cIdx.a].held = true
		
		if menuExists(unsel.menu[unsel.idx].submenu) then
			_menu = moveMenuRight(_menu)
			selHasMoved = true
			needRefresh = true
		else
			var actionResult = triggerMenuAction(unsel, _menu)
			_menu = actionResult.menu
			action = actionResult.action
			
			if actionresult.needWritePrefs then
				g_needWritePrefs = true
			endif
			
			if actionResult.needClose then
				var closeResult = closeMenu(_menu, _menuImg, g_needWritePrefs, _dynIdxChain)
				g_needWritePrefs = false
				_menu = closeResult.menu
				_menuImg = closeResult.menuImg
			else
				needRefresh = true
			endif
			
			// Update input state because it may have changed while resolving the menu action
			c = controls(0)
			c = applyKb(c, g_bind.menu).c
		endif
	else if !c.a then
		g_cDat[g_cIdx.a].held = false
	endif endif
	
	// Close menu or submenu
	if !needRefresh and c.b and !g_cDat[g_cIdx.b].held then
		g_cDat[g_cIdx.b].held = true
		
		if len(unsel.idxChain) <= 1 then
			var closeResult = closeMenu(_menu, _menuImg, g_needWritePrefs, _dynIdxChain)
			g_needWritePrefs = false
			_menu = closeResult.menu
			_menuImg = closeResult.menuImg
		else
			_menu = moveMenuLeft(_menu)
			selHasMoved = true
			needRefresh = true
		endif
	else if !c.b then
		g_cDat[g_cIdx.b].held = false
	endif endif
	
	// Trigger actions that happen on a change of highlighted item
	var menuSel = getMenuSel(_menu)
	
	if selHasMoved then
		if unsel.selAction != "" then
			triggerMenuSelAction(unsel, _menu, false)
		endif
		if menuSel.selAction != "" then
			triggerMenuSelAction(menuSel, _menu, true)
		endif
	endif
	
	// Redraw menu
	if needRefresh then
		freeImage(_menuImg)
		_menuImg = createMenuImg(_pos, _menu, _border, _txtSize, _bgAlpha)
	endif
	
	var updatedMenu = [
		.img = _menuImg,
		.menu = _menu,
		.action = action
	]
return updatedMenu

/* Opens a submenu if available. */
function moveMenuRight(_menu)
	var menuSel = getMenuSel(_menu)
	if menuSel.idx > -1
			and menuSel.menu[menuSel.idx].sel 
			and menuExists(menuSel.menu[menuSel.idx].submenu) 
			and menuSel.menu[menuSel.idx].active then
		menuSel.menu[menuSel.idx].clicked = true
		menuSel.menu[menuSel.idx].submenu[0].sel = true
		
		if len(menuSel.idxChain) > 1 then
			/* Set selected entry's clicked state to true so that 
			the submenu opens. */
			_menu = updateMenuChain(menuSel.idxChain, _menu, menuSel.menu)
		else
			_menu = menuSel.menu
		endif
	// Select first entry in submenu
	_menu = updateMenuChainChild(menuSel.idxChain, _menu, menuSel.menu[menuSel.idx].submenu)
	endif
return _menu

/* Closes a submenu. */
function moveMenuLeft(_menu)
	var menuSel = getMenuSel(_menu)
	if menuSel.idx > -1 and len(menuSel.idxChain) > 1 then
		menuSel.menu[menuSel.idx].sel = false
		menuSel.idxChain = remove(menuSel.idxChain, len(menuSel.idxChain) - 1)
		
		// Clear submenu selection
		_menu = updateMenuChainChild(menuSel.idxChain, _menu, menuSel.menu)
		
		if len(menuSel.idxChain) > 1 then
			var unclickedMenu = getMenuFromChain(_menu, menuSel.idxChain)
			unclickedMenu[menuSel.idxChain[len(menuSel.idxChain) - 1]].clicked = false
			
			/* Clear the submenu's parent entry's click state so that the 
			submenu closes. */
			_menu = updateMenuChain(menuSel.idxChain, _menu, unclickedMenu)
		else
			_menu[menuSel.idxChain[len(menuSel.idxChain) - 1]].clicked = false
		endif
	endif
return _menu

function moveMenuDown(_menu)
return moveMenuVert(_menu, 0)

function moveMenuUp(_menu)
return moveMenuVert(_menu, 1)

/* Changes highlighted item within the same menu. */
function moveMenuVert(_menu, _dir)
	var menuSel = getMenuSel(_menu)
	if menuSel.idx > -1 then
		menuSel.menu[menuSel.idx].sel = false
		if _dir then
			menuSel.menu[menuSel.up].sel = true
		else
			menuSel.menu[menuSel.down].sel = true
		endif
		
		if len(menuSel.idxChain) > 1 then
			_menu = updateMenuChain(menuSel.idxChain, _menu, menuSel.menu)
		else
			_menu = menuSel.menu
		endif
	endif
return _menu

/* Gets the submenu at the end of the selecion chain. */
function getSubmenuFromChain(_menu, _chain)
	var sub = _menu
	
	var i
	for i = 0 to len(_chain) loop
		sub = sub[_chain[i]].submenu
	repeat
return sub

/* Gets the menu in which the selection chain ends. */
function getMenuFromChain(_menu, _chain)
return getSubmenuFromChain(_menu, remove(_chain, len(_chain) - 1))

/* Gets the parent of the menu in which the selection chain ends. */
function getParentFromChain(_menu, _chain)
	var i
	for i = 0 to 2 loop
		_chain = remove(_chain, len(_chain) - 1)
	repeat
return getSubmenuFromChain(_menu, _chain)

/* Rebuilds the selection state along the menu's selection 
chain. _chain is a list of indices that indicates the selection
path; _menuCopy is the full unupdated menu; _modifiedMenu is 
the new version of the (sub)menu that has changed and whose 
parent entry is the last index in _chain. */
function updateMenuChainChild(_chain, _menuCopy, _modifiedMenu)
	var newMenu = _menuCopy
	var idx = _chain[0]
	
	if len(_chain) > 1 then
		_chain = remove(_chain, 0)
		newMenu[idx].submenu = updateMenuChainChild(_chain, newMenu[idx].submenu, _modifiedMenu)
	else
		newMenu[idx].submenu = _modifiedMenu
	endif
return newMenu

/* Automatically removes the last chain entry so the entry itself updates
rather than the submenu it points to. */
function updateMenuChain(_chain, _menuCopy, _modifiedMenu)
	_chain = remove(_chain, len(_chain) - 1)
return updateMenuChainChild(_chain, _menuCopy, _modifiedMenu)

/* Automatically removes the last two chain entries so the entry's parent 
updates rather than the entry itself. */
function updateMenuChainParent(_chain, _menuCopy, _modifiedMenu)
	var i
	for i = 0 to 2 loop
		_chain = remove(_chain, len(_chain) - 1)
	repeat
return updateMenuChainChild(_chain, _menuCopy, _modifiedMenu)

/* Returns the index of item named _text in _menu. Non-recursive; doesn't
consider _text's presence in submenus. */
function findMenuEntry(_menu, _text)
	var idx = -1
	
	var i
	for i = 0 to len(_menu) loop
		if strFind(_menu[i].text, _text) == 0 then
			idx = i
			
			break
		endif
	repeat
return idx

/* Given a selection chain, sets menu properties to create that selecion state. 
Assumes the menu begins in a completely unselected state. */
function setSelMenuChain(_menu, _chain)
	if len(_chain) then
		_menu[_chain[0]].sel = true
		
		if len(_chain) > 1 and len(_menu[_chain[0]].submenu) then
			_menu[_chain[0]].clicked = true
			_menu[_chain[0]].submenu = setSelMenuChain(_menu[_chain[0]].submenu, remove(_chain, 0))
		endif
	endif
return _menu

// ----------------------------------------------------------------
// OBJECT MENU

/* Sets default object menu values */
function initObjMenu()
	var objMenu = [
		.isOpen = false,
		.bank = 0,
		.selPos = {0, 0},
		.startRow = 0
	]
return objMenu

/* Checks if the object menu needs to be opened or closed and handles the
process. */
function openObjMenu(_objMenu)
	var c = controls(0)
	c = applyKb(c, g_bind.menu).c
	
	if c.y and !g_cDat[g_cIdx.y].held then
		g_cDat[g_cIdx.y].held = true
		
		if _objMenu.isOpen then
			_objMenu = closeObjMenu(_objMenu)
		else
			setFov(50)
			update()
			_objMenu = createObjMenu(_objMenu)
			_objMenu = setObjMenuEnvironmentVisibility(_objMenu, false)
			drawSprites()
			drawObjects()
		endif
	else if !c.y then
		g_cDat[g_cIdx.y].held = false
	endif endif
return _objMenu

/* Removes instantiated objects and sprites in the object menu. */
function clearObjMenuGrid(_objMenu)
	var i
	var j
	
	for i = 0 to len(_objMenu.obj) loop
		for j = 0 to len(_objMenu.obj[i]) loop
			if len(_objMenu.obj[i][j].children) or len(_objMenu.obj[i][j].lights) then
				_objMenu.obj[i][j] = removeGroupObj(_objMenu.obj[i][j])
				if decodeBank(-1, _objMenu.obj[i][j].bankIdx) > g_lightBank then
					removeSprite(_objMenu.obj[i][j].mergedSpr)
				endif
			else
				removeObject(_objMenu.obj[i][j].obj)
			endif
		repeat
	repeat
return _objMenu

/* Changes the displayed bank in the object menu. */
function updateObjMenuBank(_objMenu)
	_objMenu = clearObjMenuGrid(_objMenu)
	_objMenu.startRow = 0
	_objMenu.lastUpdateTime = time()
	_objMenu.obj = updateObjMenuGrid(_objMenu.startRow, _objMenu.rowLen, 
		_objMenu.colLen, _objMenu.posIncX, _objMenu.posIncY, _objMenu.bank, 
		_objMenu.fov)
		
	if !_objMenu.selVisible and getObjMenuIdxFromPos(_objMenu, {_objMenu.rowLen - 1, _objMenu.selPos.y}) 
			< len(g_obj[_objMenu.bank]) then
		_objMenu.selPos = {_objMenu.rowLen - 1, _objMenu.selPos.y}
	else if !_objMenu.selVisible 
			or (_objMenu.selVisible and getObjMenuIdxFromPos(_objMenu, _objMenu.selPos) >= len(g_obj[_objMenu.bank])) then
		_objMenu.selPos = getObjMenuPosFromIdx(_objMenu, len(g_obj[_objMenu.bank]) - 1)
	endif endif
	
	if _objMenu.selVisible then
		removeGenericObj(_objMenu.sel)
		_objMenu = drawObjMenuSel(_objMenu)
	endif
return _objMenu

/* Converts menu item index to {x, y} position. */
function getObjMenuPosFromIdx(_objMenu, _idx)
	var pos = {mod(_idx, _objMenu.rowLen), floor(_idx / _objMenu.rowLen) - _objMenu.startRow}
return pos

/* Converts {x, y} position to menu item index. */
function getObjMenuIdxFromPos(_objMenu, _pos)
	var idx = _objMenu.startRow * _objMenu.rowLen + _pos.y 
		* _objMenu.rowLen + _pos.x
return idx

/* Refreshes objects and/or object positions in the menu. */
function updateObjMenuGrid(_startRow, _rowLen, _colLen, _xInc, _yInc, _bank, _fov)
	array menuObj[0]
	var startPos = {gwidth() / 15, gwidth() / 12}
	
	var i
	var j
	var objIdx
	var scrPos
	var pos
	var lightSpr
	var scale
	var scaledExt
	var maxDim
	var camBackwards
	var rotDeg
	var objFwd
	var objModel
	var objChildren
	var objLights
	var template
	var objResult
	var lightContainer
	var menuObjR
	var screenR
	var deg
	
	initMergedImg()
	
	for i = 0 to _rowLen loop
		if _startRow * _rowLen + i > len(g_obj[_bank]) - 1 then
 			break
		endif
		
		menuObj = push(menuObj, [])
		
		for j = 0 to _colLen loop
			objIdx = _startRow * _rowLen + (j * _rowLen) + i
			if objIdx > len(g_obj[_bank]) - 1 then
				break
			endif
			
			scrPos = startPos + {_xInc * i, _yInc * j}
			pos = screenPosToWorldPos(scrPos, 1, g_cam.fwd, g_cam.up, g_cam.pos, _fov)
			lightSpr = -1
			maxDim = getMaxDim(g_obj[_bank][objIdx].ext, {1, 1, 1})
			scale = (0.13 / maxDim) * getUiFovScale(_fov)
			camBackwards = axisRotVecBy(g_cam.fwd, g_cam.up, 180)
			rotDeg = getAngleBetweenVecs({0, 0, 1}, g_cam.fwd)
			scaledExt = [
				.lo = g_obj[_bank][objIdx].ext.lo * scale,
				.hi = g_obj[_bank][objIdx].ext.hi * scale
			]
			objFwd = normalize(g_cam.pos - pos - getExtCenter(scaledExt))
			
			if len(g_obj[_bank][objIdx].children) or len(g_obj[_bank][objIdx].lights) then
				template = activeFromObjDef(_bank, objIdx)
				template.scale = {1, 1, 1} * scale
				template.pos = pos
				
				objResult = placeGrpObj(template, template, _fov)
				
				objModel = objResult.obj
				objChildren = objResult.children
				objLights = objResult.lights
				
				// Create quasi-mapObj to run a couple functions that take mapObj type as argument
				objContainer = [
					.obj = objModel,
					.lights = objLights, 
					.children = objChildren, 
					.pos = pos,
					.scale = scale,
					.fwd = objFwd,
					.up = {0, 1, 0},
					.col = template.col,
					.mat = template.mat
				]
				
				restoreDefaultObjCol(objContainer)
				setGrpLightsBrightness(objContainer, 0)
			else
				objModel = placeObjDef(g_obj[_bank][objIdx], pos,
					{1, 1, 1} * scale)
				objChildren = []
				objLights = []
			endif
			
			var spr = -1
			
			if len(g_obj[_bank][objIdx].children) and _bank > 1 then
				spr = createSprite()
				setSpriteImage(spr, g_imgMerged)
				setSpriteLocation(spr, 
					scrPos + {_xInc / 4, _yInc / 4})
			endif
			
			menuObj[i] = push(menuObj[i], [
					.obj = objModel,
					.children = objChildren,
					.lights = objLights,
					.pos = pos,
					.scrPos = scrPos,
					.scaledExt = scaledExt,
					.ext = g_obj[_bank][objIdx].ext,
					.fwd = objFwd,
					.up = {0, 1, 0},
					.scale = scale,
					.bankIdx = encodeBankIdx(_bank, objIdx),
					.name = g_obj[_bank][objIdx].name,
					.mergedSpr = spr,
					.lightSpr = lightSpr
				])
				
			menuObjR = normalize(cross(menuObj[i][j].fwd, normalize(g_cam.pos + g_cam.up - menuObj[i][j].pos)))
			screenR = worldPosToScreenPos(menuObj[i][j].pos + menuObjR * .5, g_cam.fwd, g_cam.up, g_cam.pos, _fov)
			
			// Find a rough rotation to counteract FOV distortion at the screen edge
			deg = getAngleBetweenVecs({screenR.x, screenR.y, 0} - {scrPos.x, scrPos.y, 0}, 
				{-100, 0, 0}) * 0.8
				
			if (dot(pos - g_cam.pos, g_cam.up) > 0 and dot(pos - g_cam.pos, g_cam.r) > 0)
					or (dot(pos - g_cam.pos, g_cam.up) < 0 and dot(pos - g_cam.pos, g_cam.r) < 0) then
				deg *= -1
			endif
			
			// Angle object nicely towards camera
			menuObj[i][j].up = axisRotVecBy(menuObjR, menuObj[i][j].fwd, -90)
			menuObjR = cross(menuObj[i][j].fwd, menuObj[i][j].up)
			menuObj[i][j].up = axisRotVecBy(menuObj[i][j].up, menuObjR, -35)
			menuObj[i][j].fwd = axisRotVecBy(menuObj[i][j].fwd, menuObjR, -35)
			setObjRot(menuObj[i][j].obj, menuObj[i][j].pos, menuObj[i][j].fwd, menuObj[i][j].up)
			
			menuObj[i][j] = updateMenuObjTransform(menuObj[i][j], menuObj[i][j].scaledExt, _fov, 0)
		repeat
	repeat
return menuObj

/* Creates object menu from settings cached in _objMenu. */
function createObjMenu(_objMenu)
	/* Don't change this. The object menu needs to use FOV 50 to 
	display correctly regardless of how the main camera is set. */
	var fov = 50
	var bgExtScr = {gwidth() / (-gwidth() / 8), gheight() / 130}
	var bgExt = screenPosToWorldPos(bgExtScr, 2, g_cam.fwd, g_cam.up,
		 g_cam.pos, fov)
	var bgPosScr = {gwidth() / 2, gheight() / 2}
	var bgPos = screenPosToWorldPos(bgPosScr, 2, g_cam.fwd, g_cam.up, 
		g_cam.pos, fov)
	var bgScale = {distance(projectVec(bgPos, bgExt, bgExt - g_cam.up * 100), bgPos), 
		distance(projectVec(bgPos, bgExt, bgExt+ g_cam.r * 100), bgPos)}
	var objMenuBg = placeObject(cube, bgPos, {bgScale.x, bgScale.y, 0.01})
	var posIncX = gwidth() / 10
	var posIncY = gwidth() / 8
	var rowLen = 8
	var colLen = 4
	var objBank = _objMenu.bank
	
	objectPointAt(objMenuBg, g_cam.pos)
	setObjectMaterial(objMenuBg, g_theme.bgCol, 0, 1, 0.55)
	
	if len(g_obj[objBank]) == 0 then
		var i
		for i = 0 to len(g_obj) - 1 loop
			objBank = wrap(objBank + 1, 0, len(g_obj))
			
			if len(g_obj[objBank]) then
				break
			endif
		repeat
	endif
	
	var menuObj = updateObjMenuGrid(_objMenu.startRow, rowLen, colLen, posIncX, posIncY, 
		objBank, fov)
	var txtSize = g_menuTextSize
	textSize = txtSize
	var sidebarPos = {gwidth() - getMenuWidth(g_objMenuSidebar, ">"), bgExtScr.y}
	
	_objMenu = [
		.obj = menuObj,
		.bg = objMenuBg,
		.bank = objBank,
		.sel = 0,
		.selPos = _objMenu.selPos, //{x, y} in selection grid
		.selVisible = true,
		.selFwd = menuObj[_objMenu.selPos.x][_objMenu.selPos.y].fwd,
		.isOpen = true,
		.sidebar = g_objMenuSidebar,
		.sidebarPos = sidebarPos,
		.sidebarImg = createMenuImg(sidebarPos, g_objMenuSidebar, false, txtSize, 0),
		.focusPane = 0,
		.mergedPos = {0, 0},
		.mergedImg = createImage(1, 1, false),
		.txtSize = txtSize,
		.selSidebar = 0,
		.rowLen = rowLen,
		.colLen = colLen,
		.startRow = _objMenu.startRow,
		.posIncX = posIncX,
		.posIncY = posIncY,
		.fov = fov,
		.hiddenCells = [],
		.lastUpdateTime = time() // Tracking this lets us find a more accurate delta for visual updates vs. using deltaTime() 
	]
	
	_objMenu = drawObjMenuSel(_objMenu)
return _objMenu

/* Closes the object menu and restores the view states that it changed. */
function closeObjMenu(_objMenu)
	_objMenu = clearObjMenuGrid(_objMenu)
	removeObject(_objMenu.bg)
	
	if _objMenu.selVisible then
		removeGenericObj(_objMenu.sel)
	endif
	
	freeImage(_objMenu.sidebarImg)
	_objMenu = setObjMenuEnvironmentVisibility(_objMenu, true)
	_objMenu = [
		.isOpen = false,
		.bank = _objMenu.bank,
		.selPos = _objMenu.selPos,
		.startRow = _objMenu.startRow,
		.rowLen = _objMenu.rowLen
	]
	setFov(g_cam.fov)
return _objMenu

// The object menu is 3D; hides any objects that might occlude it.
function setObjMenuEnvironmentVisibility(_objMenu, _vis)
	set3dUiVisibility(_vis)
	
	if g_cur.mode == "rotate" then
		setRotObjVisibility(g_cur.rotator, _vis)
	else if g_cur.mode == "scale" then
		setScaleCubeObjVisibility(g_cur.scaler, _vis)
	endif endif
	
	if !_vis then
		_objMenu.hiddenCells = getAdj(g_cam.cell, g_cam.cellPos)
		setGrpLightsBrightness(g_cur.activeObj, 0)
		setWorldLightsBrightness(0, false)
		setEnvironment(g_bg.idx, {0.2, 0.2, 0.2}) // Neutral environment tint
	else
		restoreGrpLightsBrightness(g_cur.activeObj)
		restoreWorldLightsBrightness()
		setEnvironment(g_bg.idx, g_bg.col)
	endif
	
	var i
	var curCell
	var j
	
	for i = 0 to len(_objMenu.hiddenCells) loop
		curCell = _objMenu.hiddenCells[i]
		if curCell != -1 then
			if g_visibleCellOutlines then
				if _vis then
					initCellOutlines()
				else
					hideCellOutlines()
				endif
			endif
			
			for j = g_cellObjStart to len(g_cell[curCell]) loop
				var obj = getMapObjFromRef(g_cell[curCell][j])
				setGroupVisibility(obj, _vis, false)
				
				if _vis then
					restoreGrpLightsBrightness(obj)
				else
					setGrpLightsBrightness(obj, 0)
				endif
			repeat
		endif
	repeat
	
	var obj
	
	for i = 0 to len(g_lightIcons) loop
		obj = g_cell[g_lightIcons[i].cell][g_lightIcons[i].idx]
		setGrpLightsSprVisibility(obj, _vis, [])
	repeat
	
	for i = 0 to len(g_thrown) loop
		setGroupVisibility(g_thrown[i].obj, _vis, false)
	repeat
return _objMenu

/* Draws the wireframe selector box. */
function drawObjMenuSel(_objMenu)
	var obj = _objMenu.obj[_objMenu.selPos.x][_objMenu.selPos.y]
	var extPos = changeVecSpaceZFwd(getExtCenter(obj.scaledExt), 
		obj.fwd, obj.up, cross(obj.fwd, obj.up), {0, 0, 0})
		
	_objMenu.sel = createWireCubeObj(obj.pos - extPos, obj.scaledExt, 0.003, 
		g_theme.bgSelCol, 0, 1, 0.55)
	_objMenu.selFwd = obj.fwd
	setObjRot(_objMenu.sel.grp, obj.pos, _objMenu.selFwd, obj.up)
return _objMenu

/* Repositions selection box, including to sidebar. */
function moveObjMenuSel(_objMenu, _dir)
	var newPos = _objMenu.selPos + _dir
	var newIdx = getObjMenuIdxFromPos(_objMenu, newPos)
	var objBank
	decodeBank(objBank, _objMenu.obj[_objMenu.selPos.x][_objMenu.selPos.y].bankIdx)
	
	// If we're in the grid area
	loop if _dir == {1, 0} 
			and (newPos.x >= _objMenu.rowLen 
			or newIdx >= len(g_obj[objBank])) then
		_objMenu.focusPane = 1
		_objMenu.sidebar[_objMenu.selSidebar].sel = true
		removeGenericObj(_objMenu.sel)
		_objMenu.selVisible = false
		break endif
	if newPos.y >= 0 
			and newPos.y < _objMenu.colLen 
			and newPos.x >= 0 
			and newPos.x < _objMenu.rowLen 
			and newIdx < _objMenu.rowLen * ceil(len(g_obj[objBank]) / _objMenu.rowLen) then
		if newIdx >= len(g_obj[objBank]) then
			newPos.x = mod(len(g_obj[objBank]), _objMenu.rowLen) - 1
		endif
		
		removeGenericObj(_objMenu.sel)
		_objMenu.selPos = newPos
		_objMenu = drawObjMenuSel(_objMenu)
		break endif
	if abs(_dir.y) == 1 and _dir.x == 0 
			and (newPos.y >= _objMenu.colLen or newPos.y < 0)
			and newIdx < _objMenu.rowLen * ceil(len(g_obj[objBank]) / _objMenu.rowLen) 
			and newIdx >= 0 then
		_objMenu.startRow += _dir.y
		_objMenu = clearObjMenuGrid(_objMenu)
		_objMenu.obj = updateObjMenuGrid(_objMenu.startRow, _objMenu.rowLen, 
			_objMenu.colLen, _objMenu.posIncX, _objMenu.posIncY, 
			decodeBank(-1, _objMenu.obj[_objMenu.selPos.x][_objMenu.selPos.y].bankIdx), 
			_objMenu.fov)
		
		if newIdx >= len(g_obj[objBank]) then
			_objMenu.selPos.x = mod(len(g_obj[objBank]), _objMenu.rowLen) - 1
		endif
		
		removeGenericObj(_objMenu.sel)
		_objMenu = drawObjMenuSel(_objMenu)
		break
	endif break repeat
return _objMenu

/* Per-frame updater for object menu. */
function updateObjMenu(_objMenu)
	var c = controls(0)
	var kbResult = applyKb(c, g_bind.menu)
	c = kbResult.c
	
	var needClose = false
	
	// If in the objects pane
	if _objMenu.focusPane == 0 then
		if menuDirInputStarted(c, kbResult.kbActive) then
			loop if c.ly < -0.3 or c.down then
				_objMenu = moveObjMenuSel(_objMenu, {0, 1})
				break endif
			if c.ly > 0.3 or c.up then
				_objMenu = moveObjMenuSel(_objMenu, {0, -1})
				break endif
			if c.lx > 0.3 or c.right then
				_objMenu = moveObjMenuSel(_objMenu, {1, 0})
				break endif
			if c.lx < -0.3 or c.left then
				_objMenu = moveObjMenuSel(_objMenu, {-1, 0})
				break
			endif break repeat
		endif
		
		if c.a and !g_cDat[g_cIdx.a].held then
			g_cDat[g_cIdx.a].held = true
			var selObj = _objMenu.obj[_objMenu.selPos.x][_objMenu.selPos.y]
			
			// Open merged object menu
			if len(selObj.children) and _objMenu.bank > g_lightBank then
				_objMenu.mergedPos = selObj.scrPos
				_objMenu.mergedImg = createMenuImg(_objMenu.mergedPos,
					g_mergedObjMenu, true, _objMenu.txtSize, 1)
				_objMenu.focusPane = 2
			else
				replaceActiveObj(decodeBank(-1, selObj.bankIdx), decodeIdx(-1, selObj.bankIdx))
				needClose = true
			endif
		else if !c.a then
			g_cDat[g_cIdx.a].held = false
		endif endif
		
		if c.b and !g_cDat[g_cIdx.b].held then
			g_cDat[g_cIdx.b].held = true
		else if !c.b then
			g_cDat[g_cIdx.b].held = false
		endif endif
	endif
	
	// If in the sidebar pane
	if _objMenu.focusPane == 1 then
		/* Lock B button so that the sidebar can't be closed. */
		g_cDat[g_cIdx.b].held = true
		var refreshSidebar = false
		
		if c.lx < -0.3 or c.left then
			_objMenu.focusPane = 0
			_objMenu.selSidebar = getMenuSel(_objMenu.sidebar).idx
			_objMenu.sidebar[_objMenu.selSidebar].sel = false
			_objMenu = drawObjMenuSel(_objMenu)
			_objMenu.selVisible = true
			refreshSidebar = true
		// Have we just moved onto the menu?
		else if c.lx > 0.3 or c.right then
			refreshSidebar = true
		endif endif
		
		var updatedSidebar = updateMenu(_objMenu.sidebarPos, _objMenu.sidebar, 
			_objMenu.sidebarImg, false, _objMenu.txtSize, refreshSidebar, [], 0)
		_objMenu.sidebarImg = updatedSidebar.img
		_objMenu.sidebar = updatedSidebar.menu
		var actionResult = triggerObjMenuAction(_objMenu, updatedSidebar.action)
		_objMenu = actionResult.menu
		
		if actionResult.needClose then
			needClose = true
		endif
	endif
	
	if c.l and !g_cDat[g_cIdx.l].held and _objMenu.focusPane != 2 then
		g_cDat[g_cIdx.l].held = true
		_objMenu = triggerObjMenuAction(_objMenu, "prevbank").menu
	else if !c.l then
		g_cDat[g_cIdx.l].held = false
	endif endif
	
	if c.r and !g_cDat[g_cIdx.r].held and _objMenu.focusPane != 2 then
		g_cDat[g_cIdx.r].held = true
		_objMenu = triggerObjMenuAction(_objMenu, "nextbank").menu
	else if !c.r then
		g_cDat[g_cIdx.r].held = false
	endif endif
	
	_objMenu = spinObjMenu(_objMenu)
	
	// If in the merged object menu
	if imageSize(_objMenu.mergedImg) != {1, 1} then
		var updatedMerged = updateMenu(_objMenu.mergedPos, g_mergedObjMenu, 
			_objMenu.mergedImg, true, _objMenu.txtSize, false, [], 1)
		_objMenu.mergedImg = updatedMerged.img
		g_mergedObjMenu = updatedMerged.menu
		
		var actionResult = triggerObjMenuAction(_objMenu, updatedMerged.action)
		_objMenu = actionResult.menu
		drawImage(_objMenu.mergedImg, 0, 0)
		
		if actionResult.needClose then
			needClose = true
		endif
	else if _objMenu.focusPane == 2 then
		_objMenu.focusPane = 0
	endif endif
	
	drawImage(_objMenu.sidebarImg, 0, 0)
	drawScreenBorder()
	safeDrawTextEx(g_bankName[_objMenu.bank], {_objMenu.sidebarPos.x / 2, gheight() / 24}, g_menuTextSize, align_centre, gwidth(), 
		0, {1, 1}, g_theme.textCol)
		
	if needClose then
		_objMenu = closeObjMenu(_objMenu)
	endif
return _objMenu

/* Draws the name of an object definition. */
function drawObjMenuName(_name, _scrPosX, _scrPosY, _incX, _incY)
	safeDrawTextEx(_name, {_scrPosX, _scrPosY + _incY / 2}, g_menuTextSize, align_centre, _incX, 
		0, {1, 1}, g_theme.textCol)
return void

/* Spins the objects in the object menu. */
function spinObjMenu(_objMenu)
	var delta = time() - _objMenu.lastUpdateTime
	_objMenu.lastUpdateTime = time()
	
	var i
	var j
	
	for i = 0 to len(_objMenu.obj) loop
		for j = 0 to len(_objMenu.obj[i]) loop
			_objMenu.obj[i][j] = updateMenuObjTransform(_objMenu.obj[i][j], 
				_objMenu.obj[i][j].scaledExt, _objMenu.fov, delta)
			drawObjMenuName(_objMenu.obj[i][j].name, _objMenu.obj[i][j].scrPos.x, 
				_objMenu.obj[i][j].scrPos.y, _objMenu.posIncX, _objMenu.posIncY)
		repeat
	repeat
	
	if _objMenu.selVisible then
		var obj = _objMenu.obj[_objMenu.selPos.x][_objMenu.selPos.y]
		_objMenu.selFwd = axisRotVecBy(_objMenu.selFwd, 
			obj.up, -100 * delta)
		
		var extPos = changeVecSpaceZFwd(getExtCenter(obj.scaledExt), 
			_objMenu.selFwd, obj.up, cross(_objMenu.selFwd, obj.up), {0, 0, 0})
		setObjRot(_objMenu.sel.grp, obj.pos - extPos, _objMenu.selFwd, obj.up)
		setObjectPos(_objMenu.sel.grp, obj.pos - extPos)
		
		_objMenu.obj[_objMenu.selPos.x][_objMenu.selPos.y] = obj
	endif
return _objMenu

/* Performs menu rotation on an object. */
function updateMenuObjTransform(_obj, _scaledExt, _fov, _delta)
return updateMenuObjTransform(_obj, _scaledExt, _fov, _delta, false, -1)

function updateMenuObjTransform(_obj, _scaledExt, _fov, _delta, _applyObjParent, _objParent)
	_obj.fwd = axisRotVecBy(_obj.fwd, _obj.up, 100 * _delta)
	var extPos = changeVecSpaceZFwd(getExtCenter(_scaledExt), 
		_obj.fwd, _obj.up, cross(_obj.fwd, _obj.up), {0, 0, 0})
	setObjectPos(_obj.obj, _obj.pos - extPos)
	setObjRot(_obj.obj, _obj.pos - extPos, _obj.fwd, _obj.up)
	var lightContainer = _obj
	lightContainer.pos = _obj.pos - extPos
	
	if _applyObjParent then
		lightContainer = applyGrpTransform(lightContainer, _objParent, false, true)
	endif
	
	setGrpLightsPos(lightContainer, _fov)
	updateGrpLightsSprScale3d(lightContainer, g_cam, lightContainer.scale)
return _obj

	// ----------------------------------------------------------------
	// DYNAMIC MENUS

/* Creates submenu for theme selection. */
function addThemesToMenu(_curThemeName)
	var themeDef = getThemeDefs()
	array themeMenu[len(themeDef)]
	
	var i
	for i = 0 to len(themeDef) loop
		themeMenu[i] = [
			.text = themeDef[i].name,
			.action = "theme" + themeDef[i].name,
			.selAction = "",
			.active = true,
			.sel = false,
			.clicked = false,
			.submenu = -1
		]
		
		if themeDef[i].name == _curThemeName then
			themeMenu[i].text = "* " + themeMenu[i].text
		endif
	repeat
return themeMenu

/* Creates submenu for backgrounds. */
function addBackgroundsToMenu(_curBgIdx)
	var bgs = [
		"Hills",
		"Dunes",
		"Clouds",
		"Cliffs - Day",
		"Cliffs - Sunset",
		"Cliffs - Night",
		"None"
	]
	array bgMenu[len(bgs)]
	
	var i
	for i = 0 to len(bgs) loop
		bgMenu[i] = [
			.text = bgs[i],
			.action = "background" + i,
			.selAction = "",
			.active = true,
			.sel = false,
			.clicked = false,
			.submenu = -1
		]
	repeat
	
	bgMenu[_curBgIdx].text = "* " + bgMenu[_curBgIdx].text
	
	var bgParent = [
		[
			.text = "Image",
			.action = "",
			.selAction = "",
			.active = true,
			.sel = false,
			.clicked = false,
			.submenu = bgMenu
		],
		[
			.text = "Tint " + vec3ToStr(g_bg.col, 2) + " ...",
			.action = "backgroundtint",
			.selAction = "",
			.active = true,
			.sel = false,
			.clicked = false,
			.submenu = -1
		]
	]
return bgParent

/* Changes brush menu to reflect current brush. */
function updateBrushMenu(_menu)
	var types = getGrpLightsTypes(g_cur.activeObj)
	var idx = findMenuEntry(_menu, "Brush properties")
	var inactiveSubIdx = []
	var objColStr = getObjCol(g_cur.activeObj).colStr
	var selChain = getMenuSel(_menu).idxChain
	
	_menu[idx].active = true
	if objColStr != "" then
		_menu[idx].submenu[0].text = 
			"Object color " + objColStr + " ..."
		_menu[idx].submenu[0].active = true
		
		var metalStr = getObjMatStr(g_cur.activeObj, 0)
		
		if metalStr != "Multiple" then
			metalStr = getBoolStr(g_cur.activeObj.mat[0])
		endif
		
		_menu[idx].submenu[1].text = 
			"Metallic (" + metalStr + ")"
		_menu[idx].submenu[1].active = true
		_menu[idx].submenu[2].text = 
			"Roughness (" + getObjMatStr(g_cur.activeObj, 1) + ")"
		_menu[idx].submenu[2].active = true
		_menu[idx].submenu[3].text = 
			"Emissiveness (" + getObjMatStr(g_cur.activeObj, 2) + ")"
		_menu[idx].submenu[3].active = true
	else
		_menu[idx].submenu[0].text = 
			"Object color"
		_menu[idx].submenu[0].active = false
		_menu[idx].submenu[1].text = 
			"Metallic"
		_menu[idx].submenu[1].active = false
		_menu[idx].submenu[2].text = 
			"Roughness"
		_menu[idx].submenu[2].active = false
		_menu[idx].submenu[3].text = 
			"Emissiveness"
		_menu[idx].submenu[3].active = false
		inactiveSubIdx = insertArray(inactiveSubIdx, [ 0, 1, 2, 3 ])
	endif
	
	if len(types) then
		_menu[idx].submenu[4].text = 
			"Brightness (" + getObjBrightnessStr(g_cur.activeObj) + ")"
		_menu[idx].submenu[4].active = true
		_menu[idx].submenu[5].text = 
			"Light color " + getObjLightCol(g_cur.activeObj).colStr + " ..."
		_menu[idx].submenu[5].active = true
	else
		_menu[idx].submenu[4].text = 
			"Brightness"
		_menu[idx].submenu[4].active = false
		_menu[idx].submenu[5].text = 
			"Light color"
		_menu[idx].submenu[5].active = false
		inactiveSubIdx = insertArray(inactiveSubIdx, [ 4, 5 ])
	endif
		
	if contains(types, "spot") then
		_menu[idx].submenu[6].text = 
			"Spread (" + getObjSpreadStr(g_cur.activeObj) + ")"
		_menu[idx].submenu[6].active = true
	else
		_menu[idx].submenu[6].text = 
			"Spread"
		_menu[idx].submenu[6].active = false
		inactiveSubIdx = push(inactiveSubIdx, 6)
	endif
	
	if contains(types, "pointshadow") or contains(types, "worldshadow") then
		_menu[idx].submenu[7].text = 
			"Resolution (" + getObjResStr(g_cur.activeObj) + ")"
		_menu[idx].submenu[7].active = true
	else
		_menu[idx].submenu[7].text = 
			"Resolution"
		_menu[idx].submenu[7].active = false
		inactiveSubIdx = push(inactiveSubIdx, 7)
	endif
	
	if contains(types, "worldshadow") then
		_menu[idx].submenu[8].text = 
			"Range (" + getObjRangeStr(g_cur.activeObj) + ")"
		_menu[idx].submenu[8].active = true
	else
		_menu[idx].submenu[8].text = 
			"Range"
		_menu[idx].submenu[8].active = false
		inactiveSubIdx = push(inactiveSubIdx, 8)
	endif
	
	// If we have a cached positition in the brush menu, clear it
	if len(selChain) == 3 then
		var i
		for i = 0 to len(inactiveSubIdx) loop
			if selChain[0] == idx and selChain[1] == inactiveSubIdx[i] then
				_menu = unselectSelChain(_menu, selChain)
				_menu = setSelMenuChain(_menu, [ selChain[0], selChain[1] ])
				
				break
			endif
		repeat
	endif
return _menu

/* Changes resoluion options depending on whether the Switch is docked. */
function updateResolutionMenu(_menu)
	var idxParent = findMenuEntry(_menu, "Advanced")
	var idx = findMenuEntry(_menu[idxParent].submenu, "Screen resolution")
	
	_menu[idxParent].submenu[idx].submenu[0].active = docked()
	_menu[idxParent].submenu[idx].submenu[0].action = ifElse(docked(), "res1080p", "")
return _menu

/* Creates a complicated dynamic menu. */
function createDynMenu(_names, _actions, _selActions, _clickeds, 
	_submenus, _selIdx, _bulletList)
	array dynMenu[len(_names)]
	
	if len(_names) then
		if len(_selIdx) > 0 then
			_selidx = _selIdx[len(_selIdx) - 1]
		endif
		
		_selIdx = clamp(_selIdx, -1, len(_names) - 1)
		
		var i
		for i = 0 to len(_names) loop
			dynMenu[i] = [
				.text = _names[i],
				.action = _actions[i],
				.selAction = _selActions[i],
				.active = true,
				.sel = i == _selIdx,
				.clicked = _clickeds[i],
				.submenu = _submenus[i]
			]
			
			if len(_bulletList) then
				dynMenu[i].text = _bulletList[i] + dynMenu[i].text
			endif
		repeat
	else
		dynMenu = -1
	endif
return dynMenu

/* Creates an object list for use in a dynamic menu's submenu. */
function createDynMenuObjList(_objList, _action, _selAction)
	array names[len(_objList)]
	array actions[len(_objList)]
	array selActions[len(_objList)]
	array submenus[len(_objList)]
	array clickeds[len(_objList)]
	
	var i
	for i = 0 to len(_objList) loop
		names[i] = _objList[i]
		actions[i] = _action[i]
		selActions[i] = _selAction[i]
		submenus[i] = -1
		clickeds[i] = false
	repeat
	
	var result = [
		.names = names,
		.actions = actions,
		.selActions = selActions,
		.submenus = submenus,
		.clickeds = clickeds
	]
return result

/* Creates the cursor menu using createDynamicMenu(). */
function createCurMenu(_midCell, _pos, _idxChainSel)
	var type = getType(_idxChainSel)
	if type != "array" then
		_idxChainSel = [_idxChainSel]
	endif
	
	var curMenu = -1
	var objRefList = g_cur.lastColContext.collision
	var objList = getObjListFromCellIdxList(objRefList, true)
	array bulletList[len(objList)]
	
	if len(objList) > 0 then
		var curMenuSelIdx = -1
		var curMenuClickeds = [false, false]
		var submenuSelIdx = [-1, -1]
		
		if len(_idxChainSel) == 1 then
			curMenuSelIdx = _idxChainSel[0]
		else if len(_idxChainSel) == 2 then
			curMenuSelIdx = _idxChainSel[0]
			curMenuClickeds[_idxChainSel[0]] = true
			submenuSelIdx[_idxChainSel[0]] = _idxChainSel[1]
		endif endif
		
		array sActions[len(objList)]
		array dActions[len(objList)]
		array selActions[len(objList)]
		
		var i
		for i = 0 to len(objList) loop
			sActions[i] = "objaddselection" + i
			dActions[i] = "objdelete" + i
			selActions[i] = "objhighlight" + i
			objList[i] = getMapObjName(-1, objList[i])
			
			if getSelIdx(objRefList[i].cell, objRefList[i].idx) != -1 then
				bulletList[i] = "* "
			else
				bulletlist[i] = ""
			endif
		repeat
		
		var selList = createDynMenuObjList(objList, sActions, selActions)
		var delList = createDynMenuObjList(objList, dActions, selActions)
		var selMenu = createDynMenu(selList.names, selList.actions, selList.selActions, 
			selList.clickeds, selList.submenus, submenuSelIdx[0], bulletList)
		var delMenu = createDynMenu(delList.names, delList.actions, delList.selActions, 
			delList.clickeds, delList.submenus, submenuSelIdx[1], [])
			
		curMenu = createDynMenu(
			["Toggle selection", "Delete"],
			["", ""],
			["", ""],
			curMenuClickeds,
			[selMenu, delMenu],
			curMenuSelIdx,
			[]
		)
	endif
return curMenu

/* Creates the selection menu using createDynamicMenu(). */
function createSelMenu(_idxChainSel)
	var type = getType(_idxChainSel)
	
	if type != "array" then
		_idxChainSel = [_idxChainSel]
	endif
	
	var offset = g_lightBank + 1 // Ensure that merged objects can't be saved in system banks
	var menu = -1
	
	var objList = getObjFromSel()
	
	if len(objList) > 0 then
		var menuSelIdx = -1
		var menuClickeds = [false, false, false, false, false, false]
		var submenuSelIdx = [-1, -1, -1, -1, -1, -1]
		
		if len(_idxChainSel) == 1 then
			menuSelIdx = _idxChainSel[0]
		else if len(_idxChainSel) == 2 then
			menuSelIdx = _idxChainSel[0]
			menuClickeds[_idxChainSel[0]] = true
			submenuSelIdx[_idxChainSel[0]] = _idxChainSel[1]
		endif endif
		
		array actions[len(objList)]
		array selActions[len(objList)]
		
		var i
		for i = 0 to len(objList) loop
			actions[i] = "selremove" + i
			selActions[i] = "selhighlight" + i
			objList[i] = getMapObjName(-1, objList[i])
		repeat
		
		array mergeActions[len(g_obj) - 1]
		array mergeSelActions[len(g_obj) - 1]
		array bank[len(g_obj) - offset + 1][1] // Add 1 because we need space for "New bank ..."
		
		for i = 0 to len(g_obj) - offset + 1 loop
			if i == len(g_obj) - offset then // Last iteration
				mergeActions[i] = "selmergenew"
				bank[i] = "New bank ..."
			else
				mergeActions[i] = "selmerge" + (i + offset)
				bank[i] = g_bankName[i + offset]
			endif
			
			mergeSelActions[i] = ""
		repeat
		
		var selList = createDynMenuObjList(objList, actions, selActions)
		var selMenu = createDynMenu(selList.names, selList.actions, selList.selActions, 
			selList.clickeds, selList.submenus, submenuSelIdx[0], [])
		var bankList = createDynMenuObjList(bank, mergeActions, mergeSelActions)
		var bankMenu = createDynMenu(bankList.names, bankList.actions, bankList.selActions, 
			bankList.clickeds, bankList.submenus, submenuSelIdx[4], [])
			
		var objCountStr = ifElse(len(objList) > 1, "first object", "object")
		var copyList = createDynMenu(
			[ "Copy from " + objCountStr + " origin", "Copy from cursor origin" ], 
			[ "selcopyfromobj", "selcopyfromcur" ], [ "", "" ], [ false, false ], 
			[ -1, -1 ], submenuSelIdx[2], [])
		var cutList = createDynMenu(
			[ "Cut from " + objCountStr + " origin", "Cut from cursor origin" ], 
			[ "selcutfromobj", "selcutfromcur" ], [ "", "" ], [ false, false ], 
			[ -1, -1 ], submenuSelIdx[3], [])
			
		menu = createDynMenu(
			["Remove from selection", "Clear selection", "Copy", "Cut", "Save in bank as merged object", "Delete"],
			["", "selclear", "selcopy", "selcut", "", "seldelete"],
			["", "", "", "", "", ""],
			menuClickeds,
			[selMenu, -1, copyList, cutList, bankMenu, -1],
			menuSelIdx, []
		)
	endif
return menu

/* Adds a dynamic submenu to a parent menu. */
function insertDynMenu(_dynMenu, _parentMenu, _idxChainMenu)
	/* If a submenu entry begins selected, the index is stored in the
	.submenu field. */
	var chain 
	var exists
	
	if menuExists(_dynMenu) then
		chain = _dynMenu
		exists = true
	else
		chain = -1
		exists = false
	endif
	
	var menuSel = getMenuSel(_dynMenu)
	var menuChain = _parentMenu
	
	var i
	var j
	
	if len(_idxChainMenu) > 0 then
		for i = len(_idxChainMenu) to 0.9 step -1 loop
			for j = 0 to i loop
				if menuSel.idx != -1 and exists then
					menuChain[_idxChainMenu[j]].clicked = true
					menuChain[_idxChainMenu[j]].sel = true
				endif
				
				if j == i - 1 then
					menuChain[_idxChainMenu[j]].submenu = chain
					
					if exists then
						menuChain[_idxChainMenu[j]].active = true
					endif
					
					chain = menuChain
				else
					menuChain = menuChain[_idxChainMenu[j]].submenu
				endif
			repeat
		repeat
	endif
return menuChain

/* Removes a dynamic submenu from a parent menu. */
function removeDynMenu(_menu, _idxChainMenu, _idxChainSel)
	/* If a menu item is selected, store that index in the parent
	menu's submenu field after we delete the menu. */
	var i
	var j
	
	if len(_idxChainSel) > len(_idxChainMenu) then
		var matches = true
		
		for i = 0 to len(_idxChainMenu) loop
			if _idxChainMenu[i] != _idxChainSel[i] then
				matches = false
				break
			endif
		repeat
		
		if matches then
			array newSelChain[len(_idxChainSel) - len(_idxChainMenu)]
			
			for i = 0 to len(newSelChain) loop
				newSelChain[i] = _idxChainSel[i + len(_idxChainMenu)]
			repeat
			
			_idxChainSel = newSelChain
		else
			_idxChainSel = -1
		endif
	else
		_idxChainSel = -1
	endif
	
	var menuChain = _menu
	var chain
	
	if len(_idxChainSel) > 0 then
		chain = _idxChainSel
	else
		chain = -1
	endif
	
	for i = len(_idxChainMenu) to 0.9 step -1 loop
		for j = 0 to i loop
			if j == i - 1 then
				menuChain[_idxChainMenu[j]].submenu = chain
				
				if i == len(_idxChainMenu) then
					menuChain[_idxChainMenu[j]].active = false
					menuChain[_idxChainMenu[j]].clicked = false
				endif
				
				chain = menuChain
			else
				menuChain = menuChain[_idxChainMenu[j]].submenu
			endif
		repeat
	repeat
return menuChain

/* Removes current cursor menu, then rebuilds and reinserts it. */
function rebuildCurMenu(_menu, _idxChainSel, _idx)
	_menu = removeDynMenu(_menu, [_idx], _idxChainSel)
	var curMenu = createCurMenu(g_cur.cell, g_cur.pos,
		 _menu[_idx].submenu)
	_menu = insertDynMenu(curMenu, _menu, [_idx])
return _menu

/* Removes current selection menu, then rebuilds and reinserts it. */
function rebuildSelMenu(_menu, _idxChainSel, _idx)
	_menu = removeDynMenu(_menu, [_idx], _idxChainSel)
	var selMenu = createSelMenu(_menu[_idx].submenu)
	_menu = insertDynMenu(selMenu, _menu, [_idx])
return _menu

// ----------------------------------------------------------------
// INPUT

	// ----------------------------------------------------------------
	// MAIN INPUT HANDLERS

/* Open, close, and update menus. */
function handleMenus()
	if !g_objMenu.isOpen then
		g_menuResult = openMenu({0, 0}, g_menu, g_menuImg, g_menuTextSize)
		g_menuImg = g_menuResult.menuImg
		g_menu = g_menuResult.menu
	endif
	
	loop if g_objMenu.isOpen then
		if imageSize(g_menuImg) != {1, 1} then
			g_closeResult = closeMenu(g_menu, g_menuImg, g_needWritePrefs, [[1], [2]])
			g_menu = g_closeResult.menu
			g_menuImg = g_closeResult.menuImg
		endif
		g_objMenu = updateObjMenu(g_objMenu)
		break endif
	if imageSize(g_menuImg) == {1, 1} and !g_photoMode then
		drawStatusBar()
		break endif
	if imageSize(g_menuImg) != {1, 1} then
		if !g_photoMode then
			drawStatusBar()
		endif
		
		g_updatedMenu = updateMenu({0, 0}, g_menu, g_menuImg, true, 
			g_menuTextSize, false, [[1], [2]], 1)
		g_menuImg = g_updatedMenu.img
		g_menu = g_updatedMenu.menu
		drawImage(g_menuImg, 0, 0)
		break
	endif break repeat
	
	if !g_photoMode then
		g_objMenu = openObjMenu(g_objMenu)
	endif
return void

/* Main input handler function. */
function handleInput()
	loop if !g_objMenu.isOpen and imageSize(g_menuImg) == {1, 1} and !g_photoMode then
		g_c = controls(0)
		
		placeActive(g_c)
		updateCam(g_c)
		moveCur(g_c)
		rotateCur(g_c)
		scaleCur(g_c)
		startMassSel(g_c)
		advanceCurMode(g_c)
		break endif
	if imageSize(g_menuImg) == {1, 1} and g_photoMode then
		g_c = controls(0)
		
		updateCam(g_c)
		
		g_c = applyKb(g_c, g_bind.edit).c
		
		if g_c.a and !g_cDat[g_cIdx.a].held then
			startThrow(g_cam.pos, g_cam.fwd, g_cam.up)
			g_cDat[g_cIdx.a].held = true
		else if !g_c.a then
			g_cDat[g_cIdx.a].held = false
		endif endif
		
		break
	endif break repeat
return void

	// ----------------------------------------------------------------
	// INPUT STATE

/* Checks whether a directional input should cause scrolling and, if so,
updates g_cDat with the input info and returns true. */
function scrollInputStarted(_c)
	var started = (g_cDat[g_cIdx.lxy].count <= 1 and time() - g_cDat[g_cIdx.lxy].lastTime >= g_rateInit
		or g_cDat[g_cIdx.lxy].count > 1 and time() - g_cDat[g_cIdx.lxy].lastTime >= g_rateRep)
		and ((abs(_c.lx) > 0.3 or abs(_c.ly) > 0.3) or (abs(_c.rx) > 0.3 or abs(_c.ry) > 0.3)
		or (_c.up or _c.down))
	
	if started then
		updateLxyStarted()
	else if abs(_c.lx) <= 0.3 and abs(_c.ly) <= 0.3 and abs(_c.rx) <= 0.3 and abs(_c.ry) <= 0.3 
			and !_c.up and !_c.down then
		updateLxyStopped()
	endif endif
return started

/* Checks whether a directional input should cause menu navigation and, if so,
updates g_cDat with the input info and returns true. */
function menuDirInputStarted(_c, _kbActive)
	var started = (_kbActive // _kbActive bypasses the repeat rate in order to use the keyboard's built-in repeat rate.
		or (g_cDat[g_cIdx.lxy].count <= 1 and time() - g_cDat[g_cIdx.lxy].lastTime >= g_rateInit)
		or (g_cDat[g_cIdx.lxy].count > 1 and time() - g_cDat[g_cIdx.lxy].lastTime >= g_rateRep))
		and (abs(_c.lx) > 0.3 or abs(_c.ly) > 0.3 or _c.up or _c.down or _c.left or _c.right)
	
	if started then
		updateLxyStarted()
	else if abs(_c.lx) <= 0.3 and abs(_c.ly) <= 0.3 and !_c.up 
			and !_c.down and !_c.left and !_c.right then
		updateLxyStopped()
	endif endif
return started

/* Checks whether a left stick input has occurred and, if so, updates g_cDat 
with the input info and returns true. */
function leftStickInputStarted(_c, _kbActive)
	var started = (_kbActive // _kbActive bypasses the repeat rate in order to use the keyboard's built-in repeat rate.
		or (g_cDat[g_cIdx.lxy].count <= 1 and time() - g_cDat[g_cIdx.lxy].lastTime >= g_rateInit)
		or (g_cDat[g_cIdx.lxy].count > 1 and time() - g_cDat[g_cIdx.lxy].lastTime >= g_rateRep))
		and (abs(_c.lx) > 0.3 or abs(_c.ly) > 0.3)
	
	if started then
		updateLxyStarted()
	else if abs(_c.lx) <= 0.3 and abs(_c.ly) <= 0.3 then
		updateLxyStopped()
	endif endif
return started

/* Updates g_cDat for left stick input starting. */
function updateLxyStarted()
	g_cDat[g_cIdx.lxy].lastTime = time()
	g_cDat[g_cIdx.lxy].held = true
	g_cDat[g_cIdx.lxy].count += 1
return void

/* Updates g_cDat for left stick input stopping. */
function updateLxyStopped()
	g_cDat[g_cIdx.lxy].held = false
	g_cDat[g_cIdx.lxy].count = 0
return void

	// ----------------------------------------------------------------
	// KEYBOARD PARSING

/* FUZE and/or Switch don't read key-off events from a keyboard. This 
function allows us to simulate a key being held until the next repeat
occurs. Used to create smooth camera movement wih the keyboard. */
function applyKbHold(_keyDat, _newPress)
	if _newPress then
		_keyDat.lastTime = time()
		_keyDat.kbHeld = true
		
		if _keyDat.kbHeld then
			_keyDat.count += 1
		else
			_keyDat.count = 0
		endif
	/* Don't account for initial repeat rate, because 0.5 sec of motion on
	a short tap doesn't feel good to use. */
	else if time() - _keyDat.lastTime >= g_kbRateRep then
		_keyDat.kbHeld = false
		_keyDat.count = 0
	endif endif
return _keyDat

/* Simulates a controller button press. */
function setController(_c, _cIdx, _val)
	var continue = true
	while continue loop
		if _cIdx == 0 then
			_c.a = _val
			
			break
		endif
		
		if _cIdx == 1 then
			_c.b = _val
			
			break
		endif
		
		if _cIdx == 2 then
			_c.x = _val
			
			break
		endif
		
		if _cIdx == 3 then
			_c.y = _val
			
			break
		endif
		
		if _cIdx == 4 then
			_c.l = _val
			
			break
		endif
		
		if _cIdx == 5 then
			_c.r = _val
			
			break
		endif
		
		if _cIdx == 6 then
			_c.zl = _val
			
			break
		endif
		
		if _cIdx == 7 then
			_c.zr = _val
			
			break
		endif
		
		if _cIdx == 8 then
			_c.up = _val
			
			break
		endif
		
		if _cIdx == 9 then
			_c.down = _val
			
			break
		endif
		
		if _cIdx == 10 then
			_c.left = _val
			
			break
		endif
		
		if _cIdx == 11 then
			_c.right = _val
			
			break
		endif
		
		if _cIdx == 12 then
			_c.lx = _val
			
			break
		endif
		
		if _cIdx == 13 then
			_c.lx = _val * -1
			
			break
		endif
		
		if _cIdx == 14 then
			_c.ly = _val
			
			break
		endif
		
		if _cIdx == 15 then
			_c.ly = _val * -1
			
			break
		endif
		
		if _cIdx == 16 then
			_c.rx = _val
			
			break
		endif
		
		if _cIdx == 17 then
			_c.rx = _val * -1
			
			break
		endif
		
		if _cIdx == 18 then
			_c.ry = _val
			
			break
		endif
		
		if _cIdx == 19 then
			_c.ry = _val * -1
			
			break
		endif

		
		continue = false
	repeat
return _c

/* Simulates a pressed and held controller button. */
function setControllerHold(_c, _cIdx, _hold)
	_c = setController(_c, _cIdx, 1)
	
	if _hold then
		g_cDat[_cIdx] = applyKbHold(g_cDat[_cIdx], true)
	endif
return _c

/* Either retriggers or ends a simulated button hold. */
function releaseControllerHold(_c, _cIdx)
	if g_cDat[_cIdx].kbHeld then
		g_cDat[_cIdx] = applyKbHold(g_cDat[_cIdx], false)
		
		if g_cDat[_cIdx].kbHeld then
			_c = setController(_c, _cIdx, 1)
		endif
	endif
return _c

/* Applies a set of keyboard bindings to a controller. */
function applyKb(_c, _kbBind)
	var kbLen = len(g_kb)
	var parsedCount = 0
	var checkRelease
	var j
	var i
	
	for i = 0 to len(_kbBind) loop
		checkRelease = _kbBind[i][2]
		
		if parsedCount < kbLen then
			if strFind(g_kb, _kbBind[i][0]) != -1 then
				for j = 0 to len(_kbBind[i][1]) loop
					_c = setControllerHold(_c, _kbBind[i][1][j], _kbBind[i][2])
				repeat
				
				parsedCount += 1
				checkRelease = false
			endif
		endif
		
		if checkRelease then
			for j = 0 to len(_kbBind[i][1]) loop
				_c = releaseControllerHold(_c, _kbBind[i][1][j])
			repeat
		endif
	repeat
	
	var result = [
		.c = _c,
		.kbActive = clamp(parsedCount, 0, 1)
	]
return result

// ----------------------------------------------------------------
// COLLISIONS

/* Returns the normal direction of a surface. */
// CORE LOADER
function getNormal(ref _in, _obj, _cell, _colCon, _range, _castPos, _planeOrig, _castFwd, _castUp, _gridBitAdj)
	var castCount = 3
	_castFwd = safeNormalize(_castFwd)
	_castUp = safeNormalize(_castUp)
	var validResult = false
	var scores = []
	var hiScoreIdx = 0
	
	var r = safeCross(_castFwd, _castUp)
	var offset = [
		_castUp * _range,
		r * _range,
		r * -_range + _castUp * -_range
	]
	
	var hits = []
	var norms = []
	var i
	for i = 0 to castCount loop
		var newHit
		raycastGrp(newHit, _obj, _cell, _castPos + offset[i], _castFwd, 
			_colCon.gridBit[_gridBitAdj], false, float_max)
		
		if newHit.hit < float_max then
			hits = push(hits, _castPos + offset[i] + _castFwd * newHit.hit)
		endif
	repeat
	
	if len(hits) > 1 then // Need at least two hits + _planeOrigin to find a plane
		array newNorms[len(hits)] 
		norms = newNorms
		
		for i = 0 to len(hits) loop
			 norms[i] = safeCross(hits[(i + 1) % len(hits)] - _planeOrig, hits[i] - _planeOrig)
			
			if norms[i] == {0, 0, 0} then
				norms[i] = {0, 1, 0}
			endif
		repeat
		
		for i = 0 to len(norms) loop
			if !len(scores) then
				scores = push(scores, [ .pos = norms[i], .score = 1 ])
			else
				var j
				for j = 0 to len(scores) loop
					if equals(norms[i], scores[j].pos, 0.001) then
						scores[j].score += 1
						
						break
					else
						scores = push(scores, [ .pos = norms[i], .score = 1 ])
					endif
				repeat
			endif
		repeat
		
		if len(scores) then
			for i = 1 to len(scores) loop
				if scores[i].score > scores[hiScoreIdx].score then
					hiScoreIdx = i
				endif
			repeat
			
			validResult = true
		endif
	endif
	
	if validResult then
		_in = scores[hiScoreIdx].pos
	else
		_in = {0, 0, 0}
	endif
return _in

/* Call this when an object is first created to initialize its collision
context. 

_grav = {0, -1, 0} approximates normal Earth gravity.
Mass value is clamped between 1 and 100. */
// CORE LOADER
function initColContext(_colCon, _obj, _comPos, _fwd, _up, _scale, _mode, _mass)
return initColContext(_colCon, _obj, _comPos, _fwd, _up, _scale, _mode, _mass, {0, -1, 0}, 0.001, true, true, true)

function initColContext(_colCon, _obj, _comPos, _fwd, _up, _scale, _mode, _mass, _grav, _extRes, _initAuxColllider, _initExt, _initGridBit)
	if _initExt then
		_colCon.ext = getObjExtent(_obj, _comPos, _scale, _fwd, _up, _extRes)
	endif
	
	if _initGridBit then
		_colCon.gridBit = getExtCollisionBitsFast(
			floorVec(_comPos) + 0.5,
			_colCon.ext, 
			_scale, 
			_fwd, 
			_up
		)
	endif
	
	_colCon.cell = -1
	_colCon.cellPos = {float_max, float_max, float_max}
	_colCon.comPos = _comPos
	_colCon.colPos = {float_max, float_max, float_max}
	_colCon.scale = _scale
	_colCon.colScale = {float_max, float_max, float_max}
	_colCon.fwd = _fwd
	_colCon.colFwd = {float_max, float_max, float_max}
	_colCon.up = _up
	_colCon.colUp = {float_max, float_max, float_max}
	_colCon.mass = clamp(_mass, 1, 100)
	_colCon.centerOfMass = getExtCenter(_colCon.ext) * _scale
	_colCon.grav = _grav
	_colCon.vel = {0, 0, 0}
	_colCon.rotVel = 0
	_colCon.rotVelAxis = {1, 0, 0}
	_colCon.objList = []
	_colCon.collision = []
	_colCon.normal = []
	_colCon.normAxis = "up"
	_colCon.colThisFrame = false
	_colCon.deflectThisFrame = false
	_colCon.allCollisions = true
	_colCon.collisionMode = _mode
	_colCon.colDat = []
	
	var orig = getOriginFromCom(_comPos, _colCon.centerOfMass, _fwd, _up, _scale)
	setObjectPos(_obj, orig)
	
	if _initAuxColllider then
		_colCon.auxCollider = placeObject(cube, orig, {0.5, 0.5, 0.5})
		setObjectVisibility(_colCon.auxCollider, false)
		
		colContext auxCon
		_colCon.auxColCon = initColContext(auxCon, _colCon.auxCollider, orig, _fwd, _up, _scale, 1, 0, 0, 0.001, false, true, true)
	endif
return _colCon

function getOriginFromCom(_comPos, _centerOfMass, _fwd, _up, _scale)
return _comPos - changeVecSpaceZFwd(_centerOfMass * _scale, _fwd, _up, safeCross(_fwd, _up), {0, 0, 0})

/* This is the main collision check function. When given an object and a new position, it calculates whether 
placing the object in that position causes a collision and positions the object to account for that collision.

_obj (object reference): The object whose position, rotation, or scale has changed.
_colCon (colContext): The object's collision context, which stores data about the object's position and collisions.
_pos (vector): The new position of _obj.
_fwd (vector): _obj's new foward vector.
_up (vector): _obj's new up vector.
_scale (vector): _obj's new scale.
_collisionMode (int): Algorithm for collision checks (1: bounding box; 2: simple raycast; 3: cuboid raycast; 
	4: spheroid raycast).
_forceUpdate (bool): Whether to check collisions even if the cached data says not to.
_getAllCollisions (bool): Whether to consider all current collisions instead of only the first one found.
_handleTransformChange (bool): Whether the function should apply the transform changes given as arguments (strongly 
	recommended to be true; if false, some parts of the collision context will need to be updated manually).
_getNormal (bool): Whether to redirect _obj based on the obstacle's shape rather than simply stopping _obj in place.
_frict (float): Velocity factor for _obj's redirected motion. (1: velocity transfers proportionally; >1: velocity 
	increases; <1 but >0: velocity reduces; 0: no velocity -- same as setting _getNormal to false; <0: velocity inverts).
_normRecurLimit (int): Number of times _obj's motion can be redirected in a single call. (1: _obj can only redirect off 
	of one surface at a time and additional surfaces will block the motion; >1: _obj can redirect off of multiple surfaces 
	at a time).
*/
// CORE LOADER
function updateObjCollisions(_obj, ref _colCon, _comPos)
return updateObjCollisions(_obj, _colCon, _comPos, _colCon.fwd, _colCon.up, _colCon.scale, _colCon.collisionMode, false, false, true, false, 0, false)

function updateObjCollisions(_obj, ref _colCon, _comPos, _fwd)
return updateObjCollisions(_obj, _colCon, _comPos, _fwd, _colCon.up, _colCon.scale, _colCon.collisionMode, false, false, true, false, 0, false)

function updateObjCollisions(_obj, ref _colCon, _comPos, _fwd, _up)
return updateObjCollisions(_obj, _colCon, _comPos, _fwd, _up, _colCon.scale, _colCon.collisionMode, false, false, true, false, 0, false)

function updateObjCollisions(_obj, ref _colCon, _comPos, _fwd, _up, _scale)
return updateObjCollisions(_obj, _colCon, _comPos, _fwd, _up, _scale, _colCon.collisionMode, false, false, true, false, 0, false)

function updateObjCollisions(_obj, ref _colCon, _comPos, _fwd, _up, _scale, _collisionMode)
return updateObjCollisions(_obj, _colCon, _comPos, _fwd, _up, _scale, _collisionMode, false, false, true, false, 0, false)

function updateObjCollisions(_obj, ref _colCon, _comPos, _fwd, _up, _scale, _collisionMode, _forceUpdate)
return updateObjCollisions(_obj, _colCon, _comPos, _fwd, _up, _scale, _collisionMode, _forceUpdate, false, true, false, 0, false)

function updateObjCollisions(_obj, ref _colCon, _comPos, _fwd, _up, _scale, _collisionMode, _forceUpdate, _getAllCollisions, _handleTransformChange, _getNormal, _normRecurLimit, _useGrav)
	var prevComPos = _colCon.comPos
	var prevScale = _colCon.scale
	var prevFwd = _colCon.fwd
	var prevUp = _colCon.up
	var prevCell = _colCon.cell
	var prevCellPos = _colCon.cellPos
	var eqRes = 0.017
	var checkCol = true
	
	if _useGrav and _normRecurLimit > 0 then
		_comPos = _comPos + _colCon.grav * deltaTime()
	endif
	
	if _normRecurLimit > 0 then
		_colCon.vel = _comPos - prevComPos
	endif
	
	var prevOrig = getOriginFromCom(prevComPos, _colCon.centerOfMass, prevFwd, prevUp, prevScale)
	var orig = getOriginFromCom(_comPos, _colCon.centerOfMass, _fwd, _up, _scale)
	
	// Short-circuit collision check if nothing has changed from the previous collision
	if _normRecurLimit > 0
			and length(_colCon.vel) <= eqRes and (_colCon.colThisFrame or _colCon.deflectThisFrame)
			and _collisionMode >= 3 
			and !_forceUpdate 
			and equals(_comPos, _colCon.colPos, eqRes)
			and equals(_fwd, _colCon.colFwd, eqRes)
			and equals(_up, _colCon.colUp, eqRes)
			and _scale == _colCon.colScale
			then
		_colCon.colThisFrame = true
		checkCol = false
		
		if _useGrav then
			_colCon.vel = {0, 0, 0}
		endif
	endif
	
	_colCon.deflectThisFrame = false
	
	if checkCol then
		if _handleTransformChange then
			if orig != prevOrig then
				setObjectPos(_obj, orig)
			endif
			
			if _fwd != prevFwd or _up != prevUp then
				setObjRot(_obj, orig, _fwd, _up)
			endif
			
			if _scale != _colCon.scale then
				setObjectScale(_obj, _scale)
			endif
		endif
		
		if _forceUpdate then
			_colCon.objList = []
		endif
		
		var cellResult
		var center = getExtCenter(_colCon.ext) * _scale
		center = changeVecSpaceZFwd(center, _fwd, _up, safeCross(_fwd, _up), {0, 0, 0})
		var prevCenter = getExtCenter(_colCon.ext) * _colCon.scale
		prevCenter = changeVecSpaceZFwd(prevCenter, prevFwd, prevUp, safeCross(prevFwd, prevUp), {0, 0, 0})
		var objMaxDim = distance(_colCon.ext.lo * _colCon.scale, prevCenter)
		var objMinDim = getMinDim(_colCon.ext, _scale)
		
		// Use aux collider only if object is moving fast enough to potentially clip through obstacles
		if _collisionMode <= 1 or distance(prevOrig + prevCenter, orig + center) <= objMinDim then
			cellResult = updateCellContext(_colCon.cell, _colCon.cellPos, orig, false, true)
			
			updateColContext(_colCon, cellResult.cell, orig, _fwd, _up, 
				_colCon.ext, _scale, _obj, _getAllCollisions, _collisionMode, prevOrig, _getNormal, [], [])
			
			_colCon.fwd = _fwd
			_colCon.up = _up
		else // Use aux collider
			var lineDir = safeNormalize((orig + center) - (prevOrig + prevCenter))
			
			if lineDir == {0, 0, 0} then
				lineDir = _fwd
			endif
			
			var linePos = ((orig + center + lineDir * objMaxDim) + (prevOrig + prevCenter)) / 2
			var lineScale = {objMaxDim, objMaxDim, distance(prevOrig + prevCenter, orig + center + lineDir * objMaxDim) / 2}
			var rotAxis = safeCross({0, 0, 1}, lineDir)
			
			if rotAxis == {0, 0, 0} then
				rotAxis = {0, 1, 0}
			endif
			
			var lineUp = axisRotVecBy({0, 1, 0}, rotAxis, getAngleBetweenVecs({0, 0, 1}, lineDir))
			
			setObjectPos(_colCon.auxCollider, linePos)
			setObjectScale(_colCon.auxCollider, lineScale)
			setObjRot(_colCon.auxCollider, linePos, lineDir, lineUp)
			
			/* Run basic collison check for the aux collider, which covers all the space the object has moved through  
			since the previous frame, and then use its results as the collision pool for a complex collison check using 
			the actual object. This ensures that objects not close enough to the object's old and new positions to be 
			seen by a normal collision check will still be included. */
			var auxCon = initColContext(_colCon.auxColCon, _colCon.auxCollider, linePos, lineDir, lineUp, lineScale, 1, 0, {0, 0, 0}, 0.05, false, false, false)
			cellResult = updateCellContext(auxCon.cell, auxCon.cellPos, linePos, false, true)
			
			updateColContext(auxCon, cellResult.cell, linePos, lineDir, lineUp, 
				auxCon.ext, lineScale, _colCon.auxCollider, true, auxCon.collisionMode, prevOrig + prevCenter, false, [], [])
			_colCon.auxColCon = auxCon
			
			cellResult = updateCellContext(_colCon.cell, _colCon.cellPos, orig, false, _forceUpdate)
			updateColContext(_colCon, cellResult.cell, orig, _fwd, _up, 
				_colCon.ext, _scale, _obj, _getAllCollisions, _collisionMode, prevOrig, _getNormal, auxCon.collision, auxCon.gridBit)
			
			_colCon.fwd = _fwd
			_colCon.up = _up
		endif
		
		_colCon.cellPos = cellResult.cellPos
		_colCon.cell = cellResult.cell
		
		if _normRecurLimit > 0 then
			_colCon.colPos = _comPos
		endif
		
		_colCon.colScale = _scale
		_colCon.colFwd = _fwd
		_colCon.colUp = _up
		
		var resetFwdUp = true
		
		if _handleTransformChange and _colCon.colThisFrame then
			if len(_colCon.normal) and _getNormal and _normRecurLimit then
				var deflPos
				
				if len(_colCon.colDepth) then
					// Push object out of the surface it has collided with
					if _colCon.colDepth[0] < float_max and _colCon.normal[0] != {0, 0, 0} then
						deflPos = _comPos + _colCon.normal[0] * _colCon.colDepth[0]
					else // Backup in case we couldn't find the surface normal/collision depth
						deflPos = _comPos - _colCon.delta
					endif
				else
					deflPos = _comPos - _colCon.delta
				endif
				
				// Bounce obj off surface and modify vel based on rotation
				if _useGrav then
					_colCon.vel = reflect(_colCon.vel, _colCon.normal[0]) / (_colCon.mass * 0.1 + 1)
					
					if _colCon.rotVelAxis != {0, 0, 0} then
						_colCon.vel = axisRotVecBy(_colCon.vel, _colCon.rotVelAxis, (_colCon.rotVel * 30) / (_colCon.mass))
					endif
					
					deflPos += _colCon.vel
					
					if _normRecurLimit > 0 and len(_colCon.normal) then
						if _colCon.normal[0] != {0, 0, 0} then
							var r = safeCross(_fwd, _up)
							
							if (_colCon.normAxis == "fwd" and abs(dot(_fwd, _colCon.normal[0])) < 0.99) 
									or (_colCon.normAxis == "up" and abs(dot(_up, _colCon.normal[0])) < 0.99) 
									or (r != {0, 0, 0} and _colCon.normAxis == "r" and abs(dot(r, _colCon.normal[0])) < 0.99) 
									or length(_colCon.vel) > deltaTime() * 8 then
								resetFwdUp = false
							else
								_colCon.rotVel = 0
								var normAxis
								
								if _colCon.normAxis == "fwd" and abs(dot(_fwd, _colCon.normal[0])) >= 0.99 then
									normAxis = _fwd * getSign(dot(_fwd, _colCon.normal[0]))
								else if _colCon.normAxis == "up" and abs(dot(_up, _colCon.normal[0])) >= 0.99 then
									normAxis = _up * getSign(dot(_up, _colCon.normal[0]))
								else
									normAxis = r * getSign(dot(r, _colCon.normal[0]))
								endif endif
								
								var deg = getAngleBetweenVecs(normAxis, _colCon.normal[0])
								var axis = safeCross(normAxis, _colCon.normal[0])
								
								if axis != {0, 0, 0} then
									_fwd = axisRotVecBy(_fwd, axis, deg)
									_up = axisRotVecBy(_up, axis, deg)
								endif
							endif
						endif
					endif
				endif
				
				/* To avoid looping through redundant positions, only continue if the deflected position isn't the same as 
				the position the object started in. */
				if length(prevComPos - deflPos) > eqRes or length(_fwd - _colCon.fwd) > eqRes or length(_up - _colCon.up) > eqRes then
					_colCon.comPos = prevComPos
					_colCon.scale = prevScale
					
					if resetFwdUp then
						_colCon.fwd = prevFwd
						_colCon.up = prevUp
					endif
					
					var argColCon = _colCon
					
					updateObjCollisions(_obj, argColCon, deflPos, _fwd, _up, _scale, _collisionMode, _forceUpdate, 
						_getAllCollisions, _handleTransformChange, _getNormal, abs(_normRecurLimit) * -1 + 1, false)
					_colCon = argColCon
					
					if !_colCon.colThisFrame then
						_colCon.deflectThisFrame = true
					endif
				endif
				
				if _colCon.colThisFrame then
					if _handleTransformChange then
						if _scale != _colCon.scale then
							setObjectScale(_obj, prevScale)
						endif
						
						if _fwd != prevFwd or _up != prevUp then
							setObjRot(_obj, orig, prevFwd, prevUp)
						endif
						
						if orig != prevOrig then
							setObjectPos(_obj, prevOrig)
						endif
					endif
				endif
			endif
		else
			_colCon.comPos = _comPos
			_colCon.scale = _scale
			_colCon.fwd = _fwd
			_colCon.up = _up
		endif
	endif
return _colCon

/* Recalculates collision bits and finds current collisions. 
_collisionMode can be 1 (bounding box), 2 (single raycast), 3 (cuboid raycasts), 
or 4 (spheroid raycasts) */
// CORE LOADER
function updateColContext(ref _colCon, _cell, _pos, _fwd, _up, _ext, _scale, _collider, _getAllCollisions, _collisionMode, _prevPos, _getNormal, _colOverride, _gridBitOverride)	
	var timer = time()
	_colCon.collision = []
	_colCon.normal = []
	_colCon.colDepth = []
	var cellPos = getCellPosFromPos(_pos)
	var gridPos = getGridIdxFromPosInCell(_pos, cellPos, true)
	var oldGridBit = _colCon.gridBit
	_colCon.gridBit = getExtCollisionBitsFast(
		_pos,
		_ext, 
		_scale, 
		_fwd, 
		_up
	)
	_colCon.colThisFrame = false
	var usedCached = false
		
	if len(_colOverride) then
		_colCon.collision = _colOverride
	endif
	
	if len(_gridBitOverride) then
		_colCon.gridBit = _gridBitOverride
	endif
	
	// Reuse collison pool if object hasn't moved enough to recalculate gridBit
	if !len(_colOverride) and _cell == _colCon.cell and len(_colCon.objList) 
			and oldGridBit[13][0] == _colCon.gridBit[13][0]
			and oldGridBit[13][1] == _colCon.gridBit[13][1] then
		usedCached = true
		getColPoolFromCache(_colCon, _collider)
	endif
	
	// Get new collision data pool if current pool is ineligible for reuse
	if  !len(_colOverride) and !usedCached then
		getColPool(_colCon, _cell, _pos, _collider)
	endif
	
	if _collisionMode >= 3 and len(_colCon.collision) then
		resolveComplexRaycastCollision(_colCon, _cell, _pos, _fwd, _up, _ext, _scale, _getAllCollisions, 
			_collisionMode, _prevPos, _getNormal, _gridBitOverride)
	else if _collisionMode == 2 and len(_colCon.collision) then
		resolveSimpleRaycastCollision(_colCon, _pos, _fwd, _up, _ext, _scale, _prevPos)
	endif endif
	
	_colCon.allCollisions = _getAllCollisions
return _colCon

/* Regenerate object list and find bounding box collisions. */
// CORE LOADER
function getColPool(ref _colCon, _cell, _pos, _collider)
	_colCon.cell = _cell
	_colCon.objList = []
	
	var h
	var i
	var curCell
	var obj
	var objGridBit
	var hit
	var curAdj = getAdj(_cell, _pos)
	
	for h = 0 to len(curAdj) loop
		curCell = curAdj[h]
		
		if curCell >= 0 and (_colCon.gridBit[h][0]
				or _colCon.gridBit[h][1]) then
			for i = g_cellObjStart to len(g_cell[curCell]) loop
				obj = getMapObjFromRef(g_cell[curCell][i])
				getObjGridBitForCell(objGridBit, obj, curCell)
				
				if _colCon.gridBit[h][0] & objGridBit[0]
						or _colCon.gridBit[h][1] & objGridBit[1] then
					hit = mergedObjIntersect(obj, _collider, false)
					
					if hit then
						_colCon.objList = insert(_colCon.objList, [ .cell = curCell, .idx = i, .adj = h ], 0)
						_colCon.collision = push(_colCon.collision, [ .cell = curCell, .idx = i, .adj = h ])
						_colCon.normal = push(_colCon.normal, {0, 0, 0})
						_colCon.colThisFrame = true
					else
						_colCon.objList = push(_colCon.objList, [ .cell = curCell, .idx = i, .adj = h ])
					endif
				endif
			repeat
		endif
	repeat
return _colCon

/* Find bounding box collisions from an existing object list. */
// CORE LOADER
function getColPoolFromCache(ref _colCon, _collider)
	var i
	var obj
	var hit
	
	for i = 0 to len(_colCon.objList) loop
		obj = getMapObjFromRef(g_cell[_colCon.objList[i].cell][_colCon.objList[i].idx])
		hit = mergedObjIntersect(obj, _collider, false)
		
		if hit then
			_colCon.collision = push(_colCon.collision, _colCon.objList[i])
			_colCon.normal = push(_colCon.normal, {0, 0, 0})
			_colCon.colThisFrame = true
			
			if i > 0 then
				_colCon.objList = insert(_colCon.objList, _colCon.objList[i], 0)
				_colCon.objList = remove(_colCon.objList, i + 1)
			endif
		endif
	repeat
return _colCon

/* Find current and previous data about object's collision boundaries and direction. */
// CORE LOADER
function getRaycastColPoints(_ext, _pos, _fwd, _up, _scale, _prevPos, _prevFwd, _prevUp, _prevScale)
	var castPoint = getExtPoints(_ext, _scale, _fwd, _up)
	var center = (castPoint[0] + castPoint[1] + castPoint[2] + castPoint[3] 
		+ castPoint[4] + castPoint[5] + castPoint[6] + castPoint[7]) / 8
	
	var prevCastPoint = getExtPoints(_ext, _prevScale, _prevFwd, _prevUp)
	var prevCenter = (prevCastPoint[0] + prevCastPoint[1] + prevCastPoint[2] 
		+ prevCastPoint[3] + prevCastPoint[4] + prevCastPoint[5] + prevCastPoint[6] 
		+ prevCastPoint[7]) / 8
	
	var delta = (center + _pos) - (prevCenter + _prevPos) 
	var dir = safeNormalize(delta)
	
	var result = [
		.castPoint = castPoint,
		.prevCastPoint = prevCastPoint,
		.center = center,
		.prevCenter = prevCenter,
		.delta = delta,
		.dir = dir
	]
return result

/* Get collision results using a simple raycast algorithm that uses one cast from the object
center in the direction of object movement. */
// CORE LOADER
function resolveSimpleRaycastCollision(ref _colCon, _pos, _fwd, _up, _ext, _scale, _prevPos)
	var colPool = _colCon.collision
	
	_colCon.collision = []
	_colCon.normal = []
	_colCon.colDepth = []
	_colCon.colThisFrame = false
	_colCon.colDat = []
	
	var pointResult = getRaycastColPoints(_ext, _pos, _fwd, _up, _scale, _prevPos, _colCon.fwd, 
		_colCon.up, _colCon.scale)
	
	_colCon.delta = pointResult.delta
	var dir = pointResult.dir
	var castObj
	var cast
	var maxDim = getMaxDim(_ext, _scale) / 2
	
	if length(_colCon.delta) then
		for i = 0 to len(colPool) loop
			castObj = getMapObjFromRef(g_cell[colPool[i].cell][colPool[i].idx])
			raycastGrp(cast, castObj, colPool[i].cell, _prevPos, dir, colPool[i].adj,
				false, float_max)
			cast = cast.hit
			
			if cast <= maxDim then
				_colCon.collision = [ colPool[i] ]
				_colCon.colThisFrame = true
				_colCon.normal = [ {0, 0, 0} ]
				_colCon.colDepth = [ float_max ]
				
				break
			endif
		repeat
	endif
return _colCon


/* Get collision results using a complex raycast algorithm that checks a polygon made of raycasts,
finds collision depth and normal, and calculates target rotation. */
// CORE LOADER
function resolveComplexRaycastCollision(ref _colCon, _cell, _pos, _fwd, _up, _ext, _scale, _getAllCollisions, 
		_collisionMode, _prevPos, _getNormal, _gridBitOverride)
	var colPool = _colCon.collision
	
	_colCon.collision = []
	_colCon.normal = []
	_colCon.colDepth = []
	_colCon.colThisFrame = false
	_colCon.colDat = []
	
	var pointResult = getRaycastColPoints(_ext, _pos, _fwd, _up, _scale, _prevPos, _colCon.fwd, 
		_colCon.up, _colCon.scale)
	
	var castPoint = pointResult.castPoint
	var prevCastPoint = pointResult.prevCastPoint
	var center = pointResult.center
	var prevCenter = pointResult.prevCenter
	_colCon.delta = pointResult.delta
	var dir = pointResult.dir
	
	timer = time()
	var prevCastDat = getCollisionCastDat(_collisionMode, _prevPos, _colCon.fwd, _colCon.up, 
		_colCon.scale, _ext, prevCastPoint, prevCenter, _prevPos - (_pos - _prevPos))
	var castObj
	var cast
	var castDat = getCollisionCastDat(_collisionMode, _pos, _fwd, _up, _scale, _ext, castPoint, center, _prevPos)
	var castOrder = [ 3, 4, 5, 6, 0, 1, 2, 7, 8, 9 ]
	
	var castResult
	complexRaycast(castResult, _colCon, colPool, castDat, prevCastDat, castOrder, _getAllCollisions, _gridBitOverride)
	var closestCol = castResult.bestCol
	_colCon = castResult.colCon
				
	if _getNormal and closestCol.cast < float_max then
		_colCon.delta = closestCol.castDat[0] - prevCastDat[closestCol.castDatIdx][0]
		dir = safeNormalize(_colCon.delta)
		castObj = getMapObjFromRef(g_cell[closestCol.obj.cell][closestCol.obj.idx])
		var castHit = closestCol.castDat[0] + closestCol.cast * closestCol.castDat[1]
		_colCon.colDat = closestCol
		var normCastPos
		
		if closestCol.cast <= closestCol.castDat[2] / 2 or closestCol.castDatIdx >= 7 then
			normCastPos = castHit - closestCol.castDat[0] + prevCastDat[closestCol.castDatIdx][0]
			_colCon.colDat.invCastDir = false
		else
			var invCastStart = closestCol.castDat[0] + closestCol.castDat[1] * closestCol.castDat[2]
			var prevInvCastStart = prevCastDat[closestCol.castDatIdx][0] + prevCastDat[closestCol.castDatIdx][1] 
				* prevCastDat[closestCol.castDatIdx][2]
			normCastPos = castHit - invCastStart + prevInvCastStart
			dir = safeNormalize(invCastStart - prevInvCastStart)
			_colCon.delta = invCastStart - prevInvCastStart
			_colCon.colDat.invCastDir = true
		endif
		
		var rotAxis = safeCross({0, 0, 1}, dir)
		
		if rotAxis == {0, 0, 0} then
			rotAxis = {0, 1, 0}
		endif
		
		var normCastUp = axisRotVecBy({0, 1, 0}, rotAxis, getAngleBetweenVecs({0, 0, 1}, dir))
		var normCast
		var colPoolCell = -1
		var safeFloorCheck = true
		
		if safeFloorCheck then
			var floorResult
			raycastSafeFloor(floorResult, _colCon, colPool, dir, normCastPos, closestCol.obj.adj)
			normCast = floorResult.normCast
			
			if floorResult.colPoolCell >= 0 then
				colPoolCell = floorResult.colPoolCell
			else
				colPoolCell = closestCol.obj.cell
			endif
		else
			colPoolCell = closestCol.obj.cell
			var curObj = getMapObjFromRef(g_cell[closestCol.obj.cell][closestCol.obj.idx])
			raycastGrp(normCast, curObj, colPoolCell, normCastPos, 
				dir, closestCol.obj.adj, true, float_max)
			normCast = normCast.hit
		endif
		
		//debugLine(normCastPos, castPoint, 0.005, 5, blue)
		var norm
		var normCastHit
		
		_colCon.dir = dir
		
		if normCast >= float_max then
			getNormal(norm, castObj, closestCol.obj.cell, _colCon, 0.00001, normCastPos, prevCastDat[closestCol.castDatIdx][0] + prevCastDat[closestCol.castDatIdx][1], 
				dir, normCastUp, closestCol.obj.adj)
			//debugLine(closestCol.castDat[0], closestCol.castDat[0] + closestCol.castDat[1] * closestCol.castDat[2], 0.005, 5, lime)
			_colCon.colDepth = push(_colCon.colDepth, float_max)
		else
			normCastHit = normCastPos + dir * normCast
			
			getNormal(norm, castObj, colPoolCell, _colCon, 0.00001, normCastPos, normCastHit, 
				dir, normCastUp, closestCol.obj.adj)
			
			var depthStart
			if _colCon.colDat.invCastDir then
				depthStart = closestCol.castDat[0] + closestCol.castDat[1] * closestCol.castDat[2]
			else
				depthStart = closestCol.castDat[0]
			endif
			
			var depthProj = projectVecToPlane(depthStart, normCastHit, norm)
			var overage = 0.0001 // Add a small amount to ensure the depth clears the collision surface
			var pointDepth = distance(depthStart, depthProj) + overage
			_colCon.colDepth = push(_colCon.colDepth, pointDepth)
		endif
		
		setTargetFaceForColRot(_colCon, norm, _fwd, _up)
		
		//debugLine(castHit, castHit + norm * 0.25, 0.005, 5, orange)
		_colCon.normal = push(_colCon.normal, norm)
	else
		_colCon.normal = push(_colCon.normal, {0, 0, 0})
		_colCon.colDepth = push(_colCon.colDepth, float_max)
	endif
return _colCon

/* Sets a target face for the collision context's hitbox to rotate towards upon
collision. The face is selected based on how closely it matches the collision 
surface's normal and on how much of the object's surface area it occupies. */
// CORE LOADER
function setTargetFaceForColRot(ref _colCon, _norm, _fwd, _up)
	// Set preferred face for the object to land on and init rotaion axis
	if _norm != {0, 0, 0} then
		var fwdDif = dot(_fwd, _norm)
		var upDif = dot(_up, _norm)
		var r = safeCross(_fwd, _up)
		
		var rDif = dot(r, _norm)
		var mostAngledDir
		var offAxis
		
		var fwdLen = abs(_colCon.ext.hi.z - _colCon.ext.lo.z) * _colCon.scale.z
		var upLen = abs(_colCon.ext.hi.y - _colCon.ext.lo.y) * _colCon.scale.y
		var rLen = abs(_colCon.ext.hi.x - _colCon.ext.lo.x) * _colCon.scale.x
		var fwdArea = upLen * rLen
		var upArea = fwdLen * rLen
		var rArea = fwdLen * upLen
		
		var fwdScore = fwdArea / (fwdArea + upArea + rArea)
		var upScore = upArea / (fwdArea + upArea + rArea)
		var rScore = rArea / (fwdArea + upArea + rArea)
		
		if (abs(fwdDif) + fwdScore) > (abs(upDif) + upScore) and (abs(fwdDif) + fwdScore) > (abs(rDif) + rScore) then
			mostAngledDir = _fwd * getSign(fwdDif)
			offAxis = r * getSign(fwdDif)
			_colCon.normAxis = "fwd"
		else if (abs(upDif) + upScore) > (abs(fwdDif) + fwdScore) and (abs(upDif) + upScore) > (abs(rDif) + rScore) then
			mostAngledDir = _up * getSign(upDif)
			offAxis = r * getSign(upDif) * -1
			_colCon.normAxis = "up"
		else
			mostAngledDir = r * getSign(rDif)
			offAxis = _fwd * getSign(rDif)
			_colCon.normAxis = "r"
		endif endif
		
		var newRotAxis = safeCross(mostAngledDir, _norm)
		
		if newRotAxis != {0, 0, 0} then
			_colCon.rotVelAxis = newRotAxis
		else
			newRotAxis = offAxis
		endif
		
		var massScaler = lerp(2, 10, _colCon.mass / 100)
		var gravNorm
		
		if _colCon.grav != {0, 0, 0} then
			gravNorm = normalize(_colCon.grav)
		else
			gravNorm = {0, 0, 0}
		endif
		
		var lowLimit = (dot(_norm * -1, gravNorm) + 1) / 2
		
		if abs(dot(mostAngledDir, _norm)) > 0.5 and lowLimit > 0.9 and _colCon.rotVel > 0 then
			if _colCon.rotVel >= 4 then
				_colCon.rotVel = max(_colCon.rotVel * (1 / (max(_colCon.mass, 6) / 5)), 1)
			else
				_colCon.rotVel = max(_colCon.rotVel * (1 / (max(_colCon.mass, 22) / 20)), 4)
			endif
		else if length(_colCon.vel) > 0.1 and length(_colCon.delta) > 0.1 then
			var velMod = abs(dot(_norm, normalize(_colCon.vel)))
			_colCon.rotVel = max(lowLimit * 4, (length(_colCon.vel) * 50) / massScaler) * velMod
		endif endif
	endif
return _colCon

/* Returns shape data for raycast collision detection. */
// CORE LOADER
function getCollisionCastDat(_type, _pos, _fwd, _up, _scale, _ext, _extPoints, _center, _prevPos)
	var r = safeCross(_fwd, _up)
	var zDir = _center + safeNormalize(_fwd) * abs(_ext.hi.z - _ext.lo.z) * 0.5 * _scale.z
	var xDir = _center + safeNormalize(r * -1) * abs(_ext.hi.x - _ext.lo.x) * 0.5  * _scale.x
	var yDir = _center + safeNormalize(_up) * abs(_ext.hi.y - _ext.lo.y) * 0.5  * _scale.y
	var castDat
	
	if _type == 3 then
		// Spheroid -- diagonal casts towards the extent corners are shorter vs. cuboid
		var avgDim = (distance(_extPoints[0], _extPoints[1]) / 2 + distance(_extPoints[0], _extPoints[2]) / 2 + distance(_extPoints[0], _extPoints[4]) / 2) / 3
		var point = [
			normalize(_extPoints[4] - _center),
			normalize(_extPoints[5] - _center),
			normalize(_extPoints[6] - _center),
			normalize(_extPoints[7] - _center),
			normalize(_extPoints[0] - _center)
		]
		castDat = [ // position, direction, distance
			[ _pos + yDir, normalize(yDir - _center) * -1, abs(_ext.hi.y - _ext.lo.y) * _scale.y ], 
			[ _pos + zDir, normalize(zDir - _center) * -1, abs(_ext.hi.z - _ext.lo.z) * _scale.z ], 
			[ _pos + xDir, normalize(xDir - _center) * -1, abs(_ext.hi.x - _ext.lo.x) * _scale.x ],
			[ _pos + point[0] * avgDim, point[0] * -1, avgDim * 2 ], 
			[ _pos + point[1] * avgDim, point[1] * -1, avgDim * 2 ], 
			[ _pos + point[2] * avgDim, point[2] * -1, avgDim * 2 ], 
			[ _pos + point[3] * avgDim, point[3] * -1, avgDim * 2 ],
			[ _prevPos + _center, normalize((_pos + _center) - (_prevPos + _center)), distance(_prevPos + _center, _pos + _center) ],
			[ _prevPos + _center, normalize((_pos + point[4] * avgDim) - (_prevPos + _center)), distance(_prevPos + _center, _pos + point[4] * avgDim) ],
			[ _prevPos + _center, normalize((_pos + point[3] * avgDim) - (_prevPos + _center)), distance(_prevPos + _center, _pos + point[3] * avgDim) ]
		]
	else
		// Cuboid
		var rad = distance(_center, _ext.hi * _scale)
		var crossDist = distance(_ext.lo * _scale, _ext.hi * _scale)
		
		castDat = [ // position, direction, distance
			[ _pos + yDir, normalize(yDir - _center) * -1, abs(_ext.hi.y - _ext.lo.y) * _scale.y ], 
			[ _pos + zDir, normalize(zDir - _center) * -1, abs(_ext.hi.z - _ext.lo.z) * _scale.z ], 
			[ _pos + xDir, normalize(xDir - _center) * -1, abs(_ext.hi.x - _ext.lo.x) * _scale.x ],
			[ _pos + _extPoints[4], normalize(_extPoints[4] - _center) * -1, crossDist ], 
			[ _pos + _extPoints[5], normalize(_extPoints[5] - _center) * -1, crossDist ], 
			[ _pos + _extPoints[6], normalize(_extPoints[6] - _center) * -1, crossDist ], 
			[ _pos + _extPoints[7], normalize(_extPoints[7] - _center) * -1, crossDist ],
			[ _prevPos + _center, normalize((_pos + _center) - (_prevPos + _center)), distance(_prevPos + _center, _pos + _center) ],
			[ _prevPos + _center, normalize((_pos + _extPoints[0]) - (_prevPos + _center)), distance(_prevPos + _center, _pos + _extPoints[0]) ],
			[ _prevPos + _center, normalize((_pos + _extPoints[7]) - (_prevPos + _center)), distance(_prevPos + _center, _pos + _extPoints[7]) ]
		]
	endif
	// Uncomment for collision shape debug
	/*var i
	for i = 0 to len(castDat) loop
		castDat[i][0] = castDat[i][0] + castDat[i][1] * 0.1
		castDat[i][2] -= 0.2
		debugLine(castDat[i][0], castDat[i][0] + castDat[i][1] * castDat[i][2], 0.01, 10, lime)
	repeat*/
return castDat

/* Checks for collisions based on cast shape defined by getCollisionCastDat(). */
// CORE LOADER
function complexRaycast(ref _in, _colCon, _colPool, _castDat, _prevCastDat, _castOrder, _getAllCollisions, _gridBitOverride)
	if !len(_gridBitOverride) then
		_gridBitOverride = _colCon.gridBit
	endif
	
	var bestCol = [ .obj = -1, .cast = float_max, .castDat = -1 ]
	var castObj
	var cast
	var i
	var j
	
	for i = 0 to len(_colPool) loop
		castObj = getMapObjFromRef(g_cell[_colPool[i].cell][_colPool[i].idx])
		
		for j = 0 to len(_castOrder) loop
			raycastGrp(cast, castObj, _colPool[i].cell, _castDat[_castOrder[j]][0], _castDat[_castOrder[j]][1], 
				_gridBitOverride[_colPool[i].adj], false, float_max)
			cast = cast.hit
			
			if cast <= _castDat[_castOrder[j]][2] then
				_colCon.collision = push(_colCon.collision, _colPool[i])
					_colCon.colThisFrame = true
				
				if bestCol.cast >= float_max or cast < bestCol.cast then
					bestCol = [ .obj = _colPool[i], .cast = cast, .castDat = _castDat[_castOrder[j]], .castDatIdx = _castOrder[j], .colPoolIdx = i, .invCastDir = false ]
				endif
				
				break
			endif
		repeat
					
		if !_getAllCollisions and len(_colCon.collision) then
			break
		endif
	repeat
	
	_in = [
		.colCon = _colCon,
		.bestCol = bestCol
	]
return _in

/* raycastSafeFloor will check normal-finding raycasts against all possible collision targets which
ensures any raycast that should be blocked by a nearby object will be blocked, returning the 
blocking surface's normal instead. The practical impact of this is that floor tiles will always 
return the correct upward normal instead of sometimes returning the non-upward normal from the 
tile's edge (because the edge is covered by the adjacent tiles which block the raycast). Using 
safeFloorCheck involves additional raycasts and hits the CPU, of course. */
// CORE LOADER
function raycastSafeFloor(ref _in, _colCon, _colPool, _dir, _normCastPos, _gridBitAdj)
	_in = [
		.normCast = float_max,
		.colPoolCell = -1
	]
	var curObj
	var newCast
	var i
	for i = 0 to len(_colPool) loop
		curObj = getMapObjFromRef(g_cell[_colPool[i].cell][_colPool[i].idx])
		raycastGrp(newCast, curObj, _colPool[i].cell, _normCastPos, 
			_dir, _colCon.gridBit[_gridBitAdj], true, float_max)
		newCast = newCast.hit
		
		if newCast < _in.normCast then
			_in.normCast = newCast
			_in.colPoolCell = _colPool[i].cell
		endif
	repeat
return _in

/* Finds collisions involving merged objects. */
// CORE LOADER
function mergedObjIntersect(_mergedObj, _obj)
return mergedObjIntersect(_mergedObj, _obj, false)

function mergedObjIntersect(_mergedObj, _obj, _hit)
	if !len(_mergedObj.children) then
		_hit = objectIntersect(_mergedObj.obj, _obj)
	else
		var i
		for i = 0 to len(_mergedObj.children) loop
			_hit = mergedObjIntersect(_mergedObj.children[i], _obj, _hit)
			
			if _hit then break endif
		repeat
	endif
return _hit

/* Performs a raycast that can hit any child within _obj. _gridBit is the
collision bit array of the casting object -- the cast will not be performed
if the caster's gridBit doesn't overlap _obj's gridBit. If _gridBit is not
given, it will be set so it always overlaps, making it irrelevant. If
_getAll is true, the nearest collision wil be returned; otherwise, the
first collision encountered will be returned. */
// CORE LOADER
function raycastGrp(ref _in, _obj, _cell, _pos, _dir)
return raycastGrp(_in, _obj, _cell, _pos, _dir, [])

function raycastGrp(ref _in, _obj, _cell, _pos, _dir, _gridBit)
return raycastGrp(_in, _obj, _cell, _pos, _dir, _gridBit, false, float_max)

function raycastGrp(ref _in, _obj, _cell, _pos, _dir, _gridBit, _getAll)
return raycastGrp(_in, _obj, _cell, _pos, _dir, _gridBit, _getAll, float_max)

function raycastGrp(ref _in, _obj, _cell, _pos, _dir, _gridBit, _getAll, _hit)
	_in = [
		.hit = _hit,
		.child = _obj
	]
	var abort = false
	var merged = len(_obj.children) or len(_obj.lights)
	
	// Categorically exclude lights. They have collision data but we can't collide with them.
	if !merged and !len(_gridBit) then
		_in.hit = raycastObject(_obj.obj, _pos, _dir)
		
		abort = true
	endif
	
	if !abort and !merged and len(_gridBit) then
		var objGridBit
		getObjGridBitForCell(objGridBit, _obj, _cell)
		
		if _gridBit[0] & objGridBit[0] 
				or _gridBit[1] & objGridBit[1] then
			_in.hit = raycastObject(_obj.obj, _pos, _dir)
		endif
		
		abort = true
	endif
	
	if !abort and (_getAll or _in.hit >= float_max) then
		var i
		var objGridBit
		
		for i = 0 to len(_obj.children) loop
			var gridMatch = false
			
			if !len(_gridBit) then
				gridMatch = true
			else
				getObjGridBitForCell(objGridBit, _obj.children[i], _cell)
				
				if objGridBit[0] & _gridBit[0] 
						or objGridBit[1] & _gridBit[1] then
					gridMatch = true
				endif
			endif
			
			if gridMatch then
				var castResult
				raycastGrp(castResult, _obj.children[i], _cell, _pos, _dir, _gridBit, _getAll, _in.hit)
				
				if castResult.hit < _in.hit then
					_in = castResult
				endif
				
				if !_getAll and _in.hit < float_max then
					break
				endif
			endif
		repeat
	endif
return _in

/* Gets a new target position for an object by adding its current velocity to its current
position. Typically, the output of this function should be passed to updateObjCollisions()'s
_comPos input every frame to update a physics object. */
// CORE LOADER
function getNewColPos(_colCon)
return _colCon.comPos + _colCon.vel

/* Gets a new target rotation for an object's forward vector by adding its current rotational 
velocity to its current forward direction. Typically, the output of this function should be passed 
to updateObjCollisions()'s _fwd input every frame to update a physics object. */
// CORE LOADER
function getNewColFwd(_colCon)
return axisRotVecBy(_colCon.fwd, _colCon.rotVelAxis, _colCon.rotVel)

/* Gets a new target rotation for an object's up vector by adding its current rotational velocity 
to its current up direction. Typically, the output of this function should be passed to updateObjCollisions()'s 
_up input every frame to update a physics object. */
// CORE LOADER
function getNewColUp(_colCon)
return axisRotVecBy(_colCon.up, _colCon.rotVelAxis, _colCon.rotVel)

/* Apply collisions to the camera. */
function updateCamCollisions(_flush)
	var colCon = g_cam.lastColContext
	updateObjCollisions(g_cam.collider, colCon, g_cam.pos, g_cam.fwd, g_cam.up, g_cam.lastColContext.scale, 
		g_cam.collisionMode, _flush, true, true, true, 2, false)
	g_cam.lastColContext = colCon
	g_cam.cell = g_cam.lastColContext.cell
	g_cam.cellPos = g_cam.lastColContext.cellPos
	g_cam.pos = g_cam.lastColContext.comPos
	g_cam.fwd = g_cam.lastColContext.fwd
	g_cam.up = g_cam.lastColContext.up
return void

/* Apply collisions to the cursor. */
function updateCurCollisions(_flush)
	var colCon = g_cur.lastColContext
	updateObjCollisions(g_cur.collider, colCon, floorVec(g_cur.pos) + 0.5, {0, 0, 1}, {0, 1, 0}, {0.5, 0.5, 0.5}, 
		1, _flush, true, true, false, 1, false)
	g_cur.lastColContext = colCon
	g_cur.cell = colCon.cell
	g_cur.cellPos = colCon.cellPos
return void

/* Begins throwing a physics object. */
function startThrow(_pos, _fwd, _up)
	colContext throwCon
	
	var objDef = g_obj[decodeBank(-1, g_cur.activeObj.bankIdx)][decodeIdx(-1, g_cur.activeObj.bankIdx)]
	var objSize = absVec3(objDef.ext.hi * g_cur.scale - objDef.ext.lo * g_cur.scale)
	var maxDim = getMaxDim(objDef.ext, g_cur.scale)
	var resizeFactor = 1
	
	// Collision contexts cannot be infinitely large; limit thrown object size to dimensions of a cell
	if maxDim > 5 then
		resizeFactor = 5 / maxDim
	endif
	
	var colScale = (objSize / 2) * resizeFactor
	var throwCollider = placeObject(cube, _pos, colScale)
	setObjRot(throwCollider, _pos, g_cur.fwd, g_cur.up)
	setObjectVisibility(throwCollider, false)
	
	var throwObj
	var objContainer
	
	if len(g_cur.activeObj.children) or len(g_cur.activeObj.lights) then
		throwObj = placeGrpObj(g_cur.activeObj, g_cur.activeObj, g_cam.fov)
		setObjectScale(throwObj.obj, g_cur.scale * resizeFactor)
		objContainer = g_cur.activeObj
		objContainer.obj = throwObj.obj
		objContainer.children = throwObj.children
		objContainer.lights = throwObj.lights
	else
		throwObj = placeObjDef(objDef, _pos, g_cur.scale * resizeFactor)
		objContainer = g_cur.activeObj
		objContainer.obj = throwObj
	endif
	
	restoreDefaultObjCol(objContainer)
	setObjRot(objContainer.obj, _pos, g_cur.fwd, g_cur.up)
	
	var mass = clamp(objSize.x * objSize.y * objSize.z * resizeFactor, 5, 100)
	
	throwCon.ext = objDef.ext
	throwCon = initColContext(throwCon, throwCollider, _pos, g_cur.fwd, g_cur.up, colScale, 4, mass, {0, -1, 0}, 0.001, true, false, true)
	throwCon.vel = g_cam.fwd * 0.5 + g_cam.up * 0.2
	g_thrown = push(g_thrown, [ .obj = objContainer, .collider = throwCollider, .colCon = throwCon, .timer = 0, 
		.com = getExtCenter(objDef.ext) * g_cur.scale * resizeFactor ])
return void

/* Updates the physics of thrown objects. */
function updateThrow()
	var i = 0
	while i < len(g_thrown) loop
		g_thrown[i].timer += deltaTime()
		
		if g_thrown[i].timer >= 5 then
			removeObject(g_thrown[i].colCon.auxCollider)
			removeGroupObj(g_thrown[i].obj)
			removeObject(g_thrown[i].collider)
			g_thrown = remove(g_thrown, i)
			
			i -= 1
		else
			g_thrown[i].colCon = updateObjCollisions(g_thrown[i].collider, g_thrown[i].colCon, getNewColPos(g_thrown[i].colCon), 
				getNewColFwd(g_thrown[i].colCon), getNewColUp(g_thrown[i].colCon), g_thrown[i].colCon.scale, g_thrown[i].colCon.collisionMode, 
				false, true, true, true, 2, true)
			
			var appliedCom = changeVecSpaceZFwd(g_thrown[i].com, g_thrown[i].colCon.fwd, g_thrown[i].colCon.up,
				safeCross(g_thrown[i].colCon.fwd, g_thrown[i].colCon.up), {0, 0, 0})
			setObjectPos(g_thrown[i].obj.obj, g_thrown[i].colCon.comPos - appliedCom)
			setObjRot(g_thrown[i].obj.obj, g_thrown[i].colCon.comPos - appliedCom, g_thrown[i].colCon.fwd, g_thrown[i].colCon.up)
		endif
		
		i += 1
	repeat
return void

	// ----------------------------------------------------------------
	// COLLISION BITS

/* Gets a binary representation of an object's collision box within a cell. 
The cell (5x5x5 dimensions) is divided into 125 units, with 0 at {0, 0, 0}
and 124 at {5, 5, 5} (incrementing x first, then y, then z). */
// CORE LOADER
function getObjCollisionBits(_obj, _objCell, _gridCellLen, _posOffset)
	var def
	getObjDef(def, _obj)
	var objExt = def.ext
	var cellHalfW = getCellWidth() / 2
	var cellBounds = [
		.lo = g_cell[_objCell][0] - cellHalfW,
		.hi = g_cell[_objCell][0] + cellHalfW
	]
	
	var bounds = getExtMinMax(objExt, _obj.scale, 
		_obj.fwd, _obj.up)
	_obj.pos += _posOffset
	bounds.lo = {
		max(bounds.lo.x + _obj.pos.x, cellBounds.lo.x),
		max(bounds.lo.y + _obj.pos.y, cellBounds.lo.y),
		max(bounds.lo.z + _obj.pos.z, cellBounds.lo.z)
	}
	bounds.hi = {
		min(bounds.hi.x + _obj.pos.x, cellBounds.hi.x),
		min(bounds.hi.y + _obj.pos.y, cellBounds.hi.y),
		min(bounds.hi.z + _obj.pos.z, cellBounds.hi.z)
	}
	bounds.lo = floorVec(bounds.lo) + 0.5
	bounds.hi = floorVec(bounds.hi) + 0.5
	
	var gridPosExt = [
		.lo = {-0.5, -0.5, -0.5},
		.hi = {0.5, 0.5, 0.5}
	]
	var dat
	array bitInt[bitLenToInt(_gridCellLen)]
	bitInt[0] = 0
	bitInt[1] = 0
		
	var gridCollider = placeObject(cube, g_cell[_objCell][0], {0.5, 0.5, 0.5})
	
	var z
	var y
	var x
	var isInter
	var intIdx
	
	for z = bounds.lo.z to bounds.hi.z + 1 loop
		for y = bounds.lo.y to bounds.hi.y + 1 loop
			for x = bounds.lo.x to bounds.hi.x + 1 loop
				/* Because of boundary collisions, we need to check that we're
				acually looking at a position in the cell. */
				if isPosInCell({x, y, z}, _objCell) then
					setObjectPos(gridCollider, {x, y, z})
					isInter = objectIntersect(_obj.obj, gridCollider)
					
					if isInter then
						gridIdx = getGridIdxFromPosInCell({x, y, z}, g_cell[_objCell][0], false)
						
						if gridIdx < _gridCellLen then
							intIdx = floor(gridIdx / g_intLen)
							bitInt[intIdx] = bitFieldInsert(bitInt[intIdx], gridIdx % g_intLen, 1, 1)
						else
							// DEBUG CONDITION: SHOULD NEVER OCCUR
							clear(black)
							ink(white)
							textSize(gheight() / 25)
							printAt(1, 1, "ERROR: gridIdx for getObjCollisionBits() is -1" + chr(10) + 
								"grid idx is " + gridIdx + chr(10) + 
								"cell is " + _objCell)
							update()
							sleep(1)
						endif
					endif
				endif
			repeat
		repeat
	repeat
	
	removeObject(gridCollider)
return bitInt

/* Constructs collision bit data for an object and all its children within 
the bounds of the given cell. Each parent within the hierarchy has a 
gridBit comprised of the intersection of all of its children's gridBits. */
// CORE LOADER
function getGrpCollisionBits(_obj, _cell)
	var depth = 0
	var childIdx = 0
	var parents = []
	var curObj = _obj
	var appliedObj = _obj
	var cellFound
	var i
	var colBits
	var bitArr
	
	loop
		if len(curObj.children) and childIdx < len(curObj.children) then
			depth += 1
			
			if len(parents) then
				appliedObj = applyGrpTransform(curObj, parents[len(parents) - 1][2])
			else
				appliedObj = curObj
			endif
			
			parents = push(parents, [ curObj, childIdx, appliedObj ]) // [ parent, child index within parent, parent with applied transform ]
			curObj = curObj.children[childIdx]
			childIdx = 0
			
			appliedObj = applyGrpTransform(curObj, parents[len(parents) - 1][2])
		else
			cellFound = false
			
			for i = 0 to len(curObj.gridBitList) loop
				if curObj.gridBitList[i][0] == _cell then
					curObj.gridBitList[i][1] =
						bitOrLong(curObj.gridBitList[i][1], 
						getObjCollisionBits(appliedObj, _cell, g_cellBitLen, 0))
					cellFound = true
					
					break
				endif
			repeat
			
			// Create new grid bit entry if no existing entry was found to merge
			if !cellFound then
				colBits = getObjCollisionBits(appliedObj, _cell, g_cellBitLen, 0)
				bitArr = [ _cell, colBits ]
				curObj.gridBitList = push(curObj.gridBitList, bitArr)
			endif
			
			depth -= 1
			
			if depth >= 0 then
				parents[depth][0].children[parents[depth][1]] = curObj
				
				// Combine child's grid bits with parent's
				cellFound = false
				
				for i = 0 to len(parents[depth][0].gridBitList) loop
					if parents[depth][0].gridBitList[i][0] == _cell then
						parents[depth][0].gridBitList[i][1] =
							bitOrLong(parents[depth][0].gridBitList[i][1], 
							curObj.gridBitList[len(curObj.gridBitList) - 1][1])
						cellFound = true
						
						break
					endif
				repeat
				
				// Create new parent grid bit entry if no existing entry was found to merge
				if !cellFound then
					parents[depth][0].gridBitList =
						push(parents[depth][0].gridBitList, 
						curObj.gridBitList[len(curObj.gridBitList) - 1])
				endif
				
				curObj = parents[depth][0]
				appliedObj = parents[depth][2]
				childIdx = parents[depth][1] + 1
				parents = remove(parents, len(parents) - 1)
			endif
		endif
		
		if depth <= 0 and childIdx >= len(curObj.children) then break endif
	repeat
return curObj

/* Quickly finds an approximation of a collision box within a cell. Like
getObjCollisionBits() but faster and less accurate. */
// CORE LOADER
function getExtCollisionBitsFast(_pos, _ext, _scale, _fwd, _up)
	var cellW = getCellWidth()
	var cellW2 = pow(cellW, 2)
	var cellW3 = cellW2 * cellW
	var cellPos = getCellPosFromPos(_pos)
	var minMax = getExtMinMax(_ext, _scale, _fwd, _up)
	
	minMax.lo += _pos
	minMax.hi += _pos
	minMax.lo = roundVec(minMax.lo, 2)
	minMax.hi = roundVec(minMax.hi, 2)
	
	var loCellPos = getCellPosFromPos(minMax.lo)
	array cells[27][bitLenToInt(g_cellBitLen)]
	var offset = (loCellPos - cellPos) / cellW
	var adj = getAdjIdxFromOffset(offset)
	var firstBitPos = getGridIdxFromPosInCell(minMax.lo, 0, false)
	
	var xW = getAdjBitWidths(minMax.lo.x, minMax.hi.x, cellW, firstBitPos, 0)
	var yW = getAdjBitWidths(minMax.lo.y, minMax.hi.y, cellW, firstBitPos, 1)
	var zW = getAdjBitWidths(minMax.lo.z, minMax.hi.z, cellW, firstBitPos, 2)
	
	var x
	var y
	var z
	var adjIdx
	var i
	var j
	var xOffset
	var yOffset
	var zOffset
	
	for z = 0 to len(zW) loop
		for y = 0 to len(yW) loop
			for x = 0 to len(xW) loop
				adjIdx = adj + x + 3 * y + 9 * z
				
				if adjIdx >= 27 then break endif
				
				for i = 0 to yW[y] loop
					for j = 0 to zW[z] loop
						xOffset = (-firstBitPos % cellW) * max(0, x)
						/* Snap firstBitPos to its resolution (y: res unit = 5; z: res unit = 25), invert it, multiply 
						by the cell offset to position it, then add the number of res units determined by getAdjBitWidths() */
						yOffset = -cellW * floor((firstBitPos % cellW2) / cellW) * max(0, y) + i * cellW
						zOffset = -1 * cellW2 * floor((firstBitPos % cellW3) / cellW2) * max(0, z) + j * cellW2
						
						cells[adjIdx] = bitFieldSetLong(cells[adjIdx], 
							firstBitPos + xOffset + yOffset + zOffset,
							xW[x], 1)
					repeat
				repeat
			repeat
		repeat
	repeat
return cells

/* Gets bitmask for the collision positions on the edge of the cell in the 
given dirction. */
function getAdjBitmask(_dir)
	array mask[bitLenToInt(g_cellBitLen)]
	mask[0] = 0
	mask[1] = 0
	
	/* Cast string to int to force FUZE to use a 64-bit int instead of overflowing
	a 32-bit int. */
	if _dir.x then
		if _dir.x > 0 then
			mask[0] = mask[0] | int("595056260442243600")
			mask[1] = mask[1] | int("1190112520884487201")
		else
			mask[0] = mask[0] | int("1190112520884487201")
			mask[1] = mask[1] | int("74382032555280450")
		endif
	endif
	
	if _dir.y then
		if _dir.y > 0 then
			mask[0] = mask[0] | int("1090715567259648")
			mask[1] = mask[1] | int("66571995072")
		else
			mask[0] = mask[0] | int("34902898152308767")
			mask[1] = mask[1] | int("2130303842304")
		endif
	endif
	
	if _dir.z then
		if _dir.z > 0 then
			mask[1] = mask[1] | int("2305842940494217216")
		else
			mask[0] = mask[0] | 33554431
		endif
	endif
return mask
	
/* Gets a row of bits along a given axis, potentially spanning up to three cells,
that can be copied along other axes to fill out the binary collision box 
representation.

_axis: 0 = x, 1 = y, 2 = z */
// CORE LOADER
function getAdjBitWidths(_axisMin, _axisMax, _cellW, _firstBitPos, _axis)
	var bitFullW = ceil(_axisMax) - floor(_axisMin)
	var axisUnit = pow(_cellW, _axis)
	var maxAxisVal = _cellW * axisUnit
	var axisVal = _firstBitPos % (_cellW * axisUnit)
	
	array adjW[3]
	adjW[0] = min(ceil((maxAxisVal - axisVal) / axisUnit), bitFullW)
	adjW[1] = bitFullW - adjW[0]
	adjW[2] = 0
	
	if adjW[1] > _cellW then
		adjW[2] = adjW[1] - _cellW
		adjW[1] = _cellW
	endif
	
	// Trim cells that don't have bits
	if adjW[1] == 0 then
		adjW = [ adjW[0] ]
	else if adjW[2] == 0 then
		adjW = [ adjW[0], adjW[1] ]
	endif endif
return adjW

/* Finds the binary collision box bit index equivalent of a normal position. 
Assumes the position is within the cell indicated by _cellPos. */
// CORE LOADER
function getGridIdxFromPosInCell(_pos, _cellPos, _useCellPos)
	var cellW = getCellWidth()
	
	if !_useCellPos then
		_cellPos = getCellPosFromPos(_pos)
	endif
	
	_pos = floorVec(_pos - _cellPos + {cellW, cellW, cellW} * 0.5)
return _pos.x + _pos.y * cellW + _pos.z * cellW * cellW

/* Gives the regular position equivalent of a binary collision box bit index. */
function getPosFromGridIdx(_midCell, _idx)
return getPosFromGridIdx(_midCell, 13, _idx)

function getPosFromGridIdx(_midCell, _adjIdx, _idx)
	var result = [
		.isValid = false,
		.pos = {0, 0, 0}
	]
	if _midCell > -1 then
		var cellW = getCellWidth()
		var cellHalfW = cellW / 2
		var adj = g_cell[_midCell][1][_adjIdx]
		var cellWSq = pow(cellW, 2)
		
		/* The addition of 0.001 offsets a rounding error that can cause
		floor() to return 1 lower than the correct value. */
		result.pos = 
			{mod(_idx, cellW), floor(mod(_idx, cellWSq) / cellW + 0.001), floor(_idx / cellWSq + 0.001)}
			+ getOffsetFromAdjIdx(_adjIdx) * cellW  + g_cell[_midCell][0] 
			- {cellHalfW, cellHalfW, cellHalfW}
		result.pos = roundVec(result.pos, 0) + {0.5, 0.5, 0.5}
		result.isValid = true
	endif
return result

/* Searches in an object's grid bit list and returns the data for a specific
cell.  */
// CORE LOADER
function getObjGridBitForCell(ref _in, _obj, _cell)
	array gridBit[bitLenToInt(g_cellBitLen)]
	_in = gridBit
	
	var i
	for i = 0 to len(_obj.gridBitList) loop
		if _obj.gridBitList[i][0] == _cell then
			_in = _obj.gridBitList[i][1]
			
			break
		endif
	repeat
return _in

/* Dumps raw gridBit data to screen for _dur seconds. */
function debugGridBit(_bitArr, _dur)
	var debugStr = []
	var i
	var j
	
	for i = 0 to len(_bitArr) loop
		debugStr = push(debugStr, str(_bitArr[i][0]) + chr(10))
		debugStr = push(debugStr, "")
		
		for j = 0 to g_intLen * bitLenToInt(g_cellBitLen) loop
			if j == g_intLen then
				debugStr[len(debugStr) - 1] += " "
			endif
			debugStr[len(debugStr) - 1] += 
				str(bitGet(_bitArr[i][1][bitLenToInt(g_cellBitLen) - 1 - floor(j / g_intLen)], 
				bitLenToInt(g_cellBitLen) * g_intLen - 1 - j % g_intLen))
		repeat
	repeat
	
	debugPrint(_dur, gheight() / 46, debugStr)
return void

/* Visualizes the object's gridBit data in 3D space for _dur seconds. */
function debugGridBit3d(_bitArr, _dur)
	var i
	var j
	var bitPos
	for i = 0 to len(_bitArr) loop
		for j = 0 to g_cellBitLen loop
			if bitGet(_bitArr[i][1][floor(j / g_intLen)], j % g_intLen) then
				bitPos = getPosFromGridIdx(_bitArr[i][0], j)
				
				debugLine(bitPos.pos - {0, 0.1, 0}, bitPos.pos + {0, 0.1, 0}, 0.1, _dur, g_theme.bgSelCol)
			endif
		repeat
	repeat
return void

// ----------------------------------------------------------------
// SYSTEM

/* Applies a new theme. */
function setTheme(_name, _reinit)
	var themeDef = getThemeDefs()
	
	var i
	for i = 0 to len(themeDef) loop
		if _name == themeDef[i].name then
			g_theme = themeDef[i]
		endif
	repeat
	
	if _reinit then
		setSpriteColor(g_cur.spr, {g_theme.bgSelCol.r, g_theme.bgSelCol.g, g_theme.bgSelCol.b, g_sprAlpha})
		
		updateCurCellOutlinePos()
		updateCamCellOutlinePos()
	endif
return void

/* This function is a wrapper for editor-only functions that is left blank in
the Core Loader, which allows non-editor calls where the target function 
doesn't exist to silently fail instead of throwing a FUZE error. */
// CORE LOADER
function edFunction(ref _in, _funcName, _argArr)
	if _funcName == "promptObjDefRelink" then
		promptObjDefRelink(_in, _argArr[0], _argArr[1])
	endif
	
	loop if _funcName == "setGrpLightsSprScale" then
		_in = setGrpLightsSprScale(_argArr[0], _argArr[1])
		break endif
	if _funcName == "worldPosToScreenPos" then
		_in = worldPosToScreenPos(_argArr[0], _argArr[1], _argArr[2], 
			_argArr[3], _argArr[4])
		break endif
	if _funcName == "getGrpLightsTypes" then
		_in = getGrpLightsTypes(_argArr[0])
		break
	endif break repeat
return _in

	// ----------------------------------------------------------------
	// CAMERA

/* Per-frame camera updater. */
function updateCam(_c)
	var oldPos = g_cam.pos
	var oldFwd = g_cam.fwd
	var oldUp = g_cam.up
	var oldDir = g_cam.dir
	var oldCell = g_cam.cell
	var oldCellPos = g_cam.cellPos
	
	_c = applyKb(_c, g_bind.cam).c
	
	g_cam.fwd = axisRotVecBy(
		g_cam.fwd,
		g_cam.up,
		_c.rx * deltaTime() * g_cam.rotSpd * -1 * (1 - abs(g_cam.fwd.y) * 0.75)
	)
	g_cam.r = axisRotVecBy(flattenY(g_cam.fwd), {0, 1, 0}, -90)
	var newFwd = axisRotVecBy(
		g_cam.fwd,
		g_cam.r,
		_c.ry * deltaTime() * g_cam.rotSpd
	)
	var newUp = normalize(cross(g_cam.r, newFwd))
	
	// Prevent flipping camera upsidedown
	if newUp.y > 0.1 then
		g_cam.fwd = newFwd
		g_cam.up = newUp
	else
		g_cam.up = normalize(cross(g_cam.r, g_cam.fwd))
	endif
	
	if _c.zr then
		if g_cam.worldMovement then
			g_cam.pos += flattenY(g_cam.fwd) * deltaTime() * g_cam.movSpd
		else
			g_cam.pos += g_cam.fwd * deltaTime() * g_cam.movSpd
		endif
	else if _c.zl then
		if g_cam.worldMovement then
			g_cam.pos -= flattenY(g_cam.fwd) * deltaTime() * g_cam.movSpd
		else
			g_cam.pos -= g_cam.fwd * deltaTime() * g_cam.movSpd
		endif
	endif endif
	
	loop if _c.up then
		if g_cam.worldMovement then
			g_cam.pos += {0, 1, 0} * deltaTime() * g_cam.movSpd
		else
			g_cam.pos += g_cam.up * deltaTime() * g_cam.movSpd
		endif
		break endif
	if _c.down then
		if g_cam.worldMovement then
			g_cam.pos += {0, -1, 0} * deltaTime() * g_cam.movSpd
		else
			g_cam.pos += g_cam.up * -1 * deltaTime() * g_cam.movSpd
		endif
		break endif
	if _c.right then
		g_cam.pos += g_cam.r * deltaTime() * g_cam.movSpd
		break endif
	if _c.left then
		g_cam.pos += g_cam.r * -1 * deltaTime() * g_cam.movSpd
		break
	endif break repeat
	
	if g_cam.collisionMode then
		updateCamCollisions(false)
	else
		g_cam.lastColContext.collision = []
		updateCamCellContext(false)
		setObjectPos(g_cam.collider, g_cam.pos)
		objectPointAt(g_cam.collider, g_cam.pos + g_cam.fwd)
	endif
	
	g_cam.delta = g_cam.pos - oldPos
	g_cam.dir = g_cam.pos + g_cam.fwd
	setCamera(g_cam.pos, g_cam.dir)
	
	if !len(g_cam.lastColContext.collision) or !g_cam.lastColContext.colThisFrame then
		if g_cam.cellPos != oldCellPos then
			var lightShowAdj = getAdjAffectedByMovement(getCellDir(g_cam.cellPos - oldCellPos))
			var lightHideAdj = getAdjAffectedByMovement(getCellDir(oldCellPos - g_cam.cellPos))
			
			g_lightIconLoader.show = []
			g_lightIconLoader.hide = []
			
			var cellIdx = -1
			var adj = getAdj(g_cam.cell, g_cam.cellPos)
			var oldAdj = getAdj(oldCell, oldCellPos)
			
			var i
			for i = 0 to len(lightShowAdj) loop
				cellIdx = adj[lightShowAdj[i]]
				if cellIdx >= 0 then
					g_lightIconLoader.show = push(g_lightIconLoader.show, cellIdx)
				endif
			repeat
			
			for i = 0 to len(lightHideAdj) loop
				cellIdx = oldAdj[lightHideAdj[i]]
				if cellIdx >= 0 then
					g_lightIconLoader.hide = push(g_lightIconLoader.hide, cellIdx)
				endif
			repeat
			
			updateCamCellOutlinePos()
		endif
	endif
	
	if g_cam.pos != oldPos or g_cam.fwd != oldFwd then
		updateViewport()
	endif
return void

/* Updates postion and rotation for editor widgets that follow the camera. */
function updateViewport()
	setObjectPos(g_viewport, g_cam.pos)
	objectPointAt(g_viewport, g_cam.dir)
	updateCompassPos()
	updateCurPos2d()
return void

/* Updates the axis visualization. */
function updateCompassPos()
	setObjectPos(g_compass.obj.grp, screenPosToWorldPos({gwidth() - gwidth() / 16, gheight() / 1.66}, 0.25, g_cam.fwd, g_cam.up, g_cam.pos, g_cam.fov))
	setObjectScale(g_compass.obj.grp, g_compass.scale * getUiFovScale(g_cam.fov))
return void

	// ----------------------------------------------------------------
	// CURSOR

/* Moves cursor and makes cursor updates. */
function moveCur(_c)
	function moveCur_rotPosOffset(_offset)
		var snapCamR = float_min
		
		if g_cDat[g_cIdx.l].held then
			snapCamR = snapAngle({g_cam.r.x, g_cam.r.z}, 8)
			_offset = axisRotVecBy(_offset, vecFromRot(snapCamR, 0), 90)
		endif
		
		var result = [
			.offset = _offset,
			.axis = snapCamR
		]
	return result
	
	var kbResult = applyKb(_c, g_bind.cursor)
	_c = kbResult.c
	
	if g_cur.mode == "move" or g_cur.mode == "masssel" then
		var moveRes = 6 // Round position to 6 decimal places
		
		if _c.l then
			g_cDat[g_cIdx.l].held = true
		else if !_c.l then
			g_cDat[g_cIdx.l].held = false
		endif endif	
		
		if leftStickInputStarted(_c, kbResult.kbActive) then
			var flatCamFwd = flattenY(g_cam.fwd)
			var rotInput = axisRotVecBy({_c.lx, 0, _c.ly}, {0, 1, 0}, atan2(flatCamFwd.z, flatCamFwd.x))
			var snapDir = snapAngle({rotInput.z, rotInput.x}, 8)
			var axis
			var tol = 0.001
			var posOffset
			
			loop if g_cur.posSnapMode == 0 then // No snap
				posOffset = normalize(vecFromRot(snapDir, 0)) * length({_c.lx, _c.ly}) * 0.1
				var result = moveCur_rotPosOffset(posOffset)
				posOffset = result.offset
				axis = result.axis
				break endif
			if g_cur.posSnapMode == 1 then // Snap by
				posOffset = normalize(vecFromRot(snapDir, 0)) * abs(g_cur.posSnapAmount)
				var result = moveCur_rotPosOffset(posOffset)
				posOffset = result.offset
				axis = result.axis
				break endif
			if g_cur.posSnapMode == 2 then // Snap to
				var posInc = {1, 1, 1}
				var negInc = {-1, -1, -1}
				posInc = {ceil(g_cur.pos.x / g_cur.posSnapAmount) * g_cur.posSnapAmount - g_cur.pos.x,
					ceil(g_cur.pos.y / g_cur.posSnapAmount) * g_cur.posSnapAmount - g_cur.pos.y,
					ceil(g_cur.pos.z / g_cur.posSnapAmount) * g_cur.posSnapAmount - g_cur.pos.z}
				negInc = {(floor(g_cur.pos.x / g_cur.posSnapAmount) * g_cur.posSnapAmount - g_cur.pos.x) * -1,
					(floor(g_cur.pos.y / g_cur.posSnapAmount) * g_cur.posSnapAmount - g_cur.pos.y) * -1,
					(floor(g_cur.pos.z / g_cur.posSnapAmount) * g_cur.posSnapAmount - g_cur.pos.z) * -1}
				posOffset = normalize(vecFromRot(snapDir, 0))
				var result = moveCur_rotPosOffset(posOffset)
				posOffset = result.offset
				axis = result.axis
				var adjCurPos = g_cur.pos
				
				var i
				var offsetCache
				
				for i = 0 to 3 loop
					/* Snapping to grid unit snaps to 1 + 0.5, which puts the cursor in the
					center of the grid cube. Because this offset can't be generated by simply 
					multiplying, it's a case that needs to be specially handled. */
					if g_cur.posSnapAmount == -1 then
						adjCurPos[i] += 0.5
					endif
					
					if equals(mod(adjCurPos[i], abs(g_cur.posSnapAmount)), 0, tol) then
						posOffset[i] *= abs(g_cur.posSnapAmount)
					else
						offsetCache = posOffset[i]
						
						if posOffset[i] > 0 then
							posOffset[i] *= (floor(g_cur.pos[i] / abs(g_cur.posSnapAmount)) + 1) * 
								abs(g_cur.posSnapAmount) - g_cur.pos[i]
							
							if g_cur.posSnapAmount == -1 then
								if g_cur.pos[i] < floor(g_cur.pos[i] / abs(g_cur.posSnapAmount)) + 0.5 then 
									posOffset[i] -= 0.5 * offsetCache
								else
									posOffset[i] += 0.5 * offsetCache
								endif
							endif
						else if posOffset[i] < 0 then
							posOffset[i] *= ((ceil(g_cur.pos[i] / abs(g_cur.posSnapAmount)) - 1) * 
								abs(g_cur.posSnapAmount) - g_cur.pos[i]) * -1
							
							if g_cur.posSnapAmount == -1 then
								if g_cur.pos[i] > floor(g_cur.pos[i] / abs(g_cur.posSnapAmount)) + 0.5 then
									posOffset[i] -= 0.5 * offsetCache
								else
									posOffset[i] += 0.5 * offsetCache
								endif
							endif
						endif endif
					endif
				repeat
				
				break
			endif break repeat
			
			g_cur.prevPos = g_cur.pos
			
			if (mod(snapDir, 90) == 0 and equals(posOffset.y, 0, tol)) 
					or (equals(posOffset.x, 0, tol) and equals(posOffset.z, 0, tol)) then
				g_cur.pos += posOffset
			else if equals(posOffset.y, 0, tol) or abs(axis) == 90 
					or abs(axis) == 180 or abs(axis) == 0 then
				g_cur.pos += posOffset * sqrt(2)
			else
				g_cur.pos += posOffset * {2, sqrt(2), 2}
			endif endif
			
			g_cur.pos = roundVec(g_cur.pos, moveRes)
			g_cur.activeObj.pos = g_cur.pos
			
			updateCurContexts(false)
		endif
	endif
return void

/* Updates stuff that changes based on cursor state. */
function updateCurContexts(_flush)
	updateCurWidgets()
	updateCurCollisions(_flush)
return void

/* Projects cursor 3D position to 2D screen position. */
function updateCurPos2d()
	g_cur.pos2d = worldPosToScreenPos(g_cur.pos, g_cam.fwd, g_cam.up, g_cam.pos, g_cam.fov)
return void

/* Performs rotation on the brush object. */
function rotateCur(_c)
	var kbResult = applyKb(_c, g_bind.edit)
	_c = kbResult.c
	
	if g_cur.mode == "rotate" then
		if leftStickInputStarted(_c, kbResult.kbActive) then
			var vAxis
			var hAxis
			
			if g_cur.rotMode then
				vAxis = g_cur.up
				hAxis = normalize(cross(g_cur.fwd, g_cur.up))
			else
				vAxis = {0, 1, 0}
				hAxis = g_cur.fwd
			endif
			
			var xVal = 0
			var yVal = 0
			
			if abs(_c.lx) > 0.3 then
				xVal = _c.lx
			endif
			if abs(_c.ly) > 0.3 then
				yVal = _c.ly * -1
			endif
			
			if xVal != 0 then
				rotateActiveObj(vAxis, xVal * deltaTime() * 250, g_cur.rotSnapMode, g_cur.rotSnapAmount, false)
			else if yVal != 0 then
				rotateActiveObj(hAxis, yVal * deltaTime() * 250, g_cur.rotSnapMode, g_cur.rotSnapAmount, false)
			endif endif
			
			updateCurWidgets()
		endif
		
		if _c.l and !g_cDat[g_cIdx.l].held then
			g_cDat[g_cIdx.l].held = true
		else if !_c.l and g_cDat[g_cIdx.l].held then
			g_cDat[g_cIdx.l].held = false
			g_cur.rotMode = setRotObjMode(g_cur.rotator, 1 - g_cur.rotMode)
		endif endif
	endif
return void

/* Performs scaling on the brush object. */
function scaleCur(_c)
	var kbResult = applyKb(_c, g_bind.edit)
	_c = kbResult.c
	
	if g_cur.mode == "scale" then
		if leftStickInputStarted(_c, kbResult.kbActive) then
			var scaleInc = {0, 0, 0}
			
			if g_cur.scaleSnapMode == 0 then
				scaleInc = {1, 1, 1} * _c.ly * deltaTime() * 15
			else if g_cur.scaleSnapMode == 1 then
				scaleInc = {1, 1, 1} * g_cur.scaleSnapAmount * getSign(_c.ly)
			else
				var tol = 0.001
				var i
				
				for i = 0 to 3 loop
					if equals(mod(g_cur.scale[i], g_cur.scaleSnapAmount), 0, tol) then
						scaleInc[i] = g_cur.scaleSnapAmount * getSign(_c.ly)
					else
						if getSign(_c.ly) > 0 then
							scaleInc[i] = g_cur.scaleSnapAmount + (g_cur.scaleSnapAmount * floor(g_cur.scale[i] / g_cur.scaleSnapAmount) - g_cur.scale[i])
						else
							scaleInc[i] = -g_cur.scaleSnapAmount + (g_cur.scaleSnapAmount * (floor(g_cur.scale[i] / g_cur.scaleSnapAmount) + 1) - g_cur.scale[i])
						endif
					endif
				repeat
			endif endif
			
			var scaleDelta
			
			loop if g_cur.scaleMode == 0 then
				scaleDelta = {scaleInc.x, scaleInc.y, scaleInc.z}
				break endif
			if g_cur.scaleMode == 1 then
				scaleDelta = {scaleInc.x, 0, scaleInc.z}
				break endif
			if g_cur.scaleMode == 2 then
				scaleDelta = {0, scaleInc.y, 0}
				break endif
			if g_cur.scaleMode == 3 then
				scaleDelta = {0, 0, scaleInc.z}
				break endif
			if g_cur.scaleMode == 4 then
				scaleDelta = {scaleInc.x, 0, 0}
				break
			endif break repeat
			
			g_cur.scale += scaleDelta
			if g_cur.isMerged or !len(g_cur.activeObj.children)then
				setObjectScale(g_cur.activeObj.obj, g_cur.scale)
			else
				var i
				var childScale
				
				for i = 0 to len(g_cur.activeObj.children) loop
					childScale = 
						applyGrpScale(g_cur.scale, g_cur.activeObj.children[i].scale, 
						g_cur.activeObj.children[i].fwd, g_cur.activeObj.children[i].up)
					
					setObjectScale(g_cur.activeObj.children[i].obj, childScale)
					setObjectPos(g_cur.activeObj.children[i].obj, g_cur.activeObj.children[i].pos * g_cur.scale)
				repeat
			endif
			
			updateCurWidgets()
		endif
		
		if _c.l and !g_cDat[g_cIdx.l].held then
			g_cDat[g_cIdx.l].held = true
			g_cur.scaleMode = wrap(g_cur.scaleMode + 1, 0, 5)
			updateCurWidgets()
		else if !_c.l and g_cDat[g_cIdx.l].held then
			g_cDat[g_cIdx.l].held = false
		endif endif
	endif
return void

/* Skips next cursor mode if the current brush doesn't support it. */
function updateCurMode()
	if (g_cur.mode == "rotate" and !objCanRotate(g_cur.activeObj))
			or (g_cur.mode == "scale" and !objCanScale(g_cur.activeObj)) then
		advanceCurMode([ .r = 1 ])
	endif
return void

/* Changes the cursor mode and initializes the mode. */
function advanceCurMode(_c)
	_c = applyKb(_c, g_bind.edit).c
	
	if _c.r then
		if !g_cDat[g_cIdx.r].held and g_cur.mode != "masssel" then
			endCurMode(g_cur.mode)
			
			loop if g_cur.mode == "move" and objCanRotate(g_cur.activeObj) then
				g_cDat[g_cIdx.r].held = true
				g_cur.mode = "rotate"
				
				var rotSize = getRotObjScale(getObjDef(-1, g_activeObj).ext, g_cur.scale)
				
				g_cur.rotator = createRotObj(g_cur.pos, rotSize)
				setRotObjMode(g_cur.rotator, g_cur.rotMode)
				updateCurWidgets()
				break endif
			if g_cur.mode == "rotate" then
				if objCanScale(g_cur.activeObj) then
					g_cDat[g_cIdx.r].held = true
					g_cur.mode = "scale"
					g_cur.scaler = createScaleCubeObj(g_cur.pos, getObjDef(-1, g_activeObj).ext)
					updateCurWidgets()
				else
					g_cDat[g_cIdx.r].held = true
					g_cur.mode = "move"
				endif
				break endif
			if g_cur.mode == "scale" then
				g_cDat[g_cIdx.r].held = true
				g_cur.mode = "move"
				break
			endif break repeat
		endif
	else if !_c.r then
		g_cDat[g_cIdx.r].held = false
	endif endif	
return void

/* Removes 3D widgets associated with a terminated cursor mode. */
function endCurMode(_mode)
	loop if _mode == "rotate" then
		removeRotObj(g_cur.rotator)
		g_cur.rotator = [ .obj = [] ]
		break endif
	if _mode == "scale" then
		removeScaleCubeObj(g_cur.scaler)
		g_cur.scaler = [ .obj = [] ]
		break endif
	if _mode == "masssel" then
		removeGenericObj(g_cur.massSel.obj)
		g_cur.massSel = -1
		break
	endif break repeat
return void

/* Updates the 3D cursor widgets as appropriate to the cursor mode. */
function updateCurWidgets()
	var snapped = floorVec(g_cur.pos) + 0.5
	setObjectPos(g_cur.objGrp, snapped)
	setObjectPos(g_cur.xyz.grp, g_cur.pos)
	setObjectPos(g_cur.activeObj.obj, g_cur.pos)
	setObjRot(g_cur.xyz.grp, g_cur.pos, g_cur.fwd, g_cur.up)
	updateCurCellOutlinePos()
	
	if g_cur.mode == "rotate" then
		setObjectPos(g_cur.rotator.grp, g_cur.pos)
		setObjRot(g_cur.rotator.grp, g_cur.pos, g_cur.fwd, g_cur.up)
		safeObjectPointAt(g_cur.rotator.obj[3].grp, {0, 0, 0}, worldVecToLocalVec({0, 1, 0}, g_cur.fwd, g_cur.up, {0, 0, 0}))
		setObjRot(g_cur.xyz.grp, g_cur.pos, g_cur.fwd, g_cur.up)
		var rotSize = getRotObjScale(g_obj[decodeBank(-1, g_cur.activeObj.bankIdx)][decodeIdx(-1, g_cur.activeObj.bankIdx)].ext, 
			g_cur.scale)
		if rotSize != g_cur.rotator.rad then
			removeRotObj(g_cur.rotator)
			g_cur.rotator = createRotObj(g_cur.pos, rotSize)
			setRotObjMode(g_cur.rotator, g_cur.rotMode)
		endif
	else if g_cur.mode == "scale" then
		setObjRot(g_cur.scaler.grp, g_cur.pos, g_cur.fwd, g_cur.up)
		var newExt = [
			.lo = getObjDef(-1, g_activeObj).ext.lo * g_cur.scale,
			.hi = getObjDef(-1, g_activeObj).ext.hi * g_cur.scale
		]	
		setScaleCubeObjExt(g_cur.scaler, newExt)
		setObjectPos(g_cur.scaler.grp, g_cur.pos)
		g_cur.xyz = setXYZObjExt(g_cur.xyz, newExt, 0.5)
		setObjRot(g_cur.xyz.grp, g_cur.pos, g_cur.fwd, g_cur.up)
		var state = getScaleModeState(g_cur.scaleMode)
		
		if !arrayEquals(g_cur.scaler.state, state) then
			g_cur.scaler = setScaleCubeObjState(g_cur.scaler, state)
		endif
	endif endif
	
	var lightContainer = g_cur.activeObj
	lightContainer.pos = g_cur.pos
	setGrpLightsPos(lightContainer, g_cam.fov)
	updateCurPos2d()
return void

	// ----------------------------------------------------------------
	// UI

/* Gets scale factor to apply distance to sprites placed in 3D space. */
function scale3dSprite(_pos, _scaleFactor, _camFwd, _camUp, _camPos)
return (gheight() / worldVecToLocalVec(_pos, _camFwd, _camUp, _camPos).z) * _scaleFactor

/* Shows or hides light object icons depending on distance from camera. */
function updateLightSpr()
	var scale = scale3dSprite(g_cur.pos, 0.002, g_cam.fwd, g_cam.up, g_cam.pos)
	
	if !g_objMenu.isOpen then
		setSpriteLocation(g_cur.spr, g_cur.pos2d)
		setSpriteScale(g_cur.spr, {scale, scale})
		setGrpLightsSprScale(g_cur.activeObj, {scale, scale})
		
		var lightContainer = g_cur.activeObj
		lightContainer.pos = g_cur.pos
		lightContainer.fwd = g_cur.fwd
		lightContainer.up = g_cur.up
		lightContainer.scale = g_cur.scale
		updateGrpLightsSprPos(lightContainer, g_cam.fov)
		updateGrpLightsSprScale3d(lightContainer, g_cam)
	endif
	
	var i
	var hide
	var j
	
	for i = 0 to len(g_lightIconLoader.hide) loop
		hide = g_lightIconLoader.hide[i]
		
		for j = g_cellObjStart to len(g_cell[hide]) loop
			if !isMapObjRef(-1, g_cell[hide][j]) then
				if setGrpLightsSprVisibility(g_cell[hide][j], false, []) then
					// If the unloaded cells have lights, remove those lights from the light icon array
					removeLightIconRecord(hide)
				endif
			endif
		repeat
	repeat
	
	var show
	
	for i = 0 to len(g_lightIconLoader.show) loop
		show = g_lightIconLoader.show[i]
		
		for j = g_cellObjStart to len(g_cell[show]) loop
			if !isMapObjRef(-1, g_cell[show][j]) then
				if setGrpLightsSprVisibility(g_cell[show][j], true, []) then
					g_lightIcons = push(g_lightIcons, [ .cell = show, .idx = j ])
					
					if g_objMenu.isOpen then
						setGrpLightsSprVisibility(g_cell[show][j], false, g_cell.show)
					endif
				endif
			endif
		repeat
	repeat
	
	if !g_objMenu.isOpen then
		var obj
		
		for i = 0 to len(g_lightIcons) loop
			obj = getMapObjFromRef(g_cell[g_lightIcons[i].cell][g_lightIcons[i].idx])
			updateGrpLightsSprPos(obj, g_cam.fov)
			updateGrpLightsSprScale3d(obj, g_cam)
		repeat
	endif
	
	g_lightIconLoader.show = []
	g_lightIconLoader. hide = []
return void

/* Draws object names and cell/index info in 3D space. */
function drawObjLabels()		
	if g_cam.drawObjLabels then
		if !g_objMenu.isOpen then
			var adj = getAdj(g_cam.cell, g_cam.cellPos)
			
			var i
			var cellIdx
			var j
			var obj
			var objDef
			var extCenter
			var screenPos
			var scale
			var objName
			var width
			var k
			
			for i = 0 to len(adj) loop
				cellIdx = adj[i]
				
				if cellIdx != -1 then
					for j = g_cellObjStart to len(g_cell[cellIdx]) loop
						obj = g_cell[cellIdx][j]
						
						if !isMapObjRef(-1, obj) then
							screenPos = worldPosToScreenPos(obj.pos, g_cam.fwd, g_cam.up, g_cam.pos, g_cam.fov)
							
							if screenPos.x >= 0 and screenPos.x <= gwidth() 
									and screenPos.y >= 0 and screenPos.y <= gheight() then
								scale = scale3dSprite(obj.pos, 0.1, g_cam.fwd, g_cam.up, g_cam.pos)
								textSize(scale)
								
								getMapObjName(objName, obj)
								width = textWidth(objName)
								
								drawText(screenPos.x - width / 2, screenPos.y, scale,
									g_theme.bgSelCol, objName)
										
								for k = 0 to len(obj.cellIdx) loop
									drawText(screenPos.x - width / 2, screenPos.y + (k + 1) * scale, scale,
										g_theme.bgSelCol, ifElse(g_dirtyMap, "*", "") + "(g_cell[" + decodeCell(obj.cellIdx[k]) + "][" 
										+ decodeIdx(-1, obj.cellIdx[k]) + "])")
								repeat
							endif
						endif
					repeat
				endif
			repeat
		endif
	endif
return void

/* Displays status bar at the bottom of the screen. */
function drawStatusBar()
	if !g_objMenu.isOpen then
		var barY = gheight() - g_statusBarH
		var ctlX = gwidth() - gwidth() / 4
		var xMargin = gwidth() / 256
		
		box(0, barY, gwidth(), g_statusBarH, g_theme.inactiveCol, 0)
		box(0 + g_menuBorderW, barY + g_menuBorderW, gwidth() - g_menuBorderW * 2, g_statusBarH - g_menuBorderW * 2, g_theme.bgCol, 0)
		box(ctlx, barY, gwidth() - ctlX, g_statusBarH, g_theme.inactiveCol, 0)
		box(ctlX + g_menuBorderW, barY + g_menuBorderW, gwidth() - ctlX - g_menuBorderW * 2, g_statusBarH - g_menuBorderW * 2, g_theme.bgCol, 0)
		
		loop if g_cur.mode == "move" then
			var movModeStr
			if g_cDat[g_cIdx.l].held then
				movModeStr = "camera x (left/right) and global y (up/down)"
			else
				movModeStr = "camera x (left/right) and camera z (up/down)"
			endif
			
			drawText(xMargin, barY, g_statusTextH, g_theme.textCol, "Editing position on " + movModeStr)
			drawText(xMargin, barY + g_statusTextH * 2, g_statusTextH, g_theme.textCol, "Position: " + vec3ToStr(g_cur.pos, g_dispDec))
			break endif
		if g_cur.mode == "rotate" then
			var rotModeStr
			if g_cur.rotMode then
				rotModeStr = "local y (left/right) and local x (up/down) "
			else
				rotModeStr = "global y (left/right) and local z (up/down)"
			endif
			
			var rotSnapModeStr = getSnapModeStr(g_cur.rotSnapMode)
			if g_cur.rotSnapMode > 0 then
				rotSnapModeStr += " " + g_cur.rotSnapAmount + chr(176)
			endif
			
			drawText(xMargin, barY, g_statusTextH, g_theme.textCol, "Editing rotation on " + rotModeStr)
			drawText(xMargin, barY + g_statusTextH, g_statusTextH, g_theme.textCol, rotSnapModeStr)
			drawText(xMargin, barY + g_statusTextH * 2, g_statusTextH, g_theme.textCol,
				"Fwd: " + vec3ToStr(g_cur.fwd, g_dispDec) + " | " + 
				"Up: " + vec3ToStr(g_cur.up, g_dispDec))
			break endif
		if g_cur.mode == "scale" then
			var scaleModeStr
			loop if g_cur.scaleMode == 0 then
				scaleModeStr = "all local axes (up/down)"
				break endif
			if g_cur.scaleMode == 1 then
				scaleModeStr = "local x and z (up/down) "
				break endif
			if g_cur.scaleMode == 2 then
				scaleModeStr = "local y (up/down)       "
				break endif
			if g_cur.scaleMode == 3 then
				scaleModeStr = "local z (up/down)       "
				break endif
			if g_cur.scaleMode == 4 then
				scaleModeStr = "local x (up/down)       "
				break 
			endif break repeat
			
			var scaleSnapModeStr = getSnapModeStr(g_cur.scaleSnapMode)
			if g_cur.scaleSnapMode > 0 then
				scaleSnapModeStr += " " + g_cur.scaleSnapAmount
			endif
			
			drawText(xMargin, barY, g_statusTextH, g_theme.textCol, "Editing scale on " + scaleModeStr)
			drawText(xMargin, barY + g_statusTextH, g_statusTextH, g_theme.textCol, scaleSnapModeStr)
			drawText(xMargin, barY + g_statusTextH * 2, g_statusTextH, g_theme.textCol,  
				"Scale: " + vec3ToStr(g_cur.scale, g_dispDec) + " | " + 
				"Extent: " + vec3ToStr(getObjDef(-1, g_activeObj).ext.lo * g_cur.scale, g_dispDec) + " " 
				+ chr(8212) + " " + vec3ToStr(getObjDef(-1, g_activeObj).ext.hi * g_cur.scale, g_dispDec))
			break endif
		if g_cur.mode == "masssel" then
			var movModeStr
			if g_cDat[g_cIdx.l].held then
				movModeStr = "camera x (left/right) and global y (up/down)"
			else
				movModeStr = "camera x (left/right) and camera z (up/down)"
			endif
			
			drawText(xMargin, barY, g_statusTextH, g_theme.textCol, "Editing mass selection range on " + movModeStr)
			drawText(xMargin, barY + g_statusTextH, g_statusTextH, g_theme.textCol, "Selection size: " + vec3ToStr(g_cur.massSel.ext.hi, g_dispDec))
			drawText(xMargin, barY + g_statusTextH * 2, g_statusTextH, g_theme.textCol, "Position: " + vec3ToStr(g_cur.pos, g_dispDec))
			break
		endif break repeat
		
		if g_cur.mode == "move" then
			drawText(ctlx + xMargin, barY, g_statusTextH, g_theme.textCol, 
				"Hold (L) to move vertically")
			drawText(ctlx + xMargin, barY + g_statusTextH, g_statusTextH, g_theme.textCol, 
				"(R) to toggle edit mode")
		else
			drawText(ctlx + xMargin, barY, g_statusTextH, g_theme.textCol, 
				"(L) to toggle axes")
			drawText(ctlx + xMargin, barY + g_statusTextH, g_statusTextH, g_theme.textCol, 
				"(R) to toggle edit mode")
		endif
		
		if g_freezeFile then
			drawText(ctlx + xMargin, barY - g_statusTextH, g_statusTextH, red, 
				"FILE IS FROZEN")
		endif
		drawText(ctlx + xMargin, barY + g_statusTextH * 2, g_statusTextH, g_theme.textCol, 
			"Map name: " + ifElse(g_dirtyMap, "*", "") + g_currentMapName)
			
		boxW = (gwidth() / 8)
		boxH = (gheight() / 4)
		box(boxW * 7, boxH * 3 - g_statusBarH, boxW, boxH, grey, 1)
	endif
return void

/* Set g_pauseRequest to a value in seconds to buffer a sleep() call. This allows 
all screen drawing to finish before sleeping so the screen won't sleep in a partially 
rendered state. */
function pause()
	if g_pauseRequest then
		sleep(g_pauseRequest)
		g_pauseRequest = 0
	endif
return void

/* Turns editor widgets on or off. */
function set3dUiVisibility(_vis)
	setXYZObjVisibility(g_compass.obj, _vis)
	setGroupVisibility(g_activeObj, _vis, true)
	setGroupVisibility(g_cur.activeObj, _vis, true)
	setSpriteVisibility(g_cur.spr, _vis)
	setXYZObjVisibility(g_cur.xyz, _vis)
	setGenericObjVisibility(g_cur.obj, _vis)
	
	if g_cur.mode == "rotate" then
		setRotObjVisibility(g_cur.rotator, _vis)
	else if g_cur.mode == "scale" then
		setScaleCubeObjVisibility(g_cur.scaler, _vis)
	endif endif
	
	if _vis then
		restoreGrpLightsBrightness(g_cur.activeObj)
	else
		setGrpLightsBrightness(g_cur.activeObj, 0)
	endif
return void

/* Enables/disables photo mode, which hides the UI and editor widgets. */
function setPhotoMode(_isEnabled)
	g_photoMode = _isEnabled
	set3dUiVisibility(!_isEnabled)
return void

/* Checks whether the universal blink state has changed and stores the 
appropriate data in g_blink. */
function updateBlink()
	if g_blink.state then
		if time() - g_blink.lastUpdateTime >= g_blink.dur1 then
			g_blink.state = 0
			g_blink.needUpdate = true
			g_blink.lastUpdateTime = time()
		else
			g_blink.needUpdate = false
		endif
	else
		if time() - g_blink.lastUpdateTime >= g_blink.dur0 then
			g_blink.state = 1
			g_blink.needUpdate = true
			g_blink.lastUpdateTime = time()
		else
			g_blink.needUpdate = false
		endif
	endif
return void

// ----------------------------------------------------------------
// DEBUG

/* General debug function for printing data to screen. */
function debug()
	/*
	var timer1 = time()
	getGrpCollisionBits(g_cell[0][g_cellObjStart], 0)
	timer1 = time() - timer1
	var timer2 = time()
	getGrpCollisionBits2(g_cell[0][g_cellObjStart], 0)
	timer2 = time() - timer2
	
	debugPrint(999, ["getGrpCollisionBits()", timer1, "getGrpCollisionBits2()", timer2])
	*/
	// /*
	textSize(g_menuTextSize * 0.6)
	ink(purple)
	printAt(15, 5, "CAM CELL: " + g_cam.cell)
	printAt(15, 6, "CAM CELLPOS: " + vec3ToStr(g_cam.cellPos, 2))
	//printAt(15, 7, g_cell[g_cam.cell][1])
	//printAt(15, 7, "CURSOR CAM ADJ: ")
	//printAt(15, 8, g_cell[g_cam.cell][1])
	
	printAt(15, 7, "CURSOR CELL: " + g_cur.cell)
	printAt(15, 8, g_cur.lastColContext.collision)
	//printAt(15, 9, "CUBE COLLISIONS, OBJLIST")
	//printAt(15, 10, g_cubeColCon.collision)
	//printAt(15, 11, g_cubeColCon.objList)
	//printAt(15, 12, "CAM COLLISION OBJLIST")
	//var i
	//for i = 0 to len(g_cam.lastColContext.objList) loop
		//printAt(15, 13 + i, str(g_cam.lastColContext.objList[i]))
	//repeat
		
	//printAt(30, 10, "g_lightIcons")
	//printAt(30, 11, g_lightIcons)
	//printAt(30, 12, "g_cur.lastColContext.objList")
	//printAt(30, 13, g_cur.lastColContext.objList)
	printAt(30, 14, "g_cam.lastColContext.objList")
	printAt(30, 15, g_cam.lastColContext.objList)
	printAt(30, 16, "g_cam.lastColContext.collision")
	printAt(30, 17, g_cam.lastColContext.collision)
	if len(g_cam.lastColContext.colDepth) then
		printAt(30, 18, g_cam.lastColContext.colDepth[0])
	endif
	printAt(30, 22, "g_cur.activeObj.col")
	printAt(30, 23, str(g_cur.activeObj.col))
	printAt(30, 24, "g_cur.activeObj.mat")
	printAt(30, 25, str(g_cur.activeObj.mat))
	
	if len(g_cur.lastColContext.collision) then
		printAt(30, 26, "UNDER CUR OBJ COL")
		printAt(30, 27, getMapObjFromRef(g_cell[g_cur.lastColContext.collision[0].cell][g_cur.lastColContext.collision[0].idx]).col)
	endif
	
	printAt(30, 28, str(g_cur.activeObj.mat))
	var i
	for i = 0 to len(g_cur.activeObj.children) loop
		printAt(30, 29 + i * 3, str(g_cur.activeObj.children[i].mat))
		var j
		for j = 0 to len(g_cur.activeObj.children[i].children) loop
			printAt(30, 29 + i * 3 + j, "  " + str(g_cur.activeObj.children[i].children[j].mat))
		repeat
	repeat
	//printAt(30, 16, "g_sel")
	//printAt(30, 17, g_sel)
	//if len(g_sel) then
	//	printAt(30, 18, "g_sel[0] bank/idx")
	//	printAt(30, 19, decodeBank(-1, getMapObjFromRef(g_cell[g_sel[0][0].cell][g_sel[0][0].idx]).bankIdx))
	//	printAt(36, 20, decodeIdx(-1, getMapObjfromRef(g_cell[g_sel[0][0].cell][g_sel[0][0].idx]).bankIdx))
	//endif
	
	//for i = g_cellObjStart to len(g_cell[46]) loop
	//	printAt(0, 36 + i, g_cell[46][i].cellIdx)
	//repeat
	//printAt(0, 37, getPosFromGridIdx(g_cur.cell, 13, 20))
	
	textSize(gheight() / 45)
	ink(green)
	printAt(0, 8, g_worldLights)
	updateDebugLines()
	
	if g_cur.mode == "masssel" then
		textSize = gwidth() / 15
		printAt(0, 9, g_cur.massSel.cell)
		var i
		for i = 0 to len(g_cur.massSel.contents) loop
			printAt(0, 21 + i, getMapObjName(-1, g_cur.massSel.contents[i]))
		repeat
	endif
	// */
return void

/* Draws a debug line that automaticaly disappears after _dur seconds. */
function debugLine(_start, _end, _w, _dur, _col)
	var mid = normalize(_end - _start) * (distance(_start, _end) / 2) + _start
	var l = [
		.obj = placeObject(cube, mid, {_w, _w, distance(_start, _end) / 2}),
		.dur = time() + _dur
	] 
	
	safeObjectPointAt(l.obj, mid, _end)
	setObjectMaterial(l.obj, _col, 0, 0)
	g_debugLines = push(g_debugLines, l)
return void

/* Checks existing debug lines and removes any that have expired. */
function updateDebugLines()
	var i = 0
	while i < len(g_debugLines) loop
		if time() > g_debugLines[i].dur then
			removeObject(g_debugLines[i].obj)
			g_debugLines = remove(g_debugLines, i)
			
			i -= 1
		endif
		
		i += 1
	repeat
return void

/* Prints text array to the screen for the given duration. */
function debugPrint(_time, _text)
return debugPrint(_time, -1, _text)

function debugPrint(_time, _size, _text)
	var target = getDrawTarget()
	
	setDrawTarget(framebuffer)
	ink(white)
	
	if _size >= 0 then
		textSize(_size)
	endif
	
	if _time > 0 then
		var timer = time()
		var i
		
		while _time > 0 loop
			clear()
			
			for i = 0 to len(_text) loop
				printAt(0, i, _text[i])
			repeat
			
			printAt(twidth() - len(str(_time)), theight() - 1, _time)
			update()
			
			_time -= (time() - timer)
			timer = time()
		repeat
	else
		var btnPrompt = "Press B to continue"
		
		clear()
		
		var i
		for i = 0 to len(_text) loop
			printAt(0, i, _text[i])
		repeat
		
		printAt(twidth() - len(btnPrompt), theight() - 1, btnPrompt)
		update()
		
		var c
		
		loop
			g_kb = getKeyboardBuffer()
			c = controls(0)
			c = applyKb(c, g_bind.menu).c
			
			if c.b and !g_cDat[g_cIdx.b].held then
				g_cDat[g_cIdx.b].held = true
				break
			else if !c.b then
				g_cDat[g_cIdx.b].held = false
			endif endif
		repeat
	endif
	
	setDrawTarget(target)
return void

function breakpoint()
return breakpoint("")

function breakpoint(_text)
	if g_breakpoint then
		debugPrint(0, gheight() / 20, ["--Breakpoint--", "", _text])
	endif
return void

// ----------------------------------------------------------------
// ICONS

/* Icons are loaded from code rather than from image editor assets to make
updating the program easier for the end user. The source code for the new 
program version needs to be copied into the old project to retain the old 
save file, and using image editor assets would require that those assets 
also be manually copied if the image(s) were changed by the update. */
function loadCelqiImg(_idx)
return loadCelqiImg(_idx, white, black)

function loadCelqiImg(_idx, _fillCol, _outlineCol)
	var l = {0, 0, 0, 0}
	var o = _outlineCol
	var _ = _fillCol
	var img
	
	if _idx == 0 then
		img = [
		l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l, // 0
		l,l,l,l,l,l,l,l,l,o,o,o,_,_,_,_,_,_,_,_,o,o,o,l,l,l,l,l,l,l,l,l, // 1
		l,l,l,l,l,l,l,o,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,o,l,l,l,l,l,l,l, // 2
		l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l, // 3
		l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l, // 4
		l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l, // 5
		l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,_,o,o,_,_,_,_,o,o,o,l,l,l, // 6
		l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 7
		l,l,o,_,_,_,_,_,_,o,_,_,_,_,_,_,_,_,_,_,o,o,_,_,_,_,o,o,_,o,l,l, // 8
		l,o,_,_,_,_,_,_,o,_,_,_,_,_,_,_,_,o,_,o,_,_,o,_,_,o,_,_,o,_,o,l, // 9
		l,o,_,_,_,_,_,o,_,_,_,_,o,_,_,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o, // 10
		l,o,_,_,_,_,_,o,_,_,_,_,o,_,_,_,o,_,o,_,_,_,_,_,_,_,_,_,_,o,_,o, // 11
		o,_,_,_,_,_,o,_,_,_,_,_,_,o,_,o,o,_,_,o,_,_,o,o,o,o,_,_,o,_,_,o, // 12
		o,_,_,_,_,_,o,_,_,_,_,o,_,o,_,o,l,o,o,_,o,_,_,o,o,_,_,o,_,o,o,l, // 13
		o,_,_,_,_,_,o,_,_,_,_,o,_,o,_,o,l,o,_,o,_,_,_,o,o,_,_,_,o,_,o,l, // 14
		o,_,_,_,_,_,o,_,_,o,_,_,o,_,_,o,o,l,o,_,_,_,o,_,_,o,_,_,_,o,l,o, // 15
		o,_,_,_,_,_,_,o,_,o,_,o,_,_,_,o,l,l,l,o,o,o,_,_,_,_,o,o,o,l,l,l, // 16
		o,_,_,_,_,_,_,o,_,_,o,_,_,_,_,o,l,o,o,l,l,l,o,o,o,o,l,l,l,o,o,l, // 17
		o,_,_,_,_,_,_,_,o,o,_,_,_,_,_,o,l,o,_,o,l,l,l,l,l,l,l,l,o,_,o,l, // 18
		o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,o,_,_,o,l,l,l,l,l,l,o,_,_,o,l, // 19
		l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,_,_,_,_,o,l,l,l,l,o,_,_,_,o,l, // 20
		l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,_,_,_,_,o,l,o,o,l,o,_,_,_,o,l, // 21
		l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,_,_,_,_,_,o,_,_,o,_,_,_,_,o,l, // 22
		l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,o,_,_,_,_,_,_,_,_,_,_,o,l,l, // 23
		l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,o,_,_,_,_,_,_,_,_,o,l,l, // 24
		l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l, // 25
		l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l, // 26
		l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l, // 27
		l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l, // 28
		l,l,l,l,l,l,l,o,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,o,l,l,l,l,l,l,l, // 29
		l,l,l,l,l,l,l,l,l,o,o,o,_,_,_,_,_,_,_,_,o,o,o,l,l,l,l,l,l,l,l,l, // 30
		l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l // 31
		]
	else
		img = [
		l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l, // 0
		l,l,l,l,l,l,l,l,l,o,o,o,_,_,_,_,_,_,_,_,o,o,o,l,l,l,l,l,l,l,l,l, // 1
		l,l,l,l,l,l,l,o,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,o,l,l,l,l,l,l,l, // 2
		l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l, // 3
		l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l, // 4
		l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l, // 5
		l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l, // 6
		l,l,o,_,_,_,_,_,_,_,_,_,_,o,o,o,o,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 7
		l,l,o,_,_,_,_,_,_,_,_,o,o,_,_,_,_,o,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 8
		l,o,_,_,_,_,_,_,_,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l, // 9
		l,o,_,_,_,_,_,_,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l, // 10
		l,o,_,_,_,_,_,_,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l, // 11
		o,_,_,_,_,_,_,_,o,_,_,o,_,_,o,_,o,o,_,_,_,o,o,_,o,_,_,_,_,_,_,o, // 12
		o,_,_,_,_,_,_,_,o,_,o,_,_,o,_,o,_,_,_,o,_,_,_,_,_,o,_,_,_,_,_,o, // 13
		o,_,_,_,_,_,_,_,_,o,o,o,o,o,o,_,_,o,o,_,_,_,o,o,_,_,_,_,_,_,_,o, // 14
		o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,o,_,_,o,_,_,_,o,_,_,_,_,_,_,o, // 15
		o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,o,o,_,o,_,_,_,o,_,_,_,_,_,_,o, // 16
		o,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,o,_,o,_,_,_,_,_,_,_,_,_,o,_,o, // 17
		o,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,o,o,o,_,o,_,o,_,_,_,o,o,_,_,o,o, // 18
		o,_,_,_,_,_,_,_,_,_,_,_,_,o,o,o,l,o,_,_,_,_,o,o,_,_,_,_,o,_,_,o, // 19
		l,o,_,_,_,_,_,_,_,_,_,_,_,o,_,_,o,l,o,o,_,_,o,o,o,_,_,_,o,_,o,l, // 20
		l,o,_,_,_,_,_,_,_,_,_,_,o,_,_,_,o,l,o,_,o,o,_,_,_,_,_,_,_,_,o,l, // 21
		l,o,_,_,_,_,_,_,_,_,_,_,o,_,_,_,o,l,o,_,_,o,_,_,o,_,o,o,_,o,l,l, // 22
		l,l,o,_,_,_,_,_,_,_,_,o,_,_,_,_,o,l,l,o,_,_,o,_,_,o,_,_,_,o,l,l, // 23
		l,l,o,_,_,_,_,_,_,_,_,o,_,_,_,_,o,l,l,l,o,o,o,_,o,_,o,_,o,l,l,l, // 24
		l,l,l,o,_,_,_,_,_,_,_,o,_,_,_,o,l,l,l,l,l,l,l,o,o,o,o,o,l,l,l,l, // 25
		l,l,l,l,o,_,_,_,_,_,_,o,_,_,o,o,o,l,o,o,o,o,o,l,o,l,l,l,l,l,l,l, // 26
		l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,o,o,_,_,_,_,_,o,l,l,l,l,l,l,l,l, // 27
		l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,o,_,_,_,_,_,_,o,l,l,l,l,l,l,l,l, // 28
		l,l,l,l,l,l,l,o,o,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l,l,l, // 29
		l,l,l,l,l,l,l,l,l,o,o,o,_,_,_,_,_,_,_,_,o,o,l,l,l,l,l,l,l,l,l,l, // 30
		l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l // 31
		]
	endif
	
	returnImg = uploadImage(img, 32, 32, 0)
return returnImg

function loadMergedImg(_fillCol, _outlineCol)
	var l = {0, 0, 0, 0}
	var o = _outlineCol
	var _ = _fillCol
	
	var img = [
		l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 0
		l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l, // 1
		l,l,o,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l, // 2
		l,l,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l, // 3
		l,l,o,_,o,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l, // 4
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 5
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 6
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 7
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 8
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 9
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 10
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 11
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 12
		l,l,o,_,o,_,o,_,o,_,o,_,o,o,o,_,o,o,o,_,_,o,o,_,o,o,o,_,_,o,l,l, // 13
		l,l,o,_,o,_,o,_,o,o,o,_,o,_,_,_,o,_,o,_,o,_,_,_,o,_,_,_,_,o,l,l, // 14
		l,l,o,_,o,_,o,_,o,o,o,_,o,o,_,_,o,o,_,_,o,_,o,_,o,o,_,_,_,o,l,l, // 15
		l,l,o,_,o,_,o,_,o,_,o,_,o,_,_,_,o,_,o,_,o,_,o,_,o,_,_,_,_,o,l,l, // 16
		l,l,o,_,o,_,o,_,o,_,o,_,o,o,o,_,o,_,o,_,_,o,o,_,o,o,o,_,_,o,l,l, // 17
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 18
		l,l,o,_,o,_,o,_,_,_,_,_,_,o,o,_,o,o,_,_,_,_,o,_,_,_,_,_,_,o,l,l, // 19
		l,l,o,_,o,_,o,_,_,_,_,_,o,_,o,_,o,_,o,_,_,_,o,_,_,_,_,_,_,o,l,l, // 20
		l,l,o,_,o,_,o,_,_,_,_,_,o,_,o,_,o,o,_,_,_,_,o,_,_,_,_,_,_,o,l,l, // 21
		l,l,o,_,o,_,o,_,_,_,_,_,o,_,o,_,o,_,o,_,o,_,o,_,_,_,_,_,_,o,l,l, // 22
		l,l,o,_,o,_,o,_,_,_,_,_,o,o,_,_,o,o,_,_,o,o,_,_,_,_,_,_,_,o,l,l, // 23
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 24
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 25
		l,l,o,_,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 26
		l,l,o,o,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 27
		l,l,l,l,o,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 28
		l,l,l,l,o,o,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 29
		l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l, // 30
		l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l // 31
	]
	
	returnImg = uploadImage(img, 32, 32, 0)
return returnImg

function loadPointLightImg()
	var l = {0, 0, 0, 0}
	var o = black
	var _ = white
	
	var img = [
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 0
		l,l,o,o,l,l,l,l,l,l,l,l,o,o,_,_,_,_,o,o,l,l,l,l,l,l,l,l,o,o,l,l, // 1
		l,l,o,_,o,l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,o,_,o,l,l, // 2
		l,l,l,o,_,o,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,o,_,o,l,l,l, // 3
		l,l,l,l,o,_,o,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,o,_,o,l,l,l,l, // 4
		l,l,l,l,l,o,o,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,o,o,l,l,l,l,l, // 5
		l,l,l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l,l, // 6
		l,l,l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l,l, // 7
		l,l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l, // 8
		l,o,o,o,o,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,o,o,o,o,l, // 9
		o,_,_,_,_,o,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,o,_,_,_,_,o, // 10
		l,o,o,o,o,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,o,o,o,o,l, // 11
		l,l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l, // 12
		l,l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l, // 13
		l,l,l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l,l, // 14
		l,l,l,l,l,o,o,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,o,o,l,l,l,l,l, // 15
		l,l,l,l,o,_,o,l,l,o,_,_,_,o,_,_,_,_,o,_,_,_,o,l,l,o,_,o,l,l,l,l, // 16
		l,l,l,o,_,o,l,l,l,o,_,_,_,_,o,_,_,o,_,_,_,_,o,l,l,l,o,_,o,l,l,l, // 17
		l,l,o,_,o,l,l,l,l,l,o,_,_,_,_,o,o,_,_,_,_,o,l,l,l,l,l,o,_,o,l,l, // 18
		l,l,o,o,l,l,l,l,l,l,l,o,_,_,_,o,_,_,_,_,o,l,l,l,l,l,l,l,o,o,l,l, // 19
		l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l, // 20
		l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,o,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l, // 21
		l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,o,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 22
		l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 23
		l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 24
		l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l, // 25
		l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l, // 26
		l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l, // 27
		l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l, // 28
		l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l, // 29
		l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 30
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l // 31
	]
	
	returnImg = uploadImage(img, 32, 32, 0)
return returnImg

function loadPointShadowLightImg()
	var l = {0, 0, 0, 0}
	var o = black
	var _ = white
	
	var img = [
		l,l,o,o,l,l,l,l,o,o,o,o,o,o,l,l,l,l,o,o,l,l,l,l,l,l,l,l,l,l,l,l, // 0
		l,l,o,_,o,l,l,o,_,_,_,_,_,_,o,l,l,o,_,o,l,l,l,l,l,l,l,l,l,l,l,l, // 1
		l,l,l,o,_,o,o,_,_,_,_,_,_,_,_,o,o,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 2
		l,l,l,l,o,o,o,_,_,_,_,_,_,_,_,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 3
		l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 4
		l,o,o,o,l,o,_,_,_,_,_,_,_,_,_,_,o,l,o,o,o,l,l,l,l,l,l,l,l,l,l,l, // 5
		o,_,_,_,o,o,_,_,_,_,_,_,_,_,_,_,o,o,_,_,_,o,l,l,l,l,l,l,l,l,l,l, // 6
		l,o,o,o,l,o,_,_,_,_,_,_,_,_,_,_,o,l,o,o,o,l,l,l,l,l,l,l,l,l,l,l, // 7
		l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 8
		l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 9
		l,l,l,o,o,l,o,_,_,_,_,_,_,_,_,o,l,o,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 10
		l,l,o,_,o,l,o,_,_,o,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 11
		l,o,_,o,l,l,l,o,_,_,o,o,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l, // 12
		l,o,o,l,l,l,l,l,o,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 13
		l,l,l,l,l,l,l,l,o,_,_,o,_,_,o,_,_,_,o,_,_,_,o,_,_,o,l,l,l,l,l,l, // 14
		l,l,l,l,l,l,l,l,l,o,o,o,_,_,o,_,_,_,o,_,_,_,o,_,_,o,l,l,l,l,l,l, // 15
		l,l,l,l,l,l,l,l,l,o,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 16
		l,l,l,l,l,l,l,l,l,o,o,o,_,_,_,_,o,_,_,_,o,_,_,_,_,o,l,l,l,l,l,l, // 17
		l,l,l,l,l,l,l,l,l,o,_,o,_,_,_,_,o,_,_,_,o,_,_,_,_,o,l,l,l,l,l,l, // 18
		l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 19
		l,l,l,l,l,l,l,l,l,o,_,o,_,_,o,_,_,_,o,_,_,_,o,_,_,o,l,l,l,l,l,l, // 20
		l,l,l,l,l,l,l,l,l,l,o,o,_,_,o,_,_,_,o,_,_,_,o,_,_,o,l,l,l,l,l,l, // 21
		l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 22
		l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,_,_,_,o,_,_,_,_,o,l,l,l,l,l,l, // 23
		l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,_,_,_,o,_,_,_,_,o,l,l,l,l,l,l, // 24
		l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 25
		l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l, // 26
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l, // 27
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l, // 28
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l, // 29
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l, // 30
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o // 31
	]
	
	returnImg = uploadImage(img, 32, 32, 0)
return returnImg

function loadSpotLightImg()
	var l = {0, 0, 0, 0}
	var o = black
	var _ = white
	
	var img = [
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 0
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 1
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o, // 2
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,o, // 3
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,o,l, // 4
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,o,l,l, // 5
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,l,l,o,o,l,l,l, // 6
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,o,o,o,l,l,l,l,l, // 7
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,o,_,o,l,l,l,l,l, // 8
		l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,l,l,l,o,_,_,_,o,_,o,l,l,l,l,l, // 9
		l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,o,o,o,o,o,_,_,_,o,_,o,l,l,l,l,l, // 10
		o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,_,_,o,_,_,_,o,_,o,l,l,l,l,l, // 11
		o,_,o,_,_,o,_,_,_,o,_,_,_,o,_,_,_,o,_,_,o,_,_,_,o,_,o,l,l,l,l,l, // 12
		o,_,o,_,o,_,_,_,o,_,_,_,o,_,_,_,o,o,_,_,o,_,_,_,o,_,o,l,l,l,l,l, // 13
		o,_,o,o,_,_,_,o,_,_,_,o,_,_,_,o,_,o,_,_,o,_,_,_,o,_,o,l,l,l,l,l, // 14
		o,_,o,_,_,_,o,_,_,_,o,_,_,_,o,_,_,o,_,_,o,_,_,_,o,_,o,l,o,o,o,l, // 15
		o,_,o,_,_,o,_,_,_,o,_,_,_,o,_,_,_,o,_,_,o,_,_,_,o,_,o,o,_,_,_,o, // 16
		o,_,o,_,o,_,_,_,o,_,_,_,o,_,_,_,o,o,_,_,o,_,_,_,o,_,o,l,o,o,o,l, // 17
		o,_,o,o,_,_,_,o,_,_,_,o,_,_,_,o,_,o,_,_,o,_,_,_,o,_,o,l,l,l,l,l, // 18
		o,_,o,_,_,_,o,_,_,_,o,_,_,_,o,_,_,o,_,_,o,_,_,_,o,_,o,l,l,l,l,l, // 19
		o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,_,_,o,_,_,_,o,_,o,l,l,l,l,l, // 20
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,_,_,_,o,_,o,l,l,l,l,l, // 21
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,o,_,o,l,l,l,l,l, // 22
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,o,_,o,l,l,l,l,l, // 23
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,o,o,o,l,l,l,l,l, // 24
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,l,l,o,o,l,l,l, // 25
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,o,l,l, // 26
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,o,l, // 27
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,o, // 28
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o, // 29
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 30
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l // 31
	]
	
	returnImg = uploadImage(img, 32, 32, 0)
return returnImg

function loadWorldLightImg()
	var l = {0, 0, 0, 0}
	var o = black
	var _ = white
	
	var img = [
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 0
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 1
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 2
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 3
		l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 4
		l,l,l,l,l,o,l,l,l,l,l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,o,l,l,l,l,l, // 5
		l,l,l,l,l,l,o,o,o,l,l,o,o,_,_,_,_,_,_,o,o,l,l,o,o,o,l,l,l,l,l,l, // 6
		l,l,l,l,l,l,o,_,_,o,o,_,_,_,_,_,_,_,_,_,_,o,o,_,_,o,l,l,l,l,l,l, // 7
		l,l,l,l,l,l,o,_,_,_,_,_,_,o,o,o,o,o,o,_,_,_,_,_,_,o,l,l,l,l,l,l, // 8
		l,l,l,l,l,l,l,o,_,_,_,o,o,_,_,_,_,_,_,o,o,_,_,_,o,l,l,l,l,l,l,l, // 9
		l,l,l,l,l,l,l,o,_,_,o,_,_,_,_,_,_,_,_,_,_,o,_,_,o,l,l,l,l,l,l,l, // 10
		l,l,l,l,l,l,o,_,_,o,_,_,_,_,_,_,_,_,_,_,_,_,o,_,_,o,l,l,l,l,l,l, // 11
		l,l,l,l,l,l,o,_,_,o,_,_,_,_,_,o,o,_,_,_,_,_,o,_,_,o,l,l,l,l,l,l, // 12
		l,l,l,l,o,o,_,_,_,o,o,o,o,o,o,_,_,o,o,o,o,o,o,_,_,_,o,o,l,l,l,l, // 13
		l,l,o,o,_,_,_,_,o,_,o,o,o,o,o,_,_,o,o,o,o,o,_,o,_,_,_,_,o,o,l,l, // 14
		o,o,_,_,_,_,_,_,o,_,o,o,o,o,_,_,_,_,o,o,o,o,_,o,_,_,_,_,_,_,o,o, // 15
		o,o,_,_,_,_,_,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,_,_,_,_,_,_,o,o, // 16
		l,l,o,o,_,_,_,_,o,_,_,_,_,_,_,_,o,o,_,_,_,_,_,o,_,_,_,_,o,o,l,l, // 17
		l,l,l,l,o,o,_,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,_,_,o,o,l,l,l,l, // 18
		l,l,l,l,l,l,o,_,_,o,_,_,_,o,_,_,_,_,_,_,_,_,o,_,_,o,l,l,l,l,l,l, // 19
		l,l,l,l,l,l,o,_,_,o,_,_,_,_,o,o,o,o,_,_,_,_,o,_,_,o,l,l,l,l,l,l, // 20
		l,l,l,l,l,l,l,o,_,_,o,_,_,_,_,_,_,_,_,_,_,o,_,_,o,l,l,l,l,l,l,l, // 21
		l,l,l,l,l,l,l,o,_,_,_,o,o,_,_,_,_,_,_,o,o,_,_,_,o,l,l,l,l,l,l,l, // 22
		l,l,l,l,l,l,o,_,_,_,_,_,_,o,o,o,o,o,o,_,_,_,_,_,_,o,l,l,l,l,l,l, // 23
		l,l,l,l,l,l,o,_,_,o,o,_,_,_,_,_,_,_,_,_,_,o,o,_,_,o,l,l,l,l,l,l, // 24
		l,l,l,l,l,l,o,o,o,l,l,o,o,_,_,_,_,_,_,o,o,l,l,o,o,o,l,l,l,l,l,l, // 25
		l,l,l,l,l,o,l,l,l,l,l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,o,l,l,l,l,l, // 26
		l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 27
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 28
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 29
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 30
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l // 31
	]
	
	returnImg = uploadImage(img, 32, 32, 0)
return returnImg

function loadWorldShadowLightImg()
	var l = {0, 0, 0, 0}
	var o = black
	var _ = white
	
	var img = [
		l,l,l,l,l,l,l,l,l,l,l,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 0
		l,l,l,l,l,l,l,l,l,l,l,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 1
		l,l,l,l,l,l,l,l,l,l,o,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 2
		l,l,l,o,l,l,l,l,o,o,_,_,_,o,o,l,l,l,l,o,l,l,l,l,l,l,l,l,l,l,l,l, // 3
		l,l,l,l,o,o,o,o,_,_,_,_,_,_,_,o,o,o,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 4
		l,l,l,l,o,_,_,_,_,_,o,o,o,_,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 5
		l,l,l,l,o,_,_,_,o,o,_,_,_,o,o,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 6
		l,l,l,l,o,_,_,o,_,_,_,_,_,_,_,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l, // 7
		l,l,l,o,_,_,o,_,_,_,_,o,_,_,_,_,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l, // 8
		l,l,l,o,_,_,o,o,o,o,o,_,o,o,o,o,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l, // 9
		l,l,o,_,_,o,o,o,o,o,o,_,o,o,o,o,o,o,_,_,o,l,l,l,l,l,l,l,l,l,l,l, // 10
		o,o,_,_,_,o,_,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 11
		l,l,o,_,_,o,_,_,_,_,_,o,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,l,l,l,l,l, // 12
		l,l,l,o,_,_,o,_,_,_,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 13
		l,l,l,o,_,_,o,_,_,o,_,o,_,_,o,_,_,_,o,_,_,_,o,_,_,o,l,l,l,l,l,l, // 14
		l,l,l,l,o,_,_,o,_,_,o,o,_,_,o,_,_,_,o,_,_,_,o,_,_,o,l,l,l,l,l,l, // 15
		l,l,l,l,o,_,_,_,o,o,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 16
		l,l,l,l,o,_,_,_,_,_,o,o,_,_,_,_,o,_,_,_,o,_,_,_,_,o,l,l,l,l,l,l, // 17
		l,l,l,l,o,o,o,o,_,_,_,o,_,_,_,_,o,_,_,_,o,_,_,_,_,o,l,l,l,l,l,l, // 18
		l,l,l,o,l,l,l,l,o,o,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 19
		l,l,l,l,l,l,l,l,l,l,o,o,_,_,o,_,_,_,o,_,_,_,o,_,_,o,l,l,l,l,l,l, // 20
		l,l,l,l,l,l,l,l,l,l,l,o,_,_,o,_,_,_,o,_,_,_,o,_,_,o,l,l,l,l,l,l, // 21
		l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 22
		l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,_,_,_,o,_,_,_,_,o,l,l,l,l,l,l, // 23
		l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,_,_,_,o,_,_,_,_,o,l,l,l,l,l,l, // 24
		l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l,l, // 25
		l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l,l, // 26
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l,l, // 27
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,l, // 28
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l, // 29
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l, // 30
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o // 31
	]
	
	returnImg = uploadImage(img, 32, 32, 0)
return returnImg

function loadLogoTextImg()
return loadLogoTextImg(white, black)

function loadLogoTextImg(_fillCol, _outlineCol)
	var l = {0, 0, 0, 0}
	var o = _outlineCol
	var _ = _fillCol
	
	var img = [
		l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,   l,l,l,o,o,o,o,o,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l, // 0
		l,l,l,l,l,l,o,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,   o,l,o,_,_,_,_,_,o,l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o, // 1
		l,l,l,l,l,o,_,_,_,_,_,o,o,o,_,_,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,   l,l,o,_,_,_,_,_,o,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,_,_,_,_,o, // 2
		l,l,l,l,o,_,_,_,_,o,o,l,l,l,o,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,   l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,l, // 3
		l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,   l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l, // 4
		l,l,o,_,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,l,l,   l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,l,o,o,o,o,o,l, // 5
		l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,_,_,_,_,_,_,_,o,o,   l,l,l,o,_,_,_,_,o,l,l,l,l,o,o,_,_,_,_,_,_,_,_,_,_,o,_,_,_,_,_,o, // 6
		l,o,_,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,_,o,o,_,_,_,_,   o,l,l,o,_,_,_,_,o,l,l,l,o,_,_,_,_,_,o,_,_,_,_,_,_,_,_,_,_,_,_,o, // 7
		l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,l,o,_,_,_,   o,l,l,o,_,_,_,_,o,l,l,l,o,_,_,_,_,o,l,o,_,_,_,_,_,o,_,_,_,_,_,o, // 8
		l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,l,l,l,o,_,_,   _,o,l,o,_,_,_,_,o,l,l,o,_,_,_,_,o,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 9
		l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,o,o,o,o,_,_,_,   _,o,l,o,_,_,_,_,o,l,l,o,_,_,_,_,o,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 10
		l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,_,_,_,_,_,_,_,_,o,   o,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o,l,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 11
		l,o,_,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,o,o,o,o,o,o,o,l,   l,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o,l,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 12
		l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,l,   l,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o,l,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 13
		l,l,o,_,_,_,_,_,o,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,   l,l,l,o,_,_,_,_,o,l,l,o,_,_,_,_,o,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 14
		l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,o,l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,l,   l,l,l,o,_,_,_,_,o,l,l,o,_,_,_,_,o,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 15
		l,l,l,l,o,_,_,_,_,o,o,l,l,l,o,_,o,l,l,l,o,_,_,_,_,o,l,l,l,l,l,l,   l,o,o,_,_,_,_,_,_,o,o,l,o,_,_,_,_,o,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 16
		l,l,l,l,l,o,_,_,_,_,_,o,o,o,_,_,o,o,o,o,o,_,_,_,_,_,o,o,o,o,o,o,   o,_,_,_,_,_,_,_,_,_,_,o,o,_,_,_,_,_,o,_,_,_,_,_,o,l,o,_,_,_,_,o, // 17
		l,l,l,l,l,l,o,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,   _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,o,_,_,_,_,o, // 18
		l,l,l,l,l,l,l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,   o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,_,_,_,_,_,o,l,o,_,_,_,_,o, // 19
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,   l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 20
		l,l,l,o,o,l,l,o,o,l,l,l,l,o,l,o,l,l,o,l,l,o,o,o,l,l,l,o,o,o,l,o,   o,l,l,o,o,o,l,o,o,o,l,l,o,o,l,o,o,o,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 21
		l,l,l,l,l,o,l,o,l,o,l,l,l,o,o,o,l,o,l,o,l,o,l,o,l,l,l,o,l,l,l,o,   l,o,l,l,o,l,l,l,o,l,l,o,l,o,l,o,l,o,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 22
		l,l,l,l,o,l,l,o,l,o,l,l,l,o,o,o,l,o,o,o,l,o,o,l,l,l,l,o,o,l,l,o,   l,o,l,l,o,l,l,l,o,l,l,o,l,o,l,o,o,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 23
		l,l,l,l,l,o,l,o,l,o,l,l,l,o,l,o,l,o,l,o,l,o,l,l,l,l,l,o,l,l,l,o,   l,o,l,l,o,l,l,l,o,l,l,o,l,o,l,o,l,o,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 24
		l,l,l,o,o,l,l,o,o,l,l,l,l,o,l,o,l,o,l,o,l,o,l,l,l,l,l,o,o,o,l,o,   o,l,l,o,o,o,l,l,o,l,l,o,o,l,l,o,l,o,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 25
		l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,   l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 26
		l,l,l,o,o,o,l,l,o,o,l,o,o,o,l,l,l,o,o,o,l,o,l,o,l,o,o,o,l,o,o,o,   l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,_,_,_,_,o,l,o,_,_,_,_,o, // 27
		l,l,l,o,l,l,l,o,l,o,l,o,l,o,l,l,l,o,l,l,l,o,l,o,l,l,l,o,l,o,l,l,   l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,o,_,_,_,_,_,o,_,_,_,_,_,o, // 28
		l,l,l,o,o,l,l,o,l,o,l,o,o,l,l,l,l,o,o,l,l,o,l,o,l,l,o,l,l,o,o,l,   l,o,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,o,l,o,_,_,_,_,_,_,_,_,_,_,_,o, // 29
		l,l,l,o,l,l,l,o,l,o,l,o,l,o,l,l,l,o,l,l,l,o,l,o,l,o,l,l,l,o,l,l,   l,l,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,l,l,o,_,_,_,_,_,o,_,_,_,_,_,o, // 30
		l,l,l,o,l,l,l,o,o,l,l,o,l,o,l,l,l,o,l,l,l,l,o,o,l,o,o,o,l,o,o,o,   l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,o,o,o,o,o,l,o,o,o,o,o,l // 31
	]
	
	returnImg = uploadImage(img, 64, 32, 0)
return returnImg
