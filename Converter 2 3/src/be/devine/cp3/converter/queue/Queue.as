package be.devine.cp3.converter.queue {
import be.devine.cp3.converter.queue.tasks.JsonLoaderTask;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.ProgressEvent;

public class Queue extends EventDispatcher {

    private var _arrWaitingTasks:Array;
    private var _arrBusyTasks:Array;
    private var _arrCompletedTasks:Array;

    public function Queue() {

        _arrBusyTasks = [];
        _arrWaitingTasks = [];
        _arrCompletedTasks = [];

    }

    public function addTask( task:ITask ):void{
        trace("[Queue] adding new task");
        _arrWaitingTasks.push(task);
        trace("[Queue] " + _arrWaitingTasks.length + " tasks waiting for execution");
    }

    public function execute():void{
        trace("[Queue] start executing tasks");

        gotoNextTask();
    }

    private function gotoNextTask():void{
        trace("[Queue] trying to load next task");

        if( _arrWaitingTasks.length > 0 ){
            trace("[Queue] Found a new task");

            var newTask:ITask = _arrWaitingTasks.shift();    //task uit de waiting array halen
            newTask.addEventListener(ProgressEvent.PROGRESS, taskProgressHandler);
            newTask.addEventListener(Event.COMPLETE, taskCompleteHandler);
            newTask.execute();

            _arrBusyTasks.push( newTask );

        }else{
            trace("[Queue] no tasks available anymore!");
            dispatchEvent( new Event(Event.COMPLETE) );

        }

    }

    private function taskProgressHandler(event:ProgressEvent):void {
        trace("[Queue] Task progress " + event.bytesLoaded + "/" + event.bytesTotal);
    }

    private function taskCompleteHandler(event:Event):void {
        trace("[Queue] Task complete!");

        var completedTask:ITask = event.currentTarget as ITask;

        var index:uint = _arrBusyTasks.indexOf( completedTask );
        _arrBusyTasks.splice( index, 1 );

        _arrCompletedTasks.push( completedTask );

        gotoNextTask();

    }

    public function get arrCompletedTasks():Array {
        return _arrCompletedTasks;
    }
}
}
