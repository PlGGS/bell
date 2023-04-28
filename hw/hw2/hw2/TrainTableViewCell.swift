//
//  TrainTableViewCell.swift
//  hw2
//
//  Created by Blake Boris on 4/28/23.
//

import UIKit

class TrainTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    //The following are set by TerminalViewController
    var train: Train? = nil;
    
    @IBOutlet weak var collectionViewTrains: UICollectionView!
    
    var selectedTrainIndex = [-1]; //TODO actually make this collection view pull from the trains array, which probably means passing it
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Line.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewTrains.dequeueReusableCell(withReuseIdentifier: "tscvc", for: indexPath) as! MultipleSelectionCollectionViewCell;
        
        cell.lblSelection.text = Line.allCases[indexPath.row].fullName;

        if selectedTrainIndex.contains(indexPath.item) {
            if (Line.allCases[indexPath.row].shortName == "PurpleExp") {
                cell.selectionView.backgroundColor = UIColor(named: "Purple");
            }
            else {
                cell.selectionView.backgroundColor = UIColor(named: Line.allCases[indexPath.row].shortName)
            }

            cell.lblSelection.textColor = UIColor.white;
        }
        else {
            cell.selectionView.backgroundColor = UIColor.white;
            cell.lblSelection.textColor = UIColor.darkGray;
        }

        cell.lblSelection.sizeToFit();
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (selectedTrainIndex.contains(indexPath.item)) {
            if let index = selectedTrainIndex.firstIndex(of: indexPath.item) {
                selectedTrainIndex.remove(at: index);
            }
        }
        else {
            selectedTrainIndex.append(indexPath.item);
        }
        
        collectionViewTrains.reloadData();
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionViewTrains.dequeueReusableCell(withReuseIdentifier: "mscvc", for: indexPath) as! MultipleSelectionCollectionViewCell;
        
        cell.lblSelection.text = Line.allCases[indexPath.row].fullName;
        cell.lblSelection.sizeToFit();
        let size = cell.lblSelection.frame.size;
        
        return CGSize(width: size.width + 20, height: size.height + 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
    }
}
