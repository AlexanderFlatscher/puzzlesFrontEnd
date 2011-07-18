package layouts
{
	import mx.core.ILayoutElement;
	
	import spark.layouts.supportClasses.LayoutBase;
	
	public class OverlapCardsLayout extends LayoutBase
	{
		public var overlap:int = 11;
		
		public function OverlapCardsLayout()
		{
			super();
		}
		
		override public function updateDisplayList(width:Number, height:Number):void {
			super.updateDisplayList(width, height);
			
			var count:int = target.numElements;
			for(var i:int = count - 1; i >= 0; i--){
				var element:ILayoutElement = (useVirtualLayout ? target.getVirtualElementAt(i) : target.getElementAt(i));
				
				element.setLayoutBoundsSize(NaN, NaN);
				element.setLayoutBoundsPosition(0, i * overlap);
				
			}
		}
		
	}
}