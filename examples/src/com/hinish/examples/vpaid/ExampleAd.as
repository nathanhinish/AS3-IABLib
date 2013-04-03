package com.hinish.examples.vpaid
{
    import com.hinish.spec.iab.vpaid.AdEvent;
    import com.hinish.spec.iab.vpaid.AdMovieClipBase;
    
    import flash.display.Sprite;
    
    
    /**
     * An example VPAID ad.
     *  
     * @langversion 3.0
     * @playerversion Flash 10
     */	
    public class ExampleAd extends AdMovieClipBase
    {
		private var _bg:Sprite;
		
        public function ExampleAd()
        {
            super();
        }
		
		
		
		/**************************
		 * 
		 * Part of VPAID spec
		 * 
		 *************************/
        
        override public function handshakeVersion(playerVPAIDVersion:String):String
        {
            super.handshakeVersion(playerVPAIDVersion);
            return "1.0b1";
        }
        
        override public function initAd(width:Number, height:Number, viewMode:String, desiredBitrate:Number, creativeData:String = "", environmentVars:String = ""):void
        {
            super.initAd(width, height, viewMode, desiredBitrate, creativeData, environmentVars);
			
			updateBackground(width, height);
			
			dispatchEvent(new AdEvent(AdEvent.AD_LOADED));
        }
        
        override public function resizeAd(width:Number, height:Number, viewMode:String):void
        {
            super.resizeAd(width, height, viewMode);
        }
        
        override public function startAd():void
        {
            super.startAd();
        }
        
        override public function stopAd():void
        {
            super.stopAd();
        }
        
        override public function pauseAd():void
        {
            super.pauseAd();
        }
        
        override public function resumeAd():void
        {
            super.resumeAd();
        }
        
        override public function expandAd():void
        {
            super.expandAd();
        }
        
        override public function collapseAd():void
        {
            super.collapseAd();
        }
        
        override public function get adLinear():Boolean
        {
            return false;
        }
        
        override public function get adExpanded():Boolean
        {
            return super.adExpanded;
        }
        
        override public function get adRemainingTime():Number
        {
            return super.adRemainingTime;
        }
        
        override public function set adVolume(value:Number):void
        {
            super.adVolume = value;
        }
		
		
		
		/**************************
		 * 
		 * Example Ad methods
		 * 
		 *************************/
		
		
		private function updateBackground(width:Number, height:Number):void
		{
			if (!_bg)
			{
				addChild(_bg = new Sprite());
			}
			
			_bg.graphics.clear();
			_bg.graphics.beginFill(0xFF0000, 0.7);
			_bg.graphics.drawRect(0, 0, width, height);
			_bg.graphics.endFill();
			_bg.graphics.beginFill(0x00FF00, 0.9);
			_bg.graphics.drawRect(10, 10, width - 20, height - 20);
			_bg.graphics.endFill();
		}
		
        
    }
}