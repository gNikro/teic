package display.scene.layers 
{
	import game.actors.Actor;

	public class LayerBase implements IUpdatable
	{
		public var layerId:int;
		
		public var actorsList:Vector.<Actor> = new Vector.<Actor>();
		
		public function LayerBase(layerId:int) 
		{
			this.layerId = layerId;
		}
		
		public function addActor(actor:Actor):void
		{
			actorsList.push(actor);
		}
		
		public function removeActor(actor:Actor):void
		{
			actorsList.removeAt(actorsList.indexOf(actor));
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