/**
 * Created with IntelliJ IDEA.
 * User: wouter
 * Date: 24/11/12
 * Time: 17:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.spritesheet {
import flash.display.BitmapData;

import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Button;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class TweensApplication extends Sprite{

    private var button:Button;
    private var quadContainer:Sprite;

    public function TweensApplication() {
        var bmpData:BitmapData = new BitmapData(100, 100, false, 0xff0000);
        button = new Button(Texture.fromBitmapData(bmpData));
        addChild(button);

        quadContainer = new Sprite();
        quadContainer.x = 110;
        addChild(quadContainer);

        button.addEventListener(Event.TRIGGERED, triggeredHandler);
    }

    private function triggeredHandler(event:Event):void {
        quadContainer.removeChildren();

        for(var i:uint = 0; i < 25; i++) {
            var q:Quad = new Quad(50, 50, 0xff0000);
            q.x = (i % 5) * 50;
            q.y = Math.floor(i / 5) * 50;
            q.alpha = 0;
            q.scaleX = q.scaleY = 0;
            quadContainer.addChild(q);

            var t:Tween = new Tween(q, .5, Transitions.EASE_IN_OUT);
            t.animate("alpha", 1);
            t.animate("scaleX", 1);
            t.animate("scaleY", 1);
            t.delay = i * .05;

            t.onComplete = onTweenComplete;
            t.onCompleteArgs = [q];

            Starling.juggler.add(t);
        }
    }

    private function onTweenComplete(q:Quad):void {
        q.color = 0x00ff00;
    }
}
}
