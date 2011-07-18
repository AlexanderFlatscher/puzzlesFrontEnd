package models
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Bindable]
	public class ChallengeVO extends EventDispatcher
	{
		public var fromFBID:String;
		public var fromName:String;
		public var rid:String;
		
		public function ChallengeVO(challenge:Object = null, target:IEventDispatcher=null)
		{
			super(target);
			
			if(challenge){
				fromFBID = challenge.from.id;
				fromName = challenge.from.name;
				rid = challenge.id;
			}
		}
	}
}