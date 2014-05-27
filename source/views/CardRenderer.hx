
package views;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

import flixel.util.FlxColor;
import models.Card;

class CardRenderer extends FlxSpriteGroup
{
	private var suit:SuitRenderer;
	private var value:ValueRenderer;
	private var background:CardBackgroundRenderer;

	public function new(card:Card)
	{
		super();
		
		background = new CardBackgroundRenderer();
		add(background);

		suit = new SuitRenderer(card.suit);
		add(suit);

		value = new ValueRenderer(card.value);
		add(value);
	}

}