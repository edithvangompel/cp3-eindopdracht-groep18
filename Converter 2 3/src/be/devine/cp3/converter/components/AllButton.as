package be.devine.cp3.converter.components {
import be.devine.cp3.converter.Main;

import feathers.controls.Button;

import starling.display.Image;
import starling.events.Event;

import starling.textures.TextureAtlas;

public class AllButton extends Button {

    private var _path:String;
    private var _xPos:int;
    private var _yPos:int;

    private var _main:Main;

    public static const BUTTON_CLICKED:String = "button clicked";

    public function AllButton(path, xPos, yPos, texture, xml) {

        var _atlas:TextureAtlas = new TextureAtlas(texture, xml);

        _path = path;
        _xPos = xPos;
        _yPos = yPos;

        this.defaultIcon = new Image(_atlas.getTexture(path));
        //this.setSize(303, 274);
        this.setSize(100, 100);
        this.x = _xPos;
        this.y = _yPos

        this.addEventListener( Event.TRIGGERED, button_triggeredHandler );

    }

    private function button_triggeredHandler(event:Event):void {
        trace("[ALLBUTTON]" + " " + "Button triggered: " + _path.slice( 0, -4 ) );

        dispatchEventWith(BUTTON_CLICKED, true, _path.slice(0,-4));    //naam vh path
    }

    public function get path():String {
        return _path;
    }

    public function set path(value:String):void {
        _path = value;
    }
}
}
