package com.weibo.charts
{
	import com.weibo.charts.data.CoordinateLogic;
	import com.weibo.charts.data.ICoordinateLogic;
	import com.weibo.charts.events.ChartEvent;
	
	import flash.geom.Rectangle;

	/**
	 * 笛卡尔坐标系 基础图表抽象类
	 * @author yaofei
	 */	
	public class CoordinateChart extends ChartBase
	{
		public function CoordinateChart()
		{
			super();
		}
		
		
		override public function set dataProvider(value:Object):void
		{
			if (!axisLogic)
			{
				axisLogic = new CoordinateLogic(this);
//				coordinateLogic.integer = _style.integer;
//				coordinateLogic.alwaysShow0 = true;
			}
			
			area = new Rectangle(0, 0, chartWidth, chartHeight);
			axisLogic.dataProvider = value;
			super.dataProvider = value;
			dispatchEvent(new ChartEvent(ChartEvent.CHART_DATA_CHANGED));
		}
		
		protected function get coordinateLogic():ICoordinateLogic
		{
			return this.axisLogic as ICoordinateLogic;
		}
	}
}