package models
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class CardVO extends EventDispatcher
	{
		[Bindable]
		public var name:String;
		[Bindable]
		public var color:uint;
		[Bindable]
		public var imageURL:String;
		[Bindable]
		public var backImageUrl:String;
		
		public function CardVO(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}