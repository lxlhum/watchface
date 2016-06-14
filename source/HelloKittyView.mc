using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class HelloKittyView extends Ui.WatchFace {

    var font;
    
    function initialize() {
        WatchFace.initialize();
    }

    //! Load your resources here
    function onLayout(dc) {
        
        font = Ui.loadResource(Rez.Fonts.id_font_c64);
        setLayout( Rez.Layouts.MainLayout( dc ) );
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        // Get and show the current time
        var clockTime = Sys.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
       

        var mySmiley = new Rez.Drawables.Smiley();
        mySmiley.draw( dc );
        
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_WHITE);
        dc.drawText(110, 160 , font, timeString, Gfx.TEXT_JUSTIFY_CENTER);

    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }

    //! The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    //! Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
