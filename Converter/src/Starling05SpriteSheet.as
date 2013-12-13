package {

import be.devine.cp3.starling.spritesheet.SpriteSheetApplication;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;

import net.hires.debug.Stats;

import starling.core.Starling;

[SWF(frameRate=60)]
public class Starling05SpriteSheet extends Sprite {
    private var starling:Starling;
    public function Starling05SpriteSheet() {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        starling = new Starling(SpriteSheetApplication, stage);
        starling.start();

        addChild(new Stats());

        stage.addEventListener(Event.RESIZE, resizeHandler);
    }

    private function resizeHandler(event:Event):void {
        var rect:Rectangle = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
        starling.viewPort = rect;
        starling.stage.stageWidth = stage.stageWidth;
        starling.stage.stageHeight = stage.stageHeight;
    }
}
}
