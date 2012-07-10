package com.hinish.spec.iab.vast.vos
{
    public class VideoClicks
    {
        /**
        * URL to open as destination page when user clicks on the video.
        */
        public var clickThrough:URIIdentifier;
        
        /**
        * URLs to request for tracking purposes when user clicks on the video.
        */
        public var clickTracking:Vector.<URIIdentifier>;
        
        /**
        * URLs to request on custom events such as hotspotted video
        */
        public var customClicks:Vector.<URIIdentifier>;
    }
}