package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

import models.*;
import views.*;

class PlayState extends FlxState
{
	private var dealState:DealState;
	private var bidState:BidState;

	private var deck:Deck;
	private var hands:Array<Hand>;
	private var crib:Crib;

	private var playerHandRenderer:PlayerHandRenderer;

	override public function create():Void
	{
		deck = new Deck();
		hands = new Array();
		crib = new Crib();

		initHands(4);

		dealState = new DealState(deck, hands, crib);
		dealState.onComplete.add(onDealComplete);

		this.openSubState(dealState);

		super.create();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}

	private function initHands(numPlayers:Int)
	{
		for(hand in 0...numPlayers)
		{
			hands[hand] = new Hand();
		}
	}

	private function onDealComplete()
	{
		closeSubState();

		playerHandRenderer = new PlayerHandRenderer(hands[0]);
		add(playerHandRenderer);

		playerHandRenderer.onCardPressed.add(onPlayerCardClicked);

		openSubState(bidState);
	}

	private function onPlayerCardClicked(cardIndex:Int)
	{
		playerHandRenderer.removeCardByIndex(cardIndex);
	}
}