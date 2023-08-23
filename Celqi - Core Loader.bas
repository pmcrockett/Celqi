// +CORE LOADER
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
	models = insertArray(models, [ [ ["Clipboard"] ], [ ["Lights"] ] ], 0)
return models

// ----------------------------------------------------------------
// GLOBAL SETUP

// Celqi global variables
var g_editor = false // Are we in the editor? false = game/core loader, true = editor
var g_version = "1.0.00"
var g_lightBank = 1 // Bank number for lights
var g_intLen = 64 // Number of bits to use for binary variables. FUZE technically has 64-bit signed ints, but it's complicated
var g_cellExt = [
	.lo = {-2.5, -2.5, -2.5},
	.hi = {2.5, 2.5, 2.5}
]
var g_cellObjStart = 2 // First index of object storage in a cell. We don't store objects in a subarray because that would increase access time.
var g_cellBitLen = pow(getCellWidth(), 3)
var g_cell // This is the array that stores all cell and map object data
var g_debugLines = []

// ----------------------------------------------------------------
// LOAD OBJECT DEFINITIONS AND MAP

var g_mapFile = open()

// Arrange model data in a code-readable format
var g_loadResult = loadObjDefs(g_mapFile)
var g_obj = g_loadResult.obj
var g_bankName = g_loadResult.bankName
var g_missingRefs = loadMergedObjDefs(g_mapFile)

readObjMap(g_mapFile, "Castle Demo")
close(g_mapFile)

// TEST CODE
//showObjectBounds(true, purple, 1)
setCamera({14, 5.25, 8.75}, {13, 5.15, 8.75})
//var obj = placeObject(cube, {9, 5.15, 8.75}, {0.5, 0.5, 0.5})
array obj[1]
array colCon[len(obj)]
var focusObjIdx = 0
var g_cam = [
	.fwd = normalize({-5, -5, 0}),
	.up = {0, 1, 0},
	.dist = -5
]

var i
for i = 0 to len(obj) loop
	obj[i] = placeObject(cube, {9, 5.15, 8.75}, {0.25, 0.25, 1})
	//obj[i] = placeObject(cube, {9, 5.15, 8.75}, {0.5, 0.5, 0.5})
	//var objModel = loadModel("Broken Vector/Car1Yellow")
	//var objModel = loadModel("Devils Garage/poolStick01")
	//var objModel = loadModel("Devils Garage/d6_A_01")
	//obj[i] = placeObject(objModel, {9, 7.15, 8.75}, {1, 1, 1})
	//obj[i] = placeObject(objModel, {9, 5.15, 8.75}, {8, 8, 8})
	//setObjectMaterial(obj[i], {0, 0, 0, 0.7}, 0, 1)
	colContext newColCon
	colCon[i] = initColContext(newColCon, obj[i], {9, 5.15, 8.75}, {0, 0, 1}, {0, 1, 0}, {0.25, 0.25, 1}, 4, 15, {0, -1, 0}, 0.001, 
	//colCon[i] = initColContext(newColCon, obj[i], {9, 5.15, 8.75}, {0, 0, 1}, {0, 1, 0}, {0.5, 0.5, 0.5}, 4, 2, {0, -1, 0}, 0.001, 
	//colCon[i] = initColContext(newColCon, obj[i], {9, 7.15, 8.75}, {0, 0, 1}, {0, 1, 0}, {1, 1, 1}, 4, 60, {0, -1, 0}, 0.001, 
	//colCon[i] = initColContext(newColCon, obj[i], {9, 5.15, 8.75}, {0, 0, 1}, {0, 1, 0}, {8, 8, 8}, 4, 15, {0, -1, 0}, 0.001, 
		true, true, true)
	//debugPrint(4, [colCon[i].ext])
repeat
//colContext colCon
//colCon = initColContext(colCon, obj, {9, 5.15, 8.75}, {0, 0, 1}, {0, 1, 0}, {0.5, 0.5, 0.5}, 4)
var aHeld = false
var rHeld = false
//var move = {-0.1, 0, -0.1}
textSize(15)

loop
	updateInput()
	updateAllObjs()
	updateCam()
	drawObjects()
	debug()
	update()
	//sleep(0.1)
repeat

function updateInput()
	var c = controls(0)
	
	//if c.a and (colCon.colThisFrame or colCon.continuedCol or colCon.deflectThisFrame) then
	if c.a and !aHeld then
		var i
		for i = 0 to len(colCon) loop
			//colCon[i].vel += {rnd(0.1) - 0.05, rnd(0.2), rnd(0.1) - 0.05} * 200 * deltaTime()
			colCon[i].vel += {0, 0.1, 0} * 200 * deltaTime()
			//colCon[i].vel += {rnd(0.02) - 0.01, rnd(0.4), rnd(0.02) - 0.01} * 5
		repeat
		
		aHeld = true
	else if !c.a then
		aHeld = false
	endif endif
	
	if c.r and !rHeld then
		focusObjIdx = (focusObjIdx + 1) % len(colCon)
		
		rHeld = true
	else if !c.r then
		rHeld = false
	endif endif
	
	if c.ly and (colCon[focusObjIdx].colThisFrame or colCon[focusObjIdx].deflectThisFrame or colCon[focusObjIdx].continuedCol) then
		//colCon[focusObjIdx].vel += ({0, 0.01, 0} + colCon[focusObjIdx].fwd * c.ly * 10 * deltaTime())
		var fwd = normalize({g_cam.fwd.x, 0, g_cam.fwd.z})
		colCon[focusObjIdx].vel += ({0, 0.01, 0} + fwd * c.ly * 3 * deltaTime())
	endif
	
	if c.lx and (colCon[focusObjIdx].colThisFrame or colCon[focusObjIdx].deflectThisFrame or colCon[focusObjIdx].continuedCol) then
		var r = cross(g_cam.fwd, g_cam.up)
		var r = normalize({r.x, 0, r.z})
		//var r = normalize(cross(colCon[focusObjIdx].fwd, colCon[focusObjIdx].up))
		colCon[focusObjIdx].vel += ({0, 0.01, 0} + r * c.lx * 3 * deltaTime())
	endif
	
	if c.rx then
		g_cam.fwd = axisRotVecBy(g_cam.fwd, {0, 1, 0}, c.rx * 100 * deltaTime())
		g_cam.up = axisRotVecBy(g_cam.up, {0, 1, 0}, c.rx * 100 * deltaTime())
	endif
	
	if c.ry then
		g_cam.dist += c.ry * 20 * deltaTime()
	endif
return void

function updateAllObjs()
	var i
	for i = 0 to len(obj) loop
		//var tempObj = obj[i]
		var tempColCon = colCon[i]
		//updateObj(tempObj, tempColCon)
		updateObj(obj[i], tempColCon)
		//obj[i] = tempObj
		colCon[i] = tempColCon
	repeat
return void

