
package views;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxSignal;
import models.Card;
import models.Hand;
import views.CardRenderer;

class PlayerHandRenderer extends FlxSpriteGroup
{
	public var onCardPressed:FlxTypedSignal<Int->Void>;

	private var cards:Array<CardRenderer>;

	public function new(hand:Hand)
	{
		super();

		cards = new Array();

		var cardRenderer:CardRenderer;
		var cardCount:Int = 0;
		for(card in hand.cards)
		{
			cardRenderer = new CardRenderer(card);
			add( cardRenderer );
			cardRenderer.x = cardRenderer.width * cardCount;
			FlxMouseEventManager.add(cardRenderer, cardPressed);
			cards[cardCount++] = cardRenderer;
		}

		y = FlxG.height - height;
		x = ( FlxG.width - width ) / 2;

		onCardPressed = new FlxTypedSignal();
	}	

	public function removeCardByIndex(cardIndex:Int)
	{
		var card:CardRenderer = cards[cardIndex];
		remove(card);
		cards.remove(card);
	}

	private function cardPressed(card:CardRenderer)
	{
		onCardPressed.dispatch(cards.indexOf(card));
	}

}