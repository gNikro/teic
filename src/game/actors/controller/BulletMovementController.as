package game.actors.controller 
{
	import game.actors.ActorData;
	import render2d.utils.FastMath;
	
	public class BulletMovementController extends ActorController
	{
		public var destinetionX:Number = 0;
		public var destinetionY:Number = 0;
		
		public var currentX:Number = 0;
		public var currentY:Number = 0;
		
		public var maxSpeed:Number = 100;
		public var currentSpeed:Number = 0;
		public var speedDumping:Number = 0.95;
		public var speedAcceleration:Number = 0.1;
		
		public var moveAngle:Number = 0;
		public var moveAngleRad:Number = 0;
		
		private var actorData:ActorData;
		
		public function BulletMovementController(actorData:ActorData) 
		{
			super(0);
			
			this.actorData = actorData;
			
			currentX = actorData.x;
			currentY = actorData.y;
		}
		
		public function setPosition(x:Number, y:Number):void 
		{
			currentX = x;
			currentY = y;
		}
		
		public function moveTo(x:Number, y:Number):void 
		{
			destinetionX = x;
			destinetionY = y;
			
			moveAngleRad = FastMath.angle(currentX, currentY, x, y);
			moveAngle = FastMath.convertToDegree(moveAngleRad);
			
			actorData.angle = moveAngle;
			actorData.angleRad = moveAngleRad;
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			var deltaX:Number = (destinetionX - currentX);
			var deltaY:Number = (destinetionY - currentY);
			
			var length:Number = (deltaX * deltaX) + (deltaY * deltaY)// + (1);
		
			if (length > 5000)
			{
				this.currentSpeed += maxSpeed * speedAcceleration;
				
				if (this.currentSpeed > maxSpeed)
					this.currentSpeed = maxSpeed;
					
				
			}
			else
			{
				
				this.currentSpeed *= speedDumping;
				
				if (length <= 0)
				{
					
					return;
				}
					
			}
			
			var currentSpeed:Number = this.currentSpeed * worldStep.partOfSecond;
			
			length = Math.sqrt(length);
				
			var addX:Number = interpolate(deltaX, currentSpeed, length);
			var addY:Number = interpolate(deltaY, currentSpeed, length);
			
			if (currentX != destinetionX)
			{
				currentX += addX;
			}
				
			if (currentY != destinetionY)
			{
				currentY += addY;
			}
			
			actorData.x = currentX;
			actorData.y = currentY;
		}
		
		[Inline]
		public final function interpolate(delta:Number, interpolationFactor:Number, length:Number):Number
		{
			var add:Number = interpolationFactor * delta / length;
			
			if (FastMath.absNumber(add) > FastMath.absNumber(delta))
				return delta;
				
			return add;
		}
		
		
	}

}