package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Score extends Sprite
	{	
		private var mytext:TextField = new TextField();
		
		public function Score() 
		{
			mytext.text = "Score:";
			mytext.x = 400;
			mytext.y = 300;
			addChild(mytext);
		}
		
		public function update(points:int)
		{
			mytext.text = "Score: " + points.toString();
		}
	}

}