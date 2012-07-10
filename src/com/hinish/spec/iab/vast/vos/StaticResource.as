package com.hinish.spec.iab.vast.vos
{
    /**
    * URL to a static file, such as an image or SWF file.
    */
    public class StaticResource implements ICompanionResource
    {
        /**
        * Mime type of static resource
        */
        public var creativeType:String;
        
        public var uri:String;
    }
}