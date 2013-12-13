/**
 * Created with IntelliJ IDEA.
 * User: matthiasbrodelet
 * Date: 6/12/13
 * Time: 11:08
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.model {
import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher{

    //instance == onmogelijk om meerdere appmodels aan te maken
    //enforcer == als beveiliging

    private static var instance:AppModel;

    public static function getInstance():AppModel{

        if(instance == null){

            instance = new AppModel(new Enforcer());

        }

        return instance;

    }

    public function AppModel(e:Enforcer) {

        if(e == null){

            throw new Error("AppModel is a singleton, use getInstance() instead");

        }


    }
}
}

internal class Enforcer {
}

