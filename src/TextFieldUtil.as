package  
{
	import flash.events.Event;
	import flash.filters.BitmapFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class TextFieldUtil 
	{
		private static var format:TextFormat = new TextFormat("Verdana", 12, 0xFFFFFF, true, null, null, null, null);
		
		public function TextFieldUtil() 
		{
			
		}
		
		public static function createTextField(text:String, textFormat:TextFormat = null, filter:BitmapFilter = null):TextField
		{
			var textField:TextField = new TextField();
			
			if (textFormat == null)
				textFormat = format;
			
			textField.defaultTextFormat = textFormat;
			
			if(text.length > 0)
				textField.htmlText = text;
				
			textField.antiAliasType = "advanced";
			
			textField.sharpness = -50;
			textField.thickness = 30;
			
			textField.gridFitType = "subpixel";
			textField.multiline = true;
			textField.selectable = false;
			textField.mouseEnabled = false;
			textField.autoSize = TextFieldAutoSize.LEFT;
			//textField.embedFonts = true;
				
			if(filter)
				textField.filters = [filter];
			
			return textField;
		}
	}
}