package game.actors.collider 
{
	import game.actors.ActorData;

	public class Collider 
	{
		public var actorData:ActorData;
		
		public function Collider(actorData:ActorData) 
		{
			this.actorData = actorData;
			
		}
		
		public function collideWith(collider:Collider):Boolean
		{
			return false;
		}
		
	}
}