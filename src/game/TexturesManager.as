package game 
{
	import external.AssetStorage;
	import flash.display.BitmapData;
	import flash.display3D.textures.Texture;
	import flash.display3D.textures.TextureBase;
	import render2d.core.gl.Driver;
	import render2d.core.gl.texture.BitmapTexture;
	import render2d.core.gl.texture.TextureUploader;
	
	public class TexturesManager 
	{
		private var assetStorage:AssetStorage;
		
		private var texturesCache:Object = {};
		private var driver:Driver;
		
		public function TexturesManager(driver:Driver, assetStorage:AssetStorage) 
		{
			this.driver = driver;
			this.assetStorage = assetStorage;
		}
		
		public function getTexture(key:String, isUseMipMaps:Boolean = false):BitmapTexture
		{
			var texture:BitmapTexture = texturesCache[key];
			
			if (texture)
				return texture;
			else
				return uploadTextre(key, isUseMipMaps);
		}
		
		public function uploadTextre(key:String, isUseMipmaps:Boolean):BitmapTexture
		{
			var bitmap:BitmapData = assetStorage.getAsset(key) as BitmapData;
			
			var texture:BitmapTexture = driver.createBitmapTexture(bitmap, isUseMipmaps);
			texturesCache[key] = texture;
			
			return texture;
		}
		
	}

}