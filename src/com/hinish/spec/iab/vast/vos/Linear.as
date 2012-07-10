package com.hinish.spec.iab.vast.vos
{
    import com.hinish.spec.xs.Time;

    public class Linear 
    {
        public var duration:Time;
        public var trackingEvents:Vector.<TrackingEvent>;
        public var adParameters:String;
        public var videoClicks:VideoClicks;
        public var mediaFiles:Vector.<MediaFile>;
    }
}