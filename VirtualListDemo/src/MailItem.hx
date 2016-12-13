
import fairygui.Controller;
import fairygui.GButton;
import fairygui.GTextField;

class MailItem extends GButton
{
    private var _timeText : GTextField;
    private var _readController : Controller;
    private var _fetchController : Controller;
    
    public function new()
    {
        super();
    }
    
    override private function constructFromXML(cxml : FastXML) : Void
    {
        super.constructFromXML(cxml);
        
        _timeText = this.getChild("timeText").asTextField;
        _readController = this.getController("IsRead");
        _fetchController = this.getController("c1");
    }
    
    public function setTime(value : String) : Void
    {
        _timeText.text = value;
    }
    
    public function setRead(value : Bool) : Void
    {
        _readController.selectedIndex = (value) ? 1 : 0;
    }
    
    public function setFetched(value : Bool) : Void
    {
        _fetchController.selectedIndex = (value) ? 1 : 0;
    }
}
