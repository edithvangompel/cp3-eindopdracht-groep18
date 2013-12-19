package be.devine.cp3.converter {

import be.devine.cp3.converter.components.AllButton;
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

    private var _aangekliktKledingstuk:String;


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
                    //megeven vd string hemd_g (of geklikt op naam allbutton) als je naar t converteerscherm gaat
                    dispatchEventWith(HEMD);
                break;
            case "broek_g":
                _nav.showScreen(CONVERTEERSCHERM);
                break;
            case "schoenen_man_g":
                _nav.showScreen(CONVERTEERSCHERM);
                break;
            case "kleed_or":
                _nav.showScreen(CONVERTEERSCHERM);
                break;
            case "schoenen_vrouw_or":
                _nav.showScreen(CONVERTEERSCHERM);
                break;
        }

    }



    //LINK SCHERM VROUW
    /*private function selectedVrouw(e:Event, si:Object):void{
        trace("in functie selectedVrouw");
        selectedItem = si;
        _nav.showScreen(VROUWSCHERM);
    }*/

    //LINK SCHERM 3
    private function selected2(e:Event, si:Object):void{
        selectedItem = si;
        _nav.showScreen(CONVERTEERSCHERM);
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

    public function get aangekliktKledingstuk():String {
        return _aangekliktKledingstuk;
        _aangekliktKledingstuk == AllButton.BUTTON_CLICKED;
    }

    public function set aangekliktKledingstuk(value:String):void {
        _aangekliktKledingstuk = value;
    }
}
}
