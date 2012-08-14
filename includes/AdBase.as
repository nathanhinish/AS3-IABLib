		/**
		 * @private
		 */
		private var __viewMode:String = "normal"; // AdViewMode.NORMAL
		
		/**
		 * Holds the last reported value of view mode received from the player.
		 */
		public function get viewMode():String
		{
			return __viewMode;
		}
		
		/**
		 * @private
		 */
		protected function set _viewMode(value:String):void
		{
			if(["normal", "thumbnail", "fullscreen"].indexOf(value) == -1)
				throw new Error('Invalid view mode. Valid values are "normal", "thumbnail", or "fullscreen". See com.hinish.spec.iab.vpaid.AdViewMode.');
			__viewMode = value;
		}
		
		/**
		 * @private
		 */
		private var __creativeData:String;
		
		/**
		 * Holds pertinent data passed in from the player.
		 */
		public function get creativeData():String
		{
			return __creativeData;
		}
		
		/**
		 * @private
		 */
		protected function set _creativeData(value:String):void
		{
			__creativeData = value;
		}
		
		/**
		 * @private
		 */
		private var __environmentVars:String;
		
		/**
		 * Holds pertinent data passed in from the player.
		 */
		public function get environmentVars():String
		{
			return __environmentVars;
		}
		
		/**
		 * @private
		 */
		protected function set _environmentVars(value:String):void
		{
			__environmentVars = value;
		}
		
		/**
		 * @private
		 */
		private var __desiredBitrate:Number;
		
		/**
		 * The player's desired bitrate for this ad.
		 */
		public function get desiredBitrate():Number
		{
			return __desiredBitrate;
		}
		
		/**
		 * @private
		 */
		protected function set _desiredBitrate(value:Number):void
		{
			__desiredBitrate = value;
		}
		
		/**
		 * @private
		 */
		private var _adExpanded:Boolean = false;
		
		/**
		 * @private
		 */
		private var _adVolume:Number = -1;
		
		/**
		 * The player calls handshakeVersion immediately 
		 * after loading the ad to indicate to the ad 
		 * that VPAID will be used. The player passes in 
		 * its latest VPAID version string. The ad 
		 * returns a version string minimally set to 
		 * “1.0”, and of the form “major.minor.patch”. 
		 * The player must verify that it supports the 
		 * particular version of VPAID or cancel the ad. 
		 * All VPAID versions are backwards compatible 
		 * within the same major version number (but not 
		 * forward compatible). So if the player supports 
		 * “2.1.05” and the ad indicates “2.0.23”, the 
		 * player can run the ad, but not in the reverse 
		 * situation. Static interface definition 
		 * implementations may require an external agreement 
		 * for version matching. Dynamic implementations 
		 * may use the handshakeVersion method call to 
		 * determine if an ad supports VPAID. For dynamic 
		 * languages, the ad or the player can adapt to 
		 * match the other’s version if necessary. A good 
		 * practice is to always call handshakeVersion even 
		 * if the version has been coordinated externally, 
		 * in case the ad supports multiple versions and 
		 * uses handshakeVersion to decide which to act on 
		 * at runtime.
		 */
		public function handshakeVersion(playerVPAIDVersion:String):String
		{
			return '1.0';
		}
		
		/**
		 * After the ad is loaded and the player calls 
		 * handshakeVersion, the player calls initAd to 
		 * initialize the ad experience. The player may 
		 * pre-load the ad and delay calling initAd until 
		 * nearing the ad playback time, however, the ad 
		 * does not load its assets until initAd is called. 
		 * The ad sends the AdLoaded event to notify the 
		 * player that its assets are loaded and it is ready 
		 * for display. The player passes a width and height 
		 * to indicate the display area for the ad. viewMode 
		 * can be one of “normal”, “thumbnail”, or 
		 * “fullscreen” to indicate the players current 
		 * viewing mode, as defined by the player and ad 
		 * publisher and may not be applicable to all ads. 
		 * The player also passes a desired Bitrate in kbps 
		 * (kilobits per second) that the ad may use when 
		 * selecting the bitrate for any streaming content. 
		 * creativeData is an optional parameter that can be 
		 * used for passing in additional ad initialization 
		 * data; for example, the extensions node of a VAST 
		 * [4] response. enviromentVars is an optional 
		 * parameter that can be used for passing 
		 * implementation-specific runtime variables, 
		 * URL-encoded name=value pairs separated by ‘&amp;’. 
		 * (see resizeAd below for more information on sizing)
		 */
		public function initAd(width:Number, height:Number, viewMode:String, desiredBitrate:Number, creativeData:String = "", environmentVars:String = ""):void
		{
			this._viewMode = viewMode;
			this._desiredBitrate = desiredBitrate;
			this._creativeData = creativeData;
			this._environmentVars = environmentVars;
		}
		
		/**
		 * Following a resize of the ad UI container, the 
		 * player calls resizeAd to allow the ad to scale 
		 * or reposition itself within its display area. 
		 * The width and height always matches the maximum 
		 * display area allotted for the ad, and resizeAd 
		 * is only called when the player changes its 
		 * video content container sizing. For ads that 
		 * expand or go into linear mode, the entire 
		 * video content display area is given in the 
		 * width height as these ads may take up that 
		 * entire area when in linear or expanded modes. 
		 * Also, the player should avoid using the built-in 
		 * scaling and sizing properties or methods for 
		 * the particular implementation technology. 
		 * viewMode can be one of “normal”, “thumbnail”, 
		 * or “fullscreen” to indicate the players current 
		 * viewing mode, as defined by the player and ad 
		 * publisher and may not be applicable to all ads. 
		 * The player should never set the width, height, 
		 * scaleX, or scaleY properties of the ad, but 
		 * should mask the ad to the provided width and 
		 * height. However, the player may set the x and 
		 * y properties of the ad to position. As well, 
		 * the ad may choose to mask itself to the width 
		 * and height to ensure UI placed off screen is 
		 * never visible.
		 */
		public function resizeAd(width:Number, height:Number, viewMode:String):void
		{
			this._viewMode = viewMode;
		}
		
		/**
		 * startAd is called by the player and is called 
		 * when the player wants the ad to start displaying. 
		 * The ad responds by sending an AdStarted event 
		 * notifying the player the ad is now playing. An 
		 * ad may not be restarted by the player by 
		 * calling startAd + stopAd multiple time
		 */
		public function startAd():void
		{
			dispatchEvent(new AdEvent(AdEvent.AD_STARTED));
		}
		
		/**
		 * stopAd is called by the player when it will 
		 * no longer display the ad. stopAd is also 
		 * called if the player needs to cancel an ad. 
		 * However, the ad may take some time to close 
		 * and clean up resources before sending an 
		 * AdStopped event to the player.
		 */
		public function stopAd():void
		{
			dispatchEvent(new AdEvent(AdEvent.AD_STOPPED));
		}
		
		/**
		 * pauseAd is called to pause ad playback. The 
		 * ad sends an AdPaused event when the ad 
		 * has been paused. The ad must turn off all 
		 * audio and suspend any animation or video.
		 * The player may use pause in order to then 
		 * hide the ad by settings its display 
		 * container’s visibility. It the discretion of 
		 * the ad whether to remove UI elements or 
		 * just stop their animation and perhaps 
		 * dim their brightness.
		 */
		public function pauseAd():void
		{
			dispatchEvent(new AdEvent(AdEvent.AD_PAUSED));
		}
		
		/**
		 * resumeAd is called to continue ad playback 
		 * following a call to pauseAd. The ad 
		 * sends an AdPlaying event when the 
		 * ad has resumed playing.
		 */
		public function resumeAd():void
		{
			dispatchEvent(new AdEvent(AdEvent.AD_PLAYING));
		}
		
		/**
		 * expandAd is called by the player to request 
		 * that the ad switch to its larger UI size. 
		 * For example, the player may implement an 
		 * open button that calls expandAd when 
		 * clicked. (see adExpanded property below) 
		 * The player may use the value of the 
		 * adExpanded property as well as an 
		 * AdExpandedChange event to determine when 
		 * to display an open or a close button, if 
		 * required. expandAd may not be applicable 
		 * to all ads.
		 */
		public function expandAd():void
		{
			_adExpanded = true;
			dispatchEvent(new AdEvent(AdEvent.AD_EXPANDED_CHANGE));
		}
		
		/**
		 * collapseAd is called by the player to 
		 * request that the ad return to its 
		 * smallest UI size. For example, the 
		 * player may implement a close button 
		 * that calls collapseAd when clicked and 
		 * is displayed only when the ad is in an 
		 * expanded state (see adExpanded property 
		 * below). collapseAd may not be applicable 
		 * to all ads.
		 */
		public function collapseAd():void
		{
			_adExpanded = false;
			dispatchEvent(new AdEvent(AdEvent.AD_EXPANDED_CHANGE));
		}
		
		/**
		 * This method supports skip controls that the video
		 * player may implement. This should kick-off the ad
		 * teardown phase.
		 */
		public function skipAd():void
		{
			
		}
		
		/**
		 * The adLinear Boolean indicates the ad’s 
		 * current linear versus non-linear mode of 
		 * operation. adLinear when true indicates 
		 * the ad is in a linear playback mode, 
		 * false nonlinear. The player checks adLinear 
		 * initially as well as each time an 
		 * AdLinearChange event is received and 
		 * updates its state according to the 
		 * particulars of the ad placement. While 
		 * the ad is in linear mode, the player has 
		 * the content video paused. If adLinear is 
		 * set to true initially and the ad is 
		 * designated as a pre-roll (defined 
		 * externally), the player may choose to 
		 * delay loading the content video until 
		 * near the end of the ad playback.
		 */
		public function get adLinear():Boolean
		{
			return false;
		}
		
		/**
		 * TODO Add documentation
		 */
		public function get adWidth():Number
		{
			return 0;
		}
		
		public function get adHeight():Number
		{
			return 0;
		}
		
		/**
		 * The adExpanded Boolean value indicates 
		 * whether the ad is in a state where it 
		 * occupies more UI area than its smallest 
		 * area. If the ad has multiple expanded 
		 * states, all expanded states show 
		 * adExpanded being true. An AdExpandedChange 
		 * event indicates the value has changed, but 
		 * the player may check the property at any 
		 * time. If ad is statically sized adExpanded 
		 * is set to false.
		 */
		public function get adExpanded():Boolean
		{
			return _adExpanded;
		}
		
		/**
		 * TODO Add documentation
		 */
		public function get adSkippableState():Boolean
		{
			return false;
		}
		
		/**
		 * The player may use the adRemainingTime 
		 * property to update player UI during ad 
		 * playback. The adRemainingTime property is 
		 * in seconds and is relative to the time the 
		 * property is accessed. The player may 
		 * periodically poll the adRemainingTime 
		 * property, but should always check it when 
		 * receiving an AdRemainingTimeChange event. 
		 * If not implemented, returns -1. If unknown, 
		 * returns -2. The player may use the 
		 * adRemainingTime property value to display 
		 * a countdown timer or other ad duration 
		 * indicator.
		 */
		public function get adRemainingTime():Number
		{
			return 0;
		}
		
		/**
		 * TODO Add documentation
		 */
		public function get adDuration():Number
		{
			return 0;
		}
		
		/**
		 * The player uses the adVolume property to 
		 * attempt to set or get the ad volume. The 
		 * adVolume value is between 0 and 1 and is 
		 * linear. The player is responsible for 
		 * maintaining mute state and setting the 
		 * ad volume accordingly. If not implemented 
		 * the get always returns -1. If set is not 
		 * implemented, does nothing.
		 */
		public function get adVolume():Number
		{
			return _adVolume;
		}
		
		/**
		 * @private
		 */
		public function set adVolume(value:Number):void
		{
			if(value > 1 || (value < 0 && value != -1))
				throw new Error("Invalid value. Volume value must be either -1 or 0 <= x <= 1");
			_adVolume = value;
			dispatchEvent(new AdEvent(AdEvent.AD_VOLUME_CHANGE));
		}
		
		/**
		 * TODO Add documentation
		 */
		public function get adCompanions():String
		{
			return "";
		}
		
		/**
		 * TODO Add documentation
		 */
		public function get adIcons():Boolean
		{
			return false;
		}