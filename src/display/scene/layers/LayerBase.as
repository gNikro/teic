package display.scene.layers 
{
	import display.scene.SceneViewBase;
	import game.actors.Actor;

	public class LayerBase implements IUpdatable
	{
		public var layerId:int;
		
		public var actorsList:Vector.<Actor> = new Vector.<Actor>();
		
		public var sceneView:SceneViewBase;
		
		public function LayerBase(layerId:int) 
		{
			this.layerId = layerId;
		}
		
		public function addActor(actor:Actor):void
		{
			actorsList.push(actor);
			sceneView.addRenderable(actor.actorView);
		}
		
		public function removeActor(actor:Actor):void
		{
			actorsList.removeAt(actorsList.indexOf(actor));
			sceneView.removeRenderable(actor.actorView);
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