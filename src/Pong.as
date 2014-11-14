package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Denzel Dap
	 */
	public class Pong extends Sprite
	{	
		private var ball	: Projectile = new Projectile();
		
		//directions and speed
		public var ballX	: int = -5;
		public var ballY	: int;
		
		public function Pong() 
		{
			addChild(ball);
			
		}
		
		public function update()
		{
			this.x += ballX + Math.abs(ballY/1.25);
			this.y += ballY;
			
			if (this.y >= stage.stageHeight && this.y > 0)
			{
				ballY *= -1;
			}
			
			if (this.y <=  0 && this.y < 0)
			{
				ballY *= -1;
			}
			
		}
		
	}

}