function updateObj(_obj, ref _colCon)
	/*
	if !colCon.colThisFrame and !colCon.continuedCol then
		vel += colCon.grav
	endif
	
	if colCon.colThisFrame or colCon.continuedCol then
		vel = colCon.grav
	endif
	*/
	/*
	if colCon.colThisFrame and len(colCon.normal)then
		if colCon.normal[0] != {0, 0, 0} then
			vel = reflect(vel, colCon.normal[0])
		else
			vel *= -1
		endif
	endif
	*/
	//colCon.vel += (colCon.grav * deltaTime() / 10) 
	//_colCon.rotVel = 5
	//_colCon.rotVelAxis = normalize({0.7, 0, 0})
	var newFwd = axisRotVecBy(_colCon.fwd, _colCon.rotVelAxis, _colCon.rotVel)
	//var newFwd = axisRotVecBy(_colCon.fwd, _colCon.rotVelAxis, 0.5)
	var newUp = axisRotVecBy(_colCon.up, _colCon.rotVelAxis, _colCon.rotVel)
	
	var com = changeVecSpaceZFwd(_colCon.centerOfMass, newFwd, newUp, normalize(cross(newFwd, newUp)), {0, 0, 0}) * _colCon.scale
	var prevCom = changeVecSpaceZFwd(_colCon.centerOfMass, _colCon.fwd, _colCon.up, normalize(cross(_colCon.fwd, _colCon.up)), {0, 0, 0}) * _colCon.scale
	//var newPos = _colCon.comPos + _colCon.vel + (prevCom - com)
	var newComPos = _colCon.comPos + _colCon.vel
	//var orig = getOriginFromCom(newComPos, _colCon.centerOfMass, newFwd, newUp, _colCon.scale)
	
	//debugLine(_colCon.comPos + prevCom, _colCon.comPos + prevCom + {0, 0.05, 0}, 0.05, 5, blue)
	//debugLine(orig, orig + {0, 0.05, 0}, 0.05, 5, blue)
	
	//var newUp = axisRotVecBy(_colCon.up, _colCon.rotVelAxis, 0.5)
	//var newUp = _colCon.fwd
	//var newFwd = _colCon.up
	updateObjCollisions(_obj, _colCon, newComPos, newFwd, newUp, _colCon.scale, _colCon.collisionMode, false, 
	//	false, true, true, 0.25, 2, true)
		true, true, true, 2, true)
	//setObjectPos(obj, colCon.comPos)
return _colCon

function updateCam()
	setCamera(colCon[focusObjIdx].comPos + g_cam.fwd * g_cam.dist, colCon[focusObjIdx].comPos)
return void

// ----------------------------------------------------------------
// STRUCTS

/* Stores information about an object's collision state. */
// +CORE LOADER
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
	int deflectThisFrame = false
	int continuedCol = false
	int allCollisions = true
	int collisionMode = 3
	var colDat
	var auxCollider = -1
	var auxColCon = -1
endstruct

/* Stores info about objects placed in the map. Distinct from active, which is
a reduced dataset, and objDef, which is the basic info need to instantiate an
active or a mapObj. */
// +CORE LOADER
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
endStruct

// Points to the cell and index that contains the object's data
// +CORE LOADER
struct mapObjRef
	int cellIdx
endStruct

/* active is a relic -- it used to e a reduced dataset of mapObj, but
now mostly just recreates mapObj. Due for deprecation. */
// +CORE LOADER
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
endStruct

/* Info about a light. lightObjs placed in the map are always contained in the lights 
array of mapObj or active. They do not exist on their own. All light types use the
same kind of lightObj (distinguished by the name field), so not all fields are always
relevant to a given light. */
// +CORE LOADER
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

// Bounding box that describes the dimensions of an object.
// +CORE LOADER
struct extent
	vector lo
	vector hi
endStruct

// Data used to instantiate a mapObj or an active.
// +CORE LOADER
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
	// FILE READING

/* Light data are saved separately in the file from object data. This function
takes the object data and the light data and assembles them into a complete
object. */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
function loadMapMsg(_mapName, _objName, _objPos)
	clear()
	printAt(0, 0, "Loading " + _mapName)
	printAt(0, 1, "Placing " + _objName + " at " + str(_objPos))
	update()
return void

/* Restores a map from file. */
// +CORE LOADER
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

/* Map properties are saved separately from map objects. */
// +CORE LOADER
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

/* A section is the highest-level file division, distinguishing between, for
example, map objects and map properties. */
// +CORE LOADER
function findFileSection(_file, _section)
return findFileSection(_file, _section, 0, -1)

function findFileSection(_file, _section, _startAt, _endAt)
return findFileChunk(_file, chr(31) + _section, [ chr(31) ], _startAt, _endAt)

/* A chunk is a file section that exists between any two delimiters, which are
typically non-printing unicode characters. _endAt is non-inclusive. */
// +CORE LOADER
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

/* Gets the index of a character within the file. Bails out if unallocated
space is encountered. */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
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

/* The light definition bank cannot be modified by the user. These light
objects are fully defined in code and do not load from file. */
// +CORE LOADER
function loadLightDefs()
	array defs[3]
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

/* Loads unmerged object definitions from the banks created in getModels(). */
// +CORE LOADER
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
	
	obj[g_lightBank] = loadLightDefs()
	
	var result = [
		.obj = obj,
		.bankName = bankName
	]
return result

/* This stub function allows you to display a loading message based on the 
object defintion that is currently loading. */
// +CORE LOADER
function loadDefMsg(_defName)
return void

/* Loads an individual unmerged object definition, which includes calculating 
the extent. */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
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
	// FILE DECODING

/* Reconstructs a variable's value from encoded file string. */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
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
	.col = {-1, -1, -1},
	.spread = -1,
	.res = -1,
	.range = -1
]

/* Fills the generic object with data from getGenObjFromFile(). */
// +CORE LOADER
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
// +CORE LOADER
function createActiveFromGenericObj(_gen)
	active obj
	obj.obj = _gen.obj
	obj.pos = _gen.pos
	obj.scale = _gen.scale
	obj.fwd = _gen.fwd
	obj.up = _gen.up
	obj.bankIdx = _gen.bankIdx
return obj

/* Pulls all the data from a generic object necessary for a lightObj. */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
function decodeCellMap(_field, _elem, _cellArr)
	loop if _field == ".pos" then
		_cellArr[0] = decodeElem(_elem)
		break endif
	if _field == ".adj" then
		_cellArr[1] = decodeElem(_elem)
		break
	endif break repeat
return _cellArr

/* Returns true if the given chunk is within the file. */
// +CORE LOADER
function inFile(_chunk)
return _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

/* Returns true if the given chunk is still within the same section. */
// +CORE LOADER
function inFileSection(_chunk)
return _chunk.nextMarker != chr(31) 
		and _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

/* Returns true if the given chunk is still within the same block. */			
// +CORE LOADER
function inFileBlock(_chunk)
return _chunk.nextMarker != chr(31) 
		and _chunk.nextMarker != chr(17) 
		and _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

