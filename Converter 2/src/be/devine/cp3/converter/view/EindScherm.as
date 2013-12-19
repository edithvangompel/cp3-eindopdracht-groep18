package be.devine.cp3.converter.view {
import feathers.controls.Screen;

import starling.display.Sprite;
import be.devine.cp3.converter.components.AllButton;
import be.devine.cp3.converter.model.AppModel;
import feathers.controls.Button;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class EindScherm extends Screen {

    //LOCATIE SPRITE SHEET
    [Embed(source="/../assets/custom/flash_assets.png")]
    protected static const ATLAS_IMAGE:Class;

    //LOCATIE XML
    [Embed(source="/../assets/custom/flash_assets.xml", mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    private var _appModel:AppModel;

    private var _button:AllButton;
    private var _lijnen:Button;
    private var _replaybtn:Button;
    private var _cont:Sprite;

    private var _arrButtons:Array = new Array("replay_button","kleerhanger","EU_donkergroen", "UK_donkergroen");
    private var _arrButtons2:Array = new Array();
    private var _arrxPos:Array = new Array(280,90,41,41);
    private var _arryPos:Array = new Array(550,150,250,340);

    public function EindScherm() {
        trace("[EindScherm] construct");

    }

    override protected function draw():void{

    }

    override protected function initialize():void{
        _appModel = AppModel.getInstance();

        _cont = new Sprite();

        var texture:Texture = Texture.fromBitmap(new ATLAS_IMAGE());
        var xml:XML = XML(new ATLAS_XML());
        var _atlas:TextureAtlas = new TextureAtlas(texture, xml);

        addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);


        //CREATE BUTTONS
        var arrayCounter:Number = 0;
        for each (var value:String in _arrButtons) {

            _button = new AllButton(value, _arrxPos[arrayCounter]+103, _arryPos[arrayCounter]+80, texture, xml);
            addChild(_button);
            _arrButtons2.push(_button);
            arrayCounter += 1;
        }

        _replaybtn = _arrButtons2[0];
        trace(_replaybtn);
        addChild(_replaybtn);
        _replaybtn.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandler);
    }

    private function addedToStageHandler(event:Event):void {
        _cont.x = stage.stageWidth / 2 - _cont.width/2;
        _cont.y = stage.stageHeight / 2 - _cont.height/2;
    }

    private function button_triggeredHandler(event:starling.events.Event):void {
        dispatchEventWith("knopklik4", true, _replaybtn);
    }



}
}
