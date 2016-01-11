package display.scene.layers 
{
	import game.actors.Actor;

	public class LayerBase implements IUpdatable
	{
		private var actorsList:Vector.<Actor> = new Vector.<Actor>();
		
		public function LayerBase() 
		{
			
		}
		
		public function addActor(actor:Actor):void
		{
			actorsList.push(actor);
		}
		
		public function removeActor(actor:Actor):void
		{
			
		}
		
		public function update(worldStep:WorldStep):void 
		{
			var actorsLength:Number = actorsList.length;
			
			for (var i:int = 0; i < actorsLength; i++)
			{
				actorsList[i].update(worldStep);
			}
		}
	}
}