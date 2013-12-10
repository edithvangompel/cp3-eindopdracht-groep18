package be.devine.cp3.spritesheet {
import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class SpriteSheetApplication extends Sprite{

    [Embed(source="/../assets/spritesheet/flash_assets.xml", mimeType="application/octet-stream")]
    //public static const StruisVogelXML:Class;

    [Embed(source="/../assets/spritesheet/flash_assets.png")]
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
