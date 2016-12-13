
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
        _view = UIPackage.createObject("VirtualList", "Main").asCom;
        _view.setSize(GRoot.inst.width, GRoot.inst.height);
        _view.addRelation(GRoot.inst, RelationType.Size);
        GRoot.inst.addChild(_view);
        
        _view.getChild("n6").addClickListener(function() : Void{_list.addSelection(500, true);
                });
        _view.getChild("n7").addClickListener(function() : Void{_list.scrollPane.scrollTop();
                });
        _view.getChild("n8").addClickListener(function() : Void{_list.scrollPane.scrollBottom();
                });
        
        _list = _view.getChild("mailList").asList;
        _list.setVirtual();
        
        _list.itemRenderer = renderListItem;
        _list.numItems = 1000;
    }
    
    private function renderListItem(index : Int, obj : GObject) : Void
    {
        var item : MailItem = cast((obj), MailItem);
        item.setFetched(index % 3 == 0);
        item.setRead(index % 2 == 0);
        item.setTime("5 Nov 2015 16:24:33");
        item.title = index + " Mail title here";
    }
}
