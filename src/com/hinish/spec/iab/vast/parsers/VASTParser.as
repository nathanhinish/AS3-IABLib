package com.hinish.spec.iab.vast.parsers
{
    import com.hinish.spec.iab.vast.vos.*;
    import com.hinish.spec.xs.Time;

    public class VASTParser
    {
        private var _extensions:Vector.<IExtensionParser>;

        private var _raw:XML;

        private var _output:VAST;

        public function VASTParser()
        {
            _extensions = new Vector.<IExtensionParser>();
        }

        public function setData(value:XML):void
        {
            _raw = value;
        }

        public function registerExtensionParser(parser:IExtensionParser):void
        {
            _extensions.push(parser);
        }

        public function parse():VAST
        {
            return parseVast();
        }

        private function parseVast():VAST
        {
            _output = new VAST();

            // Can have 0 - INF <Ad>
            var ads:XMLList = _raw.Ad, node:XML;
            for each (node in ads)
            {
                _output.ads.push(parseAd(node));
            }

            if (_raw.@version != undefined)
            {
                _output.version = _raw.@version;
            }

            return _output;
        }

        private function parseAd(node:XML):Ad
        {
            var ad:Ad, innerNode:XML, child:XML;

            if (node.InLine.length() > 0)
            {
                // Test node: VAST.Ad.InLine
                innerNode = node.InLine[0];
                ad = parseInLine(innerNode);
            }
            else if (node.Wrapper.length() > 0)
            {
                // Test node: VAST.Ad.Wrapper
                innerNode = node.Wrapper[0];
                ad = parseWrapper(innerNode);
            }

            // Test node: VAST.Ad.@id
            ad.id = String(node.@id);

            // Test node: VAST.Ad.(InLine|Wrapper).AdSystem
            ad.adSystem = parseAdSystem(innerNode.AdSystem[0]);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative
            ad.creatives = new Vector.<Creative>();
            for each (child in innerNode.Creatives.Creative)
            {
                ad.creatives.push(parseCreative(child));
            }

            // Test node: VAST.Ad.(InLine|Wrapper).Error
            ad.error = innerNode.Error;

            // Test node: VAST.Ad.(InLine|Wrapper).Extensions.Extension
            ad.extensions = new Vector.<IExtension>();
            var ext:IExtension;
            for each (child in innerNode.Extensions.Extension)
            {
                ext = parseExtension(child);
                if (ext)
                    ad.extensions.push(ext);
            }


            // Test node: VAST.Ad.(InLine|Wrapper).Impression
            ad.impressions = new Vector.<URIIdentifier>;
            for each (child in innerNode.Impression)
            {
                ad.impressions.push(parseURIIdentifier(child));
            }

            return ad;
        }

        private function parseInLine(node:XML):InLine
        {
            var i:InLine = new InLine();

            // Test node: VAST.Ad.InLine.Description
            if (node.Description.length() > 0)
                i.description = String(node.Description[0]);

            // Test node: VAST.Ad.InLine.Survey
            if (node.Survey.length() > 0)
                i.survey = String(node.Survey[0]);

            // Test node: VAST.Ad.InLine.AdTitle
            i.title = String(node.AdTitle);

            return i;
        }

        private function parseWrapper(node:XML):Wrapper
        {
            var w:Wrapper = new Wrapper();

            // Test node: VAST.Ad.Wrapper.VASTAdTagURI
            w.vastAdTagURI = String(node.VASTAdTagURI);

            return w;
        }

        private function parseAdSystem(node:XML):AdSystem
        {
            var sys:AdSystem = new AdSystem();

            // Test node: VAST.Ad.(InLine|Wrapper).AdSystem.@version
            if (node.@version != undefined)
                sys.version = node.@version;

            // Test node: VAST.Ad.(InLine|Wrapper).AdSystem
            sys.value = node;

            return sys;
        }

        private function parseCreative(node:XML):Creative
        {
            var c:Creative = new Creative();

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.@id
            if (node.@id != undefined)
                c.id = String(node.@id);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.@sequence
            if (node.@sequence != undefined)
                c.sequence = int(node.@sequence);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.@AdID
            if (node.@AdID != undefined)
                c.adId = String(node.@AdID);

            // Test node: (one of the following)
            //   VAST.Ad.(InLine|Wrapper).Creatives.Creative.Linear
            //   VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds
            //   VAST.Ad.(InLine|Wrapper).Creatives.Creative.NonLinearAds
            if (node.Linear.length() > 0)
            {
                c.source = parseLinear(node.Linear[0]);
            }
            else if (node.CompanionAds.length() > 0)
            {
                c.source = parseCompanionAds(node.CompanionAds[0]);
            }
            else if (node.NonLinearAds.length() > 0)
            {
                c.source = parseNonLinearAds(node.NonLinearAds[0]);
            }
            else
            {
                // todo Should this throw an error?
            }

            return c;
        }

        private function parseCompanionAds(node:XML):CompanionAds
        {
            var c:CompanionAds = new CompanionAds(), child:XML;
            c.companions = new Vector.<Companion>();

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion
            for each (child in node.Companion)
            {
                c.companions.push(parseCompanion(child));
            }

            return c;
        }

        private function parseCompanionBase(node:XML, obj:CompanionBase):CompanionBase
        {
            if (!obj)
                obj = new CompanionBase();

            // Test node: (*).@id
            if (node.@id != undefined)
                obj.id = String(node.@id);

            // Test node: (*).@width
            obj.width = int(node.@width);

            // Test node: (*).@height
            obj.height = int(node.@height);

            // Test node: (*).@apiFramework
            if (node.@apiFramework != undefined)
                obj.apiFramework = String(node.@apiFramework);

            // Test node: (*).AdParameters
            if (node.AdParameters.length() > 0)
                obj.adParameters = String(node.AdParameters[0]);

            return obj;
        }

        private function parseResourceCompanionBase(node:XML, obj:ResourceCompanionBase = null):ResourceCompanionBase
        {
            if (!obj)
                obj = new ResourceCompanionBase();

            parseCompanionBase(node, obj);

            // Test node: (*).@expandedWidth
            if (node.@expandedWidth != undefined)
                obj.expandedWidth = int(node.@expandedWidth);

            // Test node: (*).@expandedHeight
            if (node.@expandedHeight != undefined)
                obj.expandedHeight = int(node.@expandedHeight);

            // Test node: (one of the following)
            //   (*).StaticResource
            //   (*).IFrameResource
            //   (*).HTMLResource
            if (node.StaticResource.length() > 0)
            {
                obj.resource = parseStaticResource(node.StaticResource[0]);
            }
            else if (node.IFrameResource.length() > 0)
            {
                obj.resource = parseIFrameResource(node.IFrameResource[0]);
            }
            else if (node.HTMLResource.length() > 0)
            {
                obj.resource = parseHTMLResource(node.HTMLResource[0]);
            }
            else
            {
                // todo Should it throw an error?
            }

            return obj;
        }

        private function parseCompanion(node:XML):Companion
        {
            var c:Companion = new Companion(), child:XML;

            parseResourceCompanionBase(node, c);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion.TrackingEvents.Tracking
            c.trackingEvents = new Vector.<TrackingEvent>();
            for each (child in node.TrackingEvents.Tracking)
            {
                c.trackingEvents.push(parseTrackingEvent(child));
            }

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion.CompanionClickThrough
            if (node.CompanionClickThrough.length() > 0)
                c.clickThrough = parseURIIdentifier(node.CompanionClickThrough[0]);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion.AltText
            if (node.AltText.length() > 0)
                c.altText = String(node.AltText);

            return c;
        }

        private function parseExtension(node:XML):IExtension
        {
            var extParser:IExtensionParser;
            var ext:IExtension;

            for (var i:uint = 0; i < _extensions.length && !extParser; i++)
            {
                if (IExtensionParser(_extensions[i]).isNodeEligible(node))
                {
                    extParser = _extensions[i];
                }
            }
            if (extParser)
            {
                extParser.setData(node);
                ext = extParser.parse();
            }
            return ext;
        }

        private function parseLinear(node:XML):Linear
        {
            var l:Linear = new Linear(), child:XML;

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.Linear.Duration
            l.duration = new Time(node.Duration);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.Linear.TrackingEvents.Tracking
            l.trackingEvents = new Vector.<TrackingEvent>();
            for each (child in node.TrackingEvents.Tracking)
            {
                l.trackingEvents.push(parseTrackingEvent(child));
            }

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.Linear.AdParameters
            if (node.AdParameters.length() > 0)
                l.adParameters = String(node.AdParameters[0]);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.Linear.VideoClicks
            if (node.VideoClicks.length() > 0)
                l.videoClicks = parseVideoClicks(node.VideoClicks[0]);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.Linear.MediaFiles.MediaFile
            l.mediaFiles = new Vector.<MediaFile>();
            for each (child in node.MediaFiles.MediaFile)
            {
                l.mediaFiles.push(parseMediaFile(child));
            }

            return l;
        }

        private function parseMediaFile(node:XML):MediaFile
        {
            var mf:MediaFile = new MediaFile();

            // Test node: (*).@id
            mf.id = String(node.@id);

            // Test node: (*).@delivery
            mf.delivery = String(node.@delivery);

            // Test node: (*).@type
            mf.type = String(node.@type);

            // Test node: (*).@bitrate
            if (node.@bitrate != undefined)
                mf.bitrate = int(node.@bitrate);

            // Test node: (*).@width
            mf.width = int(node.@width);

            // Test node: (*).@height
            mf.height = int(node.@height);

            // Test node: (*).@scalable
            if (node.@scaleable != undefined)
                mf.scalable = (String(node.@scalable).toLowerCase() == "true");

            // Test node: (*).@maintainAspectRatio
            if (node.@maintainAspectRatio != undefined)
                mf.maintainAspectRatio = (String(node.@maintainAspectRatio).toLowerCase() == "true");

            // Test node: (*).@apiFramework
            if (node.@apiFramework != undefined)
                mf.apiFramework = String(node.@apiFramework);

            mf.uri = node.valueOf();

            return mf;
        }

        private function parseNonLinearAds(node:XML):NonLinearAds
        {
            var ads:NonLinearAds = new NonLinearAds(), child:XML;

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.NonLinearAds.TrackingEvents.Tracking
            ads.trackingEvents = new Vector.<TrackingEvent>();
            for each (child in node.TrackingEvents.Tracking)
            {
                ads.trackingEvents.push(parseTrackingEvent(child));
            }

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.NonLinearAds.NonLinear
            ads.nonLinears = new Vector.<NonLinear>();
            for each (child in node.NonLinearAds.NonLinear)
            {
                ads.nonLinears.push(parseNonLinear(child));
            }

            return ads;
        }

        private function parseNonLinear(node:XML):NonLinear
        {
            var nl:NonLinear = new NonLinear();

            parseResourceCompanionBase(node, nl);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.NonLinearAds.NonLinear.@scalable
            nl.scalable = (String(node.@scalable).toLowerCase() == "true");

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.NonLinearAds.NonLinear.@maintainAspectRatio
            nl.maintainAspectRatio = (String(node.@maintainAspectRatio).toLowerCase() == "true");

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.NonLinearAds.NonLinear.@minSuggestedDuration
            nl.minSuggestedDuration = int(node.@minSuggestedDuration);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.NonLinearAds.NonLinear.NonLinearClickThrough
            nl.clickThrough = String(node.NonLinearClickThrough);

            return nl;
        }

        private function parseStaticResource(node:XML):StaticResource
        {
            var r:StaticResource = new StaticResource();

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion.StaticResource.@creativeType
            r.creativeType = String(node.@creativeType);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion.StaticResource
            r.uri = String(node);

            return r;
        }

        private function parseHTMLResource(node:XML):HTMLResource
        {
            var r:HTMLResource = new HTMLResource();

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion.HTMLResource
            r.content = String(node);

            return r;
        }

        private function parseIFrameResource(node:XML):IFrameResource
        {
            var r:IFrameResource = new IFrameResource();

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion.IFrameResource
            r.uri = String(node);

            return r;
        }

        private function parseTrackingEvent(node:XML):TrackingEvent
        {
            var e:TrackingEvent = new TrackingEvent();

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion.TrackingEvents.Tracking.@event
            e.event = String(node.@event);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.CompanionAds.Companion.TrackingEvents.Tracking
            e.uri = String(node);

            return e;
        }

        private function parseURIIdentifier(node:XML):URIIdentifier
        {
            var uri:URIIdentifier = new URIIdentifier();

            // Test node: (*).@id
            if (node.@id != undefined)
            {
                uri.id = String(node.@id);
            }

            // Test node: (*)
            uri.uri = String(node);


            return uri;
        }

        private function parseVideoClicks(node:XML):VideoClicks
        {
            var vc:VideoClicks = new VideoClicks(), child:XML;

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.Linear.VideoClicks.
            if (node.ClickThrough.length() > 0)
                vc.clickThrough = parseURIIdentifier(node.ClickThrough[0]);

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.Linear.VideoClicks.ClickTracking
            vc.clickTracking = new Vector.<URIIdentifier>();
            for each (child in node.ClickTracking)
            {
                vc.clickTracking.push(parseURIIdentifier(child));
            }

            // Test node: VAST.Ad.(InLine|Wrapper).Creatives.Creative.Linear.VideoClicks.CustomClicks
            if(node.CustomClick.length() > 0)
            {
                vc.customClicks = new Vector.<URIIdentifier>();
                for each (child in node.CustomClick)
                {
                    vc.customClicks.push(parseURIIdentifier(child));
                }
            }

            return vc;
        }
    }
}
