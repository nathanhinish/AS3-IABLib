package com.hinish.spec.iab.vpaid
{
    import com.hinish.spec.iab.vpaid.AdEvent;
    
    import flash.display.Sprite;

    // Import the [Event] metadata tags
    // to make upkeep easier.
    include './../../../../../../includes/AdBaseEventMeta.as';
    /**
     * The base class for ads that
     * extend the Sprite class.
     *
     * @langversion 3.0
     * @playerversion Flash 10
     */
    public class AdSpriteBase extends Sprite implements IVPAIDAd
    {
        public function AdSpriteBase()
        {
            super();
        }

        // Import the default methods and accessors
        // to make upkeep easier.
        include './../../../../../../includes/AdBase.as';
    }
}
