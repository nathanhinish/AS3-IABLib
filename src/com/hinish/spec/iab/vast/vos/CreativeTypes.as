package com.hinish.spec.iab.vast.vos
{

    public class CreativeTypes
    {
        public static const LINEAR:String = "linear";
        public static const COMPANION:String = "companion";
        public static const NON_LINEAR:String = "nonLinear";

        public static function isValidCreativeType(key:String):Boolean
        {
            switch (key)
            {
                case LINEAR:
                case COMPANION:
                case NON_LINEAR:
                    return true;
                    break;
                default:
                    return false;
            }
        }
    }
}
