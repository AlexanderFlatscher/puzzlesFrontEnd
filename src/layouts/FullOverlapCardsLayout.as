package layouts
{
	import mx.core.ILayoutElement;
	
	import spark.layouts.supportClasses.LayoutBase;
	
	public class FullOverlapCardsLayout extends LayoutBase
	{
		public var overlap:int = 20;
		
		public function FullOverlapCardsLayout()
		{
			super();
		}
		
		override public function updateDisplayList(width:Number, height:Number):void {
			super.updateDisplayList(width, height);
			
			var count:int = target.numElements;
			for(var i:int = count - 1; i >= 0; i--){
				var element:ILayoutElement = (useVirtualLayout ? target.getVirtualElementAt(i) : target.getElementAt(i));
				
				element.setLayoutBoundsSize(NaN, NaN);
				element.setLayoutBoundsPosition(0, 0);
				
			}
		}
		
		override public function measure():void {
			super.measure();
//			var element:ILayoutElement = (useVirtualLayout ? target.getVirtualElementAt(0) : target.getElementAt(0));
//			target.measuredHeight = element.getLayoutBoundsHeight() + target.numElements * overlap;
//			target.measuredWidth = element.getLayoutBoundsWidth();
		}
	}
}