package game.actors 
{
	import render2d.core.gl.texture.BitmapTexture;
	
	public class Bullet extends Actor 
	{
		public var lifeTime:Number = 20000;
		public var spawnTime:Number = 0;
		public var deathTime:Number = 0;
		
		public function Bullet(texture:BitmapTexture) 
		{
			super(texture);
			
			_rotationX = Math.random() * 360
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			moveController.update(worldStep);
			
			_rotationX+=0.5 + Math.random() * 0.3;
			
			x = moveController.originX //+ Math.sin(_rotationX) * 15;
			y = moveController.originY //+ Math.cos(_rotationX) * 15;
		}
	}
}