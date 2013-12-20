package be.devine.cp3.converter.components {
import be.devine.cp3.converter.Main;

import feathers.controls.Button;

import starling.display.Image;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;

import starling.textures.TextureAtlas;

import feathers.controls.Button;

public class NumButton extends Button {

    private var _path:String;
    private var _xPos:int;
    private var _yPos:int;
    private var _main:Main;
    private var _element:Number;
    private var _starlingTextField:TextField;

    public static const BUTTON_CLICKED:String = "button clicked";
    public static const BUTTON_CLICKED_NUM:String = "button clicked number";

    public function NumButton(path, xPos, yPos, texture, xml, element) {

        var _atlas:TextureAtlas = new TextureAtlas(texture, xml);

        _element = element;

        _path = path;
        _xPos = xPos;
        _yPos = yPos;

        var bg:Sprite = new Sprite();
        this.addChild(bg);

        var image:Image = new Image(_atlas.getTexture(path));
        bg.addChild(image);
        //this.setSize(303, 274);
        this.setSize(100, 100);
        this.x = _xPos;
        this.y = _yPos;

        _starlingTextField = new starling.text.TextField(100, 100, _element + "", "Verdana", 30, 0x75b699);
        this.addChild(_starlingTextField);

        this.addEventListener( Event.TRIGGERED, button_triggeredHandler );

    }

    private function button_triggeredHandler(event:Event):void {
        trace("[ALLBUTTON]" + " " + "Button triggered: " + _path.slice( 0, -4 ) );
        trace("[ALLBUTTON]" + " " + "Button NUM triggered: " + _element );

        dispatchEventWith(BUTTON_CLICKED, true, _path.slice(0,-4));    //naam vh path
        dispatchEventWith(BUTTON_CLICKED_NUM, true, _element);    //aangeklikt nummer
    }

    public function get path():String {
        return _path;
    }

    public function set path(value:String):void {
        _path = value;
    }

    public function get element():Number {
        return _element;
    }

    public function set element(value:Number):void {
        _element = value;
    }
}
}
