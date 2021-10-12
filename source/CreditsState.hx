package;

import openfl.system.System;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.NG;
import lime.app.Application;
import lime.utils.Assets;
import flixel.math.FlxMath;
import flixel.text.FlxText;

using StringTools;

class CreditsState extends MusicBeatState
{
    var creditText:FlxText;
	var descText:FlxText;
    public static var startSong = true;

	var creditSelected:Int = 0;

    var canChangeItems:Bool = true;
	
	var creditsText:Array<String> = ["SKELEBUNNY",
                                    "ALEX",
                                    "ROZYBUD"
                                    ];

    var creditDesc:Array<String> = ["animator, coder",
                                    "music composer",
                                    "fps plus engine creator"
                                    ];

    //private var iconArray:Array<CreditIcons> = [];

    override function create()
	{	
	
		if(startSong)
			FlxG.sound.playMusic('assets/music/configurator' + TitleState.soundExt);
		else
			startSong = true;

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic('assets/images/menuDesat.png');
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0;
		bg.setGraphicSize(Std.int(bg.width * 1.18));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		bg.color = 0xFF5C6CA5;
		add(bg);
	
		// var magenta = new FlxSprite(-80).loadGraphic('assets/images/menuBGMagenta.png');
		// magenta.scrollFactor.x = 0;
		// magenta.scrollFactor.y = 0;
		// magenta.setGraphicSize(Std.int(magenta.width * 1.18));
		// magenta.updateHitbox();
		// magenta.screenCenter();
		// magenta.visible = false;
		// magenta.antialiasing = true;
		// add(magenta);
		// magenta.scrollFactor.set();
		
		var tex = FlxAtlasFrames.fromSparrow('assets/images/FNF_main_menu_assets.png', 'assets/images/FNF_main_menu_assets.xml');
		var creditTitle:FlxSprite = new FlxSprite(-500, 55);
		creditTitle.frames = tex;
		creditTitle.animation.addByPrefix('selected', "credits white", 24);
		creditTitle.animation.play('selected');
		creditTitle.scrollFactor.set();
		creditTitle.antialiasing = true;
		creditTitle.updateHitbox();
		creditTitle.screenCenter(X);
			
		add(creditTitle);

        /*var icon:CreditIcons = new CreditIcons(creditsText);
			icon.sprTracker = creditText;

			// using a FlxGroup is too much fuss!
			iconArray.push(icon);
			add(icon);*/
			
		
		creditText = new FlxText(5, 215, 1280, "", 64);
		creditText.scrollFactor.set(0, 0);
		creditText.setFormat("assets/fonts/Funkin-Bold.otf", 64, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		creditText.borderSize = 3;
		creditText.borderQuality = 1;
		
		descText = new FlxText(0, 400, 640, "", 20);
		descText.scrollFactor.set(0, 0);
		descText.setFormat("assets/fonts/vcr.ttf", 20, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		//descText.borderSize = 3;
		descText.borderQuality = 1;

		var backText = new FlxText(5, FlxG.height - 37, 0, "ENTER - Twitter\nESCAPE/BACKSPACE - Back to Menu\n", 16);
		backText.scrollFactor.set();
		backText.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

		add(creditText);
		add(descText);
		add(backText);

		textUpdate();

		super.create();
	}
    var selectedSomethin:Bool = false;
    override function update(elapsed:Float)
        {
    
            
        
            if (FlxG.sound.music.volume < 0.8)
            {
                FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
            }
    
            if(canChangeItems){
                if (controls.UP_P)
                    {
                        FlxG.sound.play('assets/sounds/scrollMenu' + TitleState.soundExt);
                        changeItem(-1);
                    }
    
                    if (controls.DOWN_P)
                    {
                        FlxG.sound.play('assets/sounds/scrollMenu' + TitleState.soundExt);
                        changeItem(1);
                    }
                    
                    switch(creditSelected){
                        case 0: //Skelebunny
                        if (controls.RIGHT_P || controls.LEFT_P) {
                            FlxG.sound.play('assets/sounds/scrollMenu' + TitleState.soundExt);
                        }
                            if(FlxG.keys.justPressed.ENTER){
                                #if linux
					            Sys.command('/usr/bin/xdg-open', ["https://twitter.com/junior_nazo", "&"]);
					            #else
					            FlxG.openURL('https://twitter.com/junior_nazo');
					            #end
                            }
                            
                        case 1: //alex
                        if (controls.RIGHT_P || controls.LEFT_P) {
                            FlxG.sound.play('assets/sounds/scrollMenu' + TitleState.soundExt);
                        }
                        if(FlxG.keys.justPressed.ENTER){
                            #if linux
                            Sys.command('/usr/bin/xdg-open', ["https://twitter.com/AlexLunner", "&"]);
                            #else
                            FlxG.openURL('https://twitter.com/AlexLunner');
                            #end
                        }
                        case 2: //rozy
                            if (controls.RIGHT_P || controls.LEFT_P) {
                                FlxG.sound.play('assets/sounds/scrollMenu' + TitleState.soundExt);
                            }
                            if(FlxG.keys.justPressed.ENTER){
                                #if linux
                                Sys.command('/usr/bin/xdg-open', ["https://twitter.com/helpme_thebigt", "&"]);
                                #else
                                FlxG.openURL('https://twitter.com/helpme_thebigt');
                                #end
                            }     
                }
            }
    
            if (controls.BACK || FlxG.keys.justPressed.BACKSPACE)
            {
                exit();
            }
    
            super.update(elapsed);
            
            if(controls.LEFT_P || controls.RIGHT_P || controls.UP_P || controls.DOWN_P || controls.ACCEPT || FlxG.keys.justPressed.ANY)
                textUpdate();
        }

        function textUpdate(){

            creditText.text = "";
    
            for(i in 0...creditsText.length - 1){
    
                var textStart = (i == creditSelected) ? ">" : "  ";
                creditText.text += textStart + creditsText[i] + " " + "\n";
    
            }

            /*for (i in 0...iconArray.length)
                {
                    iconArray[i].alpha = 0.6;
                }
        
                iconArray[creditSelected].alpha = 1;*/
    
            var textStart = (creditSelected == creditsText.length - 1) ? ">" : "  ";
            creditText.text += textStart + creditsText[creditsText.length - 1] + "\n";
    
            switch(creditSelected){
    
                case 0:
                    descText.text = creditDesc[creditSelected];
                case 1:
                    descText.text = creditDesc[creditSelected];
                case 2:
                    descText.text = creditDesc[creditSelected];
    
            }
    
        }

        

        function changeItem(huh:Int = 0)
            {
                creditSelected += huh;
                    
                if (creditSelected > creditsText.length - 1)
                    creditSelected = 0;
                if (creditSelected < 0)
                    creditSelected = creditsText.length - 1;
             
            }

        function exit(){
            canChangeItems = false;
            FlxG.sound.music.stop();
            FlxG.sound.play('assets/sounds/cancelMenu' + TitleState.soundExt);
            FlxG.switchState(new MainMenuState());
        }
    
}