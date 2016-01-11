package  
{
	public class StringFormat
	{
		private static var rpl_i:int = 0;
		static private var replies:Array;
		
		[Inline]
		private static function rpl(target:String, somearg2:String, somearg3:String, somearg4:String):String
		{
			if (target.length == 3)
				rpl_i = int(target.charAt(1));
			else
				rpl_i = int(target.charAt(1) + target.charAt(2));
				
			var a:String = replies[rpl_i];
			
			if (a == null)
				return '{param: '+rpl_i+' not defined}';
			else
				return a;
			
			
		}
		
		private static var standartRule:RegExp = /({\w*})+/g;
		public static function formatStanrartRule(str:String, ...replies:Array):String
		{
			return format(str, standartRule, replies);
		}
		
		public static function format(str:String, rule:RegExp, replies:Array):String
		{
			StringFormat.replies = replies;
			rpl_i = 0;
			return str.replace(rule, rpl);
		}
	}
	

}