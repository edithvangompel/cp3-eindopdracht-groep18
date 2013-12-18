package be.devine.cp3.converter.queue.tasks {
import be.devine.cp3.converter.queue.ITask;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.ProgressEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class JsonLoaderTask extends EventDispatcher implements ITask{

    private var _url:String;
    private var _result:*;

    public function JsonLoaderTask( url:String ) {

        _url = url;

    }

    public function execute():void{

        var urlloader:URLLoader = new URLLoader();
        urlloader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
        urlloader.addEventListener(Event.COMPLETE, completeHandler);
        urlloader.load(new URLRequest(_url));

    }

    private function progressHandler(event:ProgressEvent):void{
        trace("[JsonLoaderTask] Progress " + event.bytesLoaded + "/" + event.bytesTotal);
        dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, event.bytesLoaded, event.bytesTotal));
    }

    private function completeHandler(event:Event):void {
        trace("[JsonLoaderTask] Json inladen complete!");

       //var loader:URLLoader = URLLoader(event.target);
       //_result = loader.data;

        _result = event.currentTarget.data;

        /*var data:Object = JSON.parse(loader.data);

        for each(var recipe:Object in data){
            var recipeData:String = recipe.result;
        }

        dispatchEvent(new Event(Event.COMPLETE));*/
    }

    public function get result():* {
        return _result;
    }

    public function get url():String {
        return _url;
    }

    public function set url(value:String):void {
        _url = value;
    }
}
}
