package game.scene 
{
	import data.AppData;
	import display.scene.SceneControllerBase;
	import game.BulletsLayer;
	import game.mobController.MobSpawner;
	import game.playerController.PlayerController;
	import game.actors.Actor;
	import render2d.core.display.background.Background;
	import render2d.core.materials.BaseMaterial;

	public class GameScene extends SceneControllerBase
	{
		private var playerUnit:Actor;
		private var playerController:PlayerController;
		private var mobSpawner:MobSpawner;
		private var gameSceneView:GameSceneView;
		
		public function GameScene(appData:AppData) 
		{
			gameSceneView = new GameSceneView(appData.driver);
			super(gameSceneView, appData);
			
			initialize();
		}
		
		private function initialize():void 
		{
			addLayer(new BulletsLayer(this, textureManager, appData));
			
			mobSpawner = new MobSpawner(this);
			
			var background:Background = new Background(appData.width, appData.height, new BaseMaterial(textureManager.getTexture("bg", true)));
			
			var uvScaleW:Number = appData.width / 2048;
			var uvScaleH:Number = appData.height / 2048;
			
			background.resize(appData.width, appData.height, uvScaleW, uvScaleH);
			background.scaleX = 1 * camera.wScreenSpaceRatio * uvScaleW;
			background.scaleY = 1 * camera.hScreenSpaceRatio * uvScaleH;
			
			playerUnit = new Actor(textureManager.getTexture("sample", true));
			playerController = new PlayerController(playerUnit, camera, appData.stage);
			
			gameSceneView.addRenderable(background);
			gameSceneView.addRenderable(playerUnit);
		}
		
		override protected function updateDisplayList(worldStep:WorldStep):void 
		{
			super.updateDisplayList(worldStep);
			
			camera.x = playerUnit.x;
			camera.y = playerUnit.y;
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			playerController.update(worldStep);
			mobSpawner.update(worldStep);
			
			super.update(worldStep);
		}
	}
}