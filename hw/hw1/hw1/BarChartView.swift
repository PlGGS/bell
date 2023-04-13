//
//  BarChart.swift
//  hw1
//
//  Created by Blake Boris on 4/11/23.
//

import UIKit

class BarChartView: UIView {
    var array: [Int] = [Int]();
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    override func draw(_ rect: CGRect) {
        if (array.count > 0) {
            let context = UIGraphicsGetCurrentContext();
            
            //Show view border
//            context?.setStrokeColor(UIColor.green.cgColor);
//            context?.stroke(rect);
            
            let viewHeight = Int(bounds.height);
            let viewWidth = Int(bounds.width);
            
            //Decrease spacing as number of columns increases
            let spacing: Int = Int(-(Float(array.count) / Float(64)) * 4.0 + 5.0);
            
            //viewWidth minus summed spaces between columns
            let availableWidth: Double = Double(viewWidth) - (Double(spacing * (array.count - 1)));
            
            //Set each column width based on the view with minus summed spacing
            let barWidth: Double = availableWidth / Double(array.count);
            
            for (index, value) in array.enumerated() {
                //Scale column height by 100
                let barHeight = Int(Float(value) * Float(viewHeight) / 100);
                
                //Space columns evenly
                let x = Int(round((barWidth + Double(spacing)) * Double(index)));
                //Subtract barHeight from viewHight to place columns along the bottom of the view
                let y = viewHeight - barHeight;
                
                //Round bar width up or down for proper spacing
                let rect = CGRect(x: x, y: y, width: Int(round(barWidth)), height: barHeight)
                
                context?.setFillColor(UIColor.red.cgColor)
                context?.fill(rect)
            }
        }
    }
}
