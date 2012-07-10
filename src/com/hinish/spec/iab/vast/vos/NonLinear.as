package com.hinish.spec.iab.vast.vos
{
    public class NonLinear extends ResourceCompanionBase
    {
        /**
        * Whether it is acceptable to scale the image.
        */
        public var scalable:Boolean = false;
        
        /**
        * Whether the ad must have its aspect ratio maintained when scales
        */
        public var maintainAspectRatio:Boolean = true;
        
        private var _minSuggestedDuration:int;

        /**
         * Suggested duration to display non-linear ad, typically for 
         * animation to complete. Expressed in standard time 
         * format hh:mm:ss
         */
        public function get minSuggestedDuration():Object
        {
            return _minSuggestedDuration;
        }

        /**
         * @private
         */
        public function set minSuggestedDuration(value:Object):void
        {
            
            // TODO test this
            
            var v:int;
            if(value is Number)
                v = int(value);
            else if(value is Date)
                v = (value as Date).milliseconds;
            else if (value is String)
                v = Date.parse(value);
            
            _minSuggestedDuration = v;
        }
        
        /**
         * URL to open as destination page when user clicks
         * on the the non-linear ad unit.
         */
        public var clickThrough:String;
        
        

    }
}