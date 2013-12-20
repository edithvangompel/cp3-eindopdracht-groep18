package be.devine.cp3.converter.view {
import be.devine.cp3.converter.components.AllButton;
import be.devine.cp3.converter.model.AppModel;
import feathers.controls.Button;
import feathers.controls.Screen;

import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class BeginScherm extends Screen{

    //LOCATIE SPRITE SHEET
    [Embed(source="/../assets/custom/flash_assets.png")]
    protected static const ATLAS_IMAGE:Class;

    //LOCATIE XML
    [Embed(source="/../assets/custom/flash_assets.xml", mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    private var _appModel:AppModel;

    private var _button:AllButton;
    private var _header_start:Button;
    private var _nextbtn:Button;

    private var _arrButtons:Array = new Array("intro","next_button");
    private var _arrButtons2:Array = new Array();
    private var _arrxPos:Array = new Array(92,280);
    private var _arryPos:Array = new Array(300,550);

    public function BeginScherm() {

    }

    override protected function draw():void{

    }

    override protected function initialize():void{
        _appModel = AppModel.getInstance();

        var texture:Texture = Texture.fromBitmap(new ATLAS_IMAGE());
        var xml:XML = XML(new ATLAS_XML());
        var _atlas:TextureAtlas = new TextureAtlas(texture, xml);

        //CREATE HEADER
        /*var header_start_texture:Texture = _atlas.getTexture("intro");
         _header_start = new Image(header_start_texture);
         addChild(_header_start);
         addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

         //CREATE NEXTBUTTON
         var _nextbtn_texture:Texture = _atlas.getTexture("next_button");
         _nextbtn = new Image(_nextbtn_texture);
         _nextbtn.x = 395;
         _nextbtn.y = 650;
         addChild(_nextbtn);*/


        //CREATE BUTTONS
        var arrayCounter:Number = 0;
        for each (var value:String in _arrButtons) {

            _button = new AllButton(value, _arrxPos[arrayCounter]+103, _arryPos[arrayCounter]+80, texture, xml);
            addChild(_button);
            _arrButtons2.push(_button);

            arrayCounter += 1;
        }

        _header_start = _arrButtons2[0];
        _nextbtn = _arrButtons2[1];
        //_nextbtn.useHandCursor = true;
        _nextbtn.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandler);

    }

    private function addedToStageHandler(event:starling.events.Event):void {
        _header_start.x = stage.stageWidth / 2 - _header_start.width/2;
        _header_start.y = stage.stageHeight / 2 - _header_start.height/2;
    }

    private function button_triggeredHandler(event:starling.events.Event):void {
        dispatchEventWith("knopklik", true, _nextbtn);

    }

}
}
