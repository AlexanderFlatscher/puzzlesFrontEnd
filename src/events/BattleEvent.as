package events
{
	import flash.events.Event;
	
	public class BattleEvent extends Event
	{
		
		public static var OPEN_BATTLE:String = "open battle";
		public static var CLOSE_BATTLE:String = "close battle";
		
		public var battleId:int;		
		public function BattleEvent(type:String, battleId:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.battleId = battleId;
		}
	}
}