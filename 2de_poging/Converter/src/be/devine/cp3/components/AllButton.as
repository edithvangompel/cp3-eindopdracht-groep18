/**
 * Created with IntelliJ IDEA.
 * User: matthiasbrodelet
 * Date: 13/12/13
 * Time: 09:40
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.components {
import feathers.controls.Button;

import starling.display.Image;
import starling.events.Event;

import starling.textures.TextureAtlas;

public class AllButton extends Button {

    private var _path:String;
    private var _xPos:int;
    private var _yPos:int;

    public function AllButton(path, xPos, yPos, texture, xml) {

        var _atlas:TextureAtlas = new TextureAtlas(texture, xml);

        _path = path;
        _xPos = xPos;
        _yPos = yPos;

        this.defaultIcon = new Image(_atlas.getTexture(path));
        this.setSize(303, 274);
        this.x = _xPos;
        this.y = _yPos

        this.addEventListener( Event.TRIGGERED, button_triggeredHandler );

    }

    private function button_triggeredHandler(event:Event):void {
        trace("[BEGINSCHERM]" + " " + "Button triggered: " + _path.slice( 0, -4 ) );
    }
}
}
