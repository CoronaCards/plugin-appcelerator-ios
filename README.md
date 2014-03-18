# CoronaCards Module for Appcelerator Titanium (iOS)

This is a module that enables [CoronaCards](http://www.CoronaCards.com) to be used in Titanium Mobile projects. 


## Using the Module

This section describes how to use the module in conjunction with your existing projects.

### Installation

1. Run `build.py` which creates your distribution as a `.zip` file
2. Copy this zip file into `/Library/Application Support/Titanium`


### Existing Projects

You can add register the module with an _existing_ project.

Register your module with your application by editing `tiapp.xml` and adding your module.
Example:

`````
<modules>
	<module version="0.1">com.coronalabs.coronacards</module>
</modules>
`````

When you run your project, the compiler will know automatically compile in your module
dependencies and copy appropriate image assets into the application.


### JavaScript

To use your module in code, you will need to require it. 

In the following example, we assume the `main.lua` is in a folder called 'Corona' which is in the `.app` bundle.

`````
var coronacards = require( 'com.coronalabs.coronacards' );

var view = coronacards.createView();
view.width = 160;
view.height = 240;
view.run( "Corona", null );
`````


## Module Development

This section describes information useful if you want to modify and/or improve the module itself.

### Module Architecture

The CoronaCards module leverages Titanium's ViewProxy architecture with the following classes:

* `ComCoronalabsCoronacardsView` This derives from `TiUIView`
* `ComCoronalabsCoronacardsViewProxy` This derives from `TiUIViewProxy`

### Testing the Module

Run the `titanium.py` script to test your module or test from within XCode.
To test with the script, execute:

	titanium.py run --dir=YOURMODULEDIR

This will execute the app.js in the example folder as a Titanium application.

