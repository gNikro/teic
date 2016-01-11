package game.actors 
{
	import game.actors.controller.MovementController;
	
	public class Bullet extends Actor 
	{
		public var lifeTime:Number = 20000;
		public var spawnTime:Number = 0;
		public var deathTime:Number = 0;
		
		public function Bullet(bulletView:ActorView, bulletData:ActorData) 
		{
			super(bulletView, bulletData);
			
			initialize();
		}
		
		private function initialize():void 
		{
			//_rotationX = Math.random() * 360
			
			addController(new MovementController(actorData));
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			super.update(worldStep);
			
			//_rotationX += Math.random();
		}
	}
}