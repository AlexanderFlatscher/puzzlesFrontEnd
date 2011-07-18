package events
{
	import flash.events.Event;
	
	public class ChallengeEvent extends Event
	{
		public var rid:String;
		public static var ACCEPT:String = "accept";
		public static var DECLINE:String = "decline";
		
		public function ChallengeEvent(type:String, rid:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.rid = rid;
		}
	}
}