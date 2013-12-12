package be.devine.cp3.text{
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class TextFieldUtil{

    public static function createTextField(text:String, textFormat:TextFormat):TextField{

        var txt:TextField = new TextField();
        txt.embedFonts = true;
        txt.defaultTextFormat = textFormat;
        txt.selectable = false;
        txt.autoSize = TextFieldAutoSize.LEFT;

        txt.text = text;

        return txt;

    }

}
}
