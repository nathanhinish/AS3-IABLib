package com.hinish.spec.iab.vast.vos
{
    public class MediaFile extends URIIdentifier
    {
        private static const INVALID_DELIVERY_TYPE_ERROR_MESSAGE:String = "Invalid media type.";
        
        
        private var _delivery:String;

        /**
         * Required
         */
        public function get delivery():String
        {
            return _delivery;
        }

        /**
         * @private
         */
        public function set delivery(value:String):void
        {
            value = value.toLowerCase();
            if(DeliveryTypes.isValidDeliveryType(value))
            {
                _delivery = value;
            }
            else
            {
                throw new Error(INVALID_DELIVERY_TYPE_ERROR_MESSAGE);
            }
        }

        
        /**
         * Required
         */
        public var type:String;
        
        /**
         * Optional
         */
        public var bitrate:int;
        
        /**
         * Required
         */
        public var width:int;
        
        /**
         * Required
         */
        public var height:int;
        
        /**
         * Optional
         */
        public var scalable:Boolean;
        
        /**
         * Optional
         */
        public var maintainAspectRatio:Boolean;
        
        /**
         * Optional
         */
        public var apiFramework:String;
    }
}