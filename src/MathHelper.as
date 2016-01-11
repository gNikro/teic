package game 
{
	/**
	 * ...
	 * @author Asfel
	 */
	public class MathHelper 
	{
		
		[Inline]
		public static function isInRectangle(x1:Number, x2:Number, y1:Number, y2:Number, minX:Number, maxX:Number, minY:Number, maxY:Number):Boolean
		{
			return ((x1 < minX || x2 > maxX) || (y1 < minY || y2 > maxY));
		}
		
	}

}