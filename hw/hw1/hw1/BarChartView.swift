//
//  BarChart.swift
//  hw1
//
//  Created by Blake Boris on 4/11/23.
//

import UIKit

class BarChartView: UIView {
    var array: [Int] = [Int]();
    var columns: [CGRect] = [CGRect]();
    
    var viewHeight: Int = 0;
    var viewWidth: Int = 0;
    var spacing: Int = 0;
    var availableWidth: Double = 0;
    var barWidth: Double = 0;
    
    var done = false;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    func start() {
        viewHeight = Int(bounds.height);
        viewWidth = Int(bounds.width);
        
        //Decrease spacing as number of columns increases
        spacing = Int(-(Float(array.count) / Float(64)) * 4.0 + 6.0);
        
        //viewWidth minus summed spaces between columns
        availableWidth = Double(viewWidth) - (Double(spacing) * Double(array.count));
        
        //Set each column width based on the view with minus summed spacing
        barWidth = floor(availableWidth) / Double(array.count);
    }
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            if (array.count > 0) {
                
                //Show view border
//                context.setStrokeColor(UIColor.green.cgColor);
//                context.stroke(rect);
                
                for (index, value) in array.enumerated() {
                    //Scale column height by 100
                    let barHeight = Int(Double(value) * Double(viewHeight) / 100);
                    
                    //Space columns evenly
                    let x = Int((barWidth + Double(spacing)) * Double(index));
                    
                    //Subtract barHeight from viewHight to place columns along the bottom of the view
                    let y = viewHeight - barHeight;
                    
                    //Round bar width up or down for proper spacing
                    let column = CGRect(x: x, y: y, width: Int(round(barWidth)), height: barHeight);
                    
                    //Add rect to rects for movement while sorting
                    columns.append(column);
                    
                    context.setFillColor(UIColor.red.cgColor);
                    
                    //Highlight last bar to check spacing
//                    if (index == array.count - 1) {
//                        context.setFillColor(UIColor.blue.cgColor);
//                    }
                    
                    context.fill(column);
                }
            }
        }
    }
}
