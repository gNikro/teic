package game.actors.factory 
{
	import game.actors.Actor;
	import game.actors.ActorData;
	import game.actors.ActorView;
	import game.actors.controller.MovementController;
	import game.actors.MobileBase;
	import game.TexturesManager;
	
	public class ActorFactory 
	{
		private var textureManager:TexturesManager;
		
		public function ActorFactory(textureManager:TexturesManager) 
		{
			this.textureManager = textureManager;
		}
		
		public function createMobile(textureName:String):MobileBase
		{
			var actorData:ActorData = new ActorData();
			var actorView:ActorView = new ActorView(actorData, textureManager.getTexture("sample", true));
			var actor:MobileBase = new MobileBase(actorView, actorData);
			
			return actor;
		}
		
		public function createMobileActor(textureName:String):Actor
		{
			var actor:Actor = createActorWithTexture(textureName);
			actor.addController(new MovementController(actor.actorData));
			
			return actor;
		}
		
		public function createActorWithTexture(textureName:String):Actor
		{
			var actorData:ActorData = new ActorData();
			var actorView:ActorView = new ActorView(actorData, textureManager.getTexture("sample", true));
			var actor:Actor = new Actor(actorView, actorData);
			
			return actor;
		}
		
	}

}