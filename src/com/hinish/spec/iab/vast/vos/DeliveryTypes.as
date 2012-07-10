package com.hinish.spec.iab.vast.vos
{

    public class DeliveryTypes
    {
        public static const PROGRESSIVE:String = "progressive";
        public static const STREAMING:String = "streaming";

        public static function isValidDeliveryType(key:String):Boolean
        {
            switch (key)
            {
                case PROGRESSIVE:
                case STREAMING:
                    return true;
                default:
                    return false;
            }
        }
    }
}
