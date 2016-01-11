package  
{
	/**
	 * ...
	 * @author Nikro
	 */
	public class WorldStep 
	{
		public var actualTime:Number = 0;
		public var time:Number = 0;
		public var dt:Number = 0;
		public var partOfSecond:Number = 0;
		
		public function WorldStep() 
		{
			
		}
		
		public function toString():String 
		{
			return "[WorldStep time=" + time + " dt=" + dt + " partOfSecond=" + partOfSecond + "]";
		}
		
	}

}