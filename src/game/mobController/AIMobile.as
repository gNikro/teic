package game.mobController 
{
	import game.actors.Actor;
	import game.actors.ActorData;
	import game.actors.ActorView;
	
	public class AIMobile extends Actor 
	{
		
		public function AIMobile(actorView:ActorView, actorData:ActorData) 
		{
			super(actorView, actorData);
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			super.update(worldStep);
		}
	}
}