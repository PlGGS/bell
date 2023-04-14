//
//  Sort.swift
//  hw1
//
//  Created by Blake Boris on 4/11/23.
//

struct SortBarChart {
    static func insertion(array: inout [Int]) -> Void { return insertionSort(&array) };
    static func selection(array: inout [Int]) -> Void { return selectionSort(&array) };
    static func quick(array: inout [Int]) -> Void { return quickSort(&array) };
    static func merge(array: inout [Int]) -> Void { return mergeSort(&array) };
}

func insertionSort(_ array: inout [Int]) {
    guard array.count > 1 else { return }
    
    for index in 1..<array.count {
        var currentIndex = index;
        while currentIndex > 0 && array[currentIndex] < array[currentIndex - 1] {
            array.swapAt(currentIndex - 1, currentIndex);
            currentIndex -= 1;
        }
    }
}

func selectionSort(_ array: inout [Int]) {
    guard array.count > 1 else { return }

    for index in 0..<array.count - 1 {
        var minIndex = index;
        for innerIndex in index + 1..<array.count {
            if array[innerIndex] < array[minIndex] {
                minIndex = innerIndex;
            }
        }
        if index != minIndex {
            array.swapAt(index, minIndex);
        }
    }
}

func quickSort(_ array: inout [Int]) {
    guard array.count > 1 else { return } // check array length

    let pivot = array.remove(at: 0);
    var left: [Int] = [];
    var right: [Int] = [];
    for element in array {
        if element < pivot {
            left.append(element);
        } else {
            right.append(element);
        }
    }
    quickSort(&left);
    quickSort(&right);
    array = left + [pivot] + right;
}

func mergeSort(_ array: inout [Int]) {
    if array.count > 1 {
        let middleIndex = array.count / 2;
        var left = Array(array[..<middleIndex]);
        var right = Array(array[middleIndex...]);

        mergeSort(&left);
        mergeSort(&right);

        array = merge(left: left, right: right);
    }
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var merged = [Int]();
    var leftIndex = 0;
    var rightIndex = 0;

    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            merged.append(left[leftIndex]);
            leftIndex += 1;
        } else {
            merged.append(right[rightIndex]);
            rightIndex += 1;
        }
    }

    merged += left[leftIndex...];
    merged += right[rightIndex...];
    
    return merged;
}
