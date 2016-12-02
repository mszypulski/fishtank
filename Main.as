package 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import flash.display.Bitmap;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.MouseEvent;	
		
	/**
	 * ...
	 * @author Mariusz Szypulski
	 */
	
	[SWF(width="933", height="700", backgroundColor="#42a3c3")] 
	public class Main extends MovieClip 
	{
		[Embed(source="/assets/bg933x700.jpg")]
        public var ImgBackground:Class;
		public var imgBackground:Bitmap = new ImgBackground() as Bitmap;
		
		[Embed(source="/assets/bgBubbleSound.mp3")] 
        public var SndWater:Class; 
        public var sndWater:Sound = new SndWater() as Sound;
		
		private var bgSoundChannel:SoundChannel;
		
		private var numBubbles:int = 100;
		private var numFishFoods:int = 40;
		private var numPiranhes:int = 3;
		private var numGoldfishes:int = 5;
		private var numSnails:int = 3;
		private var numClockworkFishes:int = 3;
		public static var temperature:int = 20;
		private var fishFood:FishFood;
		private var goldfish:Goldfish;
		private var snail:Snail;
		private var piranha:Piranha;
		private var clockworkFish:ClockworkFish;
		private var goldFishButton:Button;
		private var piranhaButton:Button;
		private var snailButton:Button;
		private var clockworkFishButton:Button;
		public static var fishFoodList:Array = new Array();
		public static var goldfishList:Array = new Array();
		public static var snailList:Array = new Array();
		public static var piranhaList:Array = new Array();
		public static var clockworkFishList:Array = new Array();
		private var scoreHUD:ScoreHUD;	
		private var spaceKeyIsUp:Boolean = false;
		private var leftArrowKey:Boolean = false;
		private var rightArrowKey:Boolean = false;
		private var format:TextFormat;
		private var copyrightText:TextField;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			var i:int;
			var numRandomFoods:Number;
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
					
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyPress );
            stage.addEventListener( KeyboardEvent.KEY_UP, onKeyRelease );			
			
			addChild(imgBackground);
									
            bgSoundChannel = sndWater.play();
			bgSoundChannel.addEventListener( Event.SOUND_COMPLETE, onBackgroundMusicFinished );			
			
			
			
			scoreHUD = new ScoreHUD(stage);
			
			addSnail(numSnails);
			addPiranha(numPiranhes);
			addGoldfish(numGoldfishes);
			addClockworkFish(numClockworkFishes);
						
			numRandomFoods = 10 + Math.random() * numFishFoods; // between 10 and 50
			addFishFood(numRandomFoods);
			
			for (i = 0; i < numBubbles; i++)
			{
				stage.addChild(new Bubble(stage)); 
			}
			
			stage.addChild(scoreHUD);
			
			goldFishButton = new Button("goldfishButton",300,0);
			stage.addChild(goldFishButton);
			goldFishButton.addEventListener(MouseEvent.CLICK, goldfishButtonClickHandler);
			
			piranhaButton = new Button("piranhaButton",370,0);
			stage.addChild(piranhaButton);
			piranhaButton.addEventListener(MouseEvent.CLICK, piranhaButtonClickHandler);
			
			snailButton = new Button("snailButton",440,0);
			stage.addChild(snailButton);
			snailButton.addEventListener(MouseEvent.CLICK, snailButtonClickHandler);
			
			clockworkFishButton = new Button("clockworkFishButton",510,0);
			stage.addChild(clockworkFishButton);
			clockworkFishButton.addEventListener(MouseEvent.CLICK, clockworkFishButtonClickHandler);
			
								
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);			
							
		}
		
		
		
		private function addGoldfish(number:Number):void
		{
						
			for (var i:int = 0; i < number; i++)
			{
				goldfish = new Goldfish(stage);
				goldfish.addEventListener(Event.REMOVED_FROM_STAGE, removeGoldfish, false, 0, true);
				addChild(goldfish);
				goldfishList.push(goldfish);
		        scoreHUD.updateGoldfishes(1);
			}
		
		}	
		
		private function addSnail(number:Number):void
		{
						
			for (var i:int = 0; i < number; i++)
			{
				snail = new Snail(stage);
				snail.addEventListener(Event.REMOVED_FROM_STAGE, removeSnail, false, 0, true);
				addChild(snail);
				snailList.push(snail);
		        scoreHUD.updateSnails(1);
			}
		
		}	
		
		private function addFishFood(number:Number):void
		{
						
			for (var i:int = 0; i < number; i++)
			{
				fishFood = new FishFood(stage);
				fishFood.addEventListener(Event.REMOVED_FROM_STAGE, removeFishFood, false, 0, true);
				addChild(fishFood);
				fishFoodList.push(fishFood);
		        scoreHUD.updateFishFoods(1);
			}
		
		}	
		
		
		private function addPiranha(number:Number):void
		{
						
			for (var i:int = 0; i < number; i++)
			{
				piranha = new Piranha(stage);
				piranha.addEventListener(Event.REMOVED_FROM_STAGE, removePiranha, false, 0, true);
				addChild(piranha);
				piranhaList.push(piranha);
		        scoreHUD.updatePiranhas(1);
				
			}
		}
		
		private function addClockworkFish(number:Number):void
		{
						
			for (var i:int = 0; i < number; i++)
			{
				clockworkFish = new ClockworkFish(stage);
				clockworkFish.addEventListener(Event.REMOVED_FROM_STAGE, removeClockworkFish, false, 0, true);
				addChild(clockworkFish);
				clockworkFishList.push(clockworkFish);
		        scoreHUD.updateClockworkFishes(1);
				
			}
		}
		
		private function goldfishButtonClickHandler(event:MouseEvent):void
        {
           addGoldfish(1);
        }
		
		private function piranhaButtonClickHandler(event:MouseEvent):void
        {
           addPiranha(1);
        }
		
		private function snailButtonClickHandler(event:MouseEvent):void
        {
           addSnail(1);
        }
		
		private function clockworkFishButtonClickHandler(event:MouseEvent):void
        {
           addClockworkFish(1);
        }
		
		private function loop(e:Event) : void
		{
			if (spaceKeyIsUp)
			{
				addFishFood(1);
				spaceKeyIsUp = false;
			}
			
			if (leftArrowKey)
			{
				//trace("left arrow key");
				temperature -= 1;
				if (temperature <= 0) temperature = 0;
				scoreHUD.updateScoreTemperature(-1);
				leftArrowKey = false;
			}
			
			if (rightArrowKey)
			{
				temperature += 1;
				if (temperature >= 40) temperature = 40;
				scoreHUD.updateScoreTemperature(1);
				rightArrowKey = false;
			}
			
		}		
		
		
		private function onBackgroundMusicFinished( event:Event ):void
		{
			bgSoundChannel = sndWater.play();
			bgSoundChannel.addEventListener( Event.SOUND_COMPLETE, onBackgroundMusicFinished );
		}
		
		
				
		private function removeFishFood(e:Event) : void
		{
			fishFoodList.splice(fishFoodList.indexOf(e.currentTarget), 1);
			scoreHUD.updateFishFoods(-1);			
		}
		
		private function removePiranha(e:Event) : void
		{
			piranhaList.splice(piranhaList.indexOf(e.currentTarget), 1);
			scoreHUD.updatePiranhas(-1);			
		}
		
		private function removeGoldfish(e:Event) : void
		{
			goldfishList.splice(goldfishList.indexOf(e.currentTarget), 1);
			scoreHUD.updateGoldfishes(-1);			
		}
		
		private function removeSnail(e:Event) : void
		{
			snailList.splice(snailList.indexOf(e.currentTarget), 1);
			scoreHUD.updateSnails(-1);			
		}
		
		private function removeClockworkFish(e:Event) : void
		{
			clockworkFishList.splice(clockworkFishList.indexOf(e.currentTarget), 1);
			scoreHUD.updateClockworkFishes(-1);			
		}
		
	    private function onKeyRelease(keyboardEvent:KeyboardEvent):void
		{
			if ( keyboardEvent.keyCode == Keyboard.SPACE )
			{
				spaceKeyIsUp = true;
				
			}
			
			if ( keyboardEvent.keyCode == Keyboard.LEFT ) leftArrowKey = true;
			if ( keyboardEvent.keyCode == Keyboard.RIGHT ) rightArrowKey = true;
			
			
		}
		
		
		private function onKeyPress(keyboardEvent:KeyboardEvent):void
		{
			if ( keyboardEvent.keyCode == Keyboard.SPACE )
			{
				spaceKeyIsUp = false;
				
			}
		}
		
		
	}
	
}