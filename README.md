OVERVIEW
-

Celqi is a 3D map editor for FUZE4 Nintendo Switch that makes it easy to quickly build complicated environments out of objects from FUZE's extensive asset library. Celqi is primarily a graphical editor and is designed to provide a user-friendly alternative to directly defining 3D object placement in code. In this way, it is roughly analogous to FUZE's built-in 2D map editor. Celqi stores its map data in the text file, and by including a subset of Celqi's functions (the core loader) in your game project, you can access the map data from code without running the editor.

Notable features of Celqi include:

* Multiple save files.
* Unrestricted map dimensions.
* Object merging for easier modularity.
* Full support for lights.
* Robust collision engine.
* USB keyboard support.

--------

BANKS AND OBJECTS
-

Maps in Celqi are constructed from objects, which are 3D models from FUZE's asset library, primitive 3D shapes, or lights. These objects are stored in a library that is organized into multiple banks. The banks for lights and primitives are predefined, but the banks for models are customizable. It doesn't matter to Celqi what bank an object is in; banks are purely for organization. You might, for example, create banks that reflect the structure of the FUZE media browser, or you might create banks based on object purpose -- a floor tile bank, a wall tile bank, and so forth.

--------

SETUP
-

Celqi uses a customizable set of 3D models. Because the FUZE asset browser cannot be accessed from within Celqi, we must add the 3D assets we want to use to the source code before we can use them from within Celqi. This is done by editing the **getModels()** function so that Celqi can load the 3D assets on launch.

Each bank is a sub-array within **getModels()**'s **models** array. Each object definition within a bank is a two-element array whose first element is a string containing the object's display name and whose second element is a string containing the object's filepath as returned by the FUZE media browser. If the name is an empty string (**""**), the object will be auto-named based on the filepath.

Optionally, the first element of a bank may be a single-element array that provides a bank name. If this bank name isn't given, the bank will be auto-named.

Here is an example of what a full **models** array might look like:
```
var models = [
	[
		["Nature 1"], // Bank name (optional)
		// Object name, object filepath
		["Stump", "Kenney/Trunk_01"], 
		["Shrub 1", "Kenney/Plant_1_01"],
		["Shrub 2", "Kenney/Plant_2_01"]
	],
	[	
	    // No bank name given, so bank will be auto-named.
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

FUZE has an internal memory limit of 124 models loaded, so you cannot create more than 124 object definitions. Exceeding this limit will produce an error message when Celqi launches. The default Castle Demo bank can be safely deleted to free up model space if you are not using the definitions in your own maps.

If Celqi will not run after creating banks and objects, make sure that all array items are separated by commas, that the final element of each array does not end with a comma, and that all bank/object names and filepaths are enclosed in double quotes.

--------

MODIFYING BANKS AND OBJECTS
-

Sometimes you may want to move, rename, or delete an object definition.

**MOVING OBJECTS**
To move an object to a different bank, simply move the name/filepath element to a different bank array. Celqi's save file data references object definitions by their display names, so Celqi will locate the object regardless of what bank it's in.

**RENAMING OBJECTS**
To rename an object, modify its name string and then launch Celqi. If the object hasn't been used in a merged object (see **MERGED OBJECTS**) or a saved map, no further action is necessary. Otherwise, Celqi will display a message that the old object definition no longer exists and will prompt you to relink the references to that definition. Select the new object name from the list, and Celqi will change the old object name to the new object name. Note that for renamed definitions used in merged objects, the relink prompt will occur at launch, whereas for renamed definitions used in maps, the relink prompt will occur when the map is loaded.

**DELETING OBJECTS**
To delete an object, remove its name/filepath array element and then launch Celqi. If the object hasn't been used in a merged object or a saved map, no further action is necessary. If it has, Celqi will display the missing object definition prompt as it does for object renaming. To delete the object, select *Delete all references to 'OBJECT NAME' without relinking*. This will completely and permanently remove the object from any merged objects or maps that use it. It is usually a better idea to manually delete all occurences of an object from within the map editor before deleting the definition itself so you can be sure of exactly how the deletion will affect your maps.

**REPLACING OBJECTS WITH OTHER OBJECTS**
From the missing object definition prompt, you can also relink an object reference to a different object, which replaces all instances of the old object with the new object. Note that this may have unintended results: the relinker will not change object scale or position, so the newly linked objects will still use the deleted objects' scales and positions, which may not be desireable if the new definition has a different base size or a different position origin from the deleted definition. It is usually better to make these sorts of substitutions manually from within the map editor.

--------

CONTROLS
-
Celqi is designed to be used with Joycons, though it is also possible to use a USB keyboard. Keyboard bindings can be manually changed by editing the **g_bind** struct.

**CAMERA**
|Action|Joycon|Keyboard|
|-|-|-|
|Forward|ZR|w|
|Backward|ZL|s|
|Pitch|Right stick up/down|W/S|
|Yaw|Right stick left/right|q/e|
|Slide up/down/left/right|D-pad|w/s/a/d|

**POSITION  MODE**
|Action|Joycon|Keyboard|
|-|-|-|
|Move cursor forward/backward/left/right|Left stick|i/k/j/l|
|Move cursor up/down/left/right|L + left stick|o/u/j/l|
|Cycle edit mode|R|Space|
|Start mass selection|B|\|
|Cancel mass selection (while selecting)|B|\|
|Confirm mass selection (while selecting)|A|Enter|
|Place current brush object|A|Enter|

**ROTATE MODE**
|Action|Joycon|Keyboard|
|-|-|-|
|Rotate on axis 1|Left stick up/down|i/k|
|Rotate on axis 2|Left stick left/right|j/l|
|Cycle rotation axes|L|x|

**SCALE MODE**
|Action|Joycon|Keyboard|
|-|-|-|
|Change scale|Left stick up/down|i/k|
|Cycle scale axes|L|x|

**MENUS**
|Action|Joycon|Keyboard|
|-|-|-|
|Open/close main menu|X|Tab|
|Open/close object menu|Y|`|
|Move selection|Left stick/D-pad|w/s/a/d|
|Open submenu|Left stick right/D-pad right/A|d/Enter|
|Close submenu|Left stick left/D-pad left/B|a/\|
|Change bank (object menu)|L/R|q/e|
|Confirm selection|A|Enter|

