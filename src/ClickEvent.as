package 
{
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	/**
	 * ...
	 * @author Asfel
	 */
	public class ClickEvent 
	{
		private static var mapToTouch:Boolean = true;
		
		public static function get MouseMove():String
		{
			//if(FlashVars.isMobile && mapToTouch)
			//	return TouchEvent.TOUCH_MOVE;
			//else
				return MouseEvent.MOUSE_MOVE;
		}

		public static function get ReleaseOutside():String
		{
			//if(FlashVars.isMobile && mapToTouch)
			//	return TouchEvent.TOUCH_OUT;
			//else
				return MouseEvent['RELEASE_OUTSIDE'];
		}
		
		public static function get MouseOver():String
		{
			//if(FlashVars.isMobile && mapToTouch)
			//	return TouchEvent.TOUCH_OVER;
			//else
				return MouseEvent.MOUSE_OVER;
		}
		
		public static function get MouseOut():String
		{
			
			//if(FlashVars.isMobile && mapToTouch)
			//	return TouchEvent.TOUCH_OUT;
			//else
				return MouseEvent.MOUSE_OUT;
		}
		
		public static function get MouseDown():String
		{
			//if(FlashVars.isMobile && mapToTouch)
			//	return TouchEvent.TOUCH_BEGIN;
			//else
				return MouseEvent.MOUSE_DOWN;
		}
		
		public static function get MouseUp():String
		{
			//if(FlashVars.isMobile && mapToTouch)
			//	return TouchEvent.TOUCH_END;
			//else
				return MouseEvent.MOUSE_UP;
		}
		
	}

}