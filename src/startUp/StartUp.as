package startUp 
{
	import broadcasting.BroadcastingManager;
	import data.AppData;
	import display.DisplayManager;
	import events.PlayerControllerScope;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import game.scene.GameScene;
	
	[SWF(width = '1024', height = '600', backgroundColor = '0xCCCCCC', frameRate = '60')]
	public class StartUp extends Sprite 
	{
		private var preloader:startUp.Preloader;
		private var appData:AppData;
		
		public function StartUp() 
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			preloader = new startUp.Preloader();
			
			preloader.addEventListener(Event.COMPLETE, onAssetComplete);
			
			addChild(preloader);
			
			preloader.load();
		}
		
		private function onAssetComplete(e:Event):void 
		{
			regiestScopes();
			
			appData = new AppData();
			
			appData.width = stage.stageWidth;
			appData.height = stage.stageHeight;
			appData.assets = preloader.assetLoader.loadedAssets;
			appData.stage = stage;
			
			removeChild(preloader);
			
			var context3DRequester:Context3DRequester = new Context3DRequester(stage, appData);
			context3DRequester.addEventListener(Event.COMPLETE, onContextReady);
			
			context3DRequester.requestContext();
		}
		
		private function onContextReady(e:Event):void 
		{
			var displayManager:DisplayManager = new DisplayManager(stage, appData);
			displayManager.showScene(new GameScene(appData));
		}
		
		private function regiestScopes():void 
		{
			BroadcastingManager.instance.registerScope(PlayerControllerScope);
		}
	}
}