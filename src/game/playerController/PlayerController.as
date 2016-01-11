package game.playerController 
{
	import events.PlayerControllerScope;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import game.scene.layers.BulletsLayer;
	import game.actors.Actor;
	import render2d.core.cameras.Camera;
	
	public class PlayerController implements IUpdatable
	{
		private var gameUnit:Actor;
		private var stage:Stage;
		private var camera:Camera;
		
		private var isMouseDown:Boolean = false;
		
		public function PlayerController(gameUnit:Actor, camera:Camera, stage:Stage) 
		{
			this.camera = camera;
			this.stage = stage;
			this.gameUnit = gameUnit;
			
			//stage.addEventListener(MouseEvent.MOUSE_DOWN, onFollowMouse);
			stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, onMouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			//stage.addEventListener(MouseEvent.MOUSE_MOVE, onFollowMouse);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				PlayerControllerScope.SHOT.owner = gameUnit;
				broadcast(PlayerControllerScope, PlayerControllerScope.SHOT);
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
		
		public function update(e:WorldStep):void 
		{
			if (!isMouseDown)
				return;
				
			calculateMove();
		}
		
		private function calculateMove():void
		{
			var x:Number = (stage.mouseX - stage.stageWidth / 2) + camera.x;
			var y:Number = (stage.mouseY - stage.stageHeight / 2) + camera.y;
			
			//gameUnit.moveController.moveTo(x, y);
		}
	}
}