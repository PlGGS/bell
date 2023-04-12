//
//  ViewController.swift
//  hw1
//
//  Created by Blake Boris on 4/6/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        
        var ints = [6, 5, 7, 4, 7, 1, 8, 2, 2, 8, 4, 8, 7, 3, 8, 1, 8, 6, 10, 2, 3, 8, 8];
        Sort.merge(array: &ints)
        print(ints);
    }
}

func getRandomInt(_ from: UInt32, _ to: UInt32) -> Int {
    return Int(arc4random_uniform(to - from + 1)) + Int(from);
}
