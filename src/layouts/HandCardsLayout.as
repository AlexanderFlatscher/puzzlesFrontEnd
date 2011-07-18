package layouts
{
	import flash.geom.Matrix;
	import flash.geom.Vector3D;
	
	import mx.core.ILayoutElement;
	
	import spark.layouts.supportClasses.LayoutBase;
	
	public class HandCardsLayout extends LayoutBase
	{
		public var cardAngle:Number = 0.3;
		
		public function HandCardsLayout()
		{
			super();
		}
		
		override public function updateDisplayList(width:Number, height:Number):void {
			super.updateDisplayList(width, height);
			
			var count:int = target.numElements;
			var middle:Number = target.width / 2;
			var relativePosition:Number = - count/2 + 0.5;
			trace("relpo: " + relativePosition);
			
			for(var i:int = 0; i < count; i++){
				var element:ILayoutElement = (useVirtualLayout ? target.getVirtualElementAt(i) : target.getElementAt(i));
				
				element.setLayoutBoundsSize(NaN, NaN);
				
				var relativePositionToI:Number = relativePosition + i;
				var rotationAngle:Number = cardAngle * relativePositionToI;
				var matrix:Matrix = new Matrix();
				matrix.rotate(rotationAngle);
				
				var translateX:Number = middle;
				var translateY:Number = 0;
				if(relativePositionToI < 0){
					translateX += - element.getLayoutBoundsWidth() * Math.cos(rotationAngle);
					translateY = - element.getLayoutBoundsWidth() * Math.sin(rotationAngle);
				}
				
				if(relativePositionToI > 0){
					translateX += element.getLayoutBoundsWidth();
				}
				
				
				if(Math.abs(relativePositionToI) > 1){
					translateY += element.getLayoutBoundsHeight() * (relativePositionToI < 0 ? Math.sin(- cardAngle * (relativePositionToI + 1)) : Math.sin(cardAngle * (relativePositionToI - 1)));
				}
				//translateX += relativePositionToI * 80;
				
				matrix.translate(translateX/*middle + relativePositionToI * 80*/, translateY);
				element.setLayoutMatrix(matrix, true);
			}
		}
		
		override public function measure():void {
			super.measure();
		}
	}
}