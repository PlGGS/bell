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
            context?.setStrokeColor(UIColor.green.cgColor);
            context?.stroke(rect);
            
            let viewHeight = Int(bounds.height);
            let viewWidth = Int(bounds.width);
            
            let multiplier = 1;
            let spacing: Int = (Int(-(Float(array.count) / Float(64)) * 4.0 + 5.0) * multiplier);
            
            let availableWidth: Double = Double(viewWidth) - (Double(spacing * array.count));
//            print(String(viewWidth) + " - " +
//                  String((spacing * (array.count * 0.75))) + " + " +
//                  "_" + " = " +
//                  String(viewWidth - (spacing * (array.count * 0.75)))
//            );
            
            
            let barWidth: Double = availableWidth / Double(array.count);
            print(availableWidth);
            
            print(barWidth);
            print(spacing);
            
            print(barWidth + Double(spacing));
            
            print((barWidth + Double(spacing)) * Double(array.count));
            
            print(viewWidth);
            print();
                    
            for (index, value) in array.enumerated() {
                let barHeight = Int(Float(value) * Float(viewHeight) / 100);
                let x = Int((barWidth + Double(spacing)) * Double(index));
                let rect = CGRect(x: x, y: viewHeight - barHeight, width: Int(barWidth), height: barHeight)
                
                context?.setFillColor(UIColor.red.cgColor)
                context?.fill(rect)
            }
        }
    }
}
