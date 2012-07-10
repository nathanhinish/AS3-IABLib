package com.hinish.examples.vast.extensions.parsers
{
    import com.hinish.examples.vast.extensions.vos.PreviousAdInformation;
    import com.hinish.spec.iab.vast.parsers.IExtensionParser;
    import com.hinish.spec.iab.vast.vos.IExtension;

    /**
     * TODO: Add class description
     *
     * @langversion 3.0
     * @playerversion Flash 10
     */
    public class PreviousAdInformationParser implements IExtensionParser
    {
        private var _raw:XML;

        public function isNodeEligible(node:XML):Boolean
        {
            return (node.children()[0].localName() == "PreviousAdInformation");
        }

        public function setData(value:XML):void
        {
            _raw = value;
        }

        public function parse():IExtension
        {
            var ext:PreviousAdInformation = new PreviousAdInformation();
            ext.value = _raw.children()[0].valueOf();
            return ext;
        }
    }
}
