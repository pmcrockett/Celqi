![Celqi montage header](/Image/Celqi%20logo%20montage%20small.jpg)

[YouTube demo](https://www.youtube.com/watch?v=de9ErX7hD_s)

FUZE download code: **H1R23MNDDT**

# CELQI - 3D MAP EDITOR FOR FUZE (1.0.00)

--------
Celqi is a 3D map editor for FUZE4 Nintendo Switch that makes it easy to quickly build complicated environments out of objects from FUZE's extensive asset library. Celqi is primarily a graphical editor and is designed to provide a user-friendly alternative to directly defining 3D object placement in code. In this way, it is roughly analogous to FUZE's built-in 2D map editor. Celqi stores its map data in the text file, and by including a subset of Celqi's functions (the core loader) in your game project, you can access the map data from code without running the editor.

Notable features of Celqi include:

* Multiple save files.
* Unrestricted map dimensions.
* Object merging for easier modularity.
* Full support for lights.
* Full-map collision detection.
* USB keyboard support.
* Experimental physics engine.

--------
# EDITOR

--------
### BANKS AND OBJECTS
Maps in Celqi are constructed from objects, which are 3D models from FUZE's asset library, primitive 3D shapes, or lights. These objects are stored in a library that is organized into multiple banks. The banks for lights and primitives are predefined, but the banks for models are customizable. You might, for example, create banks that reflect the structure of the FUZE media browser, or you might create banks based on object purpose -- a floor tile bank, a wall tile bank, and so forth.

--------
### SETUP
Celqi uses a customizable set of 3D models. Because the FUZE asset browser cannot be accessed from within Celqi, you must add the 3D assets you want to use to the source code before you can use them from within Celqi. This is done by editing the `getModels()` function so that Celqi can load the 3D assets on launch.

Each bank is a sub-array within `getModels()`'s `models` array. Each object definition within a bank is a two-element array whose first element is a string containing the object's display name and whose second element is a string containing the object's filepath as returned by the FUZE media browser. If the name is an empty string (`""`), the object will be auto-named based on the filepath.

Optionally, the first element of a bank may be a single-element array that provides a bank name. If this bank name isn't given, the bank will be auto-named.

Here is an example of what a full `models` array might look like:
```
var models = [
	[
		// Bank name (optional)
		["Nature 1"],
		// Object name, object filepath
		["Stump", "Kenney/Trunk_01"], 
		["Shrub 1", "Kenney/Plant_1_01"],
		["Shrub 2", "Kenney/Plant_2_01"]
	],
	[	
		// No bank name given, so the bank will be auto-named.
		// Object will be auto-named "Plate River Dirt 01".
		["", "Kenney/Plate_River_Dirt_01"], 
		// Object will be auto-named "Plate River Corner Dirt 01".
		["", "Kenney/Plate_River_Corner_Dirt_01"], 
		// Object will be auto-named "Rock 1 01".
		["", "Kenney/Rock_1_01"] 
	]
]
```
Objects may have whatever names you want, but each name must be unique regardless of what bank the object is in.

FUZE has an internal memory limit of 124 models loaded, so you cannot create more than 124 object definitions. Exceeding this limit will produce an error message when Celqi launches. If Celqi will not run after creating banks and objects, make sure that all array items are separated by commas, that the final element of each array does not end with a comma, and that all bank/object names and filepaths are enclosed in double quotes.

--------
### DELETING THE CASTLE DEMO
The Castle Demo project that is included with the default Celqi code provides an example of what can be built with Celqi, but you will likely want to delete it to free up model space if you are not using the definitions in your own maps. 

To delete the project, select *File > Manage maps ... > Castle Demo* from within Celqi and confirm the map deletion prompt, then delete the Castle Demo bank in the `getModels()` function.

--------

### MODIFYING BANKS AND OBJECTS
Sometimes you may want to move, rename, or delete an object definition.

##### MOVING OBJECTS
To move an object to a different bank, simply move the name/filepath element to a different bank array. Celqi's save file data references object definitions by their display names, so Celqi will locate the object regardless of what bank it's in.

##### RENAMING OBJECTS
To rename an object, modify its name string and then launch Celqi. If the object hasn't been used in a merged object (see [**MERGED OBJECTS**](https://github.com/pmcrockett/Celqi#merged-objects)) or a saved map, no further action is necessary. Otherwise, Celqi will display a message that the old object definition no longer exists and will prompt you to relink the references to that definition. Select the new object name from the list, and Celqi will change the old object name to the new object name. Note that for renamed definitions used in merged objects, the relink prompt will occur at launch, whereas for renamed definitions used in maps, the relink prompt will occur when the map is loaded.

##### DELETING OBJECTS
To delete an object, remove its name/filepath array element and then launch Celqi. If the object hasn't been used in a merged object or a saved map, no further action is necessary. If it has, Celqi will display the missing object definition prompt as it does for object renaming. To delete the object, select *Delete all references to 'OBJECT NAME' without relinking*. This will completely and permanently remove the object from any merged objects or maps that use it. It is usually a better idea to manually delete all occurrences of an object from within the map editor before deleting the definition itself so you can be sure of exactly how the deletion will affect your maps.

##### REPLACING OBJECTS WITH OTHER OBJECTS
From the missing object definition prompt, you can also relink an object reference to a different object, which replaces all instances of the old object with the new object. Note that this may have unintended results: the relinker will not change object scale or position, so the newly linked objects will still use the deleted objects' scales and positions, which may not be desirable if the new definition has a different base size or a different position origin from the deleted definition. It is usually better to make these sorts of substitutions manually from within the map editor.

--------
### CONTROLS

Celqi is designed to be used with Joycons, though it is also possible to use a USB keyboard. Keyboard bindings can be manually changed by editing the `g_bind` struct.

##### CAMERA
|Action|Joycon|Keyboard|
|---|---|---|
|Forward|(ZR)|w|
|Backward|(ZL)|s|
|Pitch|Right stick up/down|Q/E|
|Yaw|Right stick left/right|q/e|
|Slide up/down/left/right|D-pad|W/S/A/a/D/d|

##### EDITING
|Action|Joycon|Keyboard|
|---|---|---|
|Cycle edit mode|(R\)|Space|
|Start mass selection|(B)|\\
|Cancel mass selection (while selecting)|(B)|\\
|Confirm mass selection (while selecting)|(A)|Enter|
|Place current brush object|(A)|Enter|

##### POSITION  MODE
|Action|Joycon|Keyboard|
|---|---|---|
|Move cursor forward/backward/left/right|Left stick|i/k/j/l|
|Move cursor up/down/left/right|(L) + left stick|o/u/j/l|

##### ROTATE MODE
|Action|Joycon|Keyboard|
|---|---|---|
|Rotate on axis 1|Left stick up/down|i/k|
|Rotate on axis 2|Left stick left/right|j/l|
|Cycle rotation axes|(L)|x|

##### SCALE MODE
|Action|Joycon|Keyboard|
|---|---|---|
|Change scale|Left stick up/down|i/k|
|Cycle scale axes|(L)|x|

##### MENUS
|Action|Joycon|Keyboard|
|---|---|---|
|Open/close main menu|(X)|Tab|
|Open/close object menu|(Y)|`|
|Move selection|Left stick/D-pad|w/s/a/d|
|Open submenu|Left stick right/D-pad right/(A)|d/Enter|
|Close submenu|Left stick left/D-pad left/(B)|a/\\
|Change bank (object menu)|(L)/(R\)|q/e|
|Confirm selection|(A)|Enter|

##### TEXT VIEWING
|Action|Joycon|Keyboard|
|---|---|---|
|Scroll|Left stick/D-pad|w/s|
|Fast scroll|Right stick||

--------
### MAIN MENU
##### FILE
* **New map ...** — Closes the current map and creates a new map. You will be prompted to save the current map if it has changed.
* **Save map** — Saves map under its current name.
* **Save map as ...** — Saves the map under a different name.
* **Load map ...** — Closes the current map and opens a saved map. You will be prompted to save the current map if it has changed.
* **Manage maps ...** — Opens a file browser to select maps for deletion.
* **About ...** — Shows Celqi version and author info.
* **Release notes ...** — Shows changes made in the current release version.

##### OBJECTS UNDER CURSOR
* **Toggle selection** — Adds an object under the cursor to the selection or removes it from the selection.
* **Delete** — Deletes an object under the cursor.

##### SELECTION
* **Remove from selection** — Removes an individual object from the current selection.
* **Clear selection** — Removes all objects from the current selection.
* **Copy**
	* **Copy from (first) object origin** — Copies selected object(s) to the brush and the clipboard bank. The position origin will be at the object's origin (if a single object) or the first selected object's origin (if multiple objects).
	* **Copy from cursor origin** — Copies selected object(s) to the brush and the clipboard bank. The position origin will be at the current cursor position.
* **Cut**
	* **Cut from (first) object origin** — Copies selected object(s) to the brush and the clipboard bank and removes the original(s). The position origin will be at the object's origin (if a single object) or the first selected object's origin (if multiple objects).
	* **Cut from cursor origin** — Copies selected object(s) to the brush and the clipboard bank and removes the original(s). The position origin will be at the current cursor position.
* **Save in bank as merged object** — Creates a merged object definition from the selection in an existing or new bank (see [**MERGED OBJECTS**](https://github.com/pmcrockett/Celqi#merged-objects)). The position origin will be at the current cursor position.
* **Delete** — Deletes all objects in the selection.

##### BRUSH PROPERTIES
* **Object color ...** — Sets the color of the brush object using an RGBA color picker. For primitives, `{1, 1, 1, 1}` represents white, while for models, it represents the original model texture. 
* **Metallic** — Sets the metallic value of the brush object. This only affects primitives.
* **Roughness** — Sets the roughness value of the brush object. This only affects primitives.
* **Emissiveness** — Sets the emissiveness value of the brush object.
* **Brightness** — Sets the brightness of the light(s) in the brush.
* **Light color** — Sets the color of the light(s) in the brush using an RGB color picker.
* **Spread** — Sets the spread of the light(s) in the brush. Only applicable to spot lights.
* **Resolution** — Sets the shadow resolution of the light(s) in the brush. Only applicable to point shadow lights and world shadow lights.
* **Range** — Sets the range of the light(s) in the brush. Only applicable to world shadow lights.

##### CAMERA OPTIONS
* **Recenter cursor** — Moves the cursor to the middle of the screen.
* **Movement speed** — Changes how fast the camera moves.
* **Rotation speed** — Changes the speed of the camera's pitch and yaw.
* **Field of view** — Changes the camera's field of view within a range of 50 to 110.
* **Lock movement to world axes** — When the camera is locked to the world axes, moving forward/backward or up/down moves along the world horizontal and vertical axes instead of along the camera's local axes.

##### POSITION OPTIONS
* **Snap mode** — Changes if and how the cursor snaps to the grid. *Snap by* changes the cursor's position by the given value when moved. *Snap to* snaps the cursor to a multiple of the given value when moved.
* **Snap increment** — Sets the amount by which the cursor snaps. *Grid unit* is the same as *1* for *Snap by*, but for *Snap to*, *Grid unit* centers the cursor in the given grid value (effectively giving an offset of 0.5) rather than positioning it at the corner as it does when the unit is 1.

##### ROTATION OPTIONS
* **Snap mode** — Changes if and how an object snaps to the grid when rotated. *Snap by* changes the rotation by the given value. *Snap to* snaps the rotation to a multiple of the given value. Objects always rotate around their origins.
* **Snap increment** — Sets the amount in degrees by which object rotation snaps.

##### SCALE OPTIONS
* **Snap mode** — Changes if and how an object snaps to values when scaled. *Snap by* changes the scaling by the given value. *Snap to* snaps the scaling to a multiple of the given value. Objects always scale relative to their position origin.
* **Snap increment** — Sets the amount by which objects scale. Note that this number refers to a scale change relative to the object's original size and not to a grid value.

##### BACKGROUND
* **Image** — Sets one of FUZE's predefined 3D backgrounds.
* **Tint** — Sets the background/environment color using an RGB color picker.

##### THEME
* Sets a color theme for Celqi. Themes can be defined and modified by editing the `getThemeDefs()` function.

##### ADVANCED
* **Screen resolution** — If the Switch is docked, the display resolution can be increased to 1920x1080.
* **3D rendering scale** — The resolution at which 3D objects render can be reduced. This speeds up graphics processing and may increase the framerate in visually complex maps.
* **Photo mode** — Hides UI elements and editor widgets to facilitate screenshots and physics demoing.
* **Show object labels** — Displays objects' names and their indices in the `g_cell` array (see [**REFERENCING MAP OBJECTS IN CODE**](https://github.com/pmcrockett/Celqi#referencing-map-objects-in-code)).
* **Camera collisions** — Sets the algorithm used for finding camera collisions with the environment.
* **Show cell outlines** — Celqi maps are built from a matrix of 5x5x5 cells that are automatically created by cursor movement and object placement. These cells are important to the underlying map engine, but in most cases, they can be ignored during map creation. This option enables visualization of the cells that the camera and cursor are in.
* **Throw physics object** — Throws the current brush object into the world to demo the experimental physics engine. The thrown object disappears after several seconds.
* **View map stats ...** — Shows a numerical breakdown of the objects present in the map.
* **View raw save file data ...** — Celqi save data is written to file as human-readable text. You can view the text of the save file with this option. This is a debug feature; there's no need to understand the file format unless there's a problem you're trying to diagnose.

--------
### OBJECT MENU
To select an object for the brush, first open the object menu **(Y)**. This brings up a visual list of both the objects you have defined via code in `getModels()` (see [**SETUP**](https://github.com/pmcrockett/Celqi#setup)) and the merged objects you have defined using *Save in bank as merged object* (see [**MERGED OBJECTS**](https://github.com/pmcrockett/Celqi#merged-objects)). The current bank can be changed with **(L)** and **(R\)** or with the sidebar entries. If the number of objects in a bank exceeds the viewable size, the object list can be scrolled by moving the selection cursor towards the bottom or top of the menu.

For unmerged objects, pressing **(A)** copies the object to the brush and closes the object menu. For merged objects (marked with the paper stack icon), pressing **(A)** brings up the merged object menu (see [**MERGED OBJECTS**](https://github.com/pmcrockett/Celqi#merged-objects)).

--------
### EDITING
Celqi's edit cursor has three elements. First, the color-coded arrows represent the orientation of the brush object's local axes. The red arrow is the local X axis, the green arrow is the local Y axis, and the blue arrow is the local Z axis. Second, the wireframe cube is a visual aid that marks the 1x1 grid unit in which the brush object's origin is located. This is also the range in which overlapping objects appear in the main menu's *Objects under cursor* actions. Third, the blinking brush object previews the position, scale, and rotation at which an object will be placed in the map.

Pressing **(R\)** cycles through the three edit modes -- position, rotate, and scale. In all edit modes, pressing **(A)** places the current brush object in the map, pressing **(Y)** opens the object menu, and pressing **(X)** opens the main menu. Pressing **(L)** modifies the current edit mode's behavior.

##### POSITION
In position mode, the cursor is moved horizontally with the **left control stick** and vertically with the **left control stick** + **(L)**. The cursor snaps according to the position options set in the main menu. The camera is moved independently of the cursor; if you lose track of the cursor, it can be recentered on the screen by choosing *Camera options > Recenter cursor*.

##### ROTATE
In rotate mode, **left control stick up/down** rotates the object on the first axis and **left control stick left/right** rotates the object on the second axis. **(L)** toggles rotation axis pairs between local Y/local X and world Y/local Z. Objects always rotate around their origins, and rotation snaps according to the rotation options set in the main menu.

Rotate mode is not available for point lights and point shadow lights because they cast light in every direction equally.

##### SCALE
In scale mode, **left control stick up/down** adjusts object scale. The scaling axes are indicated by green arrows pointing outwards from the cursor; these axes can be cycled by pressing **(L)**. Objects always scale from their origins, and scaling snaps according to the scale options set in the main menu.

Scale mode is not available for lights because they don't have size.

##### MASS SELECTION
Pressing **(B)** in any of the edit modes creates a mass selection box. The box's size is adjusted by moving the cursor, and objects that will be included in a committed selection flash. To commit the selection, press **(A)**; to cancel the selection, press **(B)**. To unselect objects after selecting them, choose *Selection > Remove from selection > OBJECT NAME* or *Selection > Clear selection*.

--------
### MERGED OBJECTS
By selecting objects and choosing *Selection > Save in bank as merged object*, you can combine multiple objects into a single object definition. A merged object, identified by the paper stack icon in the object menu, can be used as a single, unified object by selecting *Set brush (single merged)*, or it can be deconstructed into its underlying objects by selecting *Set brush (multiple unmerged)*.

It is also possible to merge already-merged objects, creating multiple layers of merging. FUZE will eventually hit its recursion limit and throw an error if the merged layers go too deep, so it is best not to merge deeper than a couple of layers.

##### DELETING MERGED OBJECTS
Unlike code-defined objects, merged object definitions can be deleted from within the object menu. Deleting a merged object definition can have far-reaching consequences depending on how the object has been used. A merged object can be directly placed in a map (first-level use), used as an element of other merged object definitions (second-level use), or indirectly placed in a map via those other merged objects of which it is an element (third-level use). Deletion of a definition affects all three of these uses, so you should be aware of how the object has been used before you delete it -- if you aren't, you may inadvertently affect other objects that you didn't realize referenced the deleted definition.

If you elect to remove references, they are completely deleted without being replaced. Replacing references substitutes the current brush object for any references, retaining the scales, rotations, and positions of the original references. Unmerging explodes the references into their constituent elements without otherwise changing them. If you choose *In this map only*, the deletion/replacement/unmerging will still affect second- and third-level uses in other maps, but when loading another map, you will be prompted to relink any first-level uses in that map.

Note that *Unmerge* is not available from the map load relink prompt because at that point the deleted object definition no longer exists, and there is no way for Celqi to know what its constituent elements were. Therefore, in most cases it's preferable to choose *In all maps* when unmerging.

--------
### LIGHTS
In FUZE code, lights are completely different from 3D object models; however, Celqi provides a layer of abstraction that treats lights as a type of object. This means that lights can be placed, deleted, and merged just like any other object. There are a few differences from normal objects, though: lights have no collision data, scaling has no effect on lights because they have no size, and rotation is not applicable to point lights and point shadow lights because they are not directional.

Lights also have additional settings that can be modified in the brush properties menu (see [**MAIN MENU**](https://github.com/pmcrockett/Celqi#main-menu)).

--------
### CLIPBOARD
Every time you cut or copy objects, Celqi adds them to the clipboard bank. You can browse this bank from the object menu and select objects from it just like any other bank.

The clipboard bank can contain up to 32 entries. Once this size is exceeded, old clipboard entries are deleted from the bank to make room for new ones. The clipboard bank persists if you load a different map, making it easy to copy/paste objects between maps. The bank is not, however, saved between editor sessions. If you want a permanent version of a clipboard entry, you should save it as a merged object definition.

--------
### SAFE MODE
Celqi's editor can be booted into safe mode, which prevents changes from being permanently written to the text file. To enable safe mode, set the `var g_safeMode` declaration at the start of the *Core setup* section to `true`. When running in safe mode, a reminder message is displayed in the lower left of the screen.

While Celqi is in safe mode, changes to the text file such as saving or deleting maps are discarded when the editor session ends, and the text file is rolled back to the state it was in when the session began. In more technical terms, safe mode prevents the text file from ever being closed, which means that pending changes to the file are never actually written to the file.

--------
### DELETING THE TEXT FILE
To fully erase the text file and delete all saved data including maps, merged objects, and editor preferences, uncomment the `clearFile(g_mapFile)` line in the `initEd()` function, then launch Celqi. Remember to re-comment the line when you're done.

--------
# CODE

--------
### SETTING UP THE CORE LOADER
When building a game, it is not necessary to include the entire Celqi codebase in the project in order to use maps created with the editor. There is a subset of Celqi functions, known as the core loader, that provides the code necessary to load and interact with maps without loading the editor itself.

To use the core loader, first make a copy of Celqi from the FUZE projects menu to create a base for your project that contains your maps in its text file. In this copy, uncomment the `coreLoader()` function in the *Core loader override* section at the start of the code. This function replaces the version of `coreLoader()` defined later in the code and allows the core loader to operate independently of the editor.

The editor code should then be either deleted or disabled with a multi-line comment. This code begins around line 4800 and runs through the end of the program, though its exact starting line number will vary depending on how many lines your configured `getModels()` function contains. The exact line can be found at the *Editor functions* bookmark or by searching for *EDITOR FUNCTIONS*.

If you anticipate needing to make frequent changes to your maps, you may want to comment the editor code out rather than deleting it so you can easily boot into the editor later by reversing the core loader setup steps. The editor code can be disabled with a single pair of multi-line comment symbols (`/* This is a multi-line comment */`). Alternately, if you don't anticipate needing the editor again, deleting the code will make the FUZE code editor run more smoothly by substantially reducing the number of lines in the project. Celqi's editor code can always be recopied from the original Celqi project if you need it again.

Your own project code should be placed somewhere after the core loader's global variables load. It is recommended but not required that you place your code at the very end of the file -- this makes it easier to temporarily boot into the editor from commented-out editor code, as your project code doesn't need to be bypassed to get to the editor code.

**Do not under any circumstances structure your project so that booting into the editor requires you to temporarily delete your own code** (disabling via comment is fine). If the undo or copy history is lost and an autosave happens, such as when backing out to the FUZE main menu, any deleted code will be unrecoverable.

--------
### INITIALIZING THE CORE LOADER
Before maps can be loaded, the core loader must be initialized by calling `initCore()`. This function loads object models into memory and constructs the object definitions that Celqi uses to build maps. A map name string can optionally be passed to `initCore()` to immediately load a map; alternately, a map can be loaded at any time after initialization with `readMap()`.

The stub function `loadDefMsg()` can be modified to display a custom load screen while the core loader is initializing. The function is called once every time a new object definition begins loading, and its only argument, `_defName`, provides the name of the definition that is currently loading. Any graphics drawing and calls to `update()` required by the load screen should be performed inside of this function, because `initCore()` does not otherwise call `update()`. You should not put code that substantially delays program execution (such as `sleep()`) in this function, because any time spent in the function adds to the core initialization time.

--------
### LOADING MAPS
A map is loaded by calling `readMap()`. To unload a map and remove all of its objects, call `clearMap()`. If a map is loaded, it must be unloaded with `clearMap()` before calling `readMap()` to load another map.

`readMap()` should be called from as shallow an execution context as possible in order to avoid recursion errors, which occur when a program's call stack gets too deep. The map loading process involves enough nested function calls that FUZE's call stack depth limit may be exceeded depending on the initial depth of the `readMap()` call. In practical terms, this means that you should avoid calling `readMap()` from within multiple nested functions and should consider structuring your program in a way that allows you to call it directly from your main loop if necessary.

Here is an example of how you might call the map loader from the main loop:
````
var queuedMap = ""
loop
    // A map load can be requested from anywhere in the code 
    // by setting queuedMap to the name of the map to load.
    if len(queuedMap) then
        var file = open()
        clearMap()
        readMap(file, queuedMap)
        queuedMap = ""
        close(file)
    endif
repeat
````
The stub function `loadMapMsg()` can be modified to display a custom load screen while a map is loading. The function is called every time an object within the map is placed. Its arguments provide the map name, current object name, and current object position. Any graphics drawing and calls to `update()` required by the load screen should be performed inside of this function, because `readMap()` does not otherwise call `update()`. You should not put code that substantially delays program execution (such as `sleep()`) in this function, because any time spent in the function adds to the map load time.

--------
### REFERENCING MAP OBJECTS IN CODE
Celqi divides the map space into 5x5x5 areas called cells, whose locations can be visualized by toggling *Advanced > Show cell outlines*. Cells are used to break up the full collection of map objects into more easily indexable arrays based on their locations. It is not necessary to pay attention to cells when building a map because Celqi dynamically adds and removes them to accommodate the objects you place, but you should understand their underlying structure if you want to directly access the map object hierarchy from code.

Cells are stored in the global `g_cell` array, and each cell entry in that array contains an array of `mapObj` structs that start at index 2 (lower indices store other cell data). The `mapObj` structs contain object handles as well as additional data about the objects (see [**STRUCTS**](https://github.com/pmcrockett/Celqi#structs)). There may also be `mapObjRef` structs present in cells; these are references to a root `mapObj` entry in a different cell and represent objects that overlap more than one cell.

Here is a pseudocode example of the structure of `g_cell`:
```
g_cell = [
	// Cell 0
	[
		// Cell location
		vector3,
		// Indices of adjacent cells
		array,
		// Map objects
		mapObj struct,
		mapObjRef struct,
		mapObj struct,
		mapObjRef struct
	],
	// Cell 1
	[
		vector3,
		array,
		mapObj struct,
		mapObj struct
	]
]
```
By toggling *Advanced > Show object labels*, you can view the `g_cell` indices of map objects within the editor. An object may have more than one `g_cell` entry listed depending on how many cells it overlaps. The first entry is the actual `mapObj`; subsequent entries are `mapObjRef` structs that point back to the first entry. Any of these `g_cell` entries can be resolved to its root `mapObj` by passing it to `getMapObjFromRef()`.

Celqi constructs `g_cell` indices when a map is loaded or when objects are placed during map editing, and the indices should only be considered accurate for direct referencing in code when the map is freshly loaded and unchanged. Any further changes to the map may change how Celqi assigns these indices and may make any existing use of them in code inaccurate. If the map has been changed since being loaded, Celqi places an asterisk by the `g_cell` indices shown by *Show object labels* to remind you that they may not be accurate.

--------
### USER FILE SPACE
When Celqi accesses the text file, it can only see and modify data between the start of the file and the end of its own data segment. Anything written beyond this data segment isn't affected by Celqi's data writes, so games using Celqi maps can write their own data to the file without conflicting with Celqi's data. To find the start index at which non-Celqi data can be written, use `getUserFileIdx()`.

Note that if Celqi's saved data changes, the index returned by `getUserFileIdx()` will also change even though the actual data within the user space hasn't changed. It is best practice to call this function at the start of your game code and store the result in a variable that can be used to offset game data file indices. This way if future changes to the map data inadvertently change the absolute position of the game data, this offset will be automatically handled within the game code.

--------
### COLLISION TESTING
##### DIRECTION VECTORS
A direction vector is a vector with a length of 1 that indicates the world orientation of one of an object's local axes.

Because FUZE doesn't have built-in functions for querying an object's rotation state, it is up to the programmer to track objects' rotation states. Celqi represents object rotation by using direction vectors to indicate how an object's local axes map to world space.

FUZE uses a Z-forward/Y-up 3D coordinate system, which means that for an unrotated object, forward is along the world Z axis and up is along the world Y axis. This is represented with direction vectors by saying that the object's forward vector is `{0, 0, 1}` and its up vector is `{0, 1, 0}`. If we were to rotate the object 45 degrees to its left, its forward vector would be `{0.707, 0, 0.707}` and its up vector would still be `{0, 1, 0}`.

Some of Celqi's functions ask for an object's rotation as represented by forward and up vectors. If you track objects' rotations in your own code using a different method, you will need to convert the rotations using either `eulerToDirVec()` or `axisAngleToDirVec()`, both of which return a struct in the form `[ .fwd = VECTOR, .up = VECTOR ]`.

##### COLLISION CONTEXT
Celqi stores data about an object's collision state in a `colContext` struct. Each object that will be checked for collisions against the map needs its own collision context, and each collision context must be initialized with `initSimpleColContext()` before it can be used.

When initializing a collision context, there are five collision modes available. These modes vary in their testing methods and in how computationally expensive they are. Raycast-based collision modes check against the map objects' actual geometry rather than against their bounding boxes, so in many cases they will be more accurate than the bounding box mode, but they are more costly.

* **0** — No collisions.
* **1** — Bounding box. This is the simplest and least expensive collision mode. Collisions are calculated based on bounding box intersections similarly to FUZE's `objectIntersect()` function.
* **2** — Simple raycast. Collisions are calculated by drawing a raycast from an object's center at its previous position in the direction of its movement, or if stationary, from the center of the object in the direction of its forward vector. If the raycast hits another object, a collision is returned.
* **3** — Spheroid raycast. Raycasts are drawn from the object's center in a roughly spherical pattern. If any raycast hits another object, a collision is returned.
* **4** — Cuboid raycast. Raycasts are drawn from the object's center in a roughly cubic pattern. If any raycast hits another object, a collision is returned.

A typical initialization of a collision context:
```
var obj = placeObject(cube, {0, 0, 0}, {0.5, 0.5, 0.5})
colContext colCon
initSimpleColContext(colCon, obj, {0, 0, 0}, {0, 0, 1}, {0, 1, 0}, 
    {0.5, 0.5, 0.5}, 1)
```

##### GETTING COLLISIONS
Once the object's collision context has been initialized, its collision state can be checked using `getSimpleMapCollision()`. This function returns an array of references to map objects that the object has collided with in the current frame. There may be multiple collision references per map object because each cell that a map object overlaps generates its own reference to the map object.

By passing the entire array returned by `getSimpleMapCollision()` into `filterCollisions()`, you get an array of the `mapObj` structs in the collision. Additionally, an individual element of the array returned by `getSimpleMapCollision()` can be passed to `getMapObjFromStruct()` to get a single `mapObj` struct.

A `mapObj` contains, among other things, an object handle for the map object that was collided with (`.obj` field), its location (`.pos`), its rotation (`.fwd` and `.up`), and -- by passing the `mapObj` struct to `getMapObjName()` -- its name.

--------
### PHYSICS (EXPERIMENTAL)
Celqi has a built-in physics engine; to see a physics demo, choose *Advanced > Throw physics object* from the main menu or press **(A)** while in photo mode. Thrown objects will disappear after several seconds. While in photo mode, objects can be immediately cleared with **(B)** or boosted into the air by pressing **(Y)**.

##### PHYSICS FUNCTIONS
Like the standard collision detection, the physics engine uses the `colContext` struct to store data about an object's state. To use a collision context with the physics engine, a `colContext` struct must be initialized with `initColContext()`, which is very similar to `initSimpleColContext()` except that it exposes arguments that deal specifically with physics initialization and that allow some fine-tuning of the `colContext`'s behavior.

Once the collision context has been initialized, the object's physics and collision states can be updated by calling `updateObjPhysics()`. The physics engine handles object movement based on velocity. To directly change the object's velocity, call `addColContextVel()` or `setColContextVel()`. Velocity is also affected by gravity (if enabled) and is reduced and/or redirected by collisions with map objects.

In order to reduce load, an object's physics processing is frozen once it reaches a stationary position. While frozen, it is not affected by gravity or collisions. To unfreeze the object and reenable physics processing, change the object's velocity via `addColContextVel()` or `setColContextVel()` or set `colContext.frozen` to 0.

Using multiple physics objects at the same time tends to dramatically reduce the framerate. One approach to mitigating this is to reduce the frequency of objects' physics updates when more objects are added by accumulating `timeDelta()` over multiple frames and then passing this value into `updateObjPhysics()` as the `_delta` value. There is currently no built-in system for automatically managing update frequency reduction, but you can see an example of its implementation in the editor's `startThrow()` and `updateThrow()` functions.

--------
### FUNCTIONS
Note: *opt* indicates an optional function argument. If the argument is not given, the default value is used.

--------
##### LOADING

--------
`clearMap()`

Unloads the current map and removes all map objects. Can be safely called even if no map is loaded.

Returns void.

--------
`getMapNames(_file)`

|Argument|Type|About|
|---|---|---|
|`_file`|file handle|The file to read.|

Gets the names of all maps saved in the file.

Returns array of map names in the file.

--------
`getUserFileIdx(_file)`

|Argument|Type|About|
|---|---|---|
|`_file`|file handle|The file to read.|

Gets the starting index of the user space within the file. Celqi cannot access data from this index onward, though it will shift the position of this data if its own data grows or shrinks. It is best practice to call this function at the start of a program to create a file index offset that can be added to the program's file indices in order to accommodate potential future changes in Celqi's data size.

Returns the starting index of the user space within the file.

--------
`initCore(opt _mapName)`

||Argument|Type|Default|About|
|---|---|---|---|---|
|opt|`_mapName`|str|`""`|The name of a map to automatically load. If none is provided, no map is loaded.|

Initializes Celqi's core loader and loads models into memory. Must be called before maps can be loaded.

Returns void.

--------
`loadDefMsg(_defName)`

|Argument|Type|About|
|---|---|---|
|`_defName`|str|The name of the object definition being loaded.|

This stub function can be modified to display a custom load screen for `initCore()`. `loadDefMsg()` is called once every time a new object definition begins loading. Any graphics drawing and calls to `update()` required by the load screen should be performed inside of `loadDefMsg()`, because `initCore()` does not otherwise call `update()`. Do not put code that substantially delays program execution (such as `sleep()`) in `loadDefMsg()`.

Returns void.

--------
`loadMapMsg(_mapName, _objName, _objPos)`

|Argument|Type|About|
|---|---|---|
|`_mapName`|str|The name of the map being loaded.|
|`_objName`|str|The name of the object being placed in the map.|
|`_objPos`|vector3|The position of the object being placed.|

This stub function can be modified to display a custom load screen for `readMap()`. `loadMapMsg()` is called once every time an object is placed in the map that is loading. Any graphics drawing and calls to `update()` required by the load screen should be performed inside of `loadMapMsg()`, because `readMap()` does not otherwise call `update()`. Do not put code that substantially delays program execution (such as `sleep()`) in `loadMapMsg()`.

Returns void.

--------

`readMap(_file, _mapName)`

|Argument|Type|About|
|---|---|---|
|`_file`|file handle|The file to read.|
|`_mapName`|str|The name of the map to load.|

Loads a map from the file. If a map is currently loaded, `clearMap()` must be called to unload it before calling `readMap()`. Due to FUZE's recursion depth limit, `readMap()` must be called from as shallow an execution context as possible. If you encounter recursion errors, try calling `readMap()` directly from your main loop rather than embedding the call in functions.

Returns map info struct in the form `[ .redefHappened = BOOL, .props = STRUCT ]`. This data is not relevant in non-editor contexts.

--------
##### ROTATION CONVERSION

--------
`axisAngleToDirVec(_axis, _deg)`

|Argument|Type|About|
|---|---|---|
|`_axis`|vector3|The axis of rotation.|
|`_deg`|float|Degrees of rotation around _axis.|

Converts an angle of rotation around an axis to direction vectors.

Returns struct in the form `[ .fwd = VECTOR, .up = VECTOR ]`.

--------
`eulerToDirVec(_yaw, _pitch, _roll)`

|Argument|Type|About|
|---|---|---|
|`_yaw`|float|The rotation's yaw value.|
|`_pitch`|float|The rotation's pitch value.|
|`_roll`|float|The rotation's roll value.|

Converts an Euler angle to direction vectors.

Returns struct in the form `[ .fwd = VECTOR, .up = VECTOR ]`.

--------

##### MAP OBJECTS
--------
`getMapObjFromRef(_mapObjRef)`

|Argument|Type|About|
|---|---|---|
|`_mapObjRef`|struct|`mapObjRef` struct from `g_cell`.|

Retrieves the root `mapObj` for a `mapObjRef`. If the root `mapObj` is passed as the argument, it will be returned unchanged. It is best practice to apply this function to all map object entries pulled directly from `g_cell` to ensure that you have the root `mapObj` rather than a reference.

Returns a `mapObj` struct.

--------
`getMapObjFromStruct(_cellIdxStruct)`

|Argument|Type|About|
|---|---|---|
|`_cellIdxStruct`|struct|`mapObj` reference in the form `[ .cell = INT, .idx = INT ]`.|

`getMapObjFromStruct(_cell, _idx)`

|Argument|Type|About|
|---|---|---|
|`_cell`|int|The cell of the `mapObj`.|
|`_idx`|int|The `mapObj`'s index within its cell.|

Looks up a cell/idx pair (either in a struct as returned by `getSimpleMapCollision()` or individually) and returns the associated `mapObj`.

Returns a `mapObj` struct.

--------
`getMapObjName(_mapObj)`

|Argument|Type|About|
|---|---|---|
|`_mapObj`|`mapObj` struct|A `mapObj` such as is returned by `getMapObjFromStruct()` or `getMapObjFromRef()`.|

Gets the name of a `mapObj`.

Returns string of `_mapObj`'s name.

--------

##### COLLISION CHECK
--------
`filterCollisions(_collisions, _getAllCollisions)`

||Argument|Type|Default|About|
|---|---|---|---|---|
||`_collisions`|array||Array of elements in the form `[ .cell = INT, .idx = INT ]`.|
|opt|`_getAllCollisions`|bool|`true`|Whether to return only the first `mapObj` filtered from the array (`false`) or all of them (`true`). Returning all of them is slightly slower.|

When passed an array returned by `getSimpleMapCollision()` whose elements are in the form `[ .cell = INT, .idx = INT ]`, removes extra entries that refer to the same `mapObj` and returns an array of unique `mapObj`s.

Returns an array of `mapObj`s.

--------
`getSimpleMapCollision(ref _colCon, _obj, _pos, opt _fwd, opt _up, opt _scale, opt _getAllCollisions, opt _forceUpdate, opt _collisionMode)`

||Argument|Type|Default|About|
|---|---|---|---|---|
|ref|`_colCon`|`colContext` struct||The `colContext` associated with `_obj`.|
| |`_obj`|object handle||The object to check for collisions against map objects.|
| |`_pos`|vector3||`_obj`'s world position.|
|opt|`_fwd`|vector3|`_colCon.fwd`|`_obj`'s forward vector.|
|opt|`_up`|vector3|`_colCon.up`|`_obj`'s up vector.|
|opt|`_scale`|vector3|`_colCon.scale`|`_obj`'s scale.|
|opt|`_getAllCollisions`|bool|`true`|Applies only to collision modes 2-4. Whether to return only the first collision found by the check (`false`) or all of the collisions found by the check (`true`). Returning all of the collisions is slower.|
|opt|`_forceUpdate`|bool|`false`|Whether to make the collisions fully update even if there is a faster cached state available. Generally should be `false` unless nearby map objects have changed locations, been added, or been removed.|
|opt|`_collisionMode`|int|`_colCon.collisionMode`|The collision mode to use. 0 = collisions disabled; 1 = bounding box; 2 = simple raycast; 3 = spheroid raycast; 4 = cuboid raycast.|

Checks for collisions between `_obj` and map objects using the collision data stored in `_colCon`.

Returns an array of references to this frame's collision objects (the array is also stored in `_colCon.collision`). Elements of the array are structs in the form `[ .cell = INT, .idx = INT ]`. Each cell that an object overlaps returns a distinct reference, so multiple elements may refer to the same `mapObj`. An element can be passed to `getMapObjFromStruct()` (or alternately: `getMapObjFromRef(g_cell[result.cell][result.idx])`) to get a `mapObj`, or the entire array can be resolved to an array of `mapObj`s with `filterCollisions()`.

--------
`initSimpleColContext(ref _colCon, _obj, _pos, _fwd, _up, _scale, _collisionMode)`

||Argument|Type|About|
|---|---|---|---|
|ref|`_colCon`|`colContext` struct|The `colContext` to initialize.|
| |`_obj`|object handle|The object to associate this collision context with.|
| |`_pos`|vector3|`_obj`'s world position.|
| |`_fwd`|vector3|`_obj`'s forward vector.|
| |`_up`|vector3|`_obj`'s up vector.|
| |`_scale`|vector3|`_obj`'s scale.|
| |`_collisionMode`|int|Collision mode. 0 = no collisions. 1 = bounding box collisions. 2 = simple raycast collisions. 3 = spheroid raycast collisions. 4 = cuboid raycast collisions.|

Initializes a `colContext` struct for use with `getSimpleMapCollision()`.

Returns an initialized version of `_colCon`.

--------

##### PHYSICS (EXPERIMENTAL)
--------
`addColContextVel(ref _colCon, _vel)`

||Argument|Type|About|
|---|---|---|---|
ref|`_colCon`|`colContext` struct|The `colContext` whose velocity will be modified.|
| |`_vel`|vector3|Velocity to add.|

Adds to a collision context's velocity. If the collision context's object is frozen, it will be unfrozen.

Returns updated `_colCon`.

--------
`initColContext(_colCon, _obj, _comPos, _fwd, _up, _scale, _mode, _mass, opt _grav, opt _extRes, opt _initAuxCollider, opt _initExt, opt _initGridBit)`

||Argument|Type|Default|About|
|---|---|---|---|---|
| |`_colCon`|`colContext` struct||The `colContext` to initialize.|
| |`_obj`|object handle||The object to associate this collision context with.|
| |`_comPos`|vector3||World position of the center of `_obj`'s bounding box.|
| |`_fwd`|vector3||`_obj`'s forward vector.|
| |`_up`|vector3||`_obj`'s up vector.|
| |`_scale`|vector3||`_obj`'s scale.|
| |`_mode`|int||Collision mode. 0 = no collisions. 1 = bounding box collisions. 2 = simple raycast collisions. 3 = spheroid raycast collisions. 4 = cuboid raycast collisions.|
| |`_mass`|float||`_obj`'s mass, which affects inertia and rotation. Does not represent real world units. Clamped between 1 and 100. |
|opt|`_grav`|vector3|`{0, -50, 0}`|Specifies the direction and strength of gravity. `{0, -50, 0}` approximates Earth gravity.|
|opt|`_extRes`|float|0.001|Resolution unit size for calculating object extent. Lower values are more accurate but take longer to calculate.|
|opt|`_initAuxCollider`|bool|`true`|Whether to also initialize an auxiliary collider, which is used to ensure that a fast-moving object will not clip through obstacles between collision checks.|
|opt|`_initExt`|bool|`true`|Whether to calculate object extent. In most cases this should be `true` unless the extent data in `_colCon` has already been set before passing it to `initColContext()`.|
|opt|`_initGridBit`|bool|`true`|Whether to calculate and store the object's collision position in the world. In most cases this should be `true` unless the object will definitely change positions before a collision will happen, in which case the calculation can be skipped.|

Initializes a colContext struct for use with `updateObjPhysics()`.

Returns initialized `colContext _colCon`.

--------
`setColContextVel(ref _colCon, _vel)`

||Argument|Type|About|
|---|---|---|---|
|ref|`_colCon`|`colContext` struct|The `colContext` whose velocity will be modified.|
| |`_vel`|vector3|New velocity.|

Sets a collision context's velocity. If the collision context's object is frozen, it will be unfrozen.

Returns updated `_colCon`.

--------
`updateObjPhysics(_obj, ref _colCon, _addVel, opt _scale, opt _collisionMode, opt _forceUpdate, opt _getAllCollisions, opt _handleTransformChange, opt _getNormal, opt _affectRot, opt _deflectVel, opt _maintainOrthoR, opt _normRecurLimit, opt _useGrav, opt _delta, opt _addVel)`

||Argument|Type|Default|About|
|---|---|---|---|---|
| |`_obj`|object handle||The object to which the collision context belongs.|
|ref|`_colCon`|`colContext` struct||`_obj`'s collision context.|
|opt|`_scale`|vector3|`_colCon.scale`|`_obj`'s scale.|
|opt|`_collisionMode`|int|`_colCon.collisionMode`|Collision mode. 0 = no collisions. 1 = bounding box collisions. 2 = simple raycast collisions. 3 = spheroid raycast collisions. 4 = cuboid raycast collisions.|
|opt|`_forceUpdate`|bool|`false`|Whether to make the physics state fully update even if there is a faster cached state available. Generally should be `false` unless nearby map objects have changed locations, been added, or been removed.|
|opt|`_getAllCollisions`|bool|`true`|Applies only to collision modes 2-4. Whether to return all collisions rather than just the first collision found.|
|opt|`_getNormal`|bool|`true`|Whether to calculate the direction of faces that the object collides with. Necessary for redirecting velocity along a surface instead of stopping short.|
|opt|`_affectRot`|bool|`true`|Whether collisions can impart rotational velocity to the object.|
|opt|`_maintainOrthoR`|bool|`false`|Whether the object's rotational velocity should be set in a way that keeps the object's local right vector orthogonal with the world space up vector.|
|opt|`_normRecurLimit`|int|1|The number of additional passes through the physics system that can be calculated per frame. Higher numbers produce more detailed deflection behavior but increase processing load.|
|opt|`_useGrav`|bool|`true`|Whether velocity is affected by gravity.|
|opt|`_delta`|float|`deltaTime()`|Time delta since the object's last physics update. Usually should be `deltaTime()` unless collisions aren't being calculated on every frame.|
|opt|`_addVel`|vector3|`{0, 0, 0}`|Addition to `_obj`'s velocity. Unlike `addColContextVel()`, this argument does not unfreeze a frozen physics object.|

Updates `_obj`'s physics state and resolves movement and collisions with map objects.

Returns an updated version of `_colCon`. (The original struct passed as `_colCon` is also updated.)

--------
### STRUCTS
The strikethrough fields are used internally by Celqi and shouldn't need to be accessed directly in most cases.

`colContext`
|Field|Type|About|
|---|---|---|
|~~`.auxColCon`~~|~~`colContext` struct~~||
|~~`.allCollisions`~~|~~bool~~||
|~~`.auxCollider`~~|~~object handle~~||
|`.cell`|int|Cell in which the most recent physics update occurred.|
|`.cellPos`|vector3|Position of the cell in which the most recent physics update occurred.|
|`.centerOfMass`|vector3|The center point of an object's bounding box in local space expressed as an offset from the object's origin.|
|~~`.colDat`~~|~~struct~~||
|~~`.colDepth`~~|~~array~~||
|~~`.colFwd`~~|~~vector3~~||
|`.collision`|array|Array of current collision object reference structs in the form `[ .cell = INT, .idx = INT ]`.|
|`.collisionMode`|int|Default collision mode for the object.|
|`.colPos`|vector3|Object position during the most recent collision.|
|~~`.colScale`~~|~~vector3~~||
|~~`.colThisFrame`~~|~~bool~~||
|~~`.colUp`~~|~~vector3~~||
|~~`.comPos`~~|~~vector3~~||
|~~`.continuedCol`~~|~~bool~~||
|~~`.deflectThisFrame`~~|~~bool~~||
|~~`.delta`~~|~~vector3~~||
|~~`.dir`~~|~~vector3~~||
|`.ext`|`extent` struct|Object extent struct in the form `[ .hi = VECTOR, .lo = VECTOR ]`. This struct represents the local space high and low bounds of the object. Identical to the dimensions of the built-in bounding box within a small margin of error.|
|`.frozen`|int|When the object is stationary, this number counts up every physics update. When this value is greater or equal to `g_physicsFreezeThreshold`, the object's physics state is frozen. Setting this value to 0 unfreezes the object.|
|`.fwd`|vector3|Forward vector of the object after the most recent update.|
|`.grav`|vector3|Direction and strength of gravity.|
|~~`.gridBit`~~|~~array~~||
|`.mass`|float|The object's mass, which affects inertia and rotation. Does not represent real world units.|
|~~`.normal`~~|~~array~~||
|~~`.normAxis`~~|~~str~~||
|~~`.normColDepth`~~|~~array~~||
|~~`.objList`~~|~~array~~||
|`.rotVel`|float|Object's rotational velocity.|
|`.rotVelAxis`|vector3|Axis for rotational velocity.|
|`.scale`|vector3|Scale of the object after the most recent update.|
|`.up`|vector3|Up vector of the object after the most recent update.|
|`.vel`|vector3|Current velocity of the object. When using the physics engine, movement is affected by modifying this field and calling `updateObjPhysics()`.|

`lightObj`

|Field|Type|About|
|---|---|---|
|`.brightness`|float|Brightness of the light.|
|`.col`|vector3|Color vector of the light.|
|`.fwd`|vector3|Forward vector within parent `mapObj`'s local space.|
|`.light`|light handle|The light.|
|`.name`|str|Name of the light type.|
|`.pos`|vector3|Position within parent `mapObj`'s local space.|
|`.range`|float|Range of the light. Doesn't apply to all light types.|
|`.res`|int|Resolution of the light. Doesn't apply to all light types.|
|`.spr`|sprite handle|Sprite representing the light (editor only).|
|`.spread`|float|Spread of the light. Doesn't apply to all light types.|
|`.sprScale`|vector3|Scale of the light's sprite (editor only).|

`mapObj`
|Field|Type|About|
|---|---|---|
|`.bankIdx`|int|Bank and index of the object's definition combined into a single int. Must be decoded with `decodeBank()`/`decodeIdx()`.|
|`.cellIdx`|array|Array of cells and indices where the object exists. Each cell/idx pair is combined into a single int and must be decoded with `decodeCell()`/`decodeIdx()`.|
|`.children`|array|Array of child `mapObj` structs in a merged object. Empty if the object is not merged.|
|`.col`|vector4|Color vector of the object.|
|`.fwd`|vector3|Object's forward vector.|
|`.gridBitList`|array|Array of binary information about where the object is positioned in each cell that it intersects.|
|`.highlight`|bool|Whether the object is highlighted (editor only).|
|`.lights`|array|Array of `lightObj` structs in a light object. Empty if the object is not a light.|
|`.mat`|vector3|Material of the object in the form `{metallic, roughness, emissiveStrength}`.|
|`.obj`|var|Object handle (if an unmerged object), object group (if a merged object), or -1 (if a light). Determine what is in `.obj` by checking the lengths of `.children` and `.lights`.|
|`.pos`|vector3|Object's position.|
|`.scale`|vector3|Object's scale.|
|`.up`|vector3|Object's up vector.|

`mapObjRef`

|Field|Type|About|
|---|---|---|
|`.cellIdx`|int|Cell and index of this `mapObjRef`'s root `mapObj` combined into a single int. Must be decoded with `decodeCell()`/`decodeIdx()`.|

--------
# DEVELOPMENT ROADMAP
Possible future features include:
* Support for landscapes.
* Assignable collision channels on objects.
* Non-rendering markers and collision volumes that can be used for things such as spawn points and event triggers.
* File-streaming for increased map size.
* Undo/redo.
* Better use of modifier buttons so commonly used features can be accessed with buttons instead of being buried in the menu.

--------
# KNOWN ISSUES
* There is a limit to map complexity based on FUZE's internal variable limits. It is impossible to give specifics of max allowed size and object count because there are a lot of factors involved in Celqi's variable use, but the Castle Demo map represents the approximate maximum safe complexity. If too many objects are used, FUZE will return an error when placing an object or loading a map.
* Mass selection may sometimes skip objects within the selection bounds.
* Rotation in *Snap to* mode may exhibit strange behavior with some axis orientations.
* At very small position snap values, the cursor position may sometimes get stuck.
* Metallic and roughness material properties are editable on non-primitive objects despite not applying to them.
* Cone and pyramid primitives are not included in the primitives bank because FUZE's collision boxes for them are inaccurate, which in turn causes problems in Celqi's collision detection for them. To enable them anyway, uncomment the relevant code in the `loadPrimitiveDefs()` function. If enabled, collision detection for cones and pyramids will be glitchy, but no other problems will be caused.
* Like the cone and pyramid primitives, some 3D models have incorrect collision data and may exhibit glitchy collision behavior if used. You can tell when an object's collision box is incorrect because it will appear incorrectly-sized and/or uncentered in the object menu. To examine an object's collision box more closely, use FUZE's `showObjectBounds()` function.
* FUZE has a known issue (as of 3.1.0) in which available memory is gradually reduced when repeatedly running a program (see [FUZE FORUM THREAD](https://fuzearena.com/forum/topic/1598/actual-code-size-in-editor-is-affecting-available-memory-program-has-to-start-with-until-fuze-restart)). Celqi is particularly affected by this memory issue because its codebase is so large. If performance degrades across multiple sessions, close and restart FUZE to reset the memory pool and restore performance.
* Trying to place very large objects (e.g. *Kat Deak/IcyRaceTrack*) will cause Celqi to perform very poorly and/or freeze.
