package models
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class FighterVO extends EventDispatcher
	{
		
		public var id:int;
		public var fbid:String;
		public var status:String;
		public var health:int;
		public var mana:int;
		public var handCards:ArrayCollection;
		public var deckCards:ArrayCollection;
		public var spellCards:ArrayCollection;
		public var cemetryCards:ArrayCollection;
		public var unitCards:ArrayCollection;
		
		public var maxHandCards:int;
		public var maxUnitCards:int;
		
		public function FighterVO(maxHandCards:int = 5, maxUnitCards:int = 5, target:IEventDispatcher=null)
		{
			super(target);
			this.maxUnitCards = maxUnitCards;
			this.maxUnitCards = maxUnitCards;
			
			handCards = new ArrayCollection();
			deckCards = new ArrayCollection();
			spellCards = new ArrayCollection();
			cemetryCards = new ArrayCollection();
			unitCards = new ArrayCollection();
			
			for(var i:int = 0; i < maxUnitCards; i++){
				unitCards.addItem(new ArrayCollection());
			}
		}
		
		public function parseFighter(xml:XML):void {
			
			id = xml.attribute("id");
			mana = xml.attribute("mana");
			health = xml.attribute("health");
			status = xml.attribute("state");
			
			parseHandCards(xml);
			parseDeckCards(xml);
			parseUnitCards(xml);
			parseSpellCards(xml);
			parseCemeteryCards(xml);
		}
		
		public function parseHandCards(xml:XML):void{
			for each(var card:XML in xml.Hand.Card){
				handCards.addItem(new CardVO(card.id, card.targetID, card.mana, card.type, card.targetType, card.name, card.image, card.description, card.talent, card.health, card.attack));
			}
		}
		
		public function parseDeckCards(xml:XML):void{
			for each(var card:XML in xml.Deck.Card){
				deckCards.addItem(new CardVO(card.id, card.targetID, card.mana, card.type, card.targetType, card.name, card.image, card.description, card.talent, card.health, card.attack));
			}
		}
		
		public function parseUnitCards(xml:XML):void{
			var card:XML;
			var length:int = xml.Units.Card.length();
			for(var i:int = 0; i < length; i++){
				card = xml.Units.Card[i];
				unitCards[i].addItem(new CardVO(card.id, card.targetID, card.mana, card.type, card.targetType, card.name, card.image, card.description, card.talent, card.health, card.attack));
			}
		}
		
		public function parseSpellCards(xml:XML):void{
			for each(var card:XML in xml.Spells.Card){
				if(card.type == "Upgrade"){
					trace("upgrade found: " + card.name);
					for(var i:int = 0; i < 5; i++){
						if(unitCards[i].getItemAt(0).id == card.targetID){
							unitCards[i].addItem(new CardVO(card.id, card.targetID, card.mana, card.type, card.targetType, card.name, card.image, card.description, card.talent, card.health, card.attack));
							break;
						}
					}
				}
				else
					spellCards.addItem(new CardVO(card.id, card.targetID, card.mana, card.type, card.targetType, card.name, card.image, card.description, card.talent, card.health, card.attack));
			}
		}
		
		public function parseCemeteryCards(xml:XML):void{
			for each(var card:XML in xml.Cemetery.Card){
				cemetryCards.addItem(new CardVO(card.id, card.targetID, card.mana, card.type, card.targetType, card.name, card.image, card.description, card.talent, card.health, card.attack));
			}
		}
	}
}