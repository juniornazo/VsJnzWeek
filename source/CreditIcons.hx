package;

import flixel.FlxSprite;

class CreditIcons extends FlxSprite
{
	public var sprTracker:FlxSprite;
	public var id:Int;

	public var defualtIconScale:Float = 1;
	public var iconScale:Float = 1;
	public var iconSize:Float;

    public function new(char:String = 'face', ?_id:Int = -1)
    
    {
        super();
    loadGraphic('assets/images/credit_icon.png', true, 150, 150);

    animation.add('SKELEBUNNY', [0], 0, false);
    animation.add('ALEX', [1], 0, false);
    animation.add('ROZYBUD', [2], 0, false);

    iconSize = width;

		id = _id;
		
		antialiasing = true;
		animation.play(char);
		scrollFactor.set();

    }

    override function update(elapsed:Float)
        {
    
    
            super.update(elapsed);
            setGraphicSize(Std.int(iconSize * iconScale));
            updateHitbox();
    
            if (sprTracker != null){
                setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
            }      
        }

}