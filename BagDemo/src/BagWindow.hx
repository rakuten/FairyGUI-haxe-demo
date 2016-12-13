
import openfl.events.Event;

import fairygui.Controller;
import fairygui.GButton;
import fairygui.GList;
import fairygui.GObject;
import fairygui.UIPackage;
import fairygui.Window;
import fairygui.event.ItemEvent;

class BagWindow extends Window
{
    private var _list : GList;
    private var _page : Controller;
    
    public function new()
    {
        super();
    }
    
    override private function onInit() : Void
    {
        this.contentPane = UIPackage.createObject("Bag", "BagWin").asCom;
        this.center();
        this.modal = true;
        
        _page = this.contentPane.getController("page");
        
        _list = this.contentPane.getChild("list").asList;
        _list.addEventListener(ItemEvent.CLICK, __clickItem);
        _list.itemRenderer = renderListItem;
        _list.scrollPane.addEventListener(Event.SCROLL, __scroll);
        _list.numItems = 45;
    }
    
    private function renderListItem(index : Int, obj : GObject) : Void
    {
        var button : GButton = cast((obj), GButton);
        button.icon = "i" + as3hx.Compat.parseInt(Math.random() * 10);
        button.title = "" + as3hx.Compat.parseInt(Math.random() * 100);
    }
    
    private function __scroll(evt : Event) : Void
    {
        _page.selectedIndex = _list.scrollPane.currentPageX;
    }
    
    private function __clickItem(evt : ItemEvent) : Void
    {
        var item : GObject = evt.itemObject;
        this.contentPane.getChild("n11").asLoader.url = item.icon;
        this.contentPane.getChild("n13").text = item.icon;
    }
}
