function madbunsnovid(?dialogueBox:DialogueBox):Void
	{
		var black:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
		black.scrollFactor.set();
		add(black);

		var red:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, 0xFFff1b31);
		red.scrollFactor.set();

		var senpaiEvil:FlxSprite = new FlxSprite();
		senpaiEvil.frames = FlxAtlasFrames.fromSparrow('assets/images/weeb/senpaiCrazy.png', 'assets/images/weeb/senpaiCrazy.xml');
		senpaiEvil.animation.addByPrefix('idle', 'Senpai Pre Explosion', 24, false);
		senpaiEvil.setGraphicSize(Std.int(senpaiEvil.width * 5.5));
		senpaiEvil.updateHitbox();
		senpaiEvil.screenCenter();
		//senpaiEvil.x -= 120;
		senpaiEvil.y -= 115;

		add(red);    
        inCutscene = true;
         add(dialogueBox);


		new FlxTimer().start(0.3, function(tmr:FlxTimer)
		{
			black.alpha -= 0.15;

			if (black.alpha > 0)
			{
				tmr.reset(0.3);
			}
			else
			{
				if (SONG.song.toLowerCase() == 'mad-buns')
					{
						if (dialogueBox = false)
							{
											add(senpaiEvil);
											senpaiEvil.alpha = 0;
											new FlxTimer().start(0.3, function(swagTimer:FlxTimer)
											{
												senpaiEvil.alpha += 0.15;
												if (senpaiEvil.alpha < 1)
												{
													swagTimer.reset();
												}
												else
												{
													senpaiEvil.animation.play('idle');
													FlxG.sound.play('assets/sounds/Senpai_Dies' + TitleState.soundExt, 1, false, null, true, function()
													{
														remove(senpaiEvil);
														remove(red);
														FlxG.camera.fade(FlxColor.WHITE, 0.01, true, function()
														{
														}, true);
													});
													new FlxTimer().start(3.2, function(deadTime:FlxTimer)
													{
														FlxG.camera.fade(FlxColor.WHITE, 1.6, false);
													});
												}
											});
											}
										}
				else
					startCountdown();

				remove(black);
			}
		});
	}