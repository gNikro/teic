package game.actors 
{
	import game.actors.controller.MovementController;
	
	public class MobileBase extends Actor
	{
		public function MobileBase(actorView:ActorView, actorData:ActorData) 
		{
			super(actorView, actorData)
			
			initialize();
		}
		
		private function initialize():void 
		{
			addController(new MovementController(actorData));
		}
	}

}