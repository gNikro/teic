package events 
{
	import flash.events.Event;
	
	public class MenuEvent extends Event 
	{
		public static const START_GAME:String = "startGame";
		
		
		public function MenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
		override public function clone():Event 
		{
			return new MenuEvent(type, bubbles, cancelable);
		}
	}

}