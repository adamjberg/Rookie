
package input;

import flixel.FlxG;
import flixel.input.gamepad.FlxGamepad;
import flixel.input.gamepad.PS3ButtonID;
import flixel.input.keyboard.FlxKey;
import flixel.input.keyboard.FlxKeyList;

class Input 
{

	public static var ADVANCE:Int = 0;
	public static var BACK:Int = 1;

	private static var keyboardMapping:Array<Array<String>> = [
		["Enter"],
	];

	private static var gamepadMapping:Array<Array<Int>> = [
		[PS3ButtonID.X_BUTTON],
	];

	public static function getKey(keyId:Int):Bool {
		return getKeyKeyboard(keyId) || getKeyGamepad(keyId);
	}

	public static function getKeyDown(keyId:Int):Bool {
		return getKeyDownKeyboard(keyId)
				|| getKeyDownGamepad(keyId);
	}

	public static function getKeyUp(keyId:Int):Bool {
		return getKeyUpKeyboard(keyId) || getKeyUpGamepad(keyId);
	}

	private static function getKeyKeyboard(keyId:Int):Bool {
		return FlxG.keys.anyPressed(keyboardMapping[keyId]);
	}

	private static function getKeyDownKeyboard(keyId:Int):Bool {
		return FlxG.keys.anyJustPressed(keyboardMapping[keyId]);
	}

	private static function getKeyUpKeyboard(keyId:Int):Bool {
		return FlxG.keys.anyJustReleased(keyboardMapping[keyId]);
	}

	private static function getKeyGamepad(keyId:Int):Bool {
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		return gamepad != null && gamepad.anyPressed(gamepadMapping[keyId]);
	}

	private static function getKeyDownGamepad(keyId:Int):Bool {
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		return gamepad != null && gamepad.anyJustPressed(gamepadMapping[keyId]);
	}

	private static function getKeyUpGamepad(keyId:Int):Bool {
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		return gamepad != null && gamepad.anyJustReleased(gamepadMapping[keyId]);
	}

}