
package models;

class Hand 
{

	public var cards:Array<Card>;

	public function new()
	{
		cards = new Array();
	}

	public function playCard(index:Int):Card
	{
		return cards[index];
	}

	public function addCard(card:Card)
	{
		cards.push(card);
	}

	public function getNumCards():Int
	{
		return cards.length;
	}

}