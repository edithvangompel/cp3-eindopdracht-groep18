package {

import be.devine.cp3.converter.Main;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;

import starling.core.Starling;
import starling.events.Event;

[SWF(width=480, height=800, frameRate=60, backgroundColor="#000000")]
public class Converter extends Sprite{

    private var _starling:Starling;

    public function Converter() {
        trace("[Converter] construct");
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        this._starling = new Starling(Main, stage);
        this._starling.start();
        this.stage.addEventListener(flash.events.Event.RESIZE, resizeHandler);

    }

    private function resizeHandler(event:flash.events.Event):void {
        _starling.viewPort = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
        _starling.stage.stageWidth = stage.stageWidth;
        _starling.stage.stageHeight = stage.stageHeight;
        _starling.stage.dispatchEvent(new starling.events.Event(starling.events.Event.RESIZE));

    }


}
}
