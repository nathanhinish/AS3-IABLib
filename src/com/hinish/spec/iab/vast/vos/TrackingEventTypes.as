package com.hinish.spec.iab.vast.vos
{

    public class TrackingEventTypes
    {
        public static const CREATIVE_VIEW:String = "creativeView";
        public static const START:String = "start";
        public static const MIDPOINT:String = "midpoint";
        public static const FIRST_QUARTILE:String = "firstQuartile";
        public static const THIRD_QUARTILE:String = "thirdQuartile";
        public static const COMPLETE:String = "complete";
        public static const MUTE:String = "mute";
        public static const UNMUTE:String = "unmute";
        public static const PAUSE:String = "pause";
        public static const REWIND:String = "rewind";
        public static const RESUME:String = "resume";
        public static const FULLSCREEN:String = "fullscreen";
        public static const EXPAND:String = "expand";
        public static const COLLAPSE:String = "collapse";
        public static const ACCEPT_INVITATION:String = "acceptInvitation";
        public static const CLOSE:String = "close";

        public static function isValidTrackingEventType(key:String):Boolean
        {
            switch (key)
            {
                case CREATIVE_VIEW:
                case START:
                case MIDPOINT:
                case FIRST_QUARTILE:
                case THIRD_QUARTILE:
                case COMPLETE:
                case MUTE:
                case UNMUTE:
                case PAUSE:
                case REWIND:
                case RESUME:
                case FULLSCREEN:
                case EXPAND:
                case COLLAPSE:
                case ACCEPT_INVITATION:
                case CLOSE:
                    return true;
                default:
                    return false;
            }
        }
    }
}
