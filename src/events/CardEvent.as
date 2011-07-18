package events
{
	import flash.events.Event;
	
	import models.CardVO;
	
	public class CardEvent extends Event
	{
		
		public static var CAST_UPGRADE:String = "cast upgrade";
		public static var SUMMON_UNIT:String = "summon unit";
		public static var ENLARGE:String = "enlarge";
		
		public var card:CardVO;	
		
		public function CardEvent(type:String, card:CardVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.card = card;
		}
	}
}