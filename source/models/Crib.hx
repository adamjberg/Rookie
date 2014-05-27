
package models;

class Crib 
{
	private var cards:Array<Card>;

	public function new()
	{
		cards = new Array();
	}

	public function addCard(card:Card)
	{
		cards.push(card);
	}

}