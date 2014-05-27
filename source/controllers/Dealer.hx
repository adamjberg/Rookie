
package controllers;

import models.*;

class Dealer 
{
	private static var NUM_CARDS_IN_CRIB:Int = 4;

	private var deck:Deck;
	private var hands:Array<Hand>;
	private var crib:Crib;

	public function new(deck:Deck, hands:Array<Hand>, crib:Crib)
	{
		this.deck = deck;
		this.hands = hands;
		this.crib = crib;
	}

	public function dealCards()
	{
		dealCrib();
		dealPlayerHands();
	}

	private function dealCrib()
	{
		for(i in 0...NUM_CARDS_IN_CRIB)
		{
			crib.addCard(deck.dealCard());
		}
	}

	private function dealPlayerHands()
	{
		while(deck.hasCards())
		{
			for( hand in hands )
			{
				hand.addCard(deck.dealCard());
			}
		}
	}

}