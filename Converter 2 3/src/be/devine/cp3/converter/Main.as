package be.devine.cp3.converter {

import be.devine.cp3.converter.components.AllButton;
import be.devine.cp3.converter.components.NumButton;
import be.devine.cp3.converter.model.AppModel;
import be.devine.cp3.converter.view.BeginScherm;
import be.devine.cp3.converter.view.ConverteerScherm;
import be.devine.cp3.converter.view.EindScherm;
import be.devine.cp3.converter.view.ManScherm;
import be.devine.cp3.converter.view.VrouwScherm;
import feathers.controls.Button;
import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;
import feathers.motion.transitions.ScreenSlidingStackTransitionManager;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;

public class Main extends Sprite{

    [Embed(source="/../assets/custom/bg.png")]
    private static const BackgroundClass:Class;

    private var _bg:Image;
    private var _btnStart:Button;
    public static var selectedItem:Object;

    private var _appModel:AppModel;
    private var _nav:ScreenNavigator;

    private static const BEGINSCHERM:String = "beginscherm";
    private static const MANSCHERM:String = "manscherm";
    private static const VROUWSCHERM:String = "vrouwscherm";
    private static const CONVERTEERSCHERM:String = "converteerscherm";
    private static const EINDSCHERM:String = "eindscherm";

    private static const HEMD:String = "hemd";
    private static const BROEK:String = "broek";

    public static var _aangekliktKledingstuk:String;
    public static var _aangekliktNummer:Number;
    public static var _aangekliktLand:String;
    //public static var _indexArray:Number;

    private var c:ConverteerScherm = new ConverteerScherm();


    public function Main() {
        trace("[MAIN] construct");
        _appModel = AppModel.getInstance();

        // BACKGROUND IMAGE
        _bg = Image.fromBitmap(new BackgroundClass());
        addChild(_bg);

        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

    }

    private function addedToStageHandler(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        //stage.addEventListener(Event.RESIZE, resizeHandler);
        //layout();



        this.addEventListener(ConverteerScherm.INDEX, handler);


        _nav = new ScreenNavigator();
        this.addChild(_nav);

        var beginpagina:ScreenNavigatorItem = new ScreenNavigatorItem(BeginScherm, {knopklik: selected}, null);
        _nav.addScreen(BEGINSCHERM,beginpagina);    //link const aan klasse

        var manscherm:ScreenNavigatorItem = new ScreenNavigatorItem(ManScherm, {knopklik2: selected2}, null);
        _nav.addScreen(MANSCHERM,manscherm);

        //var vrouwscherm:ScreenNavigatorItem = new ScreenNavigatorItem(ManScherm, {knopklikVrouw: selectedVrouw}, null);
        //_nav.addScreen(VROUWSCHERM,vrouwscherm);

        var converteerscherm:ScreenNavigatorItem = new ScreenNavigatorItem(ConverteerScherm, {knopklik3: selected3}, null);
        _nav.addScreen(CONVERTEERSCHERM,converteerscherm);

        var eindscherm:ScreenNavigatorItem = new ScreenNavigatorItem(EindScherm, {knopklik4: selectedReplay}, null);
        _nav.addScreen(EINDSCHERM,eindscherm);

        _nav.showScreen(BEGINSCHERM);
        var transition:ScreenSlidingStackTransitionManager = new ScreenSlidingStackTransitionManager(_nav);

    }

    //LINK SCHERM 2
    private function selected(e:Event, si:Object):void{
        selectedItem = si;
        _nav.showScreen(MANSCHERM);
        this.addEventListener(AllButton.BUTTON_CLICKED, buttonClickedHandler);
    }

    private function buttonClickedHandler(event:Event, path:String):void{
        trace("[Main] geklikt op: " + path);
        _aangekliktKledingstuk = path;

        switch (_aangekliktKledingstuk){
            case "hemd_g":
                //_aangekliktKledingstuk = "hemd";
                trace("[Main] aangekliktkledingsstuk: " + _aangekliktKledingstuk);
                _nav.showScreen(CONVERTEERSCHERM);
                //selected2(Event, "test");
                break;
            case "broek_g":
                trace("[Main] aangekliktkledingsstuk: " + _aangekliktKledingstuk);
                _nav.showScreen(CONVERTEERSCHERM);
                break;
            case "schoenen_man_g":
                trace("[Main] aangekliktkledingsstuk: " + _aangekliktKledingstuk);
                _nav.showScreen(CONVERTEERSCHERM);
                break;
            case "kleed_or":
                trace("[Main] aangekliktkledingsstuk: " + _aangekliktKledingstuk);
                _nav.showScreen(CONVERTEERSCHERM);
                break;
            case "schoenen_vrouw_or":
                trace("[Main] aangekliktkledingsstuk: " + _aangekliktKledingstuk);
                _nav.showScreen(CONVERTEERSCHERM);
                break;
            case "button_": //alle nummers

                trace(c.indexArray);
                //var index:int = c.indexArray;
                //trace("ja " + index);

                //var index:Number = ConverteerScherm.indexArray;

                trace("[Main] aangekliktNUMMER: " + _aangekliktKledingstuk);
                //trace("[Main] index array: " + index);
                break;
            case "UK_g":
                trace("[Main] aangekliktLand: " + _aangekliktKledingstuk);
                //trace("[Main] aangekliktNummer: " + _aangekliktNummer);
                _nav.showScreen(EINDSCHERM);
                break;
            case "US_g":
                trace("[Main] aangekliktLand: " + _aangekliktKledingstuk);
                _nav.showScreen(EINDSCHERM);
                break;
        }

    }

    private function handler(event:Event):void{

        //var aangekliktNummer:NumButton = event.currentTarget;
        //trace("[ConverteerScherm] geklikt op getal: " + aangekliktNummer);

        //_aangekliktNummer = aangekliktNummer;

        //indexArray = juisteArray.indexOf(_aangekliktNummer);

        //dispatchEvent(new Event(INDEX,true));
        //trace("plaats in array: " + _aangekliktNummer);
        //indexArray = _indexArray;
        var index:int = c.indexArray;
        //trace("ja " + index);
        trace("ja" + index);

    }

    //LINK SCHERM 3
    private function selected2(e:Event, si:Object):void{
        selectedItem = si;
        _nav.showScreen(CONVERTEERSCHERM);
        this.addEventListener(AllButton.BUTTON_CLICKED, buttonClickedHandler2);
    }

    private function buttonClickedHandler2(event:Event, path:String):void{
        trace("[Main][buttonClickedHandler2] geklikt op: " + path);
        _aangekliktLand = path;

        //trace("ja" + _aangekliktLand);

        switch (_aangekliktLand){
            case "UK_g":
                trace("[Main] aangekliktLand: " + _aangekliktLand);
                _nav.showScreen(EINDSCHERM);
                break;
            case "US_g":
                trace("[Main] aangekliktLand: " + _aangekliktLand);
                _nav.showScreen(EINDSCHERM);
                break;
        }

    }

    //LINK SCHERM 4
    private function selected3(e:Event, si:Object):void{
        selectedItem = si;
        _nav.showScreen(EINDSCHERM);
    }

    //LINK REPLAY
    private function selectedReplay(e:Event, si:Object):void{
        selectedItem = si;
        _nav.showScreen(BEGINSCHERM);
    }

    /*private function resizeHandler(event:Event):void {
        layout();
    }

    private function layout():void {
    }*/


}
}
