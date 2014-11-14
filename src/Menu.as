package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.fscommand;
	import flash.events.Event;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Menu extends Sprite
	{	
		public static const GAME_START : String = "startgame";
		
		private var button1:ButtonPlay = new ButtonPlay();
		private var button2:ButtonQuit = new ButtonQuit();
		private var button3:ButtonRestart = new ButtonRestart();
		
		public function Menu() 
		{	
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addChild(button1);
			button1.x = 200
			button1.y = 200;
			
			addChild(button2);
			button2.x = 200;
			button2.y = 400;
			
			addChild(button3);
			button3.x = 200;
			button3.y = 300;
			button3.visible = false;
			
		}
		
		private function onClick(e:Event):void
		{
			if (e.target == button1)
			{
				dispatchEvent(new Event("Start"));
				button1.visible = false;
				button2.visible = false;
				dispatchEvent(new Event(GAME_START));
				//button3.visible = true;
			}
			
			if (e.target == button2)
			{
				fscommand("quit");
			}
		}
		
		
	}

}