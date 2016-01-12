package game.actors.factory 
{
	import data.AppData;
	import game.actors.Actor;
	import game.actors.ActorData;
	import game.actors.ActorView;
	import game.actors.Bullet;
	import game.actors.controller.BulletMovementController;
	import game.actors.controller.MovementController;
	import game.TexturesManager;
	
	public class BulletsFactory 
	{
		private var appData:AppData;
		private var textureManager:TexturesManager;
		
		public function BulletsFactory(textureManager:TexturesManager, appData:AppData) 
		{
			this.textureManager = textureManager;
			this.appData = appData;
		}
		
		public function createLinearBullet(from:Actor, directionAngle:Number = 0):Bullet
		{
			var actorData:ActorData = new ActorData();
			var actorView:ActorView = new ActorView(actorData, textureManager.getTexture("sample", true));
			
			actorView.scaleX = 15;
			actorView.scaleY = 15;
			
			var bullet:Bullet = new Bullet(actorView, actorData);
			bullet.owner = from;
		
			
			
			
			var movementController:BulletMovementController = bullet.getController(0) as BulletMovementController;
			var fromMovementController:BulletMovementController = from.getController(0) as BulletMovementController;
			
			
			movementController.setPosition(from.actorData.x, from.actorData.y);
			movementController.maxSpeed = 1550 + Math.random() * 100 + fromMovementController.currentSpeed;
			movementController.currentSpeed = fromMovementController.currentSpeed  +5;
			movementController.speedAcceleration = 0.008;
			
			var x:Number = 10000;
			var y:Number = 0;
			var newX:Number = 0;
			var newY:Number = 0;
			
			

			var cosA:Number = Math.cos(fromMovementController.moveAngleRad + directionAngle);
			var sinA:Number = Math.sin(fromMovementController.moveAngleRad + directionAngle);
			
			newX = x * cosA - y * sinA;
			newY = x * sinA + y * cosA;
			
			movementController.moveTo(newX + from.actorData.x, newY + from.actorData.y);
			
			var spawnTime:Number = appData.timeController.worldStep.time;
			
			bullet.spawnTime = spawnTime;
			bullet.deathTime = spawnTime + bullet.lifeTime;
			
			return bullet;
		}
		
		
	}

}