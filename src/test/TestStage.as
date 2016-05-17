package test 
{
	import data.AppData;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	import render2d.core.cameras.Camera;
	import render2d.core.display.Mesh;
	import render2d.core.geometries.transform_inner;
	import render2d.core.gl.texture.BitmapTexture;
	import render2d.core.materials.BaseMaterial;
	import render2d.core.primitives.PlanePrimitive;
	import startUp.Context3DRequester;
	
	use namespace transform_inner;
	
	
	public class TestStage extends Sprite 
	{
		private var appData:AppData;
		private var renderable:Mesh;
		
		public function TestStage() 
		{
			super();
			
			appData = new AppData();
			
			var contet3DRequester:Context3DRequester = new Context3DRequester(stage, appData)
			contet3DRequester.addEventListener(Event.COMPLETE, onStage3DReady);
			contet3DRequester.requestContext();
		}
		
		private function onStage3DReady(e:Event):void 
		{
			renderable = new Mesh(new PlanePrimitive(), new BaseMaterial(appData.driver.createBitmapTexture(new BitmapData(128, 128, false, 0xFF0000))));
			renderable.scaleX = 0.5;
			renderable.scaleY = 0.5;
			renderable.transformMatrix.rotate(getTimer() / 10000);
			
			stage.addEventListener(Event.ENTER_FRAME, onFrameEnter);
		}
		
		private function onFrameEnter(e:Event):void 
		{
			appData.driver.clear();
			appData.driver.drawRenderable(renderable);
			appData.driver.present();
			
			trace(appData.driver.camera.transformMatrix);
			renderable.rotation++;
		}
		
	}

}