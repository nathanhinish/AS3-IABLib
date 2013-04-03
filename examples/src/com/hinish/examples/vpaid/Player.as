package com.hinish.examples.vpaid
{
    import com.hinish.spec.iab.vpaid.AdEvent;
    import com.hinish.spec.iab.vpaid.AdViewMode;
    
    import flash.display.DisplayObject;
    import flash.display.Loader;
    import flash.display.MovieClip;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;

    [SWF(width = "720", height = "480", backgroundColor = "#00FFFF")]
    public class Player extends MovieClip
    {
        private const VPAID_VERSION:String = "2.0";

        private var _loader:Loader;

        private var _ad:Object;

        private var _adVPAIDVersion:String;

        public function Player()
        {
            super();

            if (stage)
            {
                // Only do these if this is the top-level SWF.
                stage.align = StageAlign.TOP_LEFT;
                stage.scaleMode = StageScaleMode.NO_SCALE;

                createLoader();
            }
            else
            {
                addEventListener(Event.ADDED_TO_STAGE, function temp(event:Event):void
                {
                    removeEventListener(Event.ADDED_TO_STAGE, temp);
                    createLoader();
                });
            }
        }

        private function createLoader():void
        {
            _loader = new Loader();
            _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            _loader.load(new URLRequest("ExampleAd.swf"));
        }
		
		private function errorHandler(event:Event):void
		{
			// Just kill the event for this example.
			event.preventDefault();
			event.stopImmediatePropagation();
		}			

        private function completeHandler(event:Event):void
        {
            _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, completeHandler);
            if (_loader.content)
            {
                _ad = _loader.content;
            }
            processAd();
        }

        private function processAd():void
        {
            if (_ad)
            {
                if (_ad.hasOwnProperty("handshakeVersion"))
                {
                    _adVPAIDVersion = _ad.handshakeVersion(VPAID_VERSION);
                }
                // Just assuming it's a IEventDispatcher. 
                _ad.addEventListener(AdEvent.AD_LOADED, adLoadedHandler);

                if (_ad.hasOwnProperty("initAd"))
                {
                    _ad.initAd(stage.stageWidth - 40, stage.stageHeight - 40, AdViewMode.NORMAL, 4800, "", "");
                }
            }
        }

        private function adLoadedHandler(event:Event):void
        {
            trace("PLAYER >> AD LOADED");
            _ad.x = 20;
            _ad.y = 20;
            addChild(_ad as DisplayObject);
			_ad.startAd();
        }
    }
}
