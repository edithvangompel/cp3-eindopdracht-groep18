package be.devine.cp3.converter.view {
import be.devine.cp3.converter.Main;

import feathers.controls.Screen;

import starling.display.Image;

import starling.display.Sprite;
import be.devine.cp3.converter.components.AllButton;
import be.devine.cp3.converter.model.AppModel;
import feathers.controls.Button;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class EindScherm extends Screen {

    //LOCATIE SPRITE SHEET
    [Embed(source="/../assets/custom/flash_assets.png")]
    protected static const ATLAS_IMAGE:Class;

    //LOCATIE XML
    [Embed(source="/../assets/custom/flash_assets.xml", mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    //LEGE BUTTON
    [Embed(source="/../assets/custom/lege_button.png")]
    private static const ButtonClass:Class;

    //US / UK IMAGE
    [Embed(source="/../assets/custom/us.png")]
    private static const ButtonClassUS:Class;

    [Embed(source="/../assets/custom/uk.png")]
    private static const ButtonClassUK:Class;


    private var _appModel:AppModel;
    private var _button:AllButton;
    private var _lijnen:Button;
    private var _replaybtn:Button;
    private var _cont:Sprite;
    private var _EUknop:Button;
    private var _USknop:Image;
    private var _UKknop:Image;
    private var _legeButton:Image;
    private var _legeButton2:Image;
    private var _sizesContainer:Sprite;

    private var _arrButtons:Array = new Array("replay_button","kleerhanger","EU_donkergroen");
    private var _arrButtons2:Array = new Array();
    private var _arrxPos:Array = new Array(280,90,41,41);
    private var _arryPos:Array = new Array(550,150,250,340);

    //MAN hemd broek schoenen
    private var _arrManHemdEU:Array = [36, 38, 40, 42, 44, 46, 48];     //7 items
    private var _arrManHemdUS:Array = [14, 14.5, 15, 15.5, 16, 16.5, 17];
    private var _arrManHemdUK:Array = [14, 14.5, 15, 15.5, 16, 16.5, 17];

    private var _arrManBroekEU:Array = [46, 48, 50, 52, 54, 56, 58];    //7 items
    private var _arrManBroekUS:Array = [30, 32, 34, 36, 38, 40, 42];
    private var _arrManBroekUK:Array = [30, 32, 34, 36, 38, 40, 42];

    private var _arrManSchoenenEU:Array = [38.5, 39, 40, 41, 42, 43, 44, 45];   //8 items
    private var _arrManSchoenenUS:Array = [6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10];
    private var _arrManSchoenenUK:Array = [6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5];

    //VROUW kleed schoenen
    private var _ArrVrouwKleedEU:Array = [36, 38, 40, 42, 44, 46, 48];  //7 items
    private var _ArrVrouwKleedUS:Array = [6, 8, 10, 12, 14, 16, 18];
    private var _ArrVrouwKleedUK:Array = [8, 10, 12, 14, 16, 18, 20];

    private var _ArrVrouwSchoenEU:Array = [37, 37.5, 38, 39, 39.5, 40, 41, 41.5]; //8 items
    private var _ArrVrouwSchoenUS:Array = [6, 6.5, 7, 7.5, 8, 8.8, 9, 9.5];
    private var _ArrVrouwSchoenUK:Array = [4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5];


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
        _EUknop = _arrButtons2[2];
        _replaybtn.addEventListener(starling.events.Event.TRIGGERED, button_triggeredHandler);


        //SWITCH US OF UK
        var land:String = Main._aangekliktKledingstuk;
        //var kledingstuk:String = Main._aangekliktKledingstuk;
        trace("[ConverteerScherm] aangeklikt land: " + land);

        //switch (gekliktLand){ case "uk":
        switch (land){
            case "UK_g":
                trace(land);
                _UKknop = Image.fromBitmap(new ButtonClassUK());
                this.addChild(_UKknop);
                _UKknop.x = 151;
                _UKknop.y = 432;
                break;
            case "US_g":
                trace(land);
                _USknop = Image.fromBitmap(new ButtonClassUS());
                this.addChild(_USknop);
                _USknop.x = 151;
                _USknop.y = 432;
                break;
        }


        //CREATE TEXT BUTTONS
        _sizesContainer = new Sprite();
        addChild(_sizesContainer);
        _sizesContainer.x = 245;
        _sizesContainer.y = 335;

        //EU MAAT
        _legeButton = Image.fromBitmap(new ButtonClass());
        _sizesContainer.addChild(_legeButton);

        var starlingTextField:starling.text.TextField =
                new starling.text.TextField(
                        100, 100, 33 /* inhoud */ + "", "Verdana", 30, 0x75b699         //INHOUD
                );
        _sizesContainer.addChild(starlingTextField);

        //UK of US MAAT
        _legeButton2 = Image.fromBitmap(new ButtonClass());
        _sizesContainer.addChild(_legeButton2);
        _legeButton2.y = _legeButton2.height + 5;

        var starlingTextField2:starling.text.TextField =
                new starling.text.TextField(
                        100, 100, 38 /* inhoud */ + "", "Verdana", 30, 0x75b699         //INHOUD
                );
        _sizesContainer.addChild(starlingTextField2);

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
