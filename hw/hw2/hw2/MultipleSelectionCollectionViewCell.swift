//
//  MultipleSelectionCollectionViewCell.swift
//  hw2
//
//  Created by Blake Boris on 4/27/23.
//

import UIKit

class MultipleSelectionCollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var lblSelection: UILabel!
    
    override func layoutSubviews() {
        selectionView.layer.cornerRadius = 10;
        selectionView.layer.borderWidth = 1;
    }
}
