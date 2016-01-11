package game.actors.controller 
{
	public class MovementController extends ActorController
	{
		public var destinetionX:Number;
		public var destinetionY:Number;
		
		public var originX:Number;
		public var originY:Number;
		
		public var speed:Number = 7;
		
		public var moveAngle:Number = 0;
		public var moveAngleRad:Number = 0;
		
		private static var radToDeg:Number = 180 / Math.PI;
		
		public function MovementController() 
		{
			
		}
		
		public function moveTo(x:Number, y:Number):void 
		{
			destinetionX = x;
			destinetionY = y;
			
			moveAngleRad = getAngle(originX, originY, destinetionX, destinetionY);
			moveAngle = moveAngleRad * radToDeg;
		}
		
		private function getAngle (x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			return Math.atan2(dy,dx);
		}
		
		public function update(worldStep:WorldStep):void 
		{
			var deltaX:Number = (destinetionX - originX);
			var deltaY:Number = (destinetionY - originY);
			
			var length:Number = (deltaX * deltaX) + (deltaY * deltaY) + (1);
			length = Math.sqrt(length);
			
			var currentSpeed:Number = speed * worldStep.partOfSecond;
			
			var addX:Number = interpolate(deltaX, speed, length);
			var addY:Number = interpolate(deltaY, speed, length);
			
			if (originX != destinetionX)
			{
				originX += addX;
			}
				
			if (originY != destinetionY)
			{
				originY += addY;
			}
		}
		
		[Inline]
		public final function interpolate(delta:Number, interpolationFactor:Number, length:Number):Number
		{
			var add:Number = interpolationFactor * delta / length;
			
			if (Math.abs(add) > Math.abs(delta))
				return delta;
				
			return add;
		}
		
		
	}

}