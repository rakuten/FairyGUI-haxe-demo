import MainPanel;

import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.events.Event;
import openfl.net.URLLoader;
import openfl.net.URLLoaderDataFormat;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;

import fairygui.GRoot;
import fairygui.UIConfig;
import fairygui.UIObjectFactory;
import fairygui.UIPackage;

class Main extends Sprite
{
    private var _loader : URLLoader;
    private var _mainPanel : MainPanel;
    
    public function new()
    {
        super();
        stage.color = 0;
        stage.frameRate = 24;
        
        stage.align = StageAlign.TOP_LEFT;
        //stage.scaleMode = StageScaleMode.NO_SCALE;
        
        var path : String = "assets/Bag.zip";
        
        _loader = new URLLoader();
        _loader.dataFormat = URLLoaderDataFormat.BINARY;
        _loader.load(new URLRequest(path));
        _loader.addEventListener(Event.COMPLETE, onLoadComplete);
    }
    
    private function onLoadComplete(evt : Event) : Void
    {
        UIPackage.addPackage(cast((_loader.data), ByteArray), null);
        
        //Register custom loader class
        UIObjectFactory.setLoaderExtension(MyGLoader);
        
        UIConfig.defaultFont = "宋体";
        UIConfig.defaultScrollBounceEffect = true;
        UIConfig.defaultScrollTouchEffect = true;
        
        //等待图片资源全部解码，也可以选择不等待，这样图片会在用到的时候才解码
        UIPackage.waitToLoadCompleted(continueInit);
    }
    
    private function continueInit() : Void{
        stage.addChild(new GRoot().displayObject);
        
        _mainPanel = new MainPanel();
    }
}
