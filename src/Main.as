package
{
	import data.AppData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.StageWebView;
	import flash.media.StageWebView;
	import game.scene.GameScene;
	import render2d.core.gl.Driver;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, onContextCreated);
			stage.stage3Ds[0].requestContext3D();
			
		}
		
		private function onContextCreated(e:Event):void 
		{
			var driver:Driver = new Driver(stage.stage3Ds[0].context3D);
			driver.configureBackbuffer(stage.stageWidth, stage.stageHeight, 0);
			
			var appData:AppData = new AppData();
			appData.width = stage.stageWidth;
			appData.height = stage.stageHeight;
			
			
			var gameScene:GameScene = new GameScene(driver, appData)
		}
		
	}
	
}