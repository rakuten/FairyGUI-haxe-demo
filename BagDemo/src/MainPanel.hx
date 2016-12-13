
import fairygui.GComponent;
import fairygui.GRoot;
import fairygui.RelationType;
import fairygui.UIPackage;

class MainPanel
{
    private var _view : GComponent;
    private var _bagWindow : BagWindow;
    
    public function new()
    {
        _view = UIPackage.createObject("Bag", "Main").asCom;
        _view.setSize(GRoot.inst.width, GRoot.inst.height);
        _view.addRelation(GRoot.inst, RelationType.Size);
        GRoot.inst.addChild(_view);
        
        _bagWindow = new BagWindow();
        _view.getChild("bagBtn").addClickListener(function() : Void{_bagWindow.show();
                });
    }
}
