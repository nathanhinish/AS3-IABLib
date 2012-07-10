package com.hinish.spec.iab.vast.vos
{

    public class Companion extends ResourceCompanionBase
    {
        /**
        * The creativeView should always be requested when
        * present. For Companions creativeView is the only
        * supported event.
        */
        public var trackingEvents:Vector.<TrackingEvent>;

        /**
        * URL to open as destination page when user clicks
        * on the the companion banner ad.
        */
        public var clickThrough:URIIdentifier;

        /**
        * Alt text to be displayed when companion is
        * rendered in HTML environment.
        */
        public var altText:String;

    }
}
