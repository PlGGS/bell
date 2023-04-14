//
//  ViewController.swift
//  hw1
//
//  Created by Blake Boris on 4/6/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnSort: UIButton!
    
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
        resetSortingViews();
    }
    
    @IBAction func sortBarCharts(_ sender: Any) {
        resetArray(length);
        
        sortUsingSelected(seg: segSortAlgosTop, bcv: sortingViewTop);
        sortUsingSelected(seg: segSortAlgosBottom, bcv: sortingViewBottom);
    }
    
    func sortUsingSelected(seg: UISegmentedControl, bcv: BarChartView) {
        switch seg.selectedSegmentIndex {
            case 0:
            self.insertionSort(bcv);
//                SortBarChart.insertion(barChartView: &bcv, array: &arr);
        case 1:
            self.selectionSort(bcv);
//                SortBarChart.selection(barChartView: &bcv, array: &arr);
//            case 2:
//                SortBarChart.quick(barChartView: &bcv, array: &arr);
//            case 3:
//                SortBarChart.merge(barChartView: &bcv, array: &arr);
        default:
            break
        }
    }
    
    @IBAction func segLengthTapped(_ sender: UISegmentedControl) {
        length = Int(sender.titleForSegment(at: sender.selectedSegmentIndex)!) ?? length;
        resetArray(length);
        resetSortingViews();
    }
    
    func resetArray(_ length: Int) {
        array = getRandomIntArray(length: length, from, to);
    }
    
    func resetSortingViews() {
        sortingViewTop.array = array;
        sortingViewBottom.array = array;
        
        sortingViewTop.start();
        sortingViewBottom.start();
        
        sortingViewTop.setNeedsDisplay();
        sortingViewBottom.setNeedsDisplay();
    }
    
    func insertionSort(_ bcv: BarChartView) {
        guard array.count > 1 else { return }
        
        var array = Array(self.array);
        
        DispatchQueue.global(qos: .background).async {
            for index in 1..<array.count {
                var currentIndex = index;
                while currentIndex > 0 && array[currentIndex] < array[currentIndex - 1] {
                    array.swapAt(currentIndex - 1, currentIndex);
                    currentIndex -= 1;
                    
                    DispatchQueue.main.async {
                        bcv.array = array;
                        bcv.setNeedsDisplay();
                    }
                    
                    usleep(1000);
                }
            }
        }
    }
    
    func selectionSort(_ bcv: BarChartView) {
        guard self.array.count > 1 else { return }
        
        var array = Array(self.array);
        
        DispatchQueue.global(qos: .background).async {
            for index in 0..<array.count - 1 {
                var minIndex = index;
                for innerIndex in index + 1..<array.count {
                    if array[innerIndex] < array[minIndex] {
                        minIndex = innerIndex;
                        
                        usleep(1000);
                    }
                }
                if index != minIndex {
                    array.swapAt(index, minIndex);
                    
                    DispatchQueue.main.async {
                        bcv.array = array;
                        bcv.setNeedsDisplay();
                    }
                }
            }
        }
    }
}

func getRandomIntArray(length: Int, _ from: Int, _ to: Int) -> [Int] {
    return (0..<length).map( { _ in Int.random(in: from...to) } );
}
