package game.actors 
{
	import game.actors.controller.ActorController;
	import game.actors.controller.MovementController;
	import render2d.core.display.Renderable;
	
	public class Actor extends Renderable implements IUpdatable
	{
		public var controllersList:Vector.<ActorController>
		
		public var actorData:ActorData;
		public var actorView:ActorView;
		
		public var moveController:MovementController;
		
		public function Actor(actorView:ActorView, actorData:ActorData) 
		{
			this.actorData = actorData;
			this.unitView = unitView;
			
			initialize();
		}
		
		public function setPosition(x:Number, y:Number):void
		{
			moveController.originX = x;
			moveController.originY = y;
			
			actorData.x = x;
			actorData.y = y;
		}
		
		public function moveTo(x:Number, y:Number):void
		{
			moveController.destinetionX = x;
			moveController.destinetionY = y;
		}
		
		private function initialize():void 
		{
			moveController = new MovementController();
			
			//moveController.originX = x;
			//moveController.originY = y;
			//moveController.destinetionX = x;
			//moveController.destinetionY = y;
		}
		
		override public function update(worldStep:WorldStep):void
		{
			var controllersLength:Number = controllersList.length;
			for (var i:int = 0; i < controllersLength; i++)
			{
				controllersList[i].update(worldStep);
			}
			
			//_rotationX = moveController.moveAngle;
			
			//actorData.x = moveController.originX;
			//actorData.y = moveController.originY;
		}
	}
}