/* Returns true if the given chunk is still within the same unit. */
// +CORE LOADER
function inFileUnit(_chunk)
return _chunk.nextMarker != chr(31) 
		and _chunk.nextMarker != chr(17) 				
		and _chunk.nextMarker != chr(30) 
		and _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

/* Returns true if the given chunk is still within the same field. */
// +CORE LOADER
function inFileField(_chunk)
return _chunk.nextMarker != chr(31) 
		and _chunk.nextMarker != chr(17) 				
		and _chunk.nextMarker != chr(30) 				
		and _chunk.nextMarker != chr(29) 
		and _chunk.nextMarker != chr(127) 
		and _chunk.nextIdx < _chunk.fileLen

// ----------------------------------------------------------------
// STRING FUNCTIONS

/* Generate a name based on a filepath. */
// +CORE LOADER
function getDefaultDefName(_path)
	var name = _path
	var slashIdx = strFind(name, "/") + 1
	name = name[slashIdx:]
	name = strReplace(name, "_", " ")
return name

// ----------------------------------------------------------------
// NUMBER FUNCTIONS

/* 1 for 0 or positive, -1 for negative. */
// +CORE LOADER
function getSign(_num)
	if _num >= 0 then
		_num = 1
	else
		_num = -1
	endif
return _num

/* Round a float to a given number of decimal places. */
// +CORE LOADER
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

/* The native mod function (%) truncates the result if it's a float, 
so use this for floats. */
// +CORE LOADER
function mod(_num1, _num2)
	_num1 = roundDec(_num1, 6)
	_num2 = roundDec(_num2, 6)
	var decPart = fract(_num1 / _num2)
return decPart * _num2

/* Equality check with tolerance value. */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
function absVec3(_vec)
return {abs(_vec.x), abs(_vec.y), abs(_vec.z)}

/* Returns number of ints needed to store the given number of bits. */
// +CORE LOADER
function bitLenToInt(_bitLen)
return ceil(_bitLen / g_intLen)

/* _val must be 0 or 1. This will fill a length of _count bits starting
at _bitIdx with the _val bit. */
// +CORE LOADER
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
// +CORE LOADER
function bitOrLong(_bitIntArr1, _bitIntArr2)
	var i
	for i = 0 to len(_bitIntArr1) loop
		_bitIntArr1[i] = _bitIntArr1[i] | _bitIntArr2[i]
	repeat
return _bitIntArr1

// ----------------------------------------------------------------
// ARRAY FUNCTIONS

// +CORE LOADER
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

/* Finds the index of _item in _array, or -1 if not found. */
// +CORE LOADER
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

/* Removes item at _idx from _arr. */
// +CORE LOADER
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

// +CORE LOADER
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
// +CORE LOADER
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

/* Inserts _item at the end of _arr. */
// +CORE LOADER
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

// ----------------------------------------------------------------
// VECTOR FUNCTIONS

/* Normalized cross(), but avoids {nan, nan, nan} for a zeroed result. */
// +CORE LOADER
function safeCross(_vec1, vec2)
	var vec3 = cross(_vec1, vec2)
	
	if vec3 != {0, 0, 0} then
		 vec3 = normalize(vec3)
	endif
return vec3

/* Makes a 3D unit vector 2D by removing the Y element. */
// +CORE LOADER
function flattenY(_v)
return normalize({_v.x, 0, _v.z})

/* Rotates 3D vector _v around 3D vector _axis by _deg degrees. */
// +CORE LOADER
function axisRotVecBy(_v, _axis, _deg)
	// Euler-Rodrigues rotation formula
	var halfDeg = _deg / 2
	var w = _axis * sin(halfDeg)
	var crossWV = cross(w, _v)
return _v + 2 * cos(halfDeg) * crossWV + 2 * cross(w, crossWV)

/* Returns angle in degrees between two vectors. */
// +CORE LOADER
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

/* Rounds a vector to the given number of decimal places. */
// +CORE LOADER
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
// +CORE LOADER
function floorVec(_v)
	var i
	for i = 0 to 4 loop
		_v[i] = floor(_v[i])
	repeat
return _v

/* Remaps a 3D vector to a different context. */
// +CORE LOADER
function changeVecSpace(_vec, _newFwd, _newUp, _newR, _newPos)
	var mapped = {0, 0 ,0}
	mapped.x = _vec.x * _newFwd.x + _vec.y * _newUp.x + _vec.z * _newR.x + _newPos.x
	mapped.y = _vec.x * _newFwd.y + _vec.y * _newUp.y + _vec.z * _newR.y + _newPos.y
	mapped.z = _vec.x * _newFwd.z + _vec.y * _newUp.z + _vec.z * _newR.z + _newPos.z
return mapped

/* Remaps a 3D vector to a different context. Accounts for the fact that
FUZE uses a Z-forward orientation. */
// +CORE LOADER
function changeVecSpaceZFwd(_vec, _newFwd, _newUp, _newR, _newPos)
return changeVecSpace(_vec, _newR * -1, _newUp, _newFwd, _newPos)

/* Remaps a world vector as a local vector. */
// +CORE LOADER
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
// +CORE LOADER
function localVecToWorldVec(_vec, _locFwd, _locUp, _locPos)
	var newVec = changeVecSpaceZFwd(_vec, _locFwd, _locUp, cross(_locFwd, _locUp), {0, 0, 0})
	newVec += _locPos
return newVec

/* Projects a vector onto the plane defined by _planeOrig and _norm. */
// *CORE LOADER
function projectVecToPlane(_v, _planeOrig, _norm)
	_norm = normalize(_norm)
	var normDot = dot(_v - _planeOrig, _norm)
return _v - _norm * normDot

// ----------------------------------------------------------------
// OBJECT FUNCTIONS

	// ----------------------------------------------------------------
	// EXTENT

/* Builds extent data for an object. Reflects actual object hitbox within 
a margin of error. */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
function findObjExtDir(_obj, _pos, _colBox, _colBoxScale, _dir, _res)
	// Assume true to begin because findObjExtStartSize() succeeded
	var hit = true
	var colBoxPos = _pos
	//var posOffset = 0.05
	//var posOffset = 0.001
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
// +CORE LOADER
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
// +CORE LOADER
function getExtCenter(_ext)
	var ctr = {(_ext.hi.x + _ext.lo.x) / 2,
		(_ext.hi.y + _ext.lo.y) / 2,
		(_ext.hi.z + _ext.lo.z) / 2}
return ctr

/* Gets the longest dimension of an extent. */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
function getExtPoints(_ext, _scale, _fwd, _up)
	var r = normalize(cross(_fwd, _up))
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

/* Gets the min and max values for each axis for a scaled, rotated extent. */
// +CORE LOADER
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

	// ----------------------------------------------------------------
	// OBJECT DEFINITIONS

/* Returns an active built from an object definition. */
// +CORE LOADER
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
		act.children[i].children = newChild.children
	repeat
	
	act.lights = _def.lights
return act

/* Bank and index aren't saved into an object definition. Finds the bank and index
of the definition matching _name. */
// +CORE LOADER
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

/* Finds the definiton for an instantiated object or returns a default definition 
if none exists. */
// +CORE LOADER
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

