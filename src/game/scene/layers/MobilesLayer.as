package game.scene.layers 
{
	import display.scene.layers.LayerBase;
	import game.actors.Actor;
	import game.actors.MobileBase;
	
	public class MobilesLayer extends LayerBase 
	{
		public static const IDENT:int = 1;
		
		public var mobiles:Vector.<MobileBase> = new Vector.<MobileBase>();
		
		public function MobilesLayer() 
		{
			super(IDENT);
		}
		
		override public function addActor(actor:Actor):void 
		{
			super.addActor(actor);
			
			var mobile:MobileBase = actor as MobileBase;
			mobiles.push(mobile);
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			super.update(worldStep);
		}
	}
}