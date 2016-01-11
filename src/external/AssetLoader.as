package external 
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLStream;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	public class AssetLoader extends EventDispatcher
	{
		public var loadedAssets:AssetStorage = new AssetStorage();
		public var currentLoading:String = "";
		
		private var loadQue:Vector.<String> = new Vector.<String>;
		private var filesLoaded:int = 0;
		private var filesTotal:int = 0;
		
		
		private var isLoadInProgress:Boolean = false;
		
		private var contentLoader:Loader = new Loader();
		private var binaryLoader:URLStream = new URLStream();
		private var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
		
		private var contentFilesMap:Object = { jpg:"jpg", png:"png" };
		private var urlRequest:URLRequest = new URLRequest();
		
		public function AssetLoader() 
		{
			initalize();
		}
		
		private function initalize():void 
		{
			contentLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loadProgress);
			contentLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			
			
			binaryLoader.addEventListener(ProgressEvent.PROGRESS, loadProgress);
			binaryLoader.addEventListener(Event.COMPLETE, loadComplete);
		}
		
		public function addToQueue(filePath:String):void
		{
			loadQue.push(filePath);
			filesTotal++;
		}
		
		public function load():void
		{
			loadNext();
		}
		
		private function loadNext():void 
		{
			if (isLoadInProgress)
				return;
				
			currentLoading = loadQue.shift();
			var extension:String = currentLoading.substr(currentLoading.length - 3, 3);
			var isContent:Boolean = contentFilesMap[extension] != null;

			urlRequest.url = currentLoading;
			
			if (isContent)
			{
				contentLoader.load(urlRequest, loaderContext);
			}
			else
			{
				//urlRequest.requestHeaders = [new URLRequestHeader("Content-Length", "80000")];
				binaryLoader.load(urlRequest);
			}
		}
		
		private function loadComplete(e:Event):void 
		{
			filesLoaded++;
			dispatchEvent(new AssetProgressEvent(AssetProgressEvent.ASSET_PROGRESS_EVENT, false, false, filesLoaded, filesTotal));
			
			var loader:Object = e.target;
			
			var slashIndex:int = currentLoading.indexOf("/") + 1;
			currentLoading = currentLoading.substring(slashIndex, currentLoading.length - 4);//currentLoading.substr(currentLoading.lastIndexOf('/') + 1);
			
			if (loader == binaryLoader)
			{
				var data:ByteArray = new ByteArray();
				binaryLoader.readBytes(data, 0, binaryLoader.bytesAvailable);
				
				loadedAssets.addAsset(currentLoading, data);
			}
			else
			{
				if (contentLoader.content is Bitmap)
					loadedAssets.addAsset(currentLoading, (contentLoader.content as Bitmap).bitmapData);
				else
					loadedAssets.addAsset(currentLoading, contentLoader.content);
			}
				
			if (loadQue.length == 0)
			{
				finishLoading();
				return;
			}
			else
			{
				
				loadNext();
			}
		}
		
		private function finishLoading():void 
		{
			dispatchEvent(new AssetProgressEvent(AssetProgressEvent.ASSET_LOADING_COMPLETE, false, false, filesLoaded, filesTotal));
		}
		
		private function loadProgress(e:ProgressEvent):void 
		{
			//trace(binaryLoader.bytesAvailable);
			dispatchEvent(e);
		}
		
	}

}