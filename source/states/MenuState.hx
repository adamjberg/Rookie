package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.addons.ui.FlxUIButton;

import input.Input;
import states.PlayState;

class MenuState extends FlxState
{
	private var startButton:FlxUIButton;

	override public function create():Void
	{
		startButton = new FlxUIButton(0,0,"Start", onStartButtonPressed);
		startButton.x = ( FlxG.width  -startButton.width ) / 2;
		startButton.y = ( FlxG.height - startButton.height ) / 2;
		add(startButton);
		super.create();
	}
	
	override public function destroy():Void
	{
		startButton = null;
		super.destroy();
	}

	override public function update():Void
	{
		if(Input.getKeyDown(Input.ADVANCE)) {
			trace("key down");
		}
		if(Input.getKey(Input.ADVANCE)) {
			trace("advance");
		}
		if(Input.getKeyUp(Input.ADVANCE)) {
			trace("key up");
		}
	}

	private function onStartButtonPressed():Void
	{
		FlxG.switchState(new PlayState());
	}
}