package game.scene.layers 
{
	import display.scene.layers.LayerBase;
	import game.actors.Actor;
	import game.actors.Bullet;

	public class BulletsLayer extends LayerBase
	{
		public static const IDENT:int = 0;
		
		private var targetsList:Vector.<Actor>;
		
		private var toRemove:Vector.<Actor> = new Vector.<Actor>;
		
		public function BulletsLayer(targetsList:Vector.<Actor>) 
		{
			super(IDENT);
			
			this.targetsList = targetsList;
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			var i:int;
			
			var bulletsLength:Number = actorsList.length;
			var targetsLength:Number = targetsList.length;
			for (i = 0; i < bulletsLength; i++)
			{
				var bullet:Bullet = actorsList[i] as Bullet;
				
				bullet.update(worldStep);		
				
				
				if (bullet.deathTime < worldStep.time)
				{
					//sceneBase.removeRenderable(bullet);
					toRemove.push(bullet);
				}
				else
				{
					for (var j:int = 0; j < targetsLength; j++)
					{
						if (bullet.owner != targetsList[j] && bullet.collider.collideWith(targetsList[j].collider))
						{     
							toRemove.push(bullet);
						}
					}
				}
				
				
			}
			
			var toRemoveLength:Number = toRemove.length;
			for (i = 0; i < toRemoveLength; i++)
			{
				removeActor(toRemove[i]);
			}
			
			toRemove.length = 0;
		}
	}
}