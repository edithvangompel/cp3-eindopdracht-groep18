/**
 * Created with IntelliJ IDEA.
 * User: matthiasbrodelet
 * Date: 6/12/13
 * Time: 11:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {

import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.BeginScherm;
import be.devine.cp3.view.TweedeScherm;

import feathers.controls.Button;

import feathers.themes.MetalWorksMobileTheme;

import starling.display.Image;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;

public class Main extends Sprite{
    [Embed(source = "/../assets/custom/bg.png")]
    private static const BackgroundClass:Class;
    private var _bg:Image;
    private var _btnStart:Button;
    private var _beginScherm:BeginScherm;
    private var _tweedeScherm:TweedeScherm;

    private var _appModel:AppModel;

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

    private static const BEGINSCHERM:String = "beginscherm";
    private static const CONVERSION:String = "conversion";


    public function Main() {
        trace("[MAIN] contruct");
        _appModel = AppModel.getInstance();

        // BACKGROUND IMAGE
        _bg = Image.fromBitmap(new BackgroundClass());
        addChild(_bg);

        addEventListener(Event.ADDED_TO_STAGE, addedHandler);


    }

    private function addedHandler(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, addedHandler);
        stage.addEventListener(Event.RESIZE, resizeHandler);
        layout();
    }

    private function resizeHandler(event:Event):void {
        layout();
    }

    private function layout():void {



        _beginScherm = new BeginScherm();
        addChild(_beginScherm);



    }

}
}
