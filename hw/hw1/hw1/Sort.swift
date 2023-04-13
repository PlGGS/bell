//
//  Sort.swift
//  hw1
//
//  Created by Blake Boris on 4/11/23.
//

struct Sort {
    static func insertion<T: Comparable>(array: inout [T]) -> Void { return insertionSort(&array) };
    static func selection<T: Comparable>(array: inout [T]) -> Void { return selectionSort(&array) };
    static func quick<T: Comparable>(array: inout [T]) -> Void { return quickSort(&array) };
    static func merge<T: Comparable>(array: inout [T]) -> Void { return mergeSort(&array) };
}

func insertionSort<T: Comparable>(_ array: inout [T]) {
    guard array.count > 1 else { return }
    
    for index in 1..<array.count {
        var currentIndex = index
        while currentIndex > 0 && array[currentIndex] < array[currentIndex - 1] {
            array.swapAt(currentIndex - 1, currentIndex)
            currentIndex -= 1
        }
    }
}

func selectionSort<T: Comparable>(_ array: inout [T]) {
    guard array.count > 1 else { return }

    for index in 0..<array.count - 1 {
        var minIndex = index
        for innerIndex in index + 1..<array.count {
            if array[innerIndex] < array[minIndex] {
                minIndex = innerIndex
            }
        }
        if index != minIndex {
            array.swapAt(index, minIndex)
        }
    }
}

func quickSort<T: Comparable>(_ array: inout [T]) {
    guard array.count > 1 else { return } // check array length

    let pivot = array.remove(at: 0)
    var left: [T] = []
    var right: [T] = []
    for element in array {
        if element < pivot {
            left.append(element)
        } else {
            right.append(element)
        }
    }
    quickSort(&left)
    quickSort(&right)
    array = left + [pivot] + right
}

func mergeSort<T: Comparable>(_ array: inout [T]) {
    if array.count > 1 {
        let middleIndex = array.count / 2;
        var leftArray = Array(array[..<middleIndex]);
        var rightArray = Array(array[middleIndex...]);

        mergeSort(&leftArray);
        mergeSort(&rightArray);

        array = merge(left: leftArray, right: rightArray);
    }
}

func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    var merged = [T]();
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
