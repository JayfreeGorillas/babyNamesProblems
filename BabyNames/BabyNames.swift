//
//  BabyNames.swift
//  BabyNames
//
//  Created by Josfry Barillas on 6/28/22.
//

import Foundation

public class BabyNames {
    
    let babyNames2020FileName = "baby_names_2020_short.txt"
    let babyNames1880FileName = "baby_names_1880_short.txt"
    var babyNames = [String]()

    public init () {
        babyNames = FileParser.getLines(from: babyNames2020FileName)
    }
    
    
   static func findShortestBabyNames(_ names: [String]) -> String {

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
    
   static func longestBabyName2020(_ names:[String]) {
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
        print(longestBabyNames)
    }
    
    
   static func findNameInBothAges(_ listOne: [String], _ listTwo: [String] ) {
        var namesThatTraverseTime = [(String, String)]()
        
        for newName in listOne {
           // print(string)
            for oldName in listTwo where newName == oldName {

                namesThatTraverseTime.append((newName, oldName))

            }
            
        }
        print(namesThatTraverseTime)
    }
    
   static func nameIsValidScrabbleWord(_ listOne: [String], _ listTwo: [String]) {
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
    
    static  func binarySearchReversedBabyName(_ babyNames: [String], _ scrabbleWords: [String]) -> [(String,String)]? {
         
         var matchedNames = [(String, String)]()
         // storage for my matches
         
     nameLoop: for name in babyNames {
         var lowIndex = 0
         var highIndex = scrabbleWords.count - 1
         let reversedName = String(name.reversed()).uppercased()

         while lowIndex <= highIndex {
             
             
             let midIndex = (lowIndex + highIndex) / 2
             let word = scrabbleWords[midIndex]
             
             if lowIndex == highIndex && highIndex == midIndex && word != reversedName {
                 continue nameLoop
             }
             
             if word == reversedName {
                 let match = (name,reversedName)
                 matchedNames.append(match)
                 continue nameLoop
             } else if word < reversedName {
                 lowIndex = midIndex + 1
             } else {
                 highIndex = midIndex - 1
             }
             
         }
         
         
         
         
     }
         if matchedNames.isEmpty {
             return nil
         }
         
         print(matchedNames)
         return matchedNames
         
         
     }
     
     
    static  func setReverseNameScrabbleWord(_ babyNames: Array<String>, _ scrabbleWords: Set<String>) {

          var reversedNameIsAScrabbleWord = [(String, String)]()
          
         for name in babyNames {
             
             let reversedName = String(name.reversed()).uppercased()
             
             if scrabbleWords.contains(reversedName) {
                 reversedNameIsAScrabbleWord.append((name, reversedName))
             }
         }
          
          
          print(reversedNameIsAScrabbleWord)

      }


    
}



    
