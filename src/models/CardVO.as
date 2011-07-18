package models
{
	import flash.display.Bitmap;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Bindable]
	public class CardVO extends EventDispatcher
	{
		public var id:int;
		public var targetID:int;
		public var mana:int;
		public var type:String;
		public var targetType:String;
		public var name:String;
		public var imageURL:String;
		public var image:Bitmap;
		public var description:String;
		public var talent:String;
		public var state:String;
		public var health:int;
		public var attack:int;
		
		public function CardVO(id:int = -1, targetID:int = -1, mana:int = -1, type:String = "", targetType:String = "", name:String = "", imageURL:String = "", description:String = "", talent:String = "", state:String = "", health:int = -1, attack:int = -1, iEventDispatcherTarget:IEventDispatcher=null)
		{
			super(iEventDispatcherTarget);
			this.id = id;
			this.targetID = targetID;
			this.mana = mana;
			this.type = type;
			this.targetType = targetType;
			this.name = name;
			this.imageURL = imageURL;
			this.description = description;
			this.talent = talent;
			this.state = state;
			this.health = health;
			this.attack = attack;
		}
	}
}