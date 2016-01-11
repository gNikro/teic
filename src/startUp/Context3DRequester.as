package startUp 
{
	import data.AppData;
	import flash.display.Stage;
	import flash.display.StageQuality;
	import flash.display3D.Context3DProfile;
	import flash.display3D.Context3DRenderMode;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import render2d.core.gl.Driver;
	
	public class Context3DRequester extends EventDispatcher
	{
		private var stage:Stage;
		private var appData:AppData;
		
		public function Context3DRequester(stage:Stage, appData:AppData) 
		{
			this.appData = appData;
			this.stage = stage;
		}
		
		public function requestContext():void
		{
			stage.quality = StageQuality.LOW;
			
			stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, onContextCreated);
			stage.stage3Ds[0].requestContext3D(Context3DRenderMode.AUTO, Context3DProfile.BASELINE);
		}
		
		private function onContextCreated(e:Event):void 
		{
			var driver:Driver = new Driver(stage.stage3Ds[0].context3D);
			driver.configureBackbuffer(stage.stageWidth, stage.stageHeight, 0);
			appData.driver = driver;
			
			dispatchEvent(new Event(Event.COMPLETE));

			//appData.timeController = timeController;
		}
	}
}