package external 
{
	import flash.events.Event;
	
	public class AssetProgressEvent extends Event 
	{
		public static const ASSET_PROGRESS_EVENT:String = "assetProgressEvent";
		static public const ASSET_LOADING_COMPLETE:String = "assetLoadingComplete";
		
		public var filesLoaded:int;
		public var filesTotal:int;
		
		public function AssetProgressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, filesLoaded:int = 0, filesTotal:int = 0) 
		{
			super(type, bubbles, cancelable);
			
			this.filesTotal = filesTotal;
			this.filesLoaded = filesLoaded;
		}
		
		override public function clone():Event 
		{
			return new AssetProgressEvent(type, bubbles, cancelable, filesLoaded, filesTotal);
		}
		
	}

}