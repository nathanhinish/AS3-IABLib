package com.hinish.spec.iab.vpaid
{

	[Event(name="AdClickThru", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdError", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdExpandedChange", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdImpression", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdInteraction", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdLinearChange", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdLoaded", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdLog", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdPaused", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdPlaying", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdRemainingTimeChange", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdDurationChanged", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdStarted", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdStopped", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdSkipped", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdSkippableStateChange", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdSizeChange", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdUserAcceptInvitation", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdUserClose", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdUserMinimize", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdVideoComplete", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdVideoFirstQuartile", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdVideoMidpoint", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdVideoStart", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdVideoThirdQuartile", type="com.hinish.spec.iab.vpaid.AdEvent")]
	[Event(name="AdVolumeChange", type="com.hinish.spec.iab.vpaid.AdEvent")]
	/**
	 * Basis for all SWF-based ad components.
	 *
	 * @langversion 3.0
	 * @playerversion Flash 10
	 */
	public interface IVPAIDAd
	{

		/**
		 * Companion banners are ads that display outside
		 * the video player area to reinforce the
		 * messaging provided in the video ad unit. In
		 * some cases, a VPAID ad unit may request ads
		 * from other ad servers after initAd() has been
		 * called, and makes a decision about which ad it
		 * will display, which may or may not include ad
		 * companions. For example, a client-side yield
		 * management SDK may wrap itself in a VPAID ad
		 * when a native SDK integration might be cumbersome.
		 * In this scenario, the ad server that served the
		 * initial VAST response may not know which ad will
		 * be displayed, and therefore the VAST response
		 * itself does not include ad companions.
		 *
		 * <p>VPAID 2.0 enables an ad server to serve a
		 * VAST response which has no companions, but which
		 * does have a VPAID ad unit that pulls in ad
		 * companions dynamically based on the adserving
		 * situation. The video player can then check the
		 * VPAID ad unit for ad companions when the VAST
		 * response has none.</p>
		 *
		 * <p>The video player is not required to poll this
		 * property, and because ad companion information
		 * from the VAST response takes precedence over
		 * VPAID ad companions, the video player should only
		 * access this property when the VAST response is
		 * absent of any ad companions.</p>
		 *
		 * <p>The value of this property is a String that
		 * provides ad companion details in VAST 3.0 format
		 * for the &lt;CompanionAds&gt; element, and should
		 * contain all the media files and details for
		 * displaying the ad companions (i.e. the format
		 * should be of an InLine response and not in
		 * Wrapper format). Also, the value should only
		 * include details within the &lt;CompanionAds&gt;
		 * element and not an entire VAST response. If any XML
		 * elements are included outside of the
		 * &lt;CompanionAds&gt; element, they must be ignored,
		 * including any &lt;Impression&gt; elements that might
		 * have been included. However, VAST companion ad
		 * &lt;TrackingEvents&gt; elements for
		 * &lt;Tracking event="creativeView"&gt; must be respected.</p>
		 *
		 * <p>If the video player calls for adCompanions(),
		 * it must wait until after receiving the VPAID
		 * AdLoaded event, and any companions provided must
		 * not display until after the VPAID AdImpression
		 * event is received. Delaying companion display
		 * until after the AdImpression event prevents display
		 * of any companion banners in the case where the
		 * video ad fails to register an impression.If this
		 * property is used but no Companions are available
		 * the property should return an empty string.</p>
		 */
		function get adCompanions():String;

		/**
		 * An ad unit may provide the adDuration property
		 * to indicate the total duration of the ad,
		 * relative to the current state of the ad unit.
		 * When user interaction changes the total
		 * duration of the ad, the ad unit should update
		 * this property and send the adDurationChange
		 * event. The initial value for adDuration is the
		 * expected duration before any user interaction.
		 *
		 * <p>The video player may check the adDuration
		 * property at any time, but should always check
		 * it when receiving an adDurationChange event.</p>
		 *
		 * <p>If duration is not implemented, the ad unit
		 * returns a -1 value. If the duration is unknown,
		 * the ad unit returns a -2. Unknown duration is
		 * typical when the user has engaged the ad.</p>
		 */
		function get adDuration():Number;

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
		function get adExpanded():Boolean;

		/**
		 * The adHeight property provides the ad’s height in pixels and
		 * is updated along with the adWidth property anytime the
		 * AdSizeChange event is sent to the video player, usually after
		 * the video player calls resizeAd(). The ad unit may change its
		 * size to width and height values equal to or less than the
		 * values provided by the video player in the Width and Height
		 * parameters of the resizeAd() method. If the ViewMode parameter
		 * in the resizeAd() call is set to “fullscreen,” then the ad unit
		 * can ignore the Width and Height values of the video player and
		 * resize to any dimension. The video player may use adWidth and
		 * adHeight values to verify that the ad is appropriately sized.
		 *
		 * <p>Note: The value for the adHeight property may be different
		 * from the height value that the video player supplies when it
		 * calls resizeAd(). The resizeAd() method provides the video
		 * player’s maximum allowed value for height, but the adHeight
		 * property provides the ad’s actual height, which must be equal
		 * to or less than the video player’s supplied height.</p>
		 */
		function get adHeight():Number;

		/**
		 * The video player can use the adIcons property to avoid
		 * displaying duplicate icons over any icons that might
		 * be provided in the ad unit. Until the industry
		 * provides more guidance on how to pass metadata using
		 * common ad-serving protocols, this property is limited
		 * to a Boolean response. The default value is False. If
		 * one or more ad icons are present within the ad, the
		 * value returned is True. When set to True, the video
		 * player should not display any ad icons of its own.
		 */
		function get adIcons():Boolean;

		/**
		 * The adLinear Boolean indicates the ad’s
		 * current linear vs. non-linear mode of
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
		function get adLinear():Boolean;

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
		function get adRemainingTime():Number;

		/**
		 * Common to skippable ads is a timeframe for when
		 * they’re allowed to be skipped. For example, some
		 * ads may only be skipped a few seconds after the
		 * ad has started or may not allow the ad to be
		 * skipped as it nears the end of playback.
		 *
		 * <p>The adSkippableState enables advertisers and
		 * publishers to align their metrics based on what
		 * can and cannot be skipped.</p>
		 *
		 * <p>The default value for this property is false.
		 * When the ad reaches a point where it can be
		 * skipped, the ad unit updates this property to
		 * true and sends the AdSkippableStateChange event.
		 * The video player can check this property at any
		 * time, but should always check it when the
		 * AdSkippableStateChange event is received.</p>
		 */
		function get adSkippableState():Boolean;

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
		function get adVolume():Number;

		/**
		 * @private
		 */
		function set adVolume(value:Number):void;

		/**
		 * The adWidth property provides the ad’s width in pixels
		 * and is updated along with the adHeight property anytime
		 * the AdSizeChange event is sent to the video player, usually
		 * after the video player calls resizeAd(). The ad unit may
		 * change its size to width and height values equal to or less
		 * than the values provided by the video player in the Width and
		 * Height parameters of the resizeAd() method. If the ViewMode
		 * parameter in the resizeAd() call is set to “fullscreen,”
		 * then the ad unit can ignore the Width and Height values of
		 * the video player and resize to any dimension. The video player
		 * may use adWidthand adHeight values to verify that the ad is
		 * appropriately sized.
		 *
		 * <p>Note: adWidth value may be different than resizeAd() values.
		 * The value for the adWidth property may be different from the
		 * width value that the video player supplies when it calls
		 * resizeAd(). The resizeAd() method provides the video player’s
		 * maximum allowed value for width, but the adWidth property
		 * provides the ad’s actual width, which must be equal to or
		 * less than the video player’s supplied width.</p>
		 */
		function get adWidth():Number;

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
		function collapseAd():void;

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
		function expandAd():void;
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
		function handshakeVersion(playerVPAIDVersion:String):String;

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
		function initAd(width:Number, height:Number, viewMode:String, desiredBitrate:Number, creativeData:String="", environmentVars:String=""):void;

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
		function pauseAd():void;

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
		function resizeAd(width:Number, height:Number, viewMode:String):void;

		/**
		 * resumeAd is called to continue ad playback
		 * following a call to pauseAd. The ad
		 * sends an AdPlaying event when the
		 * ad has resumed playing.
		 */
		function resumeAd():void;

		/**
		 * This method supports skip controls that the video
		 * player may implement. This should kick-off the ad
		 * teardown phase.
		 */
		function skipAd():void;

		/**
		 * startAd is called by the player and is called
		 * when the player wants the ad to start displaying.
		 * The ad responds by sending an AdStarted event
		 * notifying the player the ad is now playing. An
		 * ad may not be restarted by the player by
		 * calling startAd + stopAd multiple time
		 */
		function startAd():void;

		/**
		 * stopAd is called by the player when it will
		 * no longer display the ad. stopAd is also
		 * called if the player needs to cancel an ad.
		 * However, the ad may take some time to close
		 * and clean up resources before sending an
		 * AdStopped event to the player.
		 */
		function stopAd():void;
	}
}