**TEXT VIEWING**
|Action|Joycon|Keyboard|
|-|-|-|
|Scroll|Left stick/D-pad|w/s|
|Fast scroll|Right stick||

--------

MAIN MENU
-
**FILE**
* ***New map ...*** --- Close current map and create a new map. You will be prompted to save the current map if it has changed.
* ***Save map*** --- Save map under its current name.
* ***Save map as ...*** --- Save map under a different name.
* ***Load map ...*** --- Close current map and open a saved map. You will be prompted to save the current map if it has changed.
* ***Manage maps ...*** -- Open a file browser to select maps for deletion.
* ***About ...*** --- View Celqi version and author info.
* ***Release notes ...*** --- View changes made in the current release version.

**OBJECTS UNDER CURSOR**
* ***Toggle selection*** --- Add an object under the cursor to the selection or remove it from the selection.
* ***Delete*** --- Delete an object under the cursor.

**SELECTION**
* ***Remove from selection*** --- Remove an individual object from the current selection.
* ***Clear selection*** --- Remove all objects from the current selection.
* ***Copy***
	* ***Copy from (first) object origin*** --- Copy selected object(s) to the brush and the clipboard bank. The position origin will be at the object's origin (if a single object) or the first selected object's origin (if multiple objects).
	* ***Copy from cursor origin*** --- Copy selected object(s) to the brush and the clipboard bank. The position origin will be at the current cursor position.
* ***Cut***
	* ***Cut from (first) object origin*** --- Copy selected object(s) to the brush and the clipboard bank and remove the original(s). The position origin will be at the object's origin (if a single object) or the first selected object's origin (if multiple objects).
	* ***Cut from cursor origin*** --- Copy selected object(s) to the brush and the clipboard bank and remove the original(s). The position origin will be at the current cursor position.
* ***Save in bank as merged object*** --- Create a merged object definition from the selection in an existing or new bank (see **MERGED OBJECTS**). The position origin will be at the current cursor position.
* ***Delete*** --- Delete all objects in the selection.

**BRUSH PROPERTIES**
* ***Object color ...*** --- Set the color of the brush object. For primitives, **{1, 1, 1, 1}** represents white, while for models, it represents the original model texture. 
* ***Metallic*** --- Set the mettalic value of the brush object. This only affects primitives.
* ***Roughness*** -- Set the roughness value of the brush object. This only affects primitives.
* ***Emissiveness*** --- Set the emissiveness value of the brush object.
* ***Brightness*** --- Set the brightness of the light(s) in the brush.
* ***Light color*** --- Set the color of the light(s) in the brush using an RGB color picker.
* ***Spread*** --- Set the spread of the light(s) in the brush. Only applicable to spot lights.
* ***Resolution*** --- Set the shadow resolution of the light(s) in the brush. Only applicable to point shadow lights and world shadow lights.
* ***Range*** --- Set the range of the light(s) in the brush. Only applicable to world shadow lights.

**CAMERA OPTIONS**
* ***Recenter cursor*** --- Move the cursor to the middle of the screen.
* ***Movement speed*** --- Change how fast the camera moves.
* ***Rotation speed*** --- Change the speed of the camera's pitch and yaw.
* ***Field of view*** --- Change the camera's field of view within a range of 50 to 110.
* ***Lock movement to world axes*** --- When the camera is locked to the world axes, moving forward/backward or up/down will move along the world horizontal and vertical axes instead of along the camera's local axes.

**POSITION OPTIONS**
* ***Snap mode*** --- Change if and how the cursor snaps to the grid. Snap by will change the cursor's position by the given value when moved. Snap to will snap the cursor to a multiple of the given value when moved.
* ***Snap increment*** --- Set the amount by which the cursor snaps. Grid unit is the same as 1 for Snap by, but for Snap to, Grid unit will center the cursor in the given grid value (effectively giving an offset of 0.5) rather than positioning it at the corner as it does when the unit is 1.

**ROTATION OPTIONS**
* ***Snap mode*** --- Change if and how an object snaps to the grid when rotated. Snap by will change the rotation by the given value. Snap to will snap the rotation to a multiple of the given value. Objects always rotate around their position origin.
* ***Snap increment*** --- Set the amount in degrees by which object rotation snaps.

**SCALE OPTIONS**
* ***Snap mode*** --- Change if and how an object snaps to values when scaled. Snap by will change the scaling by the given value. Snap to will snap the scaling to a multiple of the given value. Objects always scale relative to their position origin.
* ***Snap increment*** --- Set the amount by which objects scale. Note that this number refers to a scale change relative to the object's original size and not to a grid value.

**BACKGROUND**
* ***Image*** --- Choose one of FUZE's predefined 3D backgrounds.
* ***Tint*** --- Set the background/environment color using an RGB color picker.

**THEME**
* Choose a color theme for Celqi. Themes can be defined and modified by editing the **getThemeDefs()** function.

**ADVANCED**
* ***Screen resolution*** --- If the Switch is docked, the display resolution can be increased to 1920x1080.
* ***Photo mode*** --- Hides UI elements and editor widgets to facilitate screenshots and physics demoing.
* ***Show object labels*** --- Displays objects' names and their indices in the **g_cell** array (see **REFERENCING OBJECTS IN CODE**).
* ***Camera collisions*** --- Set the algorithm used for finding camera collisions with the environment.
* ***Show cell outlines*** --- Celqi maps are built from a matrix of 5x5x5 cells that are automatically created by cursor movement and object placement. These cells are important to the underlying map engine, but in most cases, they can be ignored during map creation. This option enables visualization of the cells that the camera and cursor are in.
* ***Throw physics object*** --- Throw the current brush object into the world to demo the experimental physics engine. The thrown object will disappear after several seconds.
* ***View map stats ...*** --- View a numerical breakdown of the objects present in the map.
* ***View raw save file data ...*** --- Celqi save data is witten to file as human-readable text. You can view the text of the save file with this option. This is a debug feature; there's no need to understand the file format unless there's a problem you're trying to diagnose.

--------

OBJECT MENU
-
To select an object for the brush, first open the object menu **(Y)**. This brings up a visual list of both the objects you have defined via code in **getModels()** (see **SETUP**) and the merged objects you have defined using *Save in bank as merged object* (see **MERGED OBJECTS**). The current bank can be changed with **(L)** and **(R\)** or with the sidebar entries. If the number of objects in a bank exceeds the viewable size, the object list can be scrolled by moving the selection cursor towards the bottom or top of the menu.

For unmerged objects, pressing **(A)** copies the object to the brush and closes the object menu. For merged objects (marked with the paper stack icon), pressing **(A)** brings up the merged object menu (see **MERGED OBJECTS**).

--------

EDITING
-
In all edit modes, pressing **(A)** places the current brush object in the map, pressing **(Y)** opens the object menu, and pressing **(X)** opens the main menu. **(R\)** cycles through the available edit modes, and **(L)** modifies the current edit mode.

**MASS SELECTION**
Pressing **(B)** in any of the edit modes creates a mass selection box. The box's size is adjusted by moving the cursor, and objects that will be included in a committed selection flash. To commit the selection, press **(A)**; to cancel the selection, press **(B)**. To unselect objects after selecting them, choose *Selection > Remove from selection > OBJECT NAME* or *Selection > Clear selection*.

**POSITION**
In position mode, the cursor is moved horizontally with the **left control stick** and vertically with the **left control stick** + **(L)**. The cursor snaps according to the position options set in the main menu. The camera is moved independently of the cursor; if you lose track of the cursor, it can be recentered on the sceen by choosing *Camera options > Recenter cursor*.

**ROTATE**
In rotate mode, **left control stick up/down** rotates the object on the first axis and **left control stick left/right** rotates the object on the second axis. **(L)** toggles rotation axis pairs between local Y/local X and world Y/local Z. Objects always rotate around their origins, and rotation snaps according to the rotation options set in the main menu.

Rotate mode is not available for point lights and point shadow lights because they cast light in every direction equally.

**SCALE**
In scale mode, **left control stick up/down** adjusts object scale. The scaling axes are indicated by green arrows pointing outwards from the cursor; these axes can be cycled by pressing **(L)**. Objects always scale from their origins, and scaling snaps according to the scale options set in the main menu.

Scale mode is not available for lights because they don't have size.

--------

MERGED OBJECTS
-
By selecting objects and choosing *Selection > Save in bank as merged object*, you can combine multiple objects into a single object definition. A merged object, identified by the paper stack icon in the object menu, can be used as a single, unified object by selecting *Set brush (single merged)*, or it can be deconstructed into its underlying objects by selecting *Set brush (multiple unmerged)*.

It is also possible to merge already-merged objects, creating multiple layers of merging. FUZE will eventually hit its recursion limit and throw an error if the merged layers go too deep, so it is best not to merge deeper than a couple of layers.

**DELETING MERGED OBJECTS**
Unlike code-defined objects, merged object definitions can be deleted from within the object menu. Deleting a merged object definition can have far-reaching consequences depending on how the object has been used. A merged object can be directly placed in a map (first-level use), used as an element of other merged object definitions (second-level use), or indirectly placed in a map via those other merged objects of which it is an element (third-level use). Deletion of a definition affects all three of these uses, so you should be aware of how the object has been used before you delete it -- if you aren't, you may inadvertantly affect other objects that you didn't realize referenced the deleted definition.

If you elect to remove references, they are completely deleted without being replaced. Replacing references substitutes the current brush object for any references, retaining the scales, rotations, and positions of the original references. Unmerging explodes the references into their constituent elements without otherwise changing them. If you choose *In this map only*, the deletion/replacement/unmerging will still affect second- and third-level uses in other maps, but when loading another map, you will be prompted to relink any first-level uses in that map.

Note that *unmerge* is not available from the map load relink prompt because at that point the deleted object definition no longer exists, and there is no way for Celqi to know what its constituent elements were. Therefore, in most cases it's preferable to choose *In all maps* when unmerging.

--------

LIGHTS
-
In FUZE code, lights are completely different from 3D object models; however, Celqi provides a layer of abstraction that treats lights as a type of object. This means that lights can be placed, deleted, and merged just like any other object. There are a few differences from normal objects, though: lights have no collision data, scaling has no effect on lights because they have no size, and rotation is not applicable to point lights and point shadow lights because they are not directional.

Lights also have additional settings that can be modified in the brush properties menu (see **MAIN MENU**).

--------

CLIPBOARD
-
Every time you cut or copy objects, Celqi adds them to the Clipboard bank. You can browse this bank from the object menu and select objects from it just like any other bank.

The Clipboard bank can contain up to 32 entries. Once this size is exceeded, old Clipboard entries are deleted from the bank to make room for new ones. The Clipboard bank persists if you load a different map, making it easy to copy/paste objects between maps. The bank is not, however, saved between editor sessions. If you want a permanent version of a Clipboard entry, you should save it as a merged object definition.

--------

USING THE CORE LOADER
-

When building a game, it is not necessary to include the entire Celqi codebase in the project in order to use maps created with the editor. There is a subset of Celqi functions, known as the core loader, that provides the code necessary to load and interact with maps without loading the editor itself.

To use the core loader, first make a copy of Celqi from the FUZE projects menu to create a base for your project that contains your maps in its text file. In this copy, uncomment the **edFunction()** function in the *Core loader override* section (**lines 12 to 36**). This function overrides the version of **edFunction()** defined later in the code and allows the core loader to operate independently.

The editor code that starts at line X should then be either deleted or disabled with a multi-line comment. If you anticipate needing to make frequent changes to your maps, you may want to comment the editor code out so you can easily boot into the editor later. Otherwise, deleting it will make the FUZE editor run more smoothly by substantially reducing the number of lines in the project. The editor code can always be copied from the original Celqi project if you need it.

Your own project code must be placed somewhere after the core loader's global variables load (that is, somewhere after **line 213**). It is recommended but not required that you place your code at the very end of the file -- this makes temporarily booting into the editor easier, as your project code doesn't need to be bypassed to get to the editor code.

**Do not under any circumstances structure your project so that booting into the editor requires you to temporarily delete your own code** (disabling via comment is fine). If the undo or copy history is lost and an autosave happens, such as when backing out to the FUZE main menu, any deleted code will be unrecoverable.

--------

REFERENCING OBJECTS IN CODE
-

Celqi divides the map space into 5x5x5 areas called cells, whose locations can be visualized by toggling *Advanced > View cells*. Cells are used to break up the full collection of map objects into more easily indexable arrays based on their locations. It is not necessary to pay attention to cells when building a map because Celqi dynamically adds and removes them to accommodate the objects you place, but you should understand their underlying structure if you want to directly access the map object hierarchy from code.

Cells are stored in the global **g_cell** array, and each cell entry in that array contains an array of **mapObj** structs that start at index 2 (lower indices store other cell data). The **mapObj** structs contain object handle references as well as additional data about the objects (see **STRUCTS**). There may also be **mapObjRef** structs present in cells; these are references to a root **mapObj** entry in a different cell and represent objects that overlap more than one cell.

Here is an example of the structure of **g_cell**:
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
By toggling *Advanced > Show object labels*, you can view the **g_cell** indices of map objects within the editor. An object may have more than one **g_cell** entry listed depending on how many cells it overlaps. The first entry is the actual **mapObj**; subsequent entries are **mapObjRef** structs that point back to the first entry. Any of these **g_cell** entries can be resolved to its root **mapObj** by passing it to **getMapObjFromRef()**.

Celqi constructs **g_cell** indices when a map is loaded or when objects are placed during map editing, and the indices should only be considered accurate for direct referencing in code when the map is freshly loaded and unchanged. Any further changes to the map may change how Celqi assigns these indices and may make any existing use of them in code inaccurate. If the map has been changed from its saved state, Celqi places an asterisk by the **g_cell** indices shown by *Show object labels* to remind you that they may not be accurate.

--------

COLLISION TESTING
-


**DIRECTION VECTORS**
A direction vector is a vector with a length of 1 that indicates the world orientation of one of an object's local axes.

Because FUZE doesn't have built-in functions for querying an object's rotation state, it is up to the programmer to track objects' rotation states. Celqi represents object rotation by using direction vectors to indicate how an object's local axes map to the world space.

FUZE uses a Z-forward/Y-up 3D coordinate system, which means that for an unrotated object, forward is along the world Z axis and up is along the world Y axis. This is represented with direction vectors by saying that the object's forward vector is **{0, 0, 1}** and its up vector is **{0, 1, 0}**. If we were to rotate the object 45 degrees to its left, its forward vector would be **{0.707, 0, 0.707}** and its up vector would still be **{0, 1, 0}**.

Some of Celqi's functions ask for an object's rotation as represented by foward and up vectors. If you track objects' rotations using a different method, you will need to convert the rotations using either **eulerToDirVec()** or **axisAngleToDirVec()**, both of which return a struct in the form **[ .fwd = VECTOR, .up = VECTOR ]**.


**COLLISION CONTEXT**
Celqi stores data about an object's collision state in a **colContext** struct. Each object that will be checked for collisions against the map needs its own collision context, and each collision context must be initialized with **initSimpleColContext()** before it can be used.

When initializing a collision context, there are five collision modes available. These modes vary in their testing methods and in how computationally expensive they are. Raycast-based collision modes check against the map objects' actual geometry rather than against their bounding boxes, so in many cases they will be more accurate than the bounding box mode, but they are more costly.

* ***0*** --- No collisions.
* ***1*** --- Bounding box. This is the simplest and least expensive collision mode. Collisions are calculated based on bounding box intersections similarly to FUZE's **objectIntersect()** function.
* ***2*** --- Simple raycast. Collisions are calculated by drawing a raycast from an object's center at its previous position in the direction of the its movement, or if stationary, from the center of the object in the direction of its forward vector. If the raycast hits another object, a collision is returned.
* ***3*** --- Spheroid raycast. Raycasts are drawn from the object's center in a roughly spherical pattern. If any raycast hits another object, a collision is returned.
* ***4*** --- Cuboid raycast. Raycasts are drawn from the object's center in a roughly cubic pattern. If any raycast hits another object, a collision is returned.

A typical initialization of a collision context:
```
var obj = placeObject(cube, {0, 0, 0}, {0.5, 0.5, 0.5})
colContext colCon
initSimpleColContext(colCon, obj, {0, 0, 0}, {0, 0, 1}, {0, 1, 0}, 
    {0.5, 0.5, 0.5}, 1)
```

**GETTING COLLISIONS**
Once the object's collision context has been initialized, its collision state can be checked using **getSimpleMapCollision()**. This function returns an array of references to map objects that the object has collided with in the current frame. A reference returned by **getSimpleMapCollision()** can be passed to **getMapObjFromStruct()** to get a **mapObj** struct that contains, among other things, an object handle for the map object that was collided with (**.obj** field), its location (**.pos**), its rotation (**.fwd** and **.up**), and -- by passing the **mapObj** struct to **getMapObjName()** -- its name.

--------

PHYSICS
-
Celqi has an experimental physics engine. To see a physics demo, choose *Advanced > Throw physics object* from the main menu or press **(A)** while in photo mode. Thrown objects will disappear after several seconds. While in photo mode, objects can be immediately cleared with **(B)** or boosted into the air by holding **(Y)**.

**PHYSICS FUNCTIONS**
Like the standard collision detection, the physics engine uses the **colContext** struct to store data about an object's state. To use a collision context with the physics engine, a **colContext** struct must be initialized with **initColContext()**, which is very similar to **initSimpleColContext()** except that it exposes arguments that deal specifically with physics initialization and that allow some fine-tuning of the **colContext**'s behavior.

Once the collision context has been initialized, the object's physics and collision states can be updated by calling **updateObjPhysics()**. The physics engine handles object movement based on velocity. To directly change the object's velocity, call **addColContextVel()** or **setColContextVel()**. Velocity is also affected by gravity (if enabled) and is reduced and/or redirected by collisions with map objects.

In order to reduce load, a object's physics processing is frozen once it reaches a stationary position. While frozen, it is not affected by gravity or collisions. To unfreeze the object and reenable physics processing, change the object's velocity via **addColContextVel()** or **setColContextVel()**.

Using multiple physics objects at the same time tends to dramatically reduce the framerate. One approach to mitigating this is to reduce the frequency of objects' physics updates when more objects are added by accumulating **timeDelta()** over multiple frames and then passing this value into **updateObjPhysics()** as the **_delta** value. There is currently no built-in system for automatically managing update frequency reduction, but you can see an example of its implementation in the editor's **startThrow()** and **updateThrow()** functions.

--------

DEVELOPMENT ROADMAP
-
Possible future features include:
* Support for landscapes.
* Assignable collision channels on objects.
* Non-rendering markers and collision volumes that can be used for things such as spawn points and event triggers.
* File-streaming for increased map size.
* Undo/redo.

--------

KNOWN ISSUES
-
* There is a limit to map complexity based on FUZE's internal variable limits. It is impossible give specifics of max allowed size and object count because there are a lot of factors involved in Celqi's variable use, but the Castle Demo map represents the approximate maximum safe complexity. If too many objects are used, FUZE will return an error when placing an object or loading a map.

* Mass selection may sometimes skip objects within the selection bounds.

* At very small snap values, the cursor may sometimes get stuck.

* Metallic and roughness material properties are editable on non-primitive objects despite not applying to them.

* Cone and pyramid primitives are not included in the primitives bank because FUZE's collision boxes for them are inaccurate, which in turn causes problems in Celqi's collision detection for them. To enable them anyway, uncomment the relevant code in the **loadPrimitiveDefs()** function. If enabled, collision detection for cones and pyramids will be glitchy, but no other problems will be caused.

* Like the cone and pyramid primitives, some 3D models have incorrect collision data and may exhibit glitchy collision behavior if used. You can tell when an object's collision data is incorrect because it will appear incorrectly-sized and/or uncentered in the object menu.

* FUZE has a known issue (as of 3.1.0) in which available memory is gradually reduced when repeatedly running a program (see FORUM THREAD). Celqi is particularly affected by this memory issue because its codebase is so large. If performance degrades across multiple sessions, close and restart FUZE to reset the memory pool and restore performance.

* Trying to place very large objects (e.g. the all-in-one racetrack models) will cause Celqi to perform very poorly and/or freeze.

FUNCTIONS
-
Note: ***opt*** indicates an optional function argument. If the argument is not given, the default value is used.

--------
**LOADING**

--------
**initCore(*opt* _mapName)**
* **_mapName** (string) (default **""**) --- The name of a map to automatically load. If none is provided, no map is loaded.

Initializes Celqi's core loader and loads models into memory. Must be called before maps can be loaded.

Returns void.

--------
**readMap(_file, _mapName)**
* **_file** (file handle) --- The file to read.
* **_mapName** (string) --- The name of the map to load.

Loads a map from the file. If a map is currently loaded, clearMap() must be called to unload it before calling readMap(). Due to FUZE's recursion depth limit, readMap() must be called from as shallow an execution context as possible. If you encounter recursion errors, try accessing readMapObj() directly from your main loop rather than embedding the call in functions.

Returns map info struct in the form [ .redefHappened = BOOL, .props = STRUCT ]. This data is not relevant in non-editor contexts.

--------
**clearMap()**

Unloads the current map and removes all map objects. Can be safely called even if no map is loaded.

Returns void.

--------
**getMapNames(_file)**
* _file (file handle) --- The file to read.

Gets the names of all maps saved in the file.

Returns array of map names in the file.

--------
**ROTATION CONVERSION**

--------
**eulerToDirVec(_yaw, _pitch, _roll)**
* **_yaw** (float) --- The rotation's yaw value.
* **_pitch** (float) --- The rotation's pitch value.
* **_roll** (float) --- The rotation's roll value.

Converts an Euler angle to direction vectors.

Returns struct in the form **[ .fwd = VECTOR, .up = VECTOR ]**.

--------
**axisAngleToDirVec(_axis, _deg)**
* **_axis** (vector3) --- The axis of rotation.
* **_deg** (float) --- Degrees of rotation around _axis.

Converts an angle of rotation around an axis to direction vectors.

Returns struct in the form **[ .fwd = VECTOR, .up = VECTOR ]**.

--------
**MAP OBJECTS**

--------
**getMapObjFromStruct(_cellIdxStruct)**
* **_cellIdxStruct** (struct) --- **mapObj** reference in the form **[ .cell = INT, .idx = INT ]**.

***getMapObjFromStruct(_cell, _idx)***
* **_cell** (int) --- The cell of the **mapObj**.
* **_idx** (int) --- The **mapObj**'s index within its cell.

Looks up a cell/idx pair (either in a struct as returned by **getSimpleMapCollision()** or individually) and returns the associated **mapObj**.

Returns a **mapObj** struct.

--------
**getMapObjFromRef(_mapObjRef)**
* **_mapObjRef** (struct) --- **mapObjRef** struct from **g_cell**.

Retrieves the root **mapObj** for a **mapObjRef**. If the root **mapObj** is passed as the argument, it will be returned unchanged, so it is best practice to apply this function to all map object entries pulled directly from **g_cell** to ensure that you have the root **mapObj** rather than a reference.

Returns a **mapObj** struct.

--------
**getMapObjName(_mapObj)**
* **_mapObj** (**mapObj** struct) --- A **mapObj** as returned by **getMapObjFromStruct()**.

Gets the name of a **mapObj**.

Returns string of **_mapObj**'s name.

--------
**COLLISION CHECK**

--------
**initSimpleColContext(*ref* _colCon, _obj, _pos, _fwd, _up, _scale, _collisionMode)**
* ***ref* _colCon** (**colContext** struct) --- The **colContext** to initialize.
* **_obj** (object handle) --- The object to associate this collision context with.
* **_pos** (vector3) --- **_obj**'s world position.
* **_fwd** (vector3) --- **_obj**'s forward vector.
* **_up** (vector3) --- **_obj**'s up vector.
* **_scale** (vector3) --- **_obj**'s scale.
* **_collisionMode** (int) --- Collision mode. 0 = no collisions. 1 = bounding box collisions. 2 = simple raycast collisions. 3 = spheroid raycast collisions. 4 = cuboid raycast collisions.

Initializes a **colContext** struct for use with **getSimpleMapCollision()**.

Returns a initialized version of **_colCon**.

--------
**getSimpleMapCollision(*ref* _colCon, _obj, _pos, *opt* _fwd, *opt* _up, *opt* _scale, *opt* _getAllCollisions, *opt* _forceUpdate, *opt* _collisionMode)**
* ***ref* _colCon** (**colContext** struct) --- The **colContext** associated with **_obj**.
* **_obj** (object handle) -- The object to check for collisions against map objects.
* **_pos** (vector3): **_obj**'s world position.
* ***opt* _fwd** (vector3) (default **_colCon.fwd**) --- **_obj**'s forward vector.
* ***opt* _up** (vector3) (default **_colCon.up**) --- **_obj**'s up vector.
* ***opt* _scale** (vector3) (default **_colCon.scale**) --- **_obj**'s scale.
* ***opt* _getAllCollisions** (boolean) (default **false**) --- Whether to return only the first collision found by the check (**false**) or all of the collisions found by the check (**true**). Returning all of the collisions is slower.
* ***opt* _forceUpdate** (boolean) (default **false**) --- Whether to make the collisions fully update even if there is a faster cached state available.
* ***opt* _collisionMode** (int) (default **_colCon.collisionMode**) --- The collision mode to use. 0 = collisions disabled; 1 = bounding box; 2 = simple raycast; 3 = spheroid raycast; 4 = cuboid raycast.

Checks for collisions between **_obj** and map objects using the collision data stored in **_colCon**.

Returns an array of references to this frame's collision objects (the array is also stored in **_colCon.collision**). Elements of the array are structs in the form **[ .cell = INT, .idx = INT ]** and can be passed to **getMapObjFromStruct()** to get a **mapObj**. Or alternately: **getMapObjFromRef(g_cell[result.cell][result.idx])**.

--------
**PHYSICS (EXPERIMENTAL)**

--------
**initColContext(_colCon, _obj, _comPos, _fwd, _up, _scale, _mode, _mass, *opt* _grav, *opt* _extRes, *opt* _initAuxCollider, *opt* _initExt, *opt* _initGridBit)**
* **_colCon** (**colContext** struct) --- The **colContext** to initialize.
* **_obj** (object handle) --- The object to associate this collision context with.
* **_comPos** (vector3) --- World position of the center of **_obj**'s bounding box.
* **_fwd** (vector3) --- **_obj**'s forward vector.
* **_up** (vector3) --- **_obj**'s up vector.
* **_scale** (vector3) --- **_obj**'s scale.
* **_mode** (int) --- Collision mode. 0 = no collisions. 1 = bounding box collisions. 2 = simple raycast collisions. 3 = spheroid raycast collisions. 4 = cuboid raycast collisions.
* **_mass** (float) --- **_obj**'s mass, which affects inertia and rotation. Does not represent real world units. Clamped between **1** and **100**. 
* ***opt* _grav** (vector3) (default **{0, -1, 0}**) --- Specifies the direction and strength of gravity. **{0, -1, 0}** approximates Earth gravity.
* ***opt* _extRes** (float) (default **0.001**) --- Resolution unit size for calculating object extent. Lower values are more accurate but take longer to calculate.
* ***opt* _initAuxCollider** (boolean) (default **true**) --- Whether to also initialize an auxilliary collider, which is used to ensure that a fast-moving object will not clip through obstacles between collision checks.
* ***opt* _initExt** (boolean) (default **true**) --- Whether to calculate object extent. In most cases this should be true unless the extent data in **_colCon** has already been set before passing it to **initColContext()**.
* ***opt* _initGridBit** (boolean) (default **true**) --- Whether to calculate and store the object's collision position in the world. In most cases this should be true unless the object will definitely change positions before a collision will happen, in which case the calculation can be skipped.

Initializes a colContext struct for use with **updateObjPhysics()**.

Returns initialized **colContext _colCon**.

--------
**updateObjPhysics(_obj, *ref* _colCon, _addVel, *opt* _scale, *opt* _collisionMode, *opt* _forceUpdate, *opt* _getAllCollisions, *opt* _handleTransformChange, *opt* _getNormal, *opt* _affectRot, *opt* _deflectVel, *opt* _maintainOrthoR, *opt* _normRecurLimit, *opt* _useGrav, *opt* _delta, *opt* _addVel)**
* **_obj** (object handle) --- The object to which the collision context belongs.
* ***ref* _colCon** (**colContext** struct) --- **_obj**'s collision context.
* ***opt* _scale** (vector3) (default **_colCon.scale**) --- **_obj**'s scale.
* ***opt* _collisionMode** (int) (default **_colCon.collisionMode**) --- Collision mode. 0 = no collisions. 1 = bounding box collisions. 2 = simple raycast collisions. 3 = spheroid raycast collisions. 4 = cuboid raycast collisions.
* ***opt* _forceUpdate** (boolean) (default **false**) --- Whether to make the physics state fully update even if there is a faster cached state available.
* ***opt* _getAllCollisions** (boolean) (default **false**) --- Whether to return all collisions rather than just the first collision found.
* ***opt* _getNormal** (boolean) (default **false**) --- Whether to calculate the direction of faces that the object collides with. Necessary for redirecting velocity along a surface instead of stopping short.
* ***opt* _affectRot** (boolean) (default **true**) --- Whether collisions can impart rotational velocity to the object.
* ***opt* _maintainOrthoR** (boolean) (default **false**) --- Whether the object's rotational velocity should be set in a way that keeps the object's local right vector othogonal with the world space up vector.
* ***opt* _normRecurLimit** (int) (default **1**) --- The number of additional passes through the physics system that can be calculated per frame. Higher numbers produce more detailed deflection behavior but increase processing load.
* ***opt* _useGrav** (boolean) (default **false**) --- Whether velocity is affected by gravity.
* ***opt* _delta** (float) (default **deltaTime()**) --- Time delta since the object's last physics update. Usually should be **deltaTime()** unless collisions aren't being calculated on every frame.
* ***opt* _addVel** (vector3) (default **{0, 0, 0}**) --- Addition to **_obj**'s velocity. Unlike **addColContextVel()**, this argument does not unfreeze a frozen physics object.

Updates **_obj**'s physics state and resolves movement and collisions with map objects.

Returns updated version of **_colCon**. (The original struct passed as **_colCon** is also updated.)

--------
**addColContextVel(*ref* _colCon, _vel)**
* ***ref* _colCon** (**colContext** struct) --- The **colContext** whose velocity will be modified.
* **_vel** (vector3) --- Velocity to add.

Adds to a collision context's velocity. If the collision context's object is frozen, it will be unfrozen.

Returns updated **_colCon**.

--------
**setColContextVel(*ref* _colCon, _vel)**
* ***ref* _colCon** (**colContext** struct) --- The **colContext** whose velocity will be modified.
* **_vel** (vector3) --- New velocity.

Sets a collision context's velocity. If the collision context's object is frozen, it will be unfrozen.

Returns updated **_colCon**.

--------

STRUCTS
-

The strikethrough fields are used interally by Celqi and shouldn't need to be accessed directly in most cases.

**colContext**
* **int cell** --- Cell in which the most recent physics update occurred.
* **vector cellPos** --- Position of the cell in which the most recent physics update occurred.
* ~~**vector comPos**~~
* **vector colPos** --- Object position during most recent collision.
* **vector scale** --- Scale of the object after the most recent update.
* ~~**vector colScale**~~
* **vector fwd** --- Forward vector of the object after the most recent update.
* ~~**vector colFwd**~~
* **vector up** --- Up vector of the object after the most recent update.
* ~~**vector colUp**~~
* **extent ext** --- Object extent struct in the form **[ .hi = VECTOR, .lo = VECTOR ]**. This struct represents the local space high and low bounds of the object. Identical to the dimensions of the built-in bounding box within a small margin of error.
* **float mass** --- The object's mass, which affects inertia and rotation. Does not represent real world units.
* **vector centerOfMass** --- The center point of an object's bounding box in local space expressed as an offset from the object's origin.
* ~~**vector dir**~~
* ~~**vector delta**~~
* **vector grav** --- Direction and strength of gravity.
* **vector vel** --- Current velocity of the object. When using the physics engine, movement is affected by directly modifying this field and calling **updateObjPhysics()**.
* **vector rotVel** --  Object's rotational velocity.
* **vector rotVelAxis** --- Axis for rotational velocity.
* ~~**array gridBit[27][2]**~~
* ~~**array objList**~~
* **array collision** --- Array of current collision object reference structs in the form **[ .cell = INT, .idx = INT ]**.
* ~~**array colDepth**~~
* ~~**array normColDepth**~~
* ~~**array normal**~~
* ~~**str normAxis**~~
* ~~**int colThisFrame**~~
* ~~**int deflectThisFrame**~~
* ~~**int allCollisions**~~
* **int collisionMode** --- Default collision mode for the object.
* ~~**var colDat**~~
* ~~**var auxCollider**~~
* ~~**var auxColCon**~~
* ~~**int continuedCol**~~
* **int frozen** --- When the object is stationary, this number counts up every physics update. When this value is greater or equal to **g_physicsFreezeThreshold**, the object's physics state is frozen. Setting this value to **0** unfreezes the object.

**mapObj**
* **var obj** --- Object handle (if an unmerged object), object group (if a merged object), or -1 (if a light). Determine what is in **.obj** by checking the lengths of **.children** and **.lights**.
* **array children** --- Array of child **mapObj** structs in a merged object. Empty if the object is not merged.
* **array lights** --- Array of **lightObj** structs in a light object. Empty if the object is not a light.
* **vector fwd** --- Object's forward vector.
* **vector up** --- Object's up vector.
* **vector scale** --- Object's scale.
* **vector pos** --- Object's position.
* **int bankIdx** --- Bank and index of the object's definition combined into a single int. Must be decoded with **decodeBank()**/**decodeIdx()**.
* **array gridBitList** --- Array of binary information about where the object is positioned in each cell that it intersects.
* **int highlight** --- Whether the object is highlighted (editor only).
* **array cellIdx** --- Array of cells and indices where the object exists. Each cell/idx pair is combined into a single int and must be decoded with **decodeCell()**/**decodeIdx()**.
* **vector col** --- Color vector of the object.
* **vector mat** --- Material of the object in the form **{metallic, roughness, emissiveStrength}**.

**mapObjRef**
* **int cellIdx** --- Cell and index of this **mapObjRef**'s root **mapObj** combined into a single int. Must be decoded with **decodeCell()**/**decodeIdx()**.

**lightObj**
* **var light** --- Light handle.
* **string name** --- Name of the light type.
* **var spr** --- Sprite representing the light (editor only).
* **vector sprScale** --- Scale of the light's sprite (editor only).
* **vector pos** --- Position within parent **mapObj**'s local space.
* **vector fwd** --- Forward vector within parent **mapObj**'s local space.
* **float brightness** --- Brightness of the light.
* **vector col** --- Color vector of the light.
* **int res** --- Resolution of the light. Doesn't apply to all light types.
* **float spread** --- Spread of the light. Doesn't apply to all light types.
* **float range** --- Range of the light. Doesn't apply to all light types.
