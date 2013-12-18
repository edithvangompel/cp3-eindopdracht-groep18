package be.devine.cp3.converter.queue {
import flash.events.IEventDispatcher;

public interface ITask extends IEventDispatcher{

    function execute():void;
    function get result():*;

}
}
