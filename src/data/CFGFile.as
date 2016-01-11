package data 
{
	import flash.system.System;
	/**
	 * ...
	 * @author Asfel
	 */
	public class CFGFile 
	{
		private var map:Object = { };
		
		private var soruce:String;
		
		public function CFGFile(soruce:String = '') 
		{
			parse(soruce);
		}
		
		public function containsText(key:String):Boolean
		{
			if (!(key in map))
				trace("missing text", key);
				
			return key in map;
		}
		
		public function getText(key:String):String
		{
			
			return map[key];
		}
		
		private function parse(source:String):void 
		{
			this.soruce = soruce;
			
			var parts:Array = source.split("\r\n");
			
			for (var i:int = 0; i < parts.length; i++)
			{
				var valuePair:String = parts[i];
				
				if (valuePair.length < 3)
				{
					continue;
				}
					
				var separatorIndex:int = valuePair.indexOf('=');
				var key:String = valuePair.substr(0, separatorIndex);
				var value:String = valuePair.substr(separatorIndex + 1).split("|").join(String.fromCharCode(13)).split("//")[0];
				
				map[key] = value;
			}
		}
		
	}

}