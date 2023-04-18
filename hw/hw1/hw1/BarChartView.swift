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
    var viewHeight: CGFloat = 0;
    var viewWidth: CGFloat = 0;
    var spacing: Float = 0;
    var availableWidth: CGFloat = 0;
    var barWidth: CGFloat = 0;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    func start() {
        viewHeight = bounds.height;
        viewWidth = bounds.width;
        
        //Decrease spacing as number of columns increases
        spacing = -(Float(array.count) / Float(64)) * 4.0 + 6.0;
        
        //viewWidth minus summed spaces between columns
        availableWidth = viewWidth - (CGFloat(spacing) * CGFloat(array.count - 1));
        
        //Set each column width based on the view with minus summed spacing
        barWidth = availableWidth / CGFloat(array.count);
    }
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            if (array.count > 0) {
                
                //Show view border
//                context.setStrokeColor(UIColor.green.cgColor);
//                context.stroke(rect);
                
                for (index, value) in array.enumerated() {
                    //Scale column height by 100
                    let barHeight: CGFloat = CGFloat(value) * CGFloat(viewHeight) / 100;
                    
                    //Space columns evenly
                    let x: CGFloat = (barWidth + CGFloat(spacing)) * CGFloat(index);
                    
                    //Subtract barHeight from viewHight to place columns along the bottom of the view
                    let y = viewHeight - barHeight;
                    
                    //Round bar width up or down for proper spacing
                    let column = CGRect(x: x, y: y, width: barWidth, height: barHeight);
                    
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
