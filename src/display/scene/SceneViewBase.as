package display.scene 
{
	import render2d.core.cameras.Camera;
	import render2d.core.display.Renderable;
	import render2d.core.gl.Driver;

	public class SceneViewBase 
	{
		public var camera:Camera;
		public var driver:Driver;
		
		protected var displayList:Vector.<Renderable> = new Vector.<Renderable>;
		
		public function SceneViewBase(driver:Driver) 
		{
			this.driver = driver;
			this.camera = driver.camera;
		}
		
		public function addRenderable(renderable:Renderable):void
		{
			displayList.push(renderable);
		}
		
		public function removeRenderable(renderable:Renderable):void 
		{
			displayList.removeAt(displayList.indexOf(renderable));
		}
		
		public function update(worldStep:WorldStep):void 
		{
			driver.clear();
			
			var length:Number = displayList.length;
			for (var i:int = 0; i < length; i++)
			{
				displayList[i].update(worldStep);
				driver.drawRenderable(displayList[i]);
			}
			
			driver.present();
		}	
	}
}