/* Places an object into the map using an object _t as the template. */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
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

// +CORE LOADER
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
				children[i].obj = placeObject(
					getObjDef(-1, _template.children[i]).obj, 
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
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
function addMapObj(_activeObj, _pos, _fwd, _up, _scale, _isGrp)
	_pos = roundVec(_pos, 6)
	mapObj newObj
	
	if _isGrp then
		var newGrp = placeGrpObj(_activeObj, _activeObj)
		newObj.obj = newGrp.obj
		newObj.children = newGrp.children
		newObj.lights = newGrp.lights
	else
		newObj.obj = placeObject(
			getObjDef(-1, _activeObj).obj,
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
// +CORE LOADER
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

/* Removes instantiated object models from the world without cleaning up the
g_cell entries. Should only be used when clearing a map or in other cases
where record sanitation doesn't matter. */
// +CORE LOADER
function fastDeleteMapObj(_obj)
	if !isMapObjRef(-1, _obj) then
		removeGroupObj(_obj)
	endif
return void

/* Removes instantiated elements of a light object. */
// +CORE LOADER
function deleteLightObj(_obj)
	removeLight(_obj.light)
	_obj.light = -1
	
	if g_editor then
		removeSprite(_obj.spr)
	endif
	
	_obj.spr = -1
return _obj

/* Deletes every object in the map. */
// +CORE LOADER
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

/* Checks whether _obj is actually a reference to another object. */
// +CORE LOADER
function isMapObjRef(ref _in, _obj)
	_in = false
	
	var cellIdxLen = len(_obj.cellIdx)
	var cellIdxStr = str(_obj.cellIdx) // Avoid multiple nested ifs to reduce stack size
	
	if !cellIdxLen and cellIdxStr != "-1" then
		_in = true
	endif
return _in

/* Returns the actual mapObj that a reference points to. */
// +CORE LOADER
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

	// ----------------------------------------------------------------
	// LIGHT OBJECT

/* Returns an active light of the specifed name. */
// +CORE LOADER
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
// +CORE LOADER
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

/* This function modifies properties of the object passed to it in order
to apply recursive transforms to lights to sync them with the rest of the
object. This is needed because lights can't be auto-modified as part of an 
object group like objects can. DO NOT modify this function to return the object, 
because these object modifications are only relevant in the context of this
specific function and should be discarded when done. */
// +CORE LOADER
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
		_obj.children[i] = applyGrpTransform(_obj.children[i], _obj, false)
		_obj.children[i].scale *= _obj.scale
		setGrpLightsPos(_obj.children[i], _fov)
	repeat
return void

	// ----------------------------------------------------------------
	// OBJECT PROPERTIES

/* Sets rotation for a merged object. _pos is needed in order for
safeObjPointAt() to work; if the bug in objectPoinAt() is fixed in the
future, _pos will no longer be needed. */
// +CORE LOADER
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
// +CORE LOADER
function safeObjectPointAt(_obj, _objPos, _dir)
	var dif = _dir - _objPos
	
	if dif.x == 0 and dif.z == 0 then
		_dir = _objPos + axisRotVecBy(dif, {1, 0, 0}, 0.015)
	endif
	
	objectPointAt(_obj, _dir)
return void

/* Objects in a group use the group's local space for scale. This function 
applies the group's scale modifier to a non-group object. */
// +CORE LOADER
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
// +CORE LOADER
function applyGrpTransform(_obj, _grpObj)
return applyGrpTransform(_obj, _grpObj, true)

function applyGrpTransform(_obj, _grpObj, _hasScale)
		
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
	_obj.up = changeVecSpaceZFwd(_obj.up, _grpObj.fwd, _grpObj.up, 
		objR, {0, 0, 0})
return _obj

/* Objects in a group use the group's local space for position. This 
function applies the group's postion modifier to a non-group object. */
// +CORE LOADER
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
// +CORE LOADER
function mapObjEquals(_obj1, _obj2)
	var eq = _obj1.fwd == _obj2.fwd 
		and _obj1.up == _obj2.up 
		and _obj1.scale == _obj2.scale 
		and _obj1.pos == _obj2.pos 
		and _obj1.bankIdx == _obj2.bankIdx
return eq

/* To reduce variable count, bank and index numbers are stored together
in a single variable. They each occupy 16 bits of a 32-bit int, with the
16 MSBs representing the bank and the 16 LSBs representing the index. */
// +CORE LOADER
function encodeBankIdx(_bank, _idx)
return bitFieldInsert(0, 0, 16, _idx) | bitFieldInsert(0, 16, 16, _bank)

// +CORE LOADER
function decodeBank(ref _in, _bankIdx)
	_in = bitFieldExtract(_bankIdx, 16, 16)
return _in

// +CORE LOADER
function decodeIdx(ref _in, _bankIdx)
	_in = bitFieldExtract(_bankIdx, 0, 16)
return _in

/* Cell and index work the same way as bank/index but are separate functions
both for clarity and in case the system changes. */
// +CORE LOADER
function decodeCell(_cellIdx)
return bitFieldExtract(_cellIdx, 16, 16)

// +CORE LOADER
function encodeCellIdx(_cell, _idx)
return bitFieldInsert(0, 0, 16, _idx) | bitFieldInsert(0, 16, 16, _cell)

/* To reduce variable count, object names are stored only in the definition
and not cached in the object instantiation. This function reads the object's 
name out of the appropriate definition. */
// +CORE LOADER
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
// CELLS

	// ----------------------------------------------------------------
	// CREATION AND PROPERTIES

/* Adds a new cell in the map. The cell will snap to the closest appropriate
position to _pos. */
// +CORE LOADER
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
// +CORE LOADER
function getCellWidth()
return abs(g_cellExt.lo.x) + abs(g_cellExt.hi.x)

/* Discovers which cells are adjacent to the cell that contains the given 
position. */
// +CORE LOADER
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
// +CORE LOADER
function updateAdjacentCell(_idx, _adjIdx, _neighborIdx)
	g_cell[_idx][1][round(_adjIdx)] = _neighborIdx
return void

/* Gets a cell's array of adjacent cells. _pos allows for a fallback check if
_midCell dosn't exist. */
// +CORE LOADER
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
// +CORE LOADER
function getOffsetFromAdjIdx(_idx)
return {_idx % 3 - 1, floor((_idx % 9) / 3) - 1, floor(_idx / 9) - 1}

/* Returns an array indices of cells whose midpoints are within the given
range from the origin. */
// +CORE LOADER
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
// +CORE LOADER
function getAdjIdxFromOffset(_off)
	var adjIdx
	
	if abs(_off.x) <= 1 and abs(_off.y) <= 1 and abs(_off.z) <= 1 then
		adjIdx = (_off.x + 1) + (_off.y + 1) * 3 + (_off.z + 1) * 9
	else
		adjIdx = -1
	endif	
return adjIdx

/* Returns whether the position is within the given cell. */
// +CORE LOADER
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
// +CORE LOADER
function getCellPosFromPos(_pos)
	// Assume cell is an equal-sided cube
	var cellW = getCellWidth()
	var cellPos = roundVec3ToMultiple(_pos, cellW, -cellW / 2)
return cellPos

/* Finds the cell that contains position _pos. */
// +CORE LOADER
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

/* Snaps a direction's axis values to 1, 0, or -1. Conceptually equivalent to
a unit vector for finding adjacent cells. */
// +CORE LOADER
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
// +CORE LOADER
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

	// ----------------------------------------------------------------
	// COLLISION BITS

/* Gets a binary representation of an object's collision box within a cell. 
The cell (5x5x5 dimensions) is divided into 125 units, with 0 at {0, 0, 0}
and 124 at {5, 5, 5} (incrementing x first, then y, then z). */
// +CORE LOADER
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
	
	// Slightly overshoot on scale to pick up certain borderline collisions
	var gridCollider = placeObject(cube, g_cell[_objCell][0], {0.5000001, 0.5000001, 0.5000001})
	
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
// +CORE LOADER
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
// +CORE LOADER
function getExtCollisionBitsFast(_pos, _ext, _scale, _fwd, _up)
	_pos = roundVec3ToMultiple(_pos, 1, -0.5) // Snap position to nearest gridBit point
	
	var cellW = getCellWidth()
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
						yOffset = -cellW * floor((firstBitPos % pow(cellW, 2)) / cellW) * max(0, y) + i * cellW
						zOffset = -cellW * floor((firstBitPos % pow(cellW, 3)) / cellW) * max(0, z) + j * pow(cellW, 2)
						cells[adjIdx] = bitFieldSetLong(cells[adjIdx], 
							firstBitPos + xOffset + yOffset + zOffset,
							xW[x], 1)
					repeat
				repeat
			repeat
		repeat
	repeat
return cells

/* Gets a row of bits along a given axis, potentially spanning up to three cells,
that can be copied along other axes to fill out the binary collision box 
representation.

_axis: 0 = x, 1 = y, 2 = z */
// +CORE LOADER
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
// +CORE LOADER
function getGridIdxFromPosInCell(_pos, _cellPos, _useCellPos)
	var cellW = getCellWidth()
	
	if !_useCellPos then
		_cellPos = getCellPosFromPos(_pos)
	endif
	
	_pos = floorVec(_pos - _cellPos + {cellW, cellW, cellW} * 0.5)
return _pos.x + _pos.y * cellW + _pos.z * cellW * cellW

/* Searches in an object's grid bit list and returns the data for a specific
cell.  */
// +CORE LOADER
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

// ----------------------------------------------------------------
// SYSTEM

/* This function is a wrapper for editor-only functions that is left blank in
the Core Loader, which allows non-editor calls where the target function 
doesn't exist to silently fail instead of throwing a FUZE error. */
// +CORE LOADER
function edFunction(ref _in, _funcName, _argArr)
return _in

	// ----------------------------------------------------------------
	// COLLISIONS

/* Returns the normal direction of a surface. */
// +CORE LOADER
function getNormal(ref _in, _obj, _cell, _colCon, _range, _castPos, _planeOrig, _castFwd, _castUp, _gridBitAdj)
	var castCount = 3
	_castFwd = normalize(_castFwd)
	_castUp = normalize(_castUp)
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
		//	_colCon.gridBit[13], false, float_max)
		//	[], false, float_max)
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
// +CORE LOADER
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
	_colCon.continuedCol = false
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
// +CORE LOADER
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
	var eqRes = deltaTime()
	//var eqRes = deltaTime() * 5
	var checkCol = true
	
	if _useGrav and _normRecurLimit == 2 then
		_comPos = _comPos + _colCon.grav * deltaTime()
		_colCon.vel = _comPos - prevComPos
	endif
	
	var prevOrig = getOriginFromCom(prevComPos, _colCon.centerOfMass, prevFwd, prevUp, prevScale)
	var orig = getOriginFromCom(_comPos, _colCon.centerOfMass, _fwd, _up, _scale)
	
	// Short-circuit collision check if nothing has changed from the previous collision
	if _normRecurLimit == 2 
			//and (length(_colCon.vel) <= 0.01 or _colCon.colThisFrame or _colCon.continuedCol or _colCon.deflectThisFrame)
			and length(_colCon.vel) <= eqRes and _colCon.colThisFrame// or _colCon.continuedCol or _colCon.deflectThisFrame)
			and _collisionMode >= 3 
			and !_forceUpdate 
			and equals(_comPos, _colCon.colPos, eqRes)
			and equals(_fwd, _colCon.colFwd, eqRes)
			and equals(_up, _colCon.colUp, eqRes)
			and _scale == _colCon.colScale
			then
		_colCon.colThisFrame = true
		_colCon.continuedCol = false
		checkCol = false
		
		if _useGrav then
			_colCon.vel = {0, 0, 0}
		endif
	endif
	
	_colCon.deflectThisFrame = false
	
	if checkCol then
		_colCon.continuedCol = false
		
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
		if distance(prevOrig + prevCenter, orig + center) <= objMinDim then
			cellResult = updateCellContext(_colCon.cell, _colCon.cellPos, orig, false, _forceUpdate)
			updateColContext(_colCon, cellResult.cell, orig, _fwd, _up, 
				_colCon.ext, _scale, _obj, _getAllCollisions, _collisionMode, prevOrig, _getNormal, [], [])
			
			_colCon.fwd = _fwd
			_colCon.up = _up
		else // Use aux collider
			var lineDir = normalize((orig + center) - (prevOrig + prevCenter))
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
		
		if _normRecurLimit == 2 then
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
				
				// Bounce obj off surface, modify rotation rate/axis, and modify vel based on rotation
				if _useGrav then
					var oldVel = _colCon.vel
					_colCon.vel = reflect(oldVel, _colCon.normal[0]) / (_colCon.mass * 0.1 + 1)
					var newRot
					var needRot = true
					
					if _colCon.normal[0] != {0, 0, 0} then
						//setTargetFaceForColRot(_colCon, _colCon.normal[0], _fwd, _up)
						/**
						var newFwd = projectVecToPlane(_fwd, {0, 0, 0}, _colCon.normal[0])
						
						if newFwd != {0, 0, 0} then
							newFwd = normalize(newFwd)
						else
							newFwd = _fwd
						endif
						*/
						var rotDeg
						var normMatchAxis
						
						if _colCon.normAxis == "fwd" then
							normMatchAxis = _fwd
						else if _colCon.normAxis == "up" then
							normMatchAxis = _up
						else
							normMatchAxis = safeCross(_fwd, _up)
						endif endif
						
						if abs(dot(normMatchAxis, _colCon.normal[0])) >= 0 then
							rotDeg = getAngleBetweenVecs(normMatchAxis, _colCon.normal[0])
						else
							rotDeg = getAngleBetweenVecs(normMatchAxis, _colCon.normal[0] * -1)
						endif
						
						//_colCon.rotVel = min(rotDeg * 0.25 * (length(_colCon.vel) / distance(_colCon.comPos, _colCon.colPos)), 10)
						//_colCon.rotVel *= (length(_colCon.vel)) / length(_colCon.delta) * _colCon.mass * 0.5
						var massScaler = lerp(0.007, 0.0003, _colCon.mass / 100)
						//_colCon.rotVel *= (length(_colCon.vel)) / (length(_colCon.delta) * _colCon.mass * massScaler)
						//_colCon.rotVel *= dot(normMatchAxis, _colCon.normal[0])
						
						
						/*
						var degToFwd = getAngleBetweenVecs(_fwd, newFwd)
						var degToNorm = getAngleBetweenVecs(_fwd, _colCon.normal[0])
						var degToInvNorm = getAngleBetweenVecs(_fwd, _colCon.normal[0] * -1)
						
						if degToNorm < degToFwd and degToNorm < degToInvNorm then
							var rotAxis = safeCross(_fwd, _colCon.normal[0])
							
							if rotAxis != {0, 0, 0} and degToNorm != 0 then
								//newRot = rotAxis
								_colCon.rotVel = degToNorm * 0.2
								needRot = false
							endif
						else if degToInvNorm < degToFwd and degToInvNorm < degToNorm then
							var rotAxis = safeCross(_fwd, _colCon.normal[0] * -1)
							
							if rotAxis != {0, 0, 0} and degToInvNorm != 0 then
								//newRot = rotAxis
								_colCon.rotVel = degToInvNorm * 0.2
								needRot = false
							endif
						else
							var rotAxis = safeCross(_fwd, newFwd)
							
							if rotAxis != {0, 0, 0} and degToFwd != 0 then
								//newRot = rotAxis
								_colCon.rotVel = degToFwd * 0.2
								needRot = false
							endif
						endif endif
						*/
					endif
					/*
					if needRot then
						newRot = safeCross(_colCon.vel, oldVel)
					endif
					*/
					newRot = _colCon.rotVelAxis
					if newRot != {0, 0, 0} then
						//_colCon.vel = axisRotVecBy(_colCon.vel, newRot, _colCon.rotVel * 10)
						//_colCon.vel = axisRotVecBy(_colCon.vel, newRot, _colCon.rotVel / 2)
						_colCon.vel = axisRotVecBy(_colCon.vel, newRot, (_colCon.rotVel * 30) / (_colCon.mass))
						//debugPrint(0.1, [(_colCon.rotVel * 30) / (_colCon.mass), _colCon.rotVel * 30, _colCon.rotVel])
					endif
					
					deflPos += _colCon.vel
					
					//_fwd = axisRotVecBy(_fwd, _colCon.rotVelAxis, _colCon.rotVel)
					//_up = axisRotVecBy(_up, _colCon.rotVelAxis, _colCon.rotVel)
				else
					//deflPos = prevComPos + (deflPos - prevComPos) / _colCon.mass
				endif
			
				if _normRecurLimit == 2 and len(_colCon.normal) then
					if _colCon.normal[0] != {0, 0, 0} then
						var r = safeCross(_fwd, _up)
						
						if (_colCon.normAxis == "fwd" and abs(dot(_fwd, _colCon.normal[0])) < 0.99) 
								or (_colCon.normAxis == "up" and abs(dot(_up, _colCon.normal[0])) < 0.99) 
								or (r != {0, 0, 0} and _colCon.normAxis == "r" and abs(dot(r, _colCon.normal[0])) < 0.99) 
								or length(_colCon.vel) > deltaTime() * 8 then
							resetFwdUp = false
							//debugPrint(0.0001, ["", "", "", "", "", "", "", "0"])
							if (_colCon.normAxis == "fwd" and abs(dot(_fwd, _colCon.normal[0])) > 0.9) 
									or (_colCon.normAxis == "up" and abs(dot(_up, _colCon.normal[0])) > 0.9) 
									or (r != {0, 0, 0} and _colCon.normAxis == "r" and abs(dot(r, _colCon.normal[0])) > 0.9) then
								//_colCon.rotVel *= 0.9
								//debugPrint(0.0001, ["", "", "", "", "", "", "", "", "1"])
							endif
						else
							_colCon.rotVel = 0
							var normAxis
							
							//setTargetFaceForColRot(_colCon, _colCon.normal[0], _fwd, _up)
							
							if _colCon.normAxis == "fwd" and abs(dot(_fwd, _colCon.normal[0])) >= 0.99 then
								normAxis = _fwd * getSign(dot(_fwd, _colCon.normal[0]))
								//debugPrint(0.0001, ["fwd"])
							else if _colCon.normAxis == "up" and abs(dot(_up, _colCon.normal[0])) >= 0.99 then
								normAxis = _up * getSign(dot(_up, _colCon.normal[0]))
								//debugPrint(0.0001, ["up"])
							else
								normAxis = r * getSign(dot(r, _colCon.normal[0]))
								//debugPrint(0.0001, ["r", r])
							endif endif
							
							var deg = getAngleBetweenVecs(normAxis, _colCon.normal[0])
							var axis = safeCross(normAxis, _colCon.normal[0])
							
							if axis != {0, 0, 0} then
								_fwd = axisRotVecBy(_fwd, axis, deg)
								_up = axisRotVecBy(_up, axis, deg)
								//debugPrint(0.0001, ["correcting"])
							endif
						endif
					endif
				endif
				
				/* To avoid looping through redundant positions, only continue if the deflected position isn't the same as 
				the position the object started in. */
				if length(prevComPos - deflPos) > eqRes or length(_fwd - _colCon.fwd) > eqRes or length(_up - _colCon.up) > eqRes then
				//if length(_fwd - _colCon.fwd) > 0.01 or length(_up - _colCon.up) > 0.01 then
				//if false then
					_colCon.comPos = prevComPos
					_colCon.scale = prevScale
					
					if resetFwdUp then
						_colCon.fwd = prevFwd
						_colCon.up = prevUp
					endif
					
					//var normBuf = _colCon.normal
					var argColCon = _colCon
					//var deflOrig = getOriginFromCom(deflPos, _colCon.centerOfMass, _fwd, _up, _scale)
					//debugPrint(0.0001, [deflPos, _colCon.vel, _colCon.mass, prevComPos, _comPos, _colCon.delta])
					
					updateObjCollisions(_obj, argColCon, deflPos, _fwd, _up, _scale, _collisionMode, _forceUpdate, 
						_getAllCollisions, _handleTransformChange, _getNormal, _normRecurLimit - 1, false)
					_colCon = argColCon
					
					//_colCon.normal = normBuf
					
					if _normRecurLimit <= 2 and !_colCon.colThisFrame then
						_colCon.deflectThisFrame = true
					endif
				endif
				
				//if _normRecurLimit == 2 and _colCon.colThisFrame then
				if _colCon.colThisFrame then
				//if _normRecurLimit == 2 then
					if _handleTransformChange then
						if _scale != _colCon.scale then
							setObjectScale(_obj, prevScale)
						endif
						
						if _fwd != prevFwd or _up != prevUp then
							//setObjRot(_obj, prevOrig, _fwd, _up)
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
// +CORE LOADER
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
						//_colCon.colDepth = push(_colCon.colDepth, float_max)
						_colCon.colThisFrame = true
					else
						_colCon.objList = push(_colCon.objList, [ .cell = curCell, .idx = i, .adj = h ])
					endif
				endif
			repeat
		endif
	repeat
return _colCon

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
			//_colCon.colDepth = push(_colCon.colDepth, float_max)
			_colCon.colThisFrame = true
			
			if i > 0 then
				_colCon.objList = insert(_colCon.objList, _colCon.objList[i], 0)
				_colCon.objList = remove(_colCon.objList, i + 1)
			endif
		endif
	repeat
return _colCon

/* Find current and precvious data about object's collision boundaries and direction. */
// +CORE LOADER
function getRaycastColPoints(_ext, _fwd, _up, _scale, _pos, _prevPos)
	var castPoint = getExtPoints(_ext, _scale, _fwd, _up)
	var center = (castPoint[0] + castPoint[1] + castPoint[2] + castPoint[3] 
		+ castPoint[4] + castPoint[5] + castPoint[6] + castPoint[7]) / 8
	
	var prevCastPoint = getExtPoints(_ext, _scale, _fwd, _up)
	var prevCenter = (prevCastPoint[0] + prevCastPoint[1] + prevCastPoint[2] 
		+ prevCastPoint[3] + prevCastPoint[4] + prevCastPoint[5] + prevCastPoint[6] 
		+ prevCastPoint[7]) / 8
	
	var dir = normalize((center + _pos) - (prevCenter + _prevPos))
	var delta = (center + _pos) - (prevCenter + _prevPos) 
	
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
// +CORE LOADER
function resolveSimpleRaycastCollision(ref _colCon, _pos, _fwd, _up, _ext, _scale, _prevPos)
	var colPool = _colCon.collision
	
	_colCon.collision = []
	_colCon.normal = []
	_colCon.colDepth = []
	_colCon.colThisFrame = false
	_colCon.colDat = []
	
	var pointResult = getRaycastColPoints(_ext, _fwd, _up, _scale, _pos, _prevPos)
	
	_colCon.delta = pointResult.delta
	var dir = pointResult.dir
	var castObj
	var cast
	var maxDim = getMaxDim(_ext, _scale) / 2
	
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
return _colCon


/* Get collision results using a complex raycast algorithm that checks a polygon made of raycasts,
finds collision depth and normal, and calculates target rotation. */
// +CORE LOADER
function resolveComplexRaycastCollision(ref _colCon, _cell, _pos, _fwd, _up, _ext, _scale, _getAllCollisions, _collisionMode, _prevPos, _getNormal, _gridBitOverride)
	var colPool = _colCon.collision
	
	_colCon.collision = []
	_colCon.normal = []
	_colCon.colDepth = []
	_colCon.colThisFrame = false
	_colCon.colDat = []
	
	var pointResult = getRaycastColPoints(_ext, _fwd, _up, _scale, _pos, _prevPos)
	
	var castPoint = pointResult.castPoint
	var prevCastPoint = pointResult.prevCastPoint
	var center = pointResult.center
	var prevCenter = pointResult.prevCenter
	_colCon.delta = pointResult.delta
	var dir = pointResult.dir
	
	timer = time()
	var prevCastDat = getCollisionCastDat(_collisionMode, _prevPos, _fwd, _up, 
		_colCon.scale, _ext, prevCastPoint, prevCenter, _prevPos - (_pos - _prevPos), dir)
	var castObj
	var cast
	var castDat = getCollisionCastDat(_collisionMode, _pos, _fwd, _up, _scale, _ext, castPoint, center, _prevPos, dir)
	//var castOrder = [ 0, 1, 2, 3, 4, 5, 6, 7 ]
	var castOrder = [ 3, 4, 5, 6, 0, 1, 2, 7, 8, 9 ]
	var castResult
	complexRaycast(castResult, _colCon, colPool, castDat, prevCastDat, castOrder, _getAllCollisions, _gridBitOverride)
	var closestCol = castResult.bestCol
	_colCon = castResult.colCon
				
	if _getNormal and closestCol.cast < float_max then
		_colCon.delta = closestCol.castDat[0] - prevCastDat[closestCol.castDatIdx][0]
		dir = normalize(_colCon.delta)
		castObj = getMapObjFromRef(g_cell[closestCol.obj.cell][closestCol.obj.idx])
		var castHit = closestCol.castDat[0] + closestCol.cast * closestCol.castDat[1]
		_colCon.colDat = closestCol
		var normCastPos
		
		if closestCol.cast <= closestCol.castDat[2] / 2 or closestCol.castDatIdx >= 7 then
			normCastPos = castHit - closestCol.castDat[0] + prevCastDat[closestCol.castDatIdx][0]
		else
			var invCastStart = closestCol.castDat[0] + closestCol.castDat[1] * closestCol.castDat[2]
			var prevInvCastStart = prevCastDat[closestCol.castDatIdx][0] + prevCastDat[closestCol.castDatIdx][1] 
				* prevCastDat[closestCol.castDatIdx][2]
			normCastPos = castHit - invCastStart + prevInvCastStart
			dir = normalize(invCastStart - prevInvCastStart)
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
			var castPointProj = projectVecToPlane(normCastPos, normCastHit, norm)
			
			var depthStart
			if _colCon.colDat.invCastDir then
				depthStart = closestCol.castDat[0] + closestCol.castDat[1] * closestCol.castDat[2]
			else
				depthStart = closestCol.castDat[0]
			endif
			
			var depthProj = projectVecToPlane(depthStart, normCastHit, norm)
			var pointDepth = distance(depthStart, depthProj)
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
// +CORE LOADER
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
		
		//debugPrint(0, [fwdScore, upScore, rScore, "------", fwdDif, upDif, rDif ])
		
		//if (abs(fwdDif) + fwdScore) - (abs(upDif) + upScore) > 0.1 and (abs(fwdDif) * fwdScore) - (abs(rDif) + rScore) > 0.1 then
		if (abs(fwdDif) + fwdScore) > (abs(upDif) + upScore) and (abs(fwdDif) + fwdScore) > (abs(rDif) + rScore) then
			mostAngledDir = _fwd * getSign(fwdDif)
			offAxis = r * getSign(fwdDif)
			_colCon.normAxis = "fwd"
		//else if (abs(upDif) + upScore) - (abs(fwdDif) + fwdScore) > 0.1 and (abs(upDif) + upScore) - (abs(rDif) + rScore) > 0.1 then
		else if (abs(upDif) + upScore) > (abs(fwdDif) + fwdScore) and (abs(upDif) + upScore) > (abs(rDif) + rScore) then
			mostAngledDir = _up * getSign(upDif)
			offAxis = r * getSign(upDif) * -1
			_colCon.normAxis = "up"
		else
			mostAngledDir = r * getSign(rDif)
			offAxis = _fwd * getSign(rDif)
			_colCon.normAxis = "r"
		endif endif
		
		//mostAngledDir = _up * getSign(upDif)
		
		var newRotAxis = safeCross(mostAngledDir, _norm)
		
		if newRotAxis != {0, 0, 0} then
			//newRotAxis = _normalize(newRotAxis)
			_colCon.rotVelAxis = newRotAxis
		else
			newRotAxis = offAxis
		endif
		
		//_colCon.rotVel = max(1, length(_colCon.vel) * 10)
		var massScaler = lerp(2, 10, _colCon.mass / 100)
		var gravNorm
		
		if _colCon.grav != {0, 0, 0} then
			gravNorm = normalize(_colCon.grav)
		else
			gravNorm = {0, 0, 0}
		endif
		
		var lowLimit = (dot(_norm * -1, gravNorm) + 1) / 2
		//if _colCon.rotVel < 0.1 then
			//_colCon.rotVel = max(1, (length(_colCon.vel) * 250) / massScaler)
			//_colCon.rotVel = max(lowLimit * 12, (length(_colCon.vel) * 50) / massScaler)
		//else
			if abs(dot(mostAngledDir, _norm)) > 0.5 and lowLimit > 0.9 and _colCon.rotVel > 0 then
				//if abs(dot(mostAngledDir, _norm)) > 0.8 then
					if _colCon.rotVel >= 4 then
						_colCon.rotVel = max(_colCon.rotVel * (1 / (max(_colCon.mass, 6) / 5)), 1)
					else
						_colCon.rotVel = max(_colCon.rotVel * (1 / (max(_colCon.mass, 22) / 20)), 4)
					endif
				//else
				//	_colCon.rotVel *= 1.05
				//endif
			else if length(_colCon.vel) > 0.1 and length(_colCon.delta) > 0.1 then
				//_colCon.rotVel = max(_colCon.rotVel / 2, (length(_colCon.vel) * 250) / massScaler)
				var velMod = abs(dot(_norm, normalize(_colCon.vel)))
				//_colCon.rotVel = max(lowLimit * 12, (length(_colCon.vel) * 50) / massScaler) * velMod
				_colCon.rotVel = max(lowLimit * 4, (length(_colCon.vel) * 50) / massScaler) * velMod
				//((dot(_norm * -1, normalize(_colCon.grav)) + 1) / 2)
				//debugPrint(0.0001, [])
			endif endif
		//endif
		
	endif
return _colCon

/* Returns shape data for raycast collision detection. */
// +CORE LOADER
function getCollisionCastDat(_type, _pos, _fwd, _up, _scale, _ext, _extPoints, _center, _prevPos, _dir)
	var r = safeCross(_fwd, _up)
	var zDir = _center + normalize(_fwd) * abs(_ext.hi.z - _ext.lo.z) * 0.5 * _scale.z
	var xDir = _center + normalize(r * -1) * abs(_ext.hi.x - _ext.lo.x) * 0.5  * _scale.x
	var yDir = _center + normalize(_up) * abs(_ext.hi.y - _ext.lo.y) * 0.5  * _scale.y
	var castDat
	
	if _type == 3 then
		// Spheroid -- diagonal casts towards the extent corners are shorter vs. cuboid
		var avgDim = (distance(_extPoints[0], _extPoints[1]) / 2 + distance(_extPoints[0], _extPoints[2]) / 2 + distance(_extPoints[0], _extPoints[4]) / 2) / 3
		castDat = [ // position, direction, distance
			//[ _pos + yDir, normalize(yDir - _center) * -1, abs(_ext.hi.y - _ext.lo.y) * _scale.y ], 
			[ _pos + zDir, normalize(zDir - _center) * -1, abs(_ext.hi.z - _ext.lo.z) * _scale.z ], 
			//[ _pos + xDir, normalize(xDir - _center) * -1, abs(_ext.hi.x - _ext.lo.x) * _scale.x ],
			[ _pos + _center + (normalize(_extPoints[4] - _center) * avgDim), normalize(_extPoints[4] - _center) * -1, avgDim * 2 ], 
			[ _pos + _center + (normalize(_extPoints[5] - _center) * avgDim), normalize(_extPoints[5] - _center) * -1, avgDim * 2 ], 
			[ _pos + _center + (normalize(_extPoints[6] - _center) * avgDim), normalize(_extPoints[6] - _center) * -1, avgDim * 2 ], 
			[ _pos + _center + (normalize(_extPoints[7] - _center) * avgDim), normalize(_extPoints[7] - _center) * -1, avgDim * 2 ]
		]
	else
		// Cuboid
		var rad = distance(_center, _ext.hi * _scale)
		//var crossDist = (rad * 2)
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
	/* Shift the raycast starts and ends inward slightly to avoid borderline collision cases that cause problems
	with normal-based position redirects. */
	var i
	for i = 0 to len(castDat) loop
		//castDat[i][0] = castDat[i][0] + castDat[i][1] * 0.1
		//castDat[i][2] -= 0.2
		//debugLine(castDat[i][0], castDat[i][0] + castDat[i][1] * castDat[i][2], 0.01, 0.1, lime)
	repeat
return castDat

/* Checks for collisions based on cast shape defined by getCollisionCastDat(). */
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
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
// +CORE LOADER
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


// ----------------------------------------------------------------
// DEBUG

/* General debug function for printing data to screen. */
function debug()
	printAt(0, 0, "colCon.vel: " + str(colCon[focusObjIdx].vel))
	if len(colCon[focusObjIdx].normal) then
		printAt(0, 1, "colCon.normal[0]: " + str(colCon[focusObjIdx].normal[0]))
	endif
	printAt(0, 2, "colCon.fwd: " + str(colCon[focusObjIdx].fwd))
	printAt(0, 3, "colCon.up: " + str(colCon[focusObjIdx].up))
	printAt(0, 4, "colCon.rotVel: " + str(colCon[focusObjIdx].rotVel))
	printAt(0, 5, "colCon.rotVelAxis: " + str(colCon[focusObjIdx].rotVelAxis))
	printAt(0, 6, "colCon.normAxis: " + str(colCon[focusObjIdx].normAxis))
	if len(colCon[focusObjIdx].colDepth) then
		printAt(0, 7, "colCon.colDepth[0]: " + str(colCon[focusObjIdx].colDepth[0]))
	endif
	updateDebugLines()
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
/// *
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
			//g_kb = getKeyboardBuffer()
			c = controls(0)
			//c = applyKb(c, g_bind.menu).c
			
			//if c.b and !g_cDat[g_cIdx.b].held then
			if c.b then
				//g_cDat[g_cIdx.b].held = true
				break
			else if !c.b then
				//g_cDat[g_cIdx.b].held = false
			endif endif
		repeat
	endif
	
	setDrawTarget(target)
return void

function breakpoint()
return breakpoint("")

function breakpoint(_text)
	//if g_breakpoint then
		debugPrint(0, gheight() / 20, ["--Breakpoint--", "", _text])
	//endif
return void
// */
