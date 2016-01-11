package 
{
	import render2d.core.materials.BaseMaterial;
	
	public class ColorUtil 
	{
		
		[Inline]
		public static function extractRed(c:int):int 
		{
			return ( c >> 16 ) & 0xFF;
		}
			 
		[Inline]
		public static function extractGreen(c:int):int 
		{
			return (c >> 8) & 0xFF;
		}
			 
		[Inline]
		public static function extractBlue(c:int):int 
		{
			return ( c & 0xFF );
		}
		
		[Inline]
		public static function setMaterialColor(color:int, material:BaseMaterial):void
		{
			material.useColor = true;
			
			material.a = 1;
			material.r = extractRed(color) / 0xFF;
			material.g = extractGreen(color) / 0xFF;
			material.b = extractBlue(color) / 0xFF;
		}
	}

}