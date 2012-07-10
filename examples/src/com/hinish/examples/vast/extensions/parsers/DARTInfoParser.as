package com.hinish.examples.vast.extensions.parsers
{
    import com.hinish.examples.vast.extensions.vos.DARTInfo;
    import com.hinish.spec.iab.vast.parsers.IExtensionParser;
    import com.hinish.spec.iab.vast.vos.IExtension;


    /**
     * TODO: Add class description
     *
     * @langversion 3.0
     * @playerversion Flash 10
     */
    public class DARTInfoParser implements IExtensionParser
    {
        private var _raw:XML;

        public function DARTInfoParser()
        {
        }

        public function setData(value:XML):void
        {
            _raw = value;
        }

        public function isNodeEligible(node:XML):Boolean
        {
            return (node.@type == "DART" && node.children()[0].localName() == "AdServingData");
        }

        public function parse():IExtension
        {
            var e:DARTInfo = new DARTInfo();
            e.geoData = String(_raw.AdServingData.DeliveryData.GeoData[0]);
            return e;
        }
    }
}
