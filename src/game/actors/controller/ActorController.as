package game.actors.controller 
{
	public class ActorController implements IUpdatable
	{
		public var id:int;
		
		public function ActorController(id:int) 
		{
			this.id = id;
		}
		
		public function update(worldStep:WorldStep):void 
		{
			
		}
	}
}