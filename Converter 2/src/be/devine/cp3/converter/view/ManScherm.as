package be.devine.cp3.converter.view {
import be.devine.cp3.converter.components.AllButton;
import be.devine.cp3.converter.model.AppModel;

import feathers.controls.Button;
import feathers.controls.Screen;

import flash.events.Event;

import starling.display.Sprite;
import starling.display.Stage;
import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class ManScherm extends Screen{

    //LOCATIE SPRITE SHEET
    [Embed(source="/../assets/custom/flash_assets.png")]
    protected static const ATLAS_IMAGE:Class;

    //LOCATIE XML
    [Embed(source="/../assets/custom/flash_assets.xml", mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    private var _appModel:AppModel;

    private var _aangekliktItem:AllButton;
    private var _button:AllButton;
    private var _nextbtn:Button;
    private var _knopVrouw:Button;
    private var _knopMan:Button;
    private var _hemd:Button;
    private var _broek:Button;
    private var _schoenen:Button;
    private var _kleed:Button;
    private var _hakken:Button;
    private var _cont:Sprite;

    public static const HEMD_CLICKED:String = "hemd clicked";

    //STANDAARDIMAGES
    /*private var _arrImages:Array = new Array("btn_MAN init","btn_VROUW","lijnen","next_button","duid_aan_tekst","hemd_grijs");
    private var _arrImages2:Array = new Array();
    private var _arrxPos:Array = new Array(30,150,92,280,90);
    private var _arryPos:Array = new Array(120,120,50,550,0);*/

    //IMAGES MAN
    private var _arrButtonsMan:Array = new Array("btn_MAN init","btn_VROUW","lijnen","next_button","duid_aan_tekst","hemd_groen","broek_groen","schoenen_man_groen");
    private var _arrButtonsMan2:Array = new Array();
    private var _arrxPosMan:Array = new Array(30,150,92,280,90,90,90,90);
    private var _arryPosMan:Array = new Array(120,120,50,550,0,260,430,550);

    //IMAGES VROUW
    private var _arrButtonsVrouw:Array = new Array("btn_MAN","btn_VROUW init","lijnen","next_button","duid_aan_tekst","kleed_oranje","schoenen_vrouw_oranje");
    private var _arrButtonsVrouw2:Array = new Array();
    private var _arrxPosVrouw:Array = new Array(30,150,92,280,90,90,90);
    private var _arryPosVrouw:Array = new Array(120,120,50,550,0,300,460);

    public function ManScherm() {
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

        addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

        //ALLE IMAGES VERWIJDEREN
        for(var i:uint; i < _arrButtonsVrouw2.length; i++){
            removeChild(_arrButtonsVrouw2[i]);
        }
        for(var j:uint; j < _arrButtonsMan2.length; j++){
            removeChild(_arrButtonsMan2[j]);
        }

        //CREATE BUTTONS MAN
        var arrayCounter:Number = 0;
        for each (var value:String in _arrButtonsMan) {
            _button = new AllButton(value, _arrxPosMan[arrayCounter]+103, _arryPosMan[arrayCounter]+80, texture, xml);
            addChild(_button);
            _arrButtonsMan2.push(_button);
            arrayCounter += 1;
        }

        _nextbtn = _arrButtonsMan2[3];
        _knopVrouw = _arrButtonsMan2[1];
        _hemd = _arrButtonsMan2[5];
        _broek = _arrButtonsMan2[6];
        _schoenen = _arrButtonsMan2[7];
        _hemd.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandlerMAN);
        _broek.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandlerMAN);
        _schoenen.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandlerMAN);
        trace("[ManScherm] knop Vrouw: " + _knopVrouw);
        _nextbtn.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandler);
        _knopVrouw.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandlerVrouw);

    }

    private function addedToStageHandler(event:starling.events.Event):void {
        _cont.x = stage.stageWidth / 2 - _cont.width/2;
        _cont.y = stage.stageHeight / 2 - _cont.height/2;
    }

    private function button_triggeredHandler(event:starling.events.Event):void{
        dispatchEventWith("knopklik2", true, _nextbtn);
    }

    private function button_triggeredHandlerVrouw(event:starling.events.Event):void{
        trace("button triggered vrouw");

        //ALLE MAN IMAGES VERWIJDEREN
        for(var i:uint; i < _arrButtonsMan2.length; i++){
            removeChild(_arrButtonsMan2[i]);
        }

        var texture:Texture = Texture.fromBitmap(new ATLAS_IMAGE());
        var xml:XML = XML(new ATLAS_XML());
        var _atlas:TextureAtlas = new TextureAtlas(texture, xml);

        //CREATE BUTTONS VROUW
        var arrayCounter:Number = 0;
        for each (var value:String in _arrButtonsVrouw) {

            _button = new AllButton(value, _arrxPosVrouw[arrayCounter]+103, _arryPosVrouw[arrayCounter]+80, texture, xml);
            addChild(_button);
            _arrButtonsVrouw2.push(_button);
            arrayCounter += 1;
        }

        _nextbtn = _arrButtonsVrouw2[3];
        _knopMan = _arrButtonsVrouw2[0];
        _kleed = _arrButtonsVrouw2[5];
        _hakken = _arrButtonsVrouw2[6];
        trace("[ManScherm] knop Vrouw: " + _knopVrouw);
        addChild(_nextbtn);
        _nextbtn.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandler);
        _knopMan.addEventListener(starling.events.Event.TRIGGERED, initialize);
        _kleed.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandlerVROUW);
        _hakken.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandlerVROUW);

        //dispatchEventWith("knopklikVrouw", true, _knopVrouw);
    }

    private function button_triggeredHandlerMAN(event:starling.events.Event):void {
        _aangekliktItem = event.currentTarget as AllButton;

        var hemd:AllButton = _arrButtonsMan2[5];
        var broek:AllButton = _arrButtonsMan2[6];
        var schoenen:AllButton = _arrButtonsMan2[7];
        hemd.alpha = .3;
        broek.alpha = .3;
        schoenen.alpha = .3;

        switch (aangekliktItem){
            case hemd:
                trace("hemd");
                    hemd.alpha = 1;
                    broek.alpha = .3;
                    schoenen.alpha = .3;
                break;
            case broek:
                trace("broek");
                    hemd.alpha = .3;
                    broek.alpha = 1;
                    schoenen.alpha = .3;
                break;
            case schoenen:
                trace("schoenen");
                    hemd.alpha = .3;
                    broek.alpha = .3;
                    schoenen.alpha = 1;
                break;
        }

    }

    private function button_triggeredHandlerVROUW(event:starling.events.Event):void {
        var aangekliktItem:AllButton = event.currentTarget as AllButton;

        var kleed:AllButton = _arrButtonsVrouw2[5];
        var hakken:AllButton = _arrButtonsVrouw2[6];
        kleed.alpha = .3;
        hakken.alpha = .3;

        switch (aangekliktItem){
            case kleed:
                trace("kleed");
                kleed.alpha = 1;
                hakken.alpha = .3;
                break;
            case hakken:
                trace("hakken");
                kleed.alpha = .3;
                hakken.alpha = 1;
                break;
        }

    }


    public function get aangekliktItem():AllButton {
        return _aangekliktItem;
    }

    public function set aangekliktItem(value:AllButton):void {
        _aangekliktItem = value;
    }
}
}
