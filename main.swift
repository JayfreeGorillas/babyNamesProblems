//
//  main.swift
//  BabyNames
//
//  Created by Josfry Barillas on 6/10/22.
//

import Foundation

print("Hello, World!")

let babyNames2020FileName = "baby_names_2020_short.txt"
let babyNames1880FileName = "baby_names_1880_short.txt"
let scrabbleWordsFileName = "sowpods.txt"



func getLines(from fileName: String) -> [String] {
    let mainPath = #file
    let filePath = mainPath.replacingOccurrences(of: "main.swift", with: fileName)
    let contents = (try? String(contentsOfFile: filePath, encoding: .utf8)) ?? ""
    var names = contents.components(separatedBy: .newlines)
    names.removeAll(where: { $0.isEmpty })
    return names
}

let babyNames20 = getLines(from: babyNames2020FileName)
let babyNames80 = getLines(from: babyNames1880FileName)
let scrabbleWords = getLines(from: scrabbleWordsFileName)
var scrabbleSet: Set<String> = Set(scrabbleWords)




//print(getLines(from: babyNames2020))
//print(getLines(from: babyNames1880))
//print(babyNames2020)
//print(babyNames1880)
//print(getLines(from: scrabbleWords))

//
func findShortestBabyNames(_ names: [String]) -> String {

    // find shortest N number of baby names
    // find all shortest
    // alpha-less them
    // top N
    // handle edge case of if N is larger than baby names
    
    var shortestBabyNames = [String]()
    var shortBabyName: String = ""
    // making short names
    var currentShortest = Int.max
    
    for name in names {
        
        guard name.count <= currentShortest else { continue }
        
        if name.count == currentShortest  {
            print(name)
            print(currentShortest)
            print(shortBabyName)
            
            
        
            
            
            if name < shortBabyName {
                shortBabyName = name
                print(name)
                print(shortBabyName)
            }
            
            
            // else if shortest alpha-less than name
        
            

            
        } else {
            print(name)
            print(shortBabyName)
            currentShortest = name.count
            shortBabyName = name
            print(name)
            print(shortBabyName)
        }
        
    }

   return shortBabyName
}

//findShortestBabyNames(getLines(from: babyNames2020))

func longestBabyName2020(_ names:[String]) {
    var currentLongest = Int.min
    var longestBabyNames = [String]()
    
    for name in names {
        
        guard name.count >= currentLongest else { continue }
        
        if name.count == currentLongest {
            longestBabyNames.append(name)
        } else {
            currentLongest = name.count
            longestBabyNames = [name]
        }
    }
    
    // Look into collections
//    for name in names {
//        if name.count == currentLongest {
//            print("tie number in \(name.count) && : \(currentLongest)")
//            longestBabyNames.append(name)
//        } else if name.count > currentLongest {
//            currentLongest = name.count
//            longestBabyNames = [name]
//        }
//    }
    /*
     guard name.count <= currentShortest else { continue }
     
     if name.count == currentShortest {
         shortestBabyNames.append(name)
     } else {
         currentShortest = name.count
         shortestBabyNames = [name]
     }
     */
    print(longestBabyNames)
}
//longestBabyName2020(getLines(from: babyNames2020))

//each list of baby names in set and learn about intersect <Set>
func findNameInBothAges(_ listOne: [String], _ listTwo: [String] ) {
    var namesThatTraverseTime = [(String, String)]()
    
    for newName in listOne {
       // print(string)
        for oldName in listTwo where newName == oldName {

            namesThatTraverseTime.append((newName, oldName))

        }
        
    }
    print(namesThatTraverseTime)
}

//findNameInBothAges(getLines(from: babyNames2020), getLines(from: babyNames1880))

func nameIsValidScrabbleWord(_ listOne: [String], _ listTwo: [String]) {
   // let start = CFAbsoluteTimeGetCurrent()
    // run your work
  
    //var nameIsScrabbleWordDict = [String: String]()
    var reversedNameIsAScrabbleWord = [(String, String)]()
    
    for string in listOne {
        
        let reversedString = String(string.reversed()).lowercased()
        
        for scrabbleWord in listTwo {
            
            let lowerScrabble = scrabbleWord.lowercased()
            
            guard reversedString == lowerScrabble.lowercased() else {continue}
            print(string, scrabbleWord)
            reversedNameIsAScrabbleWord.append((string, scrabbleWord))
            
            
        }
    }
    
    print(reversedNameIsAScrabbleWord)
//    let diff = CFAbsoluteTimeGetCurrent() - start
    //print("Took \(diff) seconds")
}
//CLOSURES
/*
 A block of code to reference as a variable..
 dogName = "spot"
 run code after network returns the closure
 thisWork = {}
 */

