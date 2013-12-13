/**
 * Created with IntelliJ IDEA.
 * User: matthiasbrodelet
 * Date: 6/12/13
 * Time: 11:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {

import be.devine.cp3.model.AppModel;
import feathers.controls.Button;
import feathers.controls.LayoutGroup;
import feathers.core.FeathersControl;

import flash.display.BitmapData;
import flash.display.Sprite;

import flash.display3D.textures.Texture;
import feathers.controls.Button;
import feathers.controls.Callout;
import feathers.controls.Label;
import feathers.themes.MetalWorksMobileTheme;

import flash.events.Event;


import feathers.controls.Button;
import feathers.controls.LayoutGroup;
import feathers.events.FeathersEventType;
import feathers.layout.HorizontalLayout;

import flash.display.BitmapData;
import flash.events.Event;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.display.Sprite;
import starling.events.Event;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.textures.TextureAtlas;

public class Main extends Sprite{

    [Embed(source="/../assets/custom/audioplayergraphics.png")]
    protected static const ATLAS_IMAGE:Class;


    [Embed(source="/../assets/spritesheet/flash_assets.xml", mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;


    [Embed(source="/../assets/spritesheet/flash_assets.xml", mimeType="application/octet-stream")]
    public static const StruisVogelXML:Class;

    [Embed(source="/../assets/spritesheet/flash_assets.png")]
    public static const StruisVogelTexture:Class;

    [Embed(source = "/../assets/custom/bg.png")]
    private static const BackgroundClass:Class;
    private var _bg:Image;
    private var _startBtn:Button;
    private var button:Button;
    private var _previousButton:Button;
    private var _appModel:AppModel;
    private var _atlas:TextureAtlas;
    private var _buttonGroup:LayoutGroup;

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

    private var _ArrVrouwSchoenEU:Array = [37, 37.5, 38, 39, 39.5, 40, 41, 41.5, 42]; //9 items
    private var _ArrVrouwSchoenUS:Array = [6, 6.5, 7, 7.5, 8, 8.8, 9, 9.5, 10];
    private var _ArrVrouwSchoenUK:Array = [4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8];


    public function Main() {

        //var red:Quad= new Quad(500,100,0xff0000);
        //addChild(red);

        //var green:Quad= new Quad(500,100,0x00ff00);
        //green.y=100;
        //addChild(green);

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));


        _bg = Image.fromBitmap(new BackgroundClass());
        addChild(_bg);

        button = new Button();
        button.label = "Click Me";
        button.width = button.height = 100;
        button.useHandCursor = true;

        addChild( button );
        trace(button.label);

        _startBtn = new Button();
        _startBtn.setSize(100,100);
        addChild(_startBtn);

        _previousButton = new Button();
        _previousButton.defaultIcon = new Image(_atlas.getTexture("PreviousIcon0000"));
        //_previousButton.setSize(50, 50);
        _buttonGroup.addChild(_previousButton);

        var texture:Texture = Texture.fromBitmap(new StruisVogelTexture());
        var xml:XML = XML(new StruisVogelXML());
        var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
        var frames:Vector.<Texture> = textureAtlas.getTextures("intro");

        var struisvogel:flash.display.Sprite = new flash.display.Sprite();
        addChild(struisvogel);

    }

}
}
