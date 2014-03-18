// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

var coronacards = require( 'com.coronalabs.coronacards' );
Ti.API.info( "module is => " + coronacards );

var view = coronacards.createView();
view.width = 160;
view.height = 240;
Ti.API.info( "view is => " + view );

// Assumes there is a "Corona" subfolder in your project
view.run( "Corona", null );