//func binarySearchReversedBabyName(_ babyNames: [String], _ scrabbleWords: [String]) {
//    var lowIndex = 0
//    var highIndex = scrabbleWords.count - 1
//
//    while lowIndex <= highIndex {
//
//        for name in babyNames {
//            <#body#>
//        }
//
//        let midIndex = (lowIndex + highIndex) / 2
//        let word = scrabbleWords[midIndex]
//        let reversedName = String(word.reversed()).uppercased()
//        print(word)
//        print(reversedName)
//        if scrabbleWords[midIndex] == reversedName {
//            print(scrabbleWords[midIndex])
//        } else if scrabbleWords[midIndex] < reversedName {
//            lowIndex = midIndex + 1
//        } else {
//            highIndex = midIndex - 1
//        }
//
//    }
//
//
//}

//binarySearchReversedBabyName(babyNames20, scrabbleWords)
//func binarySearch (_ array: [Int], value: Int) -> Int? {
// var lowIndex   = 0
//    // starting point
// var highIndex  = array.count - 1
//    // end point / tail
//
//    while lowIndex <= highIndex {
//        let midIndex = (lowIndex + highIndex) / 2
//        // getting the index of the array
//        if array[midIndex] == value {
//            // using the index of the array and checking if it is equal to our value
//            return midIndex
//        } else if array[midIndex] < value {
//            //if the value at current midIndex is lower than the value
//            lowIndex = midIndex + 1
//        } else {
//            // mid index is higher than value
//            highIndex = midIndex - 1
//        }
//    }

func setReverseNameScrabbleWord(_ babyNames: Array<String>, _ scrabbleWords: Set<String>) {

     var reversedNameIsAScrabbleWord = [(String, String)]()
     
    for name in babyNames {
        
        let reversedName = String(name.reversed()).uppercased()
        
        if scrabbleWords.contains(reversedName) {
            reversedNameIsAScrabbleWord.append((name, reversedName))
        }
    }
     
     
     print(reversedNameIsAScrabbleWord)

 }

func measureRuntime (functionToRun: () -> Void ) {
    // start timer when function is ran
    let timeBefore = Date.now.timeIntervalSince1970
    //escaping is for keeeping data while other things
    functionToRun()
    
    
    let timeAfter = Date.now.timeIntervalSince1970
    let timeTaken = timeAfter - timeBefore
    
    print(timeTaken)
}

//measureRuntime {
//
//}



//measureRuntime {
//    nameIsValidScrabbleWord(babyNames20, scrabbleWords)
//}
//
measureRuntime {
    setReverseNameScrabbleWord(babyNames20, scrabbleSet)
}
//
//measureRuntime {
//    var scrabbleSet: Set<String> = Set(scrabbleWords)
//}

//            write a binary search for scrabble words and reversedbabyName


//                              class with hella vars
// to reference a class in a closure
// escapes the scope of the class it is defined in ... Hold onto information until the closure is over

//nameIsValidScrabbleWord(getLines(from: babyNames2020), getLines(from: scrabbleWords))
/*
 
 [ :) ] What is the shortest baby name in the top 40 baby names for 2020?
 [ :) ] What are the longest baby names in the top 40 baby names for 2020? Make sure you can handle if there’s a tie.

 Nested for loops
// [name : scrabbleWord]
//
 [:)] There is at least one baby name from the top 40 baby names for 2020 that, when spelled backwards, is a valid Scrabble word. Find and print all such names.
     [ Not Done] Solve this two ways: first with an array to hold the Scrabble words, and then with a dictionary (or set) to hold the Scrabble words. Use timer functions to measure how long it takes to complete this work under each implementation. Why is the time different?
 [ :) ] What are all of the names that were top 40 baby names in both 1880 and 2020?
 
 func sumFromOne(upto n: Int) -> Int {
 //
 ////    print(n + 1)
 ////    print(n / 2)
 //    print((n + 1) * n / 2)
 //    return (n + 1) * n / 2
 //}
 //sumFromOne(upto: 10000)
 */

/*
 I need KEY:VALUE for a DICT
    for a SET JUST 1 object of
        ****unique****
            items
 */
func number(n: Int) -> Int {
    
    guard n >= 0 else { return n }
    
    if n == 0 { return 0 }
    return number(n: n - 1)
}

number(n: 5)


// for loops iterate over a list & grabbing a value within list and evaluating... chance to alter the list (problematic) Dependant on the state - Value of a particular index

// recursion does not change the values within the list... we are not maintaining the state of a list State - Value holding in a time
