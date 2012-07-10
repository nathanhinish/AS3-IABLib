package com.hinish.spec.iab.vast.vos
{

    /**
    * Top-level element, wraps each ad in the response
    */
    public class Ad implements IAdType
    {
        private var _id:String;
        
        private var _sequence:int;

        private var _adSystem:AdSystem;

        /**
         * URLs to track impression
         */
        public var impressions:Vector.<URIIdentifier>;

        /**
        * Any number of companions in any desired pixel
        * dimensions.
        */
        public var creatives:Vector.<Creative>;
        
        /**
         * URL to request if ad does not play due to error
         */
        public var error:String;
        
        public var extensions:Vector.<IExtension>;

        public function get id():String
        {
            return _id;
        }

        public function set id(value:String):void
        {
            _id = value;
        }
        
        /**
         * Identifies the sequence of multiple Ads and defines an Ad Pod.
         */
        public function get sequence():int
        {
          return _sequence;
        }
        
        public function set sequence(value:int):void
        {
          _sequence = value;
        }

        /**
        * Indicates source ad server
        */
        public function get adSystem():AdSystem
        {
            return _adSystem;
        }

        public function set adSystem(value:AdSystem):void
        {
            _adSystem = value;
        }
    }
}
