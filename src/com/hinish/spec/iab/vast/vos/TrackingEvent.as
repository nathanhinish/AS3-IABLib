package com.hinish.spec.iab.vast.vos
{
    /**
    * The name of the event to track for the Linear element. 
    * The creativeView should always be requested when present.
    */
    public class TrackingEvent
    {
        private static const INVALID_EVENT_TYPE_ERROR_MESSAGE:String = "Invalid tracking event type.";
        
        public var uri:String;
        
        private var _event:String;

        /**
        * The name of the event to track. For nonlinear ads 
        * these events should be recorded on the video 
        * within the ad.
        */
        public function get event():String
        {
            return _event;
        }

        public function set event(value:String):void
        {
            if(TrackingEventTypes.isValidTrackingEventType(value))
            {
               _event = value;
            }
            else
            {
                throw new Error(INVALID_EVENT_TYPE_ERROR_MESSAGE);
            }
        }

    }
}