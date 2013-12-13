/**
 * Created with IntelliJ IDEA.
 * User: wouter
 * Date: 22/11/12
 * Time: 16:24
 * To change this template use File | Settings | File Templates.
 */
package {
import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class SpriteSheetApplication extends Sprite{

    [Embed(source="/../media/sprite_sheet.xml", mimeType="application/octet-stream")]
    public static const StruisVogelXML:Class;

    [Embed(source="/../media/sprite_sheet.png")]
    public static const StruisVogelTexture:Class;

    public function SpriteSheetApplication() {

        var texture:Texture = Texture.fromBitmap(new StruisVogelTexture());
        var xml:XML = XML(new StruisVogelXML());
        var textureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
        var frames:Vector.<Texture> = textureAtlas.getTextures("struisvogel");

        var struisvogel:MovieClip = new MovieClip(frames, 10);
        struisvogel.loop = true;
        addChild(struisvogel);

        Starling.juggler.add(struisvogel);
    }
}
}
