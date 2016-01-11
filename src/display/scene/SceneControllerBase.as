package display.scene 
{
	import data.AppData;
	import display.scene.layers.LayerBase;
	import game.scene.layers.MobilesLayer;
	import game.actors.Actor;
	import game.TexturesManager;
	import game.actors.MobileBase;
	import render2d.core.cameras.Camera;
	import render2d.core.display.Renderable;
	import render2d.core.gl.texture.TextureUploader;
	import render2d.core.gl.Driver;
	
	public class SceneControllerBase implements IUpdatable
	{
		private var sceneView:SceneViewBase;
		
		protected var textureManager:TexturesManager;
		
		protected var appData:AppData;
		
		protected var layers:Vector.<LayerBase> = new Vector.<LayerBase>;
		protected var layersMap:Object = {};
		
		protected var camera:Camera;
		
		public function SceneControllerBase(sceneView:SceneViewBase, appData:AppData) 
		{
			this.sceneView = sceneView;
			this.appData = appData;
			
			camera = sceneView.camera;
			
			textureManager = new TexturesManager(sceneView.driver, appData.assets);
		}
		
		public function addActor(actor:Actor, layerId:int = 0):void
		{
			var layer:LayerBase = layersMap[layerId];
			layer.addActor(actor);
			
			sceneView.addRenderable(actor.actorView);
		}
		
		public function addLayer(layer:LayerBase):void
		{
			layers.push(layer);
			layersMap[layer.layerId] = layer;
		}
		
		public function update(worldStep:WorldStep):void 
		{
			updateLayers(worldStep);
			updateView(worldStep);
		}	
		
		protected function updateLayers(worldStep:WorldStep):void
		{
			var layersLength:Number = layers.length;
			for (var i:int = 0; i < layersLength; i++)
			{
				layers[i].update(worldStep);
			}
		}
		
		protected function updateView(worldStep:WorldStep):void
		{
			sceneView.update(worldStep);
		}
	}
}