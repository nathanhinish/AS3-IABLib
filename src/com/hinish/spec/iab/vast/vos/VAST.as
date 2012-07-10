package com.hinish.spec.iab.vast.vos
{
    /**
    * IAB VAST, Video Ad Serving Template, video xml ad response, Version 3.0.0
    */
    public class VAST
    {
        private var _version:String;
        
        private var _ads:Vector.<Ad>;
        
        public function VAST()
        {
            _ads = new Vector.<Ad>();
        }
        
        public function get ads():Vector.<Ad>
        {
            return _ads;
        }

        public function get version():String
        {
            return _version;
        }

        public function set version(value:String):void
        {
            _version = value;
        }

    }
}