package 
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Opponent;
	import Player01;
	
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Main extends Sprite 
	{	
		private var menu		:	Menu = new Menu();
		private var pong		:	Pong = new Pong();
		private var score		:	Score = new Score();
		//private var _player	:	Player= new Player();
		//private var _opponent	: 	Player = new Player();
		private var points		:	int;
		var _background 		: 	Background;
		var _player 			: 	Player01 = new Player01();
		var _opponent 			: 	Opponent = new Opponent();
		private var anim		:	Explosie = new Explosie();
		
		
		public function Main():void 
		{
			_background = new Background;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// entry point
			
			
			BackgroundFullScreen();
			
			
			addChild(_background);
			addChild(menu);
			addChild(score);
			//addChild(anim);
			
			
			
			
			
			menu.addEventListener(Menu.GAME_START, startUpGame);
		}
		
		private function startUpGame(e:Event):void 
		{
			addChild(_player);
			addChild(_opponent);
			
			addChild(pong);
			pong.x = stage.stageWidth / 2;
			pong.y = stage.stageHeight / 2;
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
			
		function BackgroundFullScreen() 
		{
			_background.x =  stage.stageWidth / 2;
			_background.y =  stage.stageHeight / 2;
			_background.width = stage.stageWidth;
			_background.height = stage.stageHeight;
		} 
		
		private function update(e:Event):void 
		{
			pong.update();
			score.update(points);
			if (pong.hitTestObject(_player))
			{
				
				if (pong.ballX < 0)
				{
					pong.ballX *=  -1;
					pong.ballY = ballAngle(_player);
				}
			}
			
				if (pong.hitTestObject(_opponent))
			{
				
				if (pong.ballX > 0)
				{
					pong.ballX *=  -1;
					pong.ballY =ballAngle(_opponent);
				}
			}
			
			if (pong.x < 0)
			{	
				addChild(anim);
				anim.y = pong.y;
				anim.x = pong.x;
				anim.scaleX = 1;
				points += 1;
				pong.x = stage.stageWidth / 2;
			}
			
			if (pong.x > 800)
			{	
				addChild(anim);
				anim.y = pong.y;
				anim.x = pong.x;
				anim.scaleX = -1;
				pong.x = stage.stageWidth / 2;
			}
			if (anim.currentFrame == anim.framesLoaded)
			{
				anim.x = -600;
			}
		}
		private function ballAngle(pad):Number
		{
			var angle: Number = (pong.height / 2 * ((pong.y - pad.playerPaddle.y ) / pad.playerPaddle.height / 2) * 1);
			return angle;
		}
		
	}	
	
	
}