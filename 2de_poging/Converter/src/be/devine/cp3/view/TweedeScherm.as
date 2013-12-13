/**
 * Created with IntelliJ IDEA.
 * User: edithvangompel
 * Date: 13/12/13
 * Time: 11:28
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.components.AllButton;
import be.devine.cp3.model.AppModel;

import feathers.controls.Button;

import flash.events.Event;

import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class TweedeScherm extends Sprite{

    //LOCATIE SPRITE SHEET
    [Embed(source="/../assets/custom/flash_assets.png")]
    protected static const ATLAS_IMAGE:Class;

    //LOCATIE XML
    [Embed(source="/../assets/custom/flash_assets.xml", mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    private var _appModel:AppModel;

    private var _button:AllButton;
    private var _lijnen:Button;
    private var _nextbtn:Button;

    private var _arrButtons:Array = new Array("lijnen","next_button");
    private var _arrButtons2:Array = new Array();
    private var _arrxPos:Array = new Array(92,280);
    private var _arryPos:Array = new Array(300,550);


    public function TweedeScherm() {
        trace("[TweedeScherm] construct");

        _appModel = AppModel.getInstance();

        var texture:Texture = Texture.fromBitmap(new ATLAS_IMAGE());
        var xml:XML = XML(new ATLAS_XML());
        var _atlas:TextureAtlas = new TextureAtlas(texture, xml);


        //CREATE BUTTONS
        var arrayCounter:Number = 0;
        for each (var value:String in _arrButtons) {

            _button = new AllButton(value, _arrxPos[arrayCounter], _arryPos[arrayCounter], texture, xml);
            addChild(_button);
            _arrButtons2.push(_button);
            arrayCounter += 1;
        }

        trace(_arrButtons + _arrButtons2);
        _lijnen = _arrButtons2[0];
        _nextbtn = _arrButtons2[1];
        addChild(_nextbtn);
        trace(_nextbtn);
    }

}
}
