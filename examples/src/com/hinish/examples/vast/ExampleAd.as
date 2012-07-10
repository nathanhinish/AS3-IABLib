package com.hinish.examples.vast
{
    import com.hinish.spec.iab.vpaid.AdEvent;
    import com.hinish.spec.iab.vpaid.AdMovieClipBase;
    
    
    /**
     * An example VPAID ad.
     *  
     * @langversion 3.0
     * @playerversion Flash 10
     */	
    public class ExampleAd extends AdMovieClipBase
    {
        public function ExampleAd()
        {
            super();
        }
        
        override public function handshakeVersion(playerVPAIDVersion:String):String
        {
            super.handshakeVersion(playerVPAIDVersion);
            return "1.0b1";
        }
        
        override public function initAd(width:Number, height:Number, viewMode:String, desiredBitrate:Number, creativeData:String = "", environmentVars:String = ""):void
        {
            super.initAd(width, height, viewMode, desiredBitrate, creativeData, environmentVars);
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
        
    }
}