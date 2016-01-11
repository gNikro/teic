package  
{
	import flash.display.DisplayObject;
	import flash.geom.Point;

	public class MathUtils 
	{
		[Inline]
		public static function isInside(x:Number, y:Number, obj:DisplayObject):Boolean
		{
			trace(x, y, obj.x, obj.y, obj.width, obj.height);
			return x > obj.x && x < obj.width + obj.x && y > obj.y && y < obj.height + obj.y
		}
		
		
		[Inline]
		public static function poinAdd(interestPoint:Point, addPoint:Point):void//Сложение поинтов без алокейта
		{
			interestPoint.x += addPoint.x;
			interestPoint.y += addPoint.y;
		}
		
		[Inline]
		public static function pointSubstarct(interestPoint:Point, addPoint:Point):void//Вычитание поинтов без алокейта
		{
			interestPoint.x -= addPoint.x;
			interestPoint.y -= addPoint.y;
		}
		
	}

}