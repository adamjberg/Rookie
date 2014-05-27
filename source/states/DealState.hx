package states;

import flixel.FlxSubState;

import flixel.util.FlxSignal;

import controllers.Dealer;
import models.*;

class DealState extends FlxSubState
{
	public var onComplete:FlxSignal;

	private var dealer:Dealer;

	public function new(deck:Deck, hands:Array<Hand>, crib:Crib)
	{
		dealer = new Dealer(deck, hands, crib);
		onComplete = new FlxSignal();
		super();
	}

	override public function create()
	{
		dealer.dealCards();
		super.create();
		onComplete.dispatch();
	}
	

}