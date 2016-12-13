
import openfl.events.Event;

import fairygui.GButton;
import fairygui.GComponent;
import fairygui.GList;
import fairygui.GObject;
import fairygui.GRoot;
import fairygui.RelationType;
import fairygui.UIPackage;

class MainPanel
{
    private var _view : GComponent;
    private var _list : GList;
    
    public function new()
    {
        _view = UIPackage.createObject("LoopList", "Main").asCom;
        _view.setSize(GRoot.inst.width, GRoot.inst.height);
        _view.addRelation(GRoot.inst, RelationType.Size);
        GRoot.inst.addChild(_view);
        
        _list = _view.getChild("list").asList;
        _list.setVirtualAndLoop();
        
        _list.itemRenderer = renderListItem;
        _list.numItems = 5;
        _list.scrollPane.addEventListener(Event.SCROLL, doSpecialEffect);
        
        doSpecialEffect(null);
    }
    
    private function doSpecialEffect(evt : Event) : Void
    {
        //change the scale according to the distance to the middle
        var midX : Float = _list.scrollPane.posX + _list.viewWidth / 2;
        var cnt : Int = _list.numChildren;
        for (i in 0...cnt){
            var obj : GObject = _list.getChildAt(i);
            var dist : Float = Math.abs(midX - obj.x - obj.width / 2);
            if (dist > obj.width)   //no intersection  
            obj.setScale(1, 1)
            else 
            {
                var ss : Float = 1 + (1 - dist / obj.width) * 0.24;
                obj.setScale(ss, ss);
            }
        }
        
        _view.getChild("n3").text = "" + ((_list.getFirstChildInView() + 1) % _list.numItems);
    }
    
    private function renderListItem(index : Int, obj : GObject) : Void
    {
        var item : GButton = cast((obj), GButton);
        item.setPivot(0.5, 0.5);
        item.icon = UIPackage.getItemURL("LoopList", "n" + (index + 1));
    }
}
