package game.mobController 
{
	import flash.display3D.textures.Texture;
	import game.actors.Actor;
	
	public class AIMobile extends Actor 
	{
		
		public function AIMobile(texture:Texture) 
		{
			super(texture);
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			super.update(worldStep);
			
			moveTo(0, 0);
		}
	}

}