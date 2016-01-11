package game 
{
	import data.AppData;
	import display.scene.layers.LayerBase;
	import events.BulletEvent;
	import events.PlayerControllerScope;
	import flash.display3D.textures.Texture;
	import flash.geom.Vector3D;
	import game.actors.Bullet;
	import game.actors.Actor;
	import render2d.utils.FastMath;
	import display.scene.SceneControllerBase;

	public class BulletsLayer extends LayerBase
	{
		private var appData:AppData;
		private var sceneBase:SceneControllerBase;
		
		private var bullets:Vector.<Bullet> = new Vector.<Bullet>;
		
		private var textureManager:TexturesManager;
		
		public function BulletsLayer(sceneBase:SceneControllerBase, textureManager:TexturesManager, appData:AppData) 
		{
			this.textureManager = textureManager;
			this.sceneBase = sceneBase;
			this.appData = appData;
			
			describe(PlayerControllerScope, PlayerControllerScope.SHOT, onPlayerShoot);
		}
		
		private function onPlayerShoot(e:BulletEvent):void 
		{
			spawnBullet(e.owner, -Math.PI/180*5);
			spawnBullet(e.owner,  0);
			spawnBullet(e.owner,  Math.PI/180*5);
		}
		
		public function spawnBullet(from:Actor, directionAngle:Number = 0):void
		{
			var bullet:Bullet = new Bullet(textureManager.getTexture("sample", true));
			bullet.scaleX = bullet.scaleY = 15;
			
			bullet.setPosition(from.x, from.y);
			bullet.moveController.speed = 15;
			
			var x:Number = 1000;
			var y:Number = 0;
			var newX:Number = 0;
			var newY:Number = 0;

			var cosA:Number = Math.cos(from.moveController.moveAngleRad + directionAngle);
			var sinA:Number = Math.sin(from.moveController.moveAngleRad + directionAngle);
			
			newX = x * cosA - y * sinA;
			newY = x * sinA + y * cosA;
			
			bullet.moveController.moveTo(newX + from.x, newY + from.y);
			
			var spawnTime:Number = appData.timeController.worldStep.time;
			
			bullet.spawnTime = spawnTime;
			bullet.deathTime = spawnTime + bullet.lifeTime;
			
			bullets.push(bullet);
			
			//sceneBase.addRenderable(bullet);
		}
		
		private var toRemove:Vector.<Bullet> = new Vector.<Bullet>;
		override public function update(worldStep:WorldStep):void 
		{
			var i:int;
			super.update(worldStep);
			
			for (i = 0; i < bullets.length; i++)
			{
				var bullet:Bullet = bullets[i];
				
				if (bullet.deathTime < appData.timeController.worldStep.time)
				{
					//sceneBase.removeRenderable(bullet);
					toRemove.push(bullet);
				}
			}
			
			for (i = 0; i < toRemove.length; i++)
			{
				bullets.splice(bullets.indexOf(toRemove[i]), 1);
			}
			
			toRemove.length = 0;
		}
	}
}