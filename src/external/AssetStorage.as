package external 
{
	
	public class AssetStorage 
	{
		private var dataMap:Object = { };
		
		public function AssetStorage() 
		{
			
		}
		
		public function addAsset(assetKey:String, asset:Object):void
		{
			dataMap[assetKey] = asset;
		}
		
		public function getAsset(assetKey:String):Object
		{
			return dataMap[assetKey];
		}
	}

}