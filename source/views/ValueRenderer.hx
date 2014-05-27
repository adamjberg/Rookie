
package views;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class ValueRenderer extends FlxText
{

	public function new(value:Int)
	{
		super(Std.string(value));
		color = FlxColor.BLACK;
	}

}