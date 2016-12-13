
import openfl.display.DisplayObject;
import openfl.display.Loader;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.net.URLRequest;

import fairygui.GLoader;

class MyGLoader extends GLoader
{
    private var _externalLoader : Loader;
    
    public function new()
    {
        super();
    }
    
    override private function loadExternal() : Void
    {
        /*
			这里演示了怎样从外部载入图片，仅仅是一个示例，实际应用中，应该实现Pool机制，避免每次都load
			*/
        _externalLoader = new Loader();
        _externalLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, __externalLoadCompleted);
        _externalLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, __externalLoadFailed);
        
        _externalLoader.load(new URLRequest("assets/icons/" + this.url + ".png"));
    }
    
    override private function freeExternal(content : DisplayObject) : Void
    {
        //释放已经载入的图片
        
    }
    
    private function __externalLoadCompleted(evt : Event) : Void
    {
        this.onExternalLoadSuccess(_externalLoader.content);
    }
    
    private function __externalLoadFailed(evt : Event) : Void
    {
        this.onExternalLoadFailed();
    }
}
