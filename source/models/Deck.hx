
package models;

import flixel.util.FlxRandom;

class Deck 
{
	private static var NUM_CARDS:Int = 52;
	private static var NUM_TIMES_SHUFFLE:Int = NUM_CARDS * 4;

	public var cards:Array<Card>;
	public var dealtCards:Int;

	public function new()
	{
		cards = new Array();
		reset();
		fillDeck();
	}

	private function fillDeck()
	{
		for( suit in 0...4 )
		{
			for( value in 1...14 )
			{
				cards.push(new Card(suit,value));
			}
		}
	}

	public function reset()
	{
		dealtCards = 0;	
	}

	public function shuffle()
	{
		FlxRandom.shuffleArray(cards, NUM_TIMES_SHUFFLE);
	}

	public function dealCard():Card
	{
		var card:Card = cards[dealtCards];
		dealtCards += 1;
		return card;
	}

	public function hasCards():Bool
	{
		return dealtCards < NUM_CARDS - 1;
	}
}