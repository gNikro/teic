package data 
{
	import external.AssetStorage;
	import flash.display.Stage;
	import render2d.core.gl.Driver;
	public class AppData 
	{
		
		public var width:Number;
		public var height:Number;
		public var assets:AssetStorage;
		public var stage:Stage;
		public var driver:Driver;
		public var timeController:WorldTimeController;
		
		public function AppData() 
		{
			
		}
		
	}

}