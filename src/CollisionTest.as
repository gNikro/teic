package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.actors.ActorData;
	import game.actors.collider.CircleCollider;
	import game.actors.collider.Collider;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CollisionTest extends Sprite 
	{
		
		private var colliders:Vector.<CircleCollider> = new Vector.<CircleCollider>;
		private var circle1:CircleCollider;
		
		public function CollisionTest() 
		{
			super();
			
			circle1 = new CircleCollider(new ActorData(), 50);
			var circle2:CircleCollider = new CircleCollider(new ActorData(), 50);
			
			circle2.actorData.x = stage.stageWidth / 2;
			circle2.actorData.y = stage.stageHeight / 2;
			
			colliders.push(circle1, circle2);
			
			stage.addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		private function onFrame(e:Event):void 
		{
			this.graphics.clear();
			
			circle1.actorData.x = stage.mouseX;
			circle1.actorData.y = stage.mouseY;
			
			for (var i:int = 0; i < colliders.length; i++)
			{
				var currentColldier:CircleCollider = colliders[i];

				for (var j:int = i + 1; j < colliders.length; j++)
				{
					var collideWith:CircleCollider = colliders[j];
					
					if (currentColldier.collideWith(collideWith))
					{
						this.graphics.lineStyle(1, 0xFF0000);
						this.graphics.drawCircle(currentColldier.actorData.x, currentColldier.actorData.y, currentColldier.radius);
						
						this.graphics.lineStyle(1, 0xFF0000);
						this.graphics.drawCircle(collideWith.actorData.x, collideWith.actorData.y, collideWith.radius);
					}
					else
					{
						this.graphics.lineStyle(1, 0x0000FF);
						this.graphics.drawCircle(currentColldier.actorData.x, currentColldier.actorData.y, currentColldier.radius);
						
						this.graphics.lineStyle(1, 0x0000FF);
						this.graphics.drawCircle(collideWith.actorData.x, collideWith.actorData.y, collideWith.radius);
					}
				}
			}
		}
		
	}

}