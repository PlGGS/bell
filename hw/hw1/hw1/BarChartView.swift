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
            
            let viewHeight = Int(bounds.height);
            let viewWidth = Int(bounds.width);
            
            // Calculate the available width for the rectangles after accounting for spacing
            let spacing: Int = -1 * (array.count / 64) * 4 + 5;
            let availableWidth = viewWidth - (spacing * (array.count));
            
            // Calculate the width of each rectangle based on the available width and number of rectangles
            let barWidth = availableWidth / array.count;
                    
            for (index, value) in array.enumerated() {
                let barHeight = Int(Float(value) * Float(viewHeight) / 100);
                let rect = CGRect(x: (barWidth + spacing) * index + spacing, y: viewHeight - barHeight, width: Int(barWidth), height: barHeight)
                
                
                
                context?.setFillColor(UIColor.red.cgColor)
                context?.fill(rect)
            }
        }
    }
}
