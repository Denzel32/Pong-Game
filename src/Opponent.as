package  {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import Main;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Alessandro
	 */
	public class Opponent extends Sprite
	{
		public var playerPaddle : Player;
		
		private var direction : int = 0;
		private var speed = 8;
		
		public function Opponent() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			playerPaddle = new Player();
			playerPaddle.y = 100;
			playerPaddle.x = 780;
			addChild(playerPaddle);
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
		}
		
		public function loop(e:Event):void
		{
			if (direction == 1)
			{
				playerPaddle.y -= speed;
			}
			if (direction == -1)
			{
				playerPaddle.y += speed;
			}
			if (playerPaddle.y <= 40)
			{
				playerPaddle.y = 40;
			}
			if (playerPaddle.y >= 560)
			{
				playerPaddle.y = 560;
			}
		}
		
		private function KeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.UP)
			{
				direction = 1;
			}
			if (e.keyCode == Keyboard.DOWN)
			{
				direction = -1;
			}			
		}
		private function KeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.UP)
			{
				direction = 0;
			}
			if (e.keyCode == Keyboard.DOWN)
			{
				direction = 0;
			}
		}
	}
}