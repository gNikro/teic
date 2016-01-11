package game.scene 
{
	import data.AppData;
	import display.scene.SceneControllerBase;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import game.actors.ActorData;
	import game.actors.controller.MovementController;
	import game.actors.factory.ActorFactory;
	import game.actors.factory.BulletsFactory;
	import game.scene.layers.BulletsLayer;
	import game.mobController.MobSpawner;
	import game.playerController.PlayerController;
	import game.actors.Actor;
	import game.scene.layers.MobilesLayer;
	import render2d.core.display.background.Background;
	import render2d.core.materials.BaseMaterial;

	public class GameScene extends SceneControllerBase
	{
		private var playerUnit:Actor;
		private var playerController:PlayerController;
		private var mobSpawner:MobSpawner;
		private var gameSceneView:GameSceneView;
		
		private var moveController:MovementController;
		private var isMouseDown:Boolean;
		private var stage:Stage;
		
		
		private var bulletsFactory:BulletsFactory;
		private var actorFactory:ActorFactory;
		private var playerActor:Actor;
		
		public function GameScene(appData:AppData) 
		{
			gameSceneView = new GameSceneView(appData.driver);
			super(gameSceneView, appData);
			
			initialize();
		}
		
		private function initialize():void 
		{
			var mobilesLayer:MobilesLayer = new MobilesLayer();
			addLayer(mobilesLayer);
			addLayer(new BulletsLayer(mobilesLayer.actorsList));
			
			this.stage = appData.stage;
			
			mobSpawner = new MobSpawner(this);
			
			var background:Background = new Background(appData.width, appData.height, new BaseMaterial(textureManager.getTexture("bg", true)));
			
			var uvScaleW:Number = appData.width / 2048;
			var uvScaleH:Number = appData.height / 2048;
			
			background.resize(appData.width, appData.height, uvScaleW, uvScaleH);
			background.scaleX = 1 * camera.wScreenSpaceRatio * uvScaleW;
			background.scaleY = 1 * camera.hScreenSpaceRatio * uvScaleH;
			
			gameSceneView.addRenderable(background);
			
			
			actorFactory = new ActorFactory(textureManager);
			bulletsFactory = new BulletsFactory(textureManager, appData);
			
			
			playerActor = actorFactory.createMobile("sample");
			addActor(playerActor, MobilesLayer.IDENT);
			
			
			moveController = playerActor.getController(0) as MovementController;
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				addActor(bulletsFactory.createLinearBullet(playerActor, 0), BulletsLayer.IDENT);
			}
		}
		
		private function onMouseUp(e:MouseEvent):void 
		{
			isMouseDown = false;
		}
		
		private function onMouseDown(e:MouseEvent):void 
		{
			isMouseDown = true;
			calculateMove();
		}
		
		private function calculateMove():void
		{
			var x:Number = (stage.mouseX - stage.stageWidth / 2) + camera.x;
			var y:Number = (stage.mouseY - stage.stageHeight / 2) + camera.y;
			
			moveController.moveTo(x, y);
		}
		
		override protected function updateLayers(worldStep:WorldStep):void 
		{
			super.updateLayers(worldStep);
		}
		
		override protected function updateView(worldStep:WorldStep):void 
		{
			camera.x = moveController.currentX;
			camera.y = moveController.currentY;
			
			super.updateView(worldStep);
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			if (isMouseDown)
			{
				calculateMove();
			}
			
			super.update(worldStep);
		}
	}
}