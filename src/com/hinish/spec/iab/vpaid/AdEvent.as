package com.hinish.spec.iab.vpaid
{
	import flash.events.Event;

	/**
	 * VPAID Ads can fire these events
	 *
	 * @langversion 3.0
	 * @playerversion Flash 10
	 */
	public class AdEvent extends Event
	{

		/**
		 * The AdClickThru event is sent by the ad unit when a
		 * clickthrough occurs. Three parameters can be included to
		 * give the video player the option for handling the event.
		 *
		 * <p>Three parameters are available for the event:
		 * <ul>
		 * <li><b>String url:</b>
		 * enables the ad unit to specify the clickthrough url</li>
		 * <li><b>String ID:</b>
		 * used for tracking purposes</li>
		 * <li><b>Boolean playerHandles:</b>
		 * indicates whether the video player or the ad unit handles
		 * the event. Set to true, the video player opens the new
		 * browser window to the URL provided. Set to false, the ad
		 * unit handles the event.</li>
		 * </ul>
		 * </p>
		 *
		 * <p>The AdClickThru event is included under the same name in
		 * Digital Video In-Stream Ad Metrics Definitions and must be
		 * implemented to be IAB compliant.</p>
		 */
		public static const AD_CLICK_THRU:String = "AdClickThru";

		/**
		 * The duration for some video ads can change in response to
		 * user interaction or other factors. When the ad duration
		 * changes, the ad unit updates the values of the adDuration
		 * and adRemainingTime properties and dispatches the
		 * AdDurationChange event, notifying the video player that
		 * duration has changed. The video player can then get
		 * adDuration and adRemainingTime to update its UI, such as
		 * the duration indicator, if applicable.
		 *
		 * <p>Upon initial duration change, the ad unit should update
		 * the adRemainingTime and adDuration properties and send the
		 * adDurationChange event at least once per second but no
		 * more than four times per second (to maintain optimum
		 * performance) so that the video player can keep its UI in
		 * synch with actual duration and time remaining.</p>
		 */
		public static const AD_DURATION_CHANGE:String = "AdDurationChange";

		/**
		 * The AdError event is sent when the ad unit has experienced a
		 * fatal error. Before the ad unit sends AdError it must
		 * clean up all resources and cancel any pending ad playback.
		 * The video player must remove any ad UI, and recover to its
		 * regular content playback state. The String message
		 * parameter can be used to provide more specific information
		 * to the video player.
		 */
		public static const AD_ERROR:String = "AdError";

		/**
		 * When the expanded state of the ad changes, the ad unit must
		 * update the adExpanded property and dispatch the
		 * AdExpandedChange event to notify the video player of the
		 * change. The video player responds by using the get
		 * adExpanded property to update its UI accordingly. An
		 * AdExpandedChange event may be triggered by the expandAd()
		 * method.
		 *
		 * <p>The AdExpandedChange event is only for notifying the
		 * player of a change in ad unit expansion, such as the
		 * expand or collapse of an interactive panel. To dispatch a
		 * change in standard display size, please use
		 * AdSizeChange.</p>
		 */
		public static const AD_EXPANDED_CHANGE:String = "AdExpandedChange";

		/**
		 * The AdImpression event is used to notify the video player
		 * that the user-visible phase of the ad has begun. The
		 * AdImpression event may be sent using different criteria
		 * depending on the type of ad format the ad unit is
		 * implementing.
		 *
		 * <p>For a linear mid-roll ad, the impression should coincide
		 * with the AdStart event. However, for a non-linear overlay
		 * ad, the impression will occur when the invitation banner
		 * is displayed, which is normally before the ad video is
		 * shown. This event matches that of the same name in Digital
		 * Video In-Stream Ad Metrics Definitions, and must be
		 * implemented to be IAB compliant.</p>
		 */
		public static const AD_IMPRESSION:String = "AdImpression";

		/**
		 * This event was introduced to capture all user interactions
		 * under one metric aside from any clicks that result in
		 * redirecting the user to specified site. AdInteraction
		 * events might include hover-overs, clicks that don’t result
		 * in a ClickThru, click-and-drag interactions, and event the
		 * events described in section 3.3.16. While AdInteraction
		 * does not replace any other metrics, it can be used in
		 * addition to other metrics. Keep in mind that recording
		 * both an AdUserMinimize and an AdInteraction for the same
		 * event is just one event with two names. Other custom
		 * interactions, such as “Dealer Locator” for example don’t
		 * exist in any VPAID events, so it could be recorded under
		 * the AdInteraction event.
		 *
		 * <p>The AdInteraction event is sent by the ad unit to indicate
		 * any interaction with the ad EXCEPT for ad clickthroughs.
		 * An ad clickthrough is indicated using the AdClickThru
		 * event described in section 3.3.12.</p>
		 *
		 * <p>One parameter is available for the event:
		 * <ul>
		 * <li><b>String ID:</b>
		 * used for tracking purposes
		 * </li>
		 * </ul>
		 * </p>
		 */
		public static const AD_INTERACTION:String = "AdInteraction";

		/**
		 * The AdLinearChange event is sent by the ad unit to notify the
		 * video player that the ad unit has changed playback mode.
		 * To find out the current state of the ad unit’s linearity,
		 * the video player must use the get adLinear property and
		 * update its UI accordingly. See the adLinear property for
		 * more information.
		 */
		public static const AD_LINEAR_CHANGE:String = "AdLinearChange";

		/**
		 * When the video player calls the initAd() method, the ad unit
		 * can begin loading assets. Once loaded and ready for
		 * display, the ad dispatches the AdLoaded event. No UI
		 * elements should be visible before AdLoaded is sent, but
		 * sending AdLoaded indicates that the ad unit has verified
		 * that all files are ready to execute. Also, if initAd() was
		 * called, and the ad unit is unable to display and/or send
		 * AdLoaded, then AdError should be dispatched.
		 */
		public static const AD_LOADED:String = "AdLoaded";

		/**
		 * The AdLog event is optional and can be used to relay
		 * debugging information using the parameter, String message.
		 * AdLog enables video player engineers to debug ads that
		 * provide an ad log.
		 */
		public static const AD_LOG:String = "AdLog";

		/**
		 * The AdPaused event is sent in response to the pauseAd()
		 * method call to confirm that the ad has paused. Sending
		 * AdPaused indicates that the ad has stopped all audio and any
		 * animation in progress. Other settings, such as adjusting
		 * the ad’s visibility or removing ad elements from the UI,
		 * may be implemented until resumeAd() is called. See
		 * pauseAd() method description for more detail.
		 */
		public static const AD_PAUSED:String = "AdPaused";

		/**
		 * The AdPlaying event is sent in response to the resumeAd()
		 * method call to confirm that the ad is playing. Sending
		 * AdPlaying indicates that the ad unit has resumed playback
		 * from the point at which it was paused. See
		 * pauseAd() method description for more detail.
		 */
		public static const AD_PLAYING:String = "AdPlaying";

		/**
		 * The AdRemainingTimeChange event is still supported in order
		 * to accommodate ads and video players using VPAID 1.0;
		 * however, in 2.0 versions, please use AdDurationChange
		 *
		 * <p>The AdRemainingTimeChange event is sent by the ad unit to
		 * notify the video player that the ad’s remaining playback
		 * time has changed. The video player may get the
		 * adRemainingTime property and update its UI accordingly.</p>
		 *
		 * <p>Upon initial duration change, the ad unit should update
		 * the adRemainingTime property and send the
		 * AdRemainingTimeChange event at least once per second but
		 * no more than four times per second (to maintain optimum
		 * performance) so that the video player can keep its UI in
		 * synch with actual time remaining.</p>
		 */
		public static const AD_REMAINING_TIME_CHANGE:String = "AdRemainingTimeChange";

		/**
		 * The AdSizeChange event is sent in response to the resizeAd()
		 * method call. When the video player resizes, it notifies
		 * the ad unit so that the ad unit can also scale to maintain
		 * the same ad space ratio that it had relevant to the
		 * previous video player size.
		 *
		 * <p>When the video player calls resizeAd(), the ad unit must
		 * scale its width and height value to equal or less than the
		 * width and height value supplied in the video player call.
		 * If the video player doesn’t provide width and height
		 * values (as in fullscreen mode), then the ad unit can
		 * resize to any dimension.</p>
		 *
		 * <p>Once the ad unit has resized itself, it writes width and
		 * height values to the adWidth and adHeight properties,
		 * respectively. The AdSizeChange event is then sent to
		 * confirm that the ad unit has resized itself.</p>
		 *
		 * <p>See resizeAd(), adWidth and adHeight for more
		 * information.</p>
		 */
		public static const AD_SIZE_CHANGE:String = "AdSizeChange";

		/**
		 * When an ad unit only allows its creative to be skipped within
		 * a specific time frame, it can use the
		 * AdSkippableStateChange event to prompt the video player to
		 * check the value of the adSkippableState property, which
		 * keeps the video player updated on when the ad can be
		 * skipped and when it cannot be skipped.
		 */
		public static const AD_SKIPPABLE_STATE_CHANGED:String = "AdSkippableStateChange";

		/**
		 * The AdSkipped event is sent by the ad unit to notify the
		 * video player that the ad has been skipped, stopped
		 * displaying and all ad resources have been cleaned up.
		 *
		 * <p>The AdSkipped event can be sent in response to the
		 * skipAd() method call or as a result of a skip control
		 * activated within the ad unit (rather than in the video
		 * player).</p>
		 *
		 * <p>In response to a skipAd() method call, the
		 * ad unit must stop ad play, clean up all resources, and
		 * send the AdSkipped event. If a skip control is activated
		 * within the ad unit, the ad unit must stop ad play, clean
		 * up all resource, and send the AdSkipped event followed by
		 * the AdStopped event. Sending the AdStopped event for skip
		 * controls activated in the ad unit ensures that video
		 * players using earlier versions of VPAID receive notice
		 * that the ad has stopped playing.</p>
		 */
		public static const AD_SKIPPED:String = "AdSkipped";

		/**
		 * The AdStarted event is sent by the ad unit to notify the
		 * video player that the ad is displaying and is a response
		 * to the startAd() method.
		 */
		public static const AD_STARTED:String = "AdStarted";

		/**
		 * The AdStopped event is sent by the ad unit to notify the
		 * video player that the ad has stopped displaying and all ad
		 * resources have been cleaned up. This event is only for
		 * responding the stopAd() method call made by the video
		 * player. It should never be used to initiate the ad unit’s
		 * end or used to inform the video player that it can now
		 * call stopAd().
		 */
		public static const AD_STOPPED:String = "AdStopped";

		/**
		 * The AdUserAcceptInvitation event is sent by the ad unit when
		 * it meets requirements of the same names as set in Digital
		 * Video In-Stream Ad Metrics Definitions. This event
		 * indicates user-initiated action that the ad unit
		 * dispatches to the video player. The video player may
		 * choose to report this event externally, but takes no other
		 * action.
		 */
		public static const AD_USER_ACCEPT_INVITATION:String = "AdUserAcceptInvitation";

		/**
		 * The AdUserClose event is sent by the ad unit when
		 * it meets requirements of the same names as set in Digital
		 * Video In-Stream Ad Metrics Definitions. This event
		 * indicates user-initiated action that the ad unit
		 * dispatches to the video player. The video player may
		 * choose to report this event externally, but takes no other
		 * action.
		 */
		public static const AD_USER_CLOSE:String = "AdUserClose";

		/**
		 * The AdUserMinimize event is sent by the ad unit when
		 * it meets requirements of the same names as set in Digital
		 * Video In-Stream Ad Metrics Definitions. This event
		 * indicates user-initiated action that the ad unit
		 * dispatches to the video player. The video player may
		 * choose to report this event externally, but takes no other
		 * action.
		 */
		public static const AD_USER_MINIMIZE:String = "AdUserMinimize";

		/**
		 * This event is sent by the ad unit to notify the video
		 * player of the ad unit’s video progress and is used in
		 * VAST under the same event name. A Definition can be found
		 * under “Percent complete” events in Digital Video In-Stream
		 * Ad Metrics Definitions. This event must be implemented
		 * for ads to be IAB compliant, but only apply to the video
		 * portion of the ad experience, if any.
		 */
		public static const AD_VIDEO_COMPLETE:String = "AdVideoComplete";

		/**
		 * This event is sent by the ad unit to notify the video
		 * player of the ad unit’s video progress and is used in
		 * VAST under the same event name. A Definition can be found
		 * under “Percent complete” events in Digital Video In-Stream
		 * Ad Metrics Definitions. This event must be implemented
		 * for ads to be IAB compliant, but only apply to the video
		 * portion of the ad experience, if any.
		 */
		public static const AD_VIDEO_FIRST_QUARTILE:String = "AdVideoFirstQuartile";

		/**
		 * This event is sent by the ad unit to notify the video
		 * player of the ad unit’s video progress and is used in
		 * VAST under the same event name. A Definition can be found
		 * under “Percent complete” events in Digital Video In-Stream
		 * Ad Metrics Definitions. This event must be implemented
		 * for ads to be IAB compliant, but only apply to the video
		 * portion of the ad experience, if any.
		 */
		public static const AD_VIDEO_MIDPOINT:String = "AdVideoMidpoint";

		/**
		 * This event is sent by the ad unit to notify the video
		 * player of the ad unit’s video progress and is used in
		 * VAST under the same event name. A Definition can be found
		 * under “Percent complete” events in Digital Video In-Stream
		 * Ad Metrics Definitions. This event must be implemented
		 * for ads to be IAB compliant, but only apply to the video
		 * portion of the ad experience, if any.
		 */
		public static const AD_VIDEO_START:String = "AdVideoStart";

		/**
		 * This event is sent by the ad unit to notify the video
		 * player of the ad unit’s video progress and is used in
		 * VAST under the same event name. A Definition can be found
		 * under “Percent complete” events in Digital Video In-Stream
		 * Ad Metrics Definitions. This event must be implemented
		 * for ads to be IAB compliant, but only apply to the video
		 * portion of the ad experience, if any.
		 */
		public static const AD_VIDEO_THIRD_QUARTILE:String = "AdVideoThirdQuartile";

		/**
		 * If the ad unit supports volume, any volume changes are
		 * updated in the adVolume property and the AdVolumeChange
		 * event is dispatched to notify the video player of the
		 * change. The video player may then use the get adVolume
		 * property and update its UI accordingly.
		 */
		public static const AD_VOLUME_CHANGE:String = "AdVolumeChange";

		public function AdEvent(type:String, data:Object = null)
		{
			_data = data;
			super(type);
		}

		private var _data:Object;

		override public function clone():Event
		{
			return new AdEvent(type, data);
		}

		/**
		 * This object will hold the data for the event types that have
		 * a payload. The types that required data to be passed
		 * should have the requirements listed above.
		 */
		public function get data():Object
		{
			return _data;
		}
	}
}
