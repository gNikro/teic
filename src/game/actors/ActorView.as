package game.actors 
{
	import flash.display3D.Context3DMipFilter;
	import flash.display3D.Context3DTextureFilter;
	import flash.display3D.Context3DWrapMode;
	import render2d.core.display.BlendMode;
	import render2d.core.display.Renderable;
	import render2d.core.gl.texture.BitmapTexture;
	import render2d.core.materials.BaseMaterial;
	import render2d.core.primitives.PlanePrimitive;
	import render2d.core.renderers.SamplerData;
	
	public class ActorView extends Renderable 
	{
		private static const geom:PlanePrimitive = new PlanePrimitive();
		private static const sampler:SamplerData = new SamplerData(Context3DWrapMode.CLAMP, Context3DTextureFilter.LINEAR, Context3DMipFilter.MIPLINEAR);
		
		private var texture:BitmapTexture;
		
		private var actorData:ActorData;
		
		public function ActorView(actorData:ActorData, texture:BitmapTexture) 
		{
			super();
			
			this.texture = texture;
			this.actorData = actorData;
			
			initialize();
		}
		
		private function initialize():void 
		{
			geometry = geom;
			material = new BaseMaterial(texture);
			material.blendMode = BlendMode.ALPHA2;
			material.samplerData = sampler;
			
			scaleX = 50;
			scaleY = 50;
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			super.update(worldStep);
			
			x = actorData.x;
			y = actorData.y;
		}
		
		override public function copyTransformTo(constantsVector:Vector.<Number>, registerIndex:int):void 
		{
			constantsVector[registerIndex++] = x;
			constantsVector[registerIndex++] = y;
			
			constantsVector[registerIndex++] = scaleX;
			constantsVector[registerIndex++] = scaleY;
			
			//trace(actorData.angle, actorData.angleRad);
			constantsVector[registerIndex++] = Math.cos(actorData.angleRad);
			constantsVector[registerIndex++] = Math.sin(actorData.angleRad);
		}
	}

}