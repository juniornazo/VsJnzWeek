package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class BackgroundFriends extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);

		frames = Paths.getSparrowAtlas("street/friends");
		antialiasing = true;

		animation.addByIndices('idle', 'friends', CoolUtil.numberArray(14), "", 24, false);

		animation.play('idle');
	}

	var danceDir:Bool = false;

	public function getScared():Void
	{
		animation.addByIndices('idle', 'friends scared', CoolUtil.numberArray(14), "", 24, false);
		dance();
	}

	public function dance():Void
	{

			animation.play('idle', true);

	}
}