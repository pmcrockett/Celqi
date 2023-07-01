Celqi is a 3D map editor for FUZE4 Nintendo Switch that makes it easy to quickly build complicated environments out of objects from FUZE's extensive asset library with very little coding. Notable features of Celqi include:

* Multiple save files
* Unrestricted map size
* Object merging for easier modularity
* Full support for lights
* Robust collision engine
* USB keyboard support

SETUP

Before 3D objects can be accessed in Celqi, these objects must be added to the source code in the getModels() function (found at line X) so that Celqi can load them on launch. Objects are grouped in banks. It doesn't matter to Celqi what bank an object is in; banks are purely for organization. You might, for example, create banks that reflect the structure of the FUZE media browser, or you might create banks based on object purpose -- a floor tile bank, a wall tile bank, and so forth.

DEFINING BANKS AND OBJECTS

Each bank is a sub-array within getModels()'s models array. Each object definition within a bank is a two-element array whose first element is a string containing the object's display name and whose second element is a string containing the object's filepath as returned by the FUZE media browser. Optionally, the first element of a bank may be a single-element array that provides a bank name. If this bank name isn't given, the bank will be auto-named.

Here is an example of what the full models array looks like:

var models = [
	// Bank 1
	[
		["Nature 1"], // Bank name (optional)
		["Stump", "Kenney/Trunk_01"], // Object name, object filepath
		["Shrub 1", "Kenney/Plant_1_01"],
		["Shrub 2", "Kenney/Plant_2_01"]
	],
	// Bank 2
	[
		["Nature 2"], 
		["River (Dirt)", "Kenney/Plate_River_Dirt_01"],
		["River Corner (Dirt)", "Kenney/Plate_River_Corner_Dirt_01"],
		["Rock", "Kenney/Rock_1_01"]
	]
]

You may add as many banks as you want, and each bank may have as many objects as you want. Objects may also have whatever names you want, but each name must be unique regardless of what bank the object is in. If the code will not run after creating banks and objects, make sure that all array items are separated by commas, that the final element of each array does not end with a comma, and that all bank/object names and filepaths are enclosed in double quotes.

MODIFYING BANKS AND OBJECTS

Sometimes you may want to move, rename, or delete an object definition.

To move an object to a different bank, simply move the name/filepath element to a different bank array. Celqi's save file data references object definitions by their display names, so Celqi will locate the object regardless of what bank it's in.

To rename an object, modify its name string and then launch Celqi. If the object hasn't been used in a merged object (see MERGED OBJECTS) or a saved map, no further action is necessary. Otherwise, Celqi will display a message that the old object definition no longer exists and will prompt you to relink the references to that definition. Select the new object name from the list, and Celqi will change the old object name to the new object name. Note that for renamed definitions used in merged objects, the relink prompt will occur at launch, whereas for renamed definitions used in maps, the relink prompt will occur when the map is loaded.

To delete an object, remove its name/filepath array element and then launch Celqi. If the object hasn't been used in a merged object or a saved map, no further action is necessary. If it has, Celqi will display the same message and prompt as it does for object renaming. To delete the object, select "Delete all references to 'OBJECT NAME' without relinking." Note that this will completely and permanently remove the object from any merged objects or maps that use it. It is usually a better idea to manually delete all occurences of an object from within the map editor before deleting the definition itself so you can be sure of exactly how the deletion will affect your maps. Additionally, instead of deleting the definition, you can instead relink the object references to a different object. Note that this may have unintended results: the relinker will not change object scale or position, so the newly linked objects will still use the deleted objects' scales and positions, which may not be desireable if the new definition has a different base size or a different position origin from the deleted definition. Again, it is usually better to make these sorts of substitutions manually from within the map editor.

Once an object definition has been created, you should not change its filepath. Celqi generates collision data for object definitions the first time it sees a new object name, and it has no way of knowing if that name's filepath has later changed. As such, if you change the filepath associated with a name, the generated collision data will no longer be accurate and the object will not load correctly. If you want to change the filepath used by an existing object definition, follow the relinking procedure described above by deleting the original definition and relinking it to a new definition with a different name and filepath. To use the original name, follow the name change procedure above once the original definition has been removed and relinked.



CONTROLS

A note about keyboard use: Celqi is designed to be used with Joycons, though it is also possible to use a USB keyboard. FUZE can see only a keypress and its repeat rate and does not see when the key is released. Because of this, camera movement, which is continuous with Joycon control, is incremental with keyboard control. The camera will move smoothly through those increments, but the lack of data about keypress duration limits the precision with which the camera can be moved.

Keyboard bindings can be manually changed by editing the g_bind struct (found at line X).

CAMERA

Forward - ZR (w)
Backward - ZL (s)
Pitch/yaw - right stick (shift + w/s, q/e)
Slide up/down/left/right - D-pad (, a/d)

CURSOR

Move cursor forward/backward/left/right - left stick (i/k/j/l)
Move cursor up/down/left/right - L + left stick (o/u/j/l)
Cycle edit mode - R (space)
Start mass selection - B (NEED TO ADD)
Cancel mass selection (while selecting) - B
Confirm mass selection (while selecting) - A
Place current brush object - A (enter)

ROTATE MODE

Rotate on axis 1 - left stick up/down (i/k)
Rotate on axis 2 - left stick left/right (j/l)
Cycle rotation axes - L (x)

SCALE MODE

Change scale - left stick up/down (i/k)
Cycle scale axes - L (x)

MENUS

Open/close main menu - X (tab)
Open/close object menu - Y (`)
Move selection - left stick, D-pad (w/s/a/d)
Open submenu - left stick right/D-pad right, A (d/enter)
Close submenu - left stick left/D-pad left, B (a/backslash)
Change bank (object menu) - L/R (q/e)
Confirm selection - A (enter)

TEXT VIEWING

Scroll - Left stick/D-pad (w/s)
Fast scroll - right stick (NEED TO ADD)



MAIN MENU

File
	New map ... - Close current map and create a new map. You will be prompted to save the current map if it has changed.
	Save map - Save map under its current name.
	Save map as ... - Save map under a different name.
	Load map ... - Close current map and open a saved map. You will be prompted to save the current map if it has changed.
	Manage maps ... - Open a file browser to select maps for deletion.
	About ... - View Celqi version and author info.
	Release notes ... - View changes made in the current release version.
Objects under cursor
	Toggle selection - Add an object under the cursor to the selection or remove it from the selection.
	Delete - Delete an object under the cursor.
Selection
	Remove from selection - Remove an individual object from the current selection.
	Clear selection - Remove all objects from the current selection.
	Copy
		Copy from (first) object origin - Copy selected object(s) to the brush and the clipboard bank. The position origin will be at the object's origin (if a single object) or the first selected object's origin (if multiple objects).
		Copy from cursor origin - Copy selected object(s) to the brush and the clipboard bank. The position origin will be at the current cursor position.
	Cut
		Cut from (first) object origin - Copy selected object(s) to the brush and the clipboard bank and remove the original(s). The position origin will be at the object's origin (if a single object) or the first selected object's origin (if multiple objects).
		Cut from cursor origin - Copy selected object(s) to the brush and the clipboard bank and remove the original(s). The position origin will be at the current cursor position.
	Save in bank as merged object - Create a merged object definition from the selection in an existing or new bank (see MERGED OBJECTS). The position origin will be at the current cursor position.
	Delete - Delete all objects in the selection.
Brush light properties - If multiple lights exist in a merged object, increasing or decreasing a property value will offset the value of each light individually, while setting the value with Set ... will set all lights to the same value.
	Brightness - Set the brightness of the light(s) in the brush.
	Color - Set the color of the light(s) in the brush using an RGB color picker.
	Spread - Set the spread of the light(s) in the brush. Only applicable to spot lights.
	Resolution - Set the shadow resolution of the light(s) in the brush. Only applicable to point shadow lights and world shadow lights.
	Range - Set the range of the light(s) in the brush. Only applicable to world shadow lights.
Camera options
	Recenter cursor - Move the cursor to the middle of the screen.
	Movement speed - Change how fast the camera moves.
	Rotation speed - Change the speed of the camera's pitch and yaw.
	Field of view - Change the camera's field of view within a range of 50 to 110.
	Draw distance - Set the camera's draw distance in number of cells (see DRAW DISTANCE).
Position options
	Snap mode - Change if and how the cursor snaps to the grid. Snap by will change the cursor's position by the given value when moved. Snap to will snap the cursor to a multiple of the given value when moved.
	Snap increment - Set the amount by which the cursor snaps. Grid unit is the same as 1 for Snap by, but for Snap to, Grid unit will center the cursor in the given grid value (effectively giving an offset of 0.5) rather than positioning it at the corner as it does when the unit is 1.
Rotation options
	Snap mode - Change if and how an object snaps to the grid when rotated. Snap by will change the rotation by the given value. Snap to will snap the rotation to a multiple of the given value. Objects always rotate around their position origin.
	Snap increment - Set the amount in degrees by which object rotation snaps.
Scale options
	Snap mode - Change if and how an object snaps to values when scaled. Snap by will change the scaling by the given value. Snap to will snap the scaling to a multiple of the given value. Objects always scale relative to their position origin.
	Snap increment - Set the amount by which objects scale. Note that this number refers to a scale change relative to the object's original size and not to a grid value.
Background
	Image - Choose one of FUZE's predefined 3D backgrounds.
	Tint - Set the background/environment color using an RGB color picker.
Theme - Choose a color theme for Celqi. Themes can be defined and modified by editing the getThemeDefs() function (at line X).
Advanced
	Screen resolution - If the Switch is docked, the display resolution can be increased to 1920x1080. This feature is not fully tested because Celqi is developed on a Switch Lite.
	Photo mode - Hides UI elements and editor widgets to facilitate screenshots.
	Show object labels - Displays objects' names and their indices in the g_cell array (see REFERENCING OBJECTS IN CODE).
	Camera collisions - Set whether the camera can collide with map objects.
	Show cell outlines - Celqi maps are built from a matrix of 5x5x5 cells that are automatically created by cursor movement and object placement. These cells are important to the underlying map engine, but in most cases, they can be ignored during map creation. You can use this option to view the cells. Empty cells are not saved; saving and reloading the map will purge them.
	View raw save file data ... - Celqi save data is witten to file as human-readable text. You can view the text of the save file with this option. This is a debugging feature; there's no need to understand the file format unless there's a problem you're trying to diagnose.



OBJECT MENU

To select an object for the brush, first open the object menu (Y). This brings up a visual list of both the objects you have defined via code in getModels() (see DEFINING BANKS AND OBJECTS) and the merged objects you have defined using Save in bank as merged object (see MERGED OBJECTS). The current bank can be changed with L and R or with the sidebar entries. If the number of objects in a bank exceeds the viewable size, the object list can be scrolled by moving the selection cursor towards the bottom or top of the menu.

For code-defined objects (no paper stack icon), pressing A copies the object to the brush and closes the object menu. For merged objects (paper stack icon), pressing A brings up the merged object menu (see MERGED OBJECTS).



EDITING

In all edit modes, pressing A places the current brush object in the map, pressing Y opens the object menu, and pressing X opens the main menu. R cycles through the available edit modes, and L modifies the current edit mode.

POSITION

In position mode, the cursor is moved horizontally with the left control stick and vertically with the left control stick + L. The cursor snaps according to the position options set in the main menu. The camera is moved independently of the cursor; if you lose track of the cursor, it can be recentered on the sceen by choosing Camera options > Recenter cursor.

While in position mode, pressing B creates a mass selection box. The box's size is adjusted by moving the cursor, and objects that will be included in a committed selection flash. To commit the selection, press A; to cancel the selection, press B. To unselect objects after selecting them, choose Selection > Remove from selection > [OBJECT NAME] or Selection > Clear selection.

ROTATE

In rotate mode, left control stick up/down rotates the object on the first axis and left control stick left/right rotates the obejct on the second axis. R toggles rotation axis pairs between local Y/local X and global Y/local Z. Objects always rotate around their origins, and rotation snaps according to the rotation options set in the main menu.

Rotate mode is not available for Point Lights and Point Shadow Lights because they cast light in every direction equally.

SCALE

In scale mode, left control stick up/down adjusts object scale. The scaling axes are indicated by green arrows pointing outwards from the cursor; these axes can be cycled by pressing L. Objects always scale from their origins, and scaling snaps according to the scale options set in the main menu.

Scale mode is not available for lights because they don't have size.



MERGED OBJECTS [CHECK UNMERGE BEHAVIOR RE: UNLOADED MAPS]

By selecting objects and choosing Selection > Save in bank as merged object you can combine multiple objects into a single object definition. A merged object, identified by the paper stack icon in the object menu, can be used as a single, unified object by selecting Set brush (single merged), or it can be deconstructed into its underlying objects by selecting Set brush (multiple unmerged). It is also possible to merge already-merged objects, creating multiple layers of merging. (FUZE will eventually hit its recursion limit and throw an error if the merged layers go too deep, so it is best not to merge deeper than a couple of layers.)

Unlike code-defined objects, merged object definitions can be deleted from within the object menu. Deleting a merged object definition can have far-reaching consequences depending on how the object has been used. A merged object can be directly placed in a map (first-level use), used as an element of other merged object definitions (second-level use), or indirectly placed in a map via those other merged objects of which it is an element (third-level use). Deletion of a definition affects all three of those uses, so you should be aware of how the object has been used before you delete it -- if you aren't, you may inadvertantly affect other objects that you didn't realize referenced the deleted definition.

If you elect to remove references, they are completely deleted without being replaced. Replacing references substitutes the current brush object for any references, retaining the scales, rotations, and positions of the original references. Unmerging explodes the references into their constituent elements without otherwise changing them. If you choose "In this map only," the deletion/replacement/unmerging will still affect second- and third-level uses in other maps, but when loading another map, you will be prompted to relink any first-level uses in that map.

Note that "unmerge" is not available from the map load relink prompt because at that point the deleted object definition no longer exists, and there is no way for Celqi to know what its constituent elements were. Therefore, in most cases it's preferable to choose "in all maps" when unmerging.



LIGHTS

In FUZE code, lights are completely different from 3D object models; however, Celqi provides a layer of abstraction that treats lights as a type of object. This means that lights can be placed, deleted, and merged just like any other object. There are a few differences from normal objects, though: lights have no collision data, scaling has no effect on lights because they have no size, and rotation is not applicable to point lights and point shadow lights because they are not directional. Lights also have additional settings that can be modified in the Light brush properties menu (see MAIN MENU).



CLIPBOARD

Every time you cut or copy objects, Celqi adds them to the Clipboard bank. You can browse this bank from the object menu and select objects from it just like any other bank. The Clipboard bank can contain up to 32 entries. Once this size is exceeded, old Clipboard entries are deleted from the bank to make room for new ones. The Clipboard bank persists if you load a different map, making it easy to copy/paste objects between maps. The bank is not, however, saved between editor sessions. If you want a permanent version of a Clipboard entry, you should save it as a merged object definition.



DRAW DISTANCE

The draw distance value refers to visible cells beyond the the camera cell along cardinal axes. It is important to understand that setting a draw distance instead of leaving it at infinite will not necessarily improve performace. Celqi implements draw distance by hiding and showing objects at the distance threshold, and this entails substantial processing overhead. In cases where a performace bottleneck stems from the amount or complexity of the visual rendering, setting a draw distance may improve performace. In all other cases, a draw distance will degrade performance.



REFERENCING OBJECTS IN CODE

The g_cell indices that can be toggled with Show object labels can be used in code to refer to the map objects directly, but there are a few caveats: Celqi constructs these indices when a map is loaded or when objects are placed during map editing, and the indices should only be considered accurate for direct referencing in code when the map is freshly loaded and unchanged. Any further changes to the map may change how Celqi assigns these indices and may make any existing use of them in code inaccurate. If the map has been changed from its saved state, Celqi places an asterisk by the g_cell indices to remind you that they may not be accurate.

An object may have more than one g_cell index listed depending on how many cells it overlaps; any of the listed indices can be used, but the first one refers to the cell in which the object's position origin is located.

All map objects including lights are wrapped in a mapObj struct. The instantiated 3D object (or group, in the case of merged objects) is stored in the .obj field. Unlike with 2D sprites, FUZE does not natively expose the properties of 3D objects, so properties such as position and rotation must be externally tracked. Celqi tracks these properties in the various fields of mapObj. Any changes made to the .obj object/group must also be made to the associated struct fields in mapObj -- the easiest way to do this is to make changes to objects via Celqi's object functions, which automatically manage the synchronization of the object/group and the struct.

Because the .obj field may contain an instantiated 3D object, an object group (if a merged object), or -1 (if a light), you may need to check what .obj contains before operating on it. This can be done by checking whether the length of the .children array and the .lights array. If the length of .children is greater than 0, the .obj field contains a group; if the length of .lights is more than 0, the .obj field contains -1; otherwise, .obj contains an object.

The .gridBit field stores a binary approximation of the object's collision box within the cell and is used to quickly screen possible collisions before running a full collision check on the object. If collision detection is needed for a mapObj, its .gridBit field must be updated whenever the object's postion, rotation, or scale (collectively referred to as its transform) changes. This is done with [CHECK FUNCTION] or [OTHER FUNCTION]. The first function is a fast calculation meant for objects whose transforms may later change. The second is a slower but more accurate calculation meant for objects whose transforms will not change after initial placement.

A mapObj struct has the following properties:

.obj (object/group/int) - An instantiated 3D object, an object group (if a merged object), or -1 if a light. Determine what is in .obj by checking the lengths of .children and .lights.
.name (string) - The object's name as defined by the user in the getModels() array.
.fwd (vector) - The object's forward vector. Always a unit vector (i.e. it has a length of 1).
.up (vector)- The object's up vector. Always a unit vector.
.scale (vector) - The object's scale multiplier. {1, 1, 1} represents default size.
.pos (vector) - The object's position in 3D space.
.bank (int) - The bank in which the object's definition is saved.
.idx (int) - The index of the object's definition within its bank.
.gridBit (array) - Binary representation of the object's collision box within its cell; spread over 2 ints.
.highlight (int) - Boolean for whether the object is highlighted in the editor.
.children (array) - Children contained by the .obj group in a merged object.
.lights (array) - Lights within the object
.cellIdx (array) - Structs in the form [ .cell = CELL_NUM, .idx = OBJ_IDX_WITHIN_CELL ] recording which cells the object overlaps and the object's indices within those cells.

DEVELOPMENT ROADMAP

Planned future features include:

* Support for landscapes and object primitives
* Editable material properties (color, metallic, roughness, and emissiveness)
* A stand-alone map loader for easier game project integration
* Assignable collision channels
