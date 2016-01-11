package game.actors.collider 
{
	import game.actors.ActorData;
	
	public class CircleCollider extends Collider 
	{
		public var radius:Number;
		public var radiusSquared:Number;
		
		public function CircleCollider(actorData:ActorData, radius:Number) 
		{
			super(actorData);
			
			this.radius = radius;
			this.radiusSquared = radius * radius * 2;
		}
		
		override public function collideWith(collider:Collider):Boolean 
		{
			if (collider is CircleCollider)
			{
				var x1:Number = actorData.x;
				var y1:Number = actorData.y;
				var r1:Number = radiusSquared;
				
				var circleCollider:CircleCollider = collider as CircleCollider;
				
				var x2:Number = circleCollider.actorData.x;
				var y2:Number = circleCollider.actorData.y;
				var r2:Number = circleCollider.radiusSquared;
				
				var distanceX:Number = (x2 - x1);
				var distanceY:Number = (y2 - y1);
				
				var radiusDelta:Number = r1 + r2;
				
				if (distanceX * distanceX + distanceY * distanceY <= radiusDelta)
					return true
				else
					return false;
			}
			else
			{
				//TODO
				
				return false;
			}
		}
	}
}