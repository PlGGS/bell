//
//  TrainTableViewCell.swift
//  hw2
//
//  Created by Blake Boris on 4/28/23.
//

import UIKit

class TrainTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //Set by TerminalViewController
    var train: Train? = nil;
    
    @IBOutlet weak var collectionViewTrains: UICollectionView!
    @IBOutlet weak var imgDestination: UIImageView!
    @IBOutlet weak var lblDestination: UILabel!
    @IBOutlet weak var lblMinsOrDue: UILabel!
    @IBOutlet weak var lblStaticMinutes: UILabel!
    
    var stats: [String] = Array(repeating: "", count: 3);
    
    override func awakeFromNib() {
        super.awakeFromNib();
        
        stats[2] = "Delayed";
        
        let layout = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal;
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        collectionViewTrains.collectionViewLayout = layout;
        
        collectionViewTrains.dataSource = self;
        collectionViewTrains.delegate = self;
    }
    
    var selectedTrainIndex = [-1]; //TODO actually make this collection view pull from the trains array, which probably means passing it
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (train!.isDelayed == "1") ? 3 : 2;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewTrains.dequeueReusableCell(withReuseIdentifier: "tscvc", for: indexPath) as! TrainStatsCollectionViewCell;
        
        cell.lblStat.text = stats[indexPath.row];
        
        cell.lblStat.textColor = UIColor.white;
        cell.statView.backgroundColor = UIColor(named:stats[0]);

        cell.lblStat.sizeToFit();
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionViewTrains.reloadData();
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionViewTrains.dequeueReusableCell(withReuseIdentifier: "tscvc", for: indexPath) as! TrainStatsCollectionViewCell;
        
        stats[0] = Line(rawValue: train!.lineName)!.shortName;
        stats[1] = "#\(train!.runNumber)";
        
        cell.lblStat.text = stats[indexPath.row];
        cell.lblStat.sizeToFit();
        let size = cell.lblStat.frame.size;
        
        return CGSize(width: size.width + 20, height: size.height + 10);
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0);
    }
}
