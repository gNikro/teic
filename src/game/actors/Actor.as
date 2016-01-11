package game.actors 
{
	import game.actors.collider.CircleCollider;
	import game.actors.collider.Collider;
	import game.actors.controller.ActorController;
	
	public class Actor implements IUpdatable
	{
		protected var controllersList:Vector.<ActorController>
		protected var controllersMap:Object = {};
		
		public var actorData:ActorData;
		public var actorView:ActorView;
		public var collider:Collider;
		
		public function Actor(actorView:ActorView, actorData:ActorData, collider:Collider = null) 
		{
			this.actorData = actorData;
			this.actorView = actorView;
			
			if (collider == null)
				this.collider = new CircleCollider(actorData, (actorView.scaleX + actorView.scaleY) / 2);
			else
				this.collider = collider;
			
			initialize();
		}
		
		public function addController(controller:ActorController):void
		{
			controllersList.push(controller);
			controllersMap[controller.id] = controller;
		}
		
		public function getController(id:int):ActorController
		{
			return controllersMap[id];
		}
		
		private function initialize():void 
		{
			controllersList = new Vector.<ActorController>();
		}
		
		public function update(worldStep:WorldStep):void
		{
			var controllersLength:Number = controllersList.length;
			
			for (var i:int = 0; i < controllersLength; i++)
			{
				controllersList[i].update(worldStep);
			}
		}
	}
}