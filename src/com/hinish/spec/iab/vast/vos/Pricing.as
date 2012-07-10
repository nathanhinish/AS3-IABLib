package com.hinish.spec.iab.vast.vos
{
    /**
    * The price of the ad.
    */
    public class Pricing
    {
        public var value:Number;
        
        /**
         * The pricing model used.
         * <p>see com.hinish.spec.iab.vast.vos.PricingModels</p>
         */
        public var model:String;
        
        /**
         * The currency of the pricing.
         */
        public var currency:String;
    }
}