package com.hinish.spec.iab.vast.vos
{
    public class CompanionBase
    {
        /**
         * Optional identifier
         */
        public var id:String;
        
        /**
         * Pixel dimensions of companion
         */
        public var width:int;
        
        /**
         * Pixel dimensions of companion
         */
        public var height:int;
        
        /**
         * Data to be passed into the companion ads. The apiFramework defines the method to use for communication (e.g. "FlashVar")
         */
        public var adParameters:String;

        /**
         * The apiFramework defines the method to use for communication with the companion
         */
        public var apiFramework:String;
    }
}