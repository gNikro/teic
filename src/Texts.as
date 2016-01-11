package 
{
	import controller.GameSettings;
	import data.CFGFile;
	import events.UtilityScope;
	import flash.events.DataEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Asfel
	 */
	public class Texts 
	{
		private var replaceRule:RegExp = /({\w*})+/g;
		private var cfgFile:CFGFile;
		
		public static var _instance:Texts;
		
		
		[Embed(source = "../bin/assets/config/text/ru_RU.cfg", mimeType = "application/octet-stream")]
		private var ru_RULang:Class;
		
		[Embed(source = "../bin/assets/config/text/en_EN.cfg", mimeType = "application/octet-stream")]
		private var en_ENLang:Class;
		
		[Embed(source = "../bin/assets/config/text/de_DE.cfg", mimeType = "application/octet-stream")]
		private var de_DELang:Class;
		
		public var ru_RU:CFGFile;
		public var en_EN:CFGFile;
		public var de_DE:CFGFile;
		
		public function Texts() 
		{
			ru_RU = new CFGFile(new ru_RULang);
			en_EN = new CFGFile(new en_ENLang);
			de_DE = new CFGFile(new de_DELang);
			
			cfgFile = this[GameSettings.instance.dataBase.lang]
			
			describe(UtilityScope, UtilityScope.CHANGE_LANGUAGE, onLanguageChange, 100);
		}
		
		private function onLanguageChange(e:DataEvent):void 
		{
			trace("change lang", e.data);
			cfgFile = this[e.data];
		}
		
		public static function get instance():Texts
		{
			if (!_instance)
				_instance = new Texts();
				
			return _instance;
		}
		
		public function getText(textLabel:String, ...values:Array):String
		{
			if (!cfgFile.containsText(textLabel))
				return "Missing text " + textLabel;
			else if (values && values.length > 0)
				return StringFormat.format(cfgFile.getText(textLabel), replaceRule, values);
			else
				return cfgFile.getText(textLabel);
		}
	}

}