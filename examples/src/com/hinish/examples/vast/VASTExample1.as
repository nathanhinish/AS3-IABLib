package com.hinish.examples.vast
{
    import com.hinish.examples.vast.extensions.parsers.*;
    import com.hinish.spec.iab.vast.parsers.VASTParser;
    import com.hinish.spec.iab.vast.vos.VAST;
    
    import flash.display.Sprite;
    import flash.utils.ByteArray;
    import flash.utils.setTimeout;


    public class VASTExample1 extends Sprite
    {
        [Embed(source = "../../../../../resources/vast_sample_1.xml", mimeType = "application/octet-stream")]
        private static const SAMPLE_1:Class;
        
        [Embed(source = "../../../../../resources/vast_sample_2.xml", mimeType = "application/octet-stream")]
        private static const SAMPLE_2:Class;
        
        public function VASTExample1()
        {
            setTimeout(parseVast, 2500);
        }
        
        private function parseVast():void
        {
            var parser:VASTParser = new VASTParser();
            parser.registerExtensionParser(new PreviousAdInformationParser());
            parser.registerExtensionParser(new DARTInfoParser());
            
            parser.setData(XML(getContents(SAMPLE_1)));
            var output1:VAST = parser.parse();
            
            parser.setData(XML(getContents(SAMPLE_2)));
            var output2:VAST = parser.parse();
        }

        private function getContents(cls:Class):String
        {
            var ba:ByteArray = new cls();
            return ba.readUTFBytes(ba.length);
        }
    }
}
