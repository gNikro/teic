package display 
{
	import data.AppData;
	import flash.display.Stage;
	import flash.events.Event;
	import render2d.core.display.Scene;
	import display.scene.SceneControllerBase;

	public class DisplayManager 
	{
		private var timeController:WorldTimeController = new WorldTimeController();
			
		private var stage:Stage;
		
		private var currentScene:SceneControllerBase;
		private var appData:AppData;
		
		public function DisplayManager(stage:Stage, appData:AppData) 
		{
			this.appData = appData;
			this.stage = stage;
			
			
			initialize();
		}
		
		private function initialize():void 
		{
			appData.timeController = timeController;
			stage.addEventListener(Event.ENTER_FRAME, onUpdate);
		}
		
		public function showScene(scene:SceneControllerBase):void
		{
			currentScene = scene;
		}
		
		private function onUpdate(e:Event):void 
		{
			timeController.updateTime();
			
			if(currentScene)
				currentScene.update(timeController.worldStep);
		}
		
	}

}