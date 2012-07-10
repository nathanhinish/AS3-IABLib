package com.hinish.spec.iab.vast.vos
{
    /**
    * Wraps each creative element within an
    * InLine or Wrapper Ad
    */
    public class Creative
    {
        private static const INVALID_CREATIVE_TYPE_ERROR_MESSAGE:String = "Invalid creative type.";

        /**
         * Creative ID
         */
        public var id:String;

        /**
         * The preferred order in which multiple Creatives should be displayed
         */
        public var sequence:int;

        /**
         * Ad-ID for the creative (formerly ISCI)
         */
        public var adId:String;

        private var _source:Object;

        /**
         * Should be one of com.hinish.examples.vast.vos.LinearAd, 
         * Vector.&lt;com.hinish.examples.vast.vos.Companion&gt;, or
         * com.hinish.examples.vast.vos.NonLinearAds
         */
        public function get source():Object
        {
            return _source;
        }

        /**
         * @private
         */
        public function set source(value:Object):void
        {
            if(value is Linear || value is CompanionAds || value is NonLinearAds)
            {
                _source = value;
            }
        }


        private var _type:String;

        /**
         * TODO
         */
        public function get type():String
        {
            return _type;
        }

        /**
         * @private
         */
        public function set type(value:String):void
        {
            if (CreativeTypes.isValidCreativeType(value))
            {
                _type = value;
            }
            else
            {
                throw new Error(INVALID_CREATIVE_TYPE_ERROR_MESSAGE);
            }
        }

    }
}