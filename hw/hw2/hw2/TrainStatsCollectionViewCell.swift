//
//  TrainStatsCollectionViewCell.swift
//  hw2
//
//  Created by Blake Boris on 4/28/23.
//

import UIKit

class TrainStatsCollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var statView: UIView!
    @IBOutlet weak var lblStat: UILabel!
    
    override func layoutSubviews() {
        statView.layer.cornerRadius = 10;
        statView.layer.borderWidth = 1
        statView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
