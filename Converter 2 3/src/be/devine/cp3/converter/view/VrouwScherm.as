package be.devine.cp3.converter.view {
import be.devine.cp3.converter.components.AllButton;
import be.devine.cp3.converter.model.AppModel;
import feathers.controls.Button;
import feathers.controls.Screen;

import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class VrouwScherm extends Screen{

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
    private var _cont:Sprite;

    private var _arrButtons:Array = new Array("btn_MAN","btn_VROUW init","lijnen","next_button","duid_aan_tekst","kleed_grijs","schoenen_vrouw_grijs");
    private var _arrButtons2:Array = new Array();
    private var _arrxPos:Array = new Array(30,150,92,280,90,90,90);
    private var _arryPos:Array = new Array(120,120,50,550,0,300,460);

    public function VrouwScherm() {
        trace("[ManScherm] construct");

    }
    override protected function draw():void{

    }

    override protected function initialize():void{
        _appModel = AppModel.getInstance();
        _cont = new Sprite();

        var texture:Texture = Texture.fromBitmap(new ATLAS_IMAGE());
        var xml:XML = XML(new ATLAS_XML());
        var _atlas:TextureAtlas = new TextureAtlas(texture, xml);

        //addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

        //CREATE BUTTONS
        var arrayCounter:Number = 0;
        for each (var value:String in _arrButtons) {

            _button = new AllButton(value, _arrxPos[arrayCounter]+103, _arryPos[arrayCounter]+80, texture, xml);
            addChild(_button);
            _arrButtons2.push(_button);
            arrayCounter += 1;
        }

        _lijnen = _arrButtons2[0];
        _nextbtn = _arrButtons2[1];
        addChild(_nextbtn);
    }
}
}
