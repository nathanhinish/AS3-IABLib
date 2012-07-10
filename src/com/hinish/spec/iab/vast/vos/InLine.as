package com.hinish.spec.iab.vast.vos
{
    /**
    * Second-level element surrounding complete ad data for a single ad.
    */
    public class InLine extends Ad
    {
        /**
        * Common name of ad
        */
        public var title:String;
        
        /**
        * Longer description of ad
        */
        public var description:String;
        
        /**
         * Common name of advertiser
         */
        public var advertiser:String;
        
        /**
         * The price of the ad.
         */
        public var pricing:Pricing;
        
        /**
        * URL of request to survey vendor
        */
        public var survey:String;
    }
}