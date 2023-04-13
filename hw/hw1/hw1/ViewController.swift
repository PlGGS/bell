//
//  ViewController.swift
//  hw1
//
//  Created by Blake Boris on 4/6/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnSort: UIButton!
    
    @IBOutlet weak var lblArrayTop: UILabel!
    @IBOutlet weak var lblArrayBottom: UILabel!
    
    @IBOutlet weak var sortingViewTop: BarChartView!
    @IBOutlet weak var sortingViewBottom: BarChartView!
    
    @IBOutlet weak var segLength: UISegmentedControl!
    
    @IBOutlet weak var segSortAlgosTop: UISegmentedControl!
    @IBOutlet weak var segSortAlgosBottom: UISegmentedControl!
    
    var length: Int = 16;
    let from: Int = 1;
    let to: Int = 100;
    
    var array: [Int] = [Int]();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        resetArray(length);
        sortingViewTop.array = array;
        sortingViewBottom.array = array;
    }
    
    @IBAction func btnSortTapped(_ sender: Any) {
        var arrayCopyTop = Array(array);
        var arrayCopyBottom = Array(array);
        
        sortUsingSelected(seg: segSortAlgosTop, arr: &arrayCopyTop)
        sortUsingSelected(seg: segSortAlgosBottom, arr: &arrayCopyBottom)
        
        sortingViewTop.array = arrayCopyTop;
        sortingViewBottom.array = arrayCopyBottom;
        sortingViewTop.setNeedsDisplay();
        sortingViewBottom.setNeedsDisplay();
    }
    
    func sortUsingSelected<T: Comparable>(seg: UISegmentedControl, arr: inout [T]) {
        switch seg.selectedSegmentIndex {
        case 0:
            Sort.insertion(array: &arr);
        case 1:
            Sort.selection(array: &arr);
        case 2:
            Sort.quick(array: &arr);
        case 3:
            Sort.merge(array: &arr);
        default:
            break
        }
    }
    
    @IBAction func segLengthTapped(_ sender: UISegmentedControl) {
        length = Int(sender.titleForSegment(at: sender.selectedSegmentIndex)!) ?? length;
        resetArray(length);
    }
    
    @IBAction func segSortAlgosTopTapped(_ sender: Any) {
        
    }
    
    @IBAction func segSortAlgosBottomTapped(_ sender: Any) {
        
    }
    
    func resetArray(_ length: Int) {
        array = getRandomIntArray(length: length, from, to);
        lblArrayTop.text = String(array.description);
        lblArrayBottom.text = String(array.description);
        sortingViewTop.array = array;
        sortingViewBottom.array = array;
        sortingViewTop.setNeedsDisplay();
        sortingViewBottom.setNeedsDisplay();
    }
}

func getRandomIntArray(length: Int, _ from: Int, _ to: Int) -> [Int] {
    return (0..<length).map( { _ in Int.random(in: from...to) } );
}





