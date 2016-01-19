package startUp 
{
	import external.AssetLoader;
	import external.AssetProgressEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import game.scene.GameScene;
	
	public class Preloader extends Sprite 
	{
		public var assetLoader:AssetLoader;
		
		private var currentFilePart:Number = 0;
		private var allFilesPart:Number = 0;
		
		private var size:Number = 0;
		private var overalLoadingProgress:TextField;
		private var fileLoadingProgress:TextField;
		
		public function Preloader() 
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function load():void 
		{
			assetLoader.addToQueue("assets/bg.jpg");
			assetLoader.addToQueue("assets/sample.jpg");
			assetLoader.addToQueue("assets/shape.png");
			assetLoader.addToQueue("assets/doge.png");
			
			assetLoader.load();
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			assetLoader = new AssetLoader();
			
			size = stage.stageWidth / 2;
			
			var textFormat:TextFormat = new TextFormat("FixedSys", 10, 0xFFFFFF);
			overalLoadingProgress = new TextField();
			overalLoadingProgress.defaultTextFormat = textFormat;
			fileLoadingProgress = new TextField();
			fileLoadingProgress.defaultTextFormat = textFormat;
			overalLoadingProgress.text = "0%";
			fileLoadingProgress.text = "0%";
			
			overalLoadingProgress.autoSize = TextFieldAutoSize.LEFT;
			fileLoadingProgress.autoSize = TextFieldAutoSize.LEFT;
			
			overalLoadingProgress.selectable = false;
			fileLoadingProgress.selectable = false;
			
			addChild(overalLoadingProgress);
			addChild(fileLoadingProgress);
			
			initialize();
		}
		
		private function initialize():void 
		{
			assetLoader.addEventListener(AssetProgressEvent.ASSET_PROGRESS_EVENT, onAssetProgress);
			assetLoader.addEventListener(AssetProgressEvent.ASSET_LOADING_COMPLETE, onAssetComplete);
			assetLoader.addEventListener(ProgressEvent.PROGRESS, onFileProgress);
			
			addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		private function onFrame(e:Event):void
		{
			this.graphics.clear();
			
			
			var xx:Number = (stage.stageWidth - size) / 2;
			var yy:Number = stage.stageHeight / 2 - 50;
			
			overalLoadingProgress.x = xx;
			overalLoadingProgress.y = yy - overalLoadingProgress.textHeight - 12;
			
			fileLoadingProgress.x = xx;
			
			
			overalLoadingProgress.text = Math.floor(allFilesPart * 100) + "%";
			fileLoadingProgress.text = assetLoader.currentLoading + " " + Math.floor(currentFilePart * 100) + "%";
			
			var lineSize:int = 20;
			
			this.graphics.lineStyle(0, 0xFFFFFF, 0);
			this.graphics.beginFill(0xFFFFFF);
			this.graphics.drawRect(xx, yy, size * allFilesPart, lineSize);
			
			lineSize = 10;
			
			this.graphics.lineStyle(1, 0xFFFFFF);
			this.graphics.endFill()
			this.graphics.drawRect(xx - lineSize, yy - lineSize, size * 1 + lineSize + lineSize, lineSize + lineSize + lineSize + lineSize);
			
			lineSize = 4;
			yy += 60;
			
			fileLoadingProgress.y = yy - fileLoadingProgress.textHeight - 8;
			
			this.graphics.lineStyle(0, 0xFFFFFF, 0);
			this.graphics.beginFill(0xFFFFFF);
			this.graphics.drawRect(xx, yy, size * currentFilePart, lineSize);
			
			this.graphics.lineStyle(1, 0xFFFFFF);
			this.graphics.endFill()
			this.graphics.drawRect(xx - lineSize, yy - lineSize, size * 1 + lineSize + lineSize, lineSize + lineSize + lineSize);
		}
		
		private function onFileProgress(e:ProgressEvent):void 
		{
			currentFilePart = e.bytesLoaded / e.bytesTotal;
			
			if (currentFilePart == Number.POSITIVE_INFINITY)
				currentFilePart = 0;
		}
		
		private function onAssetProgress(e:AssetProgressEvent):void 
		{
			allFilesPart = e.filesLoaded / e.filesTotal;
		}
		
		private function onAssetComplete(e:AssetProgressEvent):void 
		{
			removeEventListener(Event.ENTER_FRAME, onFrame);
			graphics.clear();
			
			while (numChildren)
				removeChildAt(0);
				
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}

}