package game.mobController 
{
	import flash.display3D.textures.Texture;
	import game.scene.GameScene;

	public class MobSpawner implements IUpdatable
	{
		private var gameScene:GameScene;
		public var mobsList:Vector.<AIMobile> = new Vector.<AIMobile>;
		
		public function MobSpawner(gameScene:GameScene) 
		{
			this.gameScene = gameScene;
			
		}
		
		public function update(worldStep:WorldStep):void 
		{
			if (mobsList.length >= 10)
				return;
				
			spawnMob();
		}
		
		private function spawnMob():void 
		{
			var unit:AIMobile = new AIMobile(gameScene.textureManager.getTexture("sample", true) as Texture);
			
			unit.setPosition(-1000 + Math.random() * 2000, -1000 + Math.random() * 2000);
			
			mobsList.push(unit);
			
			//gameScene.addRenderable(unit);
			
			
		}
	}
}