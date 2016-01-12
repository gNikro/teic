package game.actors 
{
	import game.actors.controller.BulletMovementController;
	import game.actors.controller.MovementController;
	
	public class Bullet extends Actor 
	{
		public var lifeTime:Number = 10000;
		public var spawnTime:Number = 0;
		public var deathTime:Number = 0;
		public var owner:Actor;
		
		public function Bullet(bulletView:ActorView, bulletData:ActorData) 
		{
			super(bulletView, bulletData);
			
			initialize();
		}
		
		private function initialize():void 
		{
			//_rotationX = Math.random() * 360
			
			addController(new BulletMovementController(actorData));
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			super.update(worldStep);
			
			actorData.angleRad += Math.PI / 36;
			(getController(0) as BulletMovementController).speedAcceleration += 0.0003;
			//_rotationX += Math.random();
		}
	}
}