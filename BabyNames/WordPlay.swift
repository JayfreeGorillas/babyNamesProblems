//
//  WordPlay.swift
//  BabyNames
//
//  Created by Josfry Barillas on 6/28/22.
//

import Foundation


public class WordPlay {
    
    let wordsFile = "sowpods.txt"
    var words = [String]()

   

    public init () {
        words = FileParser.getLines(from: wordsFile)
    }
    
    // MARK: - everything below this needs to be covered with a mentor..
  static   func beginningAndEndsWithTH(_ scrabbleWords: Set<String>) -> [String] {
        let prefix = "TH"
        var wordsWithTH = [String]()
        
        for word in scrabbleWords where word.hasPrefix(prefix) && word.hasSuffix(prefix) {
            wordsWithTH.append(word)
        }
        
        return wordsWithTH
    }

    //beginningAndEndsWithTH(scrabbleSet)

  static   func wordsWithOnlyU(_ scrabbleWords: Set<String>) {
        let vowelsIdontwant: [Character] = ["A","E","I","O"]
        var uVowel: Character = "U"
        var wordsWithOnlyUVowel = [String]()

        for word in scrabbleWords where word.contains(uVowel) {
            var vowelCount = 1
            
            for letter in word where vowelsIdontwant.contains(letter) {
                vowelCount += 1
                if vowelCount > 1 {
                    break
                }
            }
            if vowelCount == 1 {
                wordsWithOnlyUVowel.append(word)
            }
        }
      print(wordsWithOnlyUVowel)
        print(wordsWithOnlyUVowel.count)
    }

  static   func findOnlyUVowel(_ scrabbleWords: Set<String>) {
        let invalidVowels: Set<Character> = ["A", "E", "I", "O"]
        let validVowel = "U"
        
        var matchedWords = Set<String>()
        
    outer: for word in scrabbleWords where word.contains(validVowel) {
        
            for letter in word where invalidVowels.contains(letter) {
                continue outer
            }
            matchedWords.insert(word)
        }
      print(matchedWords)
        print(matchedWords.count)
    }

    //example(scrabbleSet)
    //wordsWithOnlyU(scrabbleSet)

   static  func wordsWithOnlyE(_scrabbleWords: Set<String>) {
        let invalidVowels: Set<Character> = ["A","I","O","U"]
        let validVowel = "E"
        
        var matchedWords = Set<String>()
        
    outer: for word in scrabbleWords where word.contains(validVowel) && word.count >= 15{
            
            for letter in word where invalidVowels.contains(letter) {
                continue outer
            }
        matchedWords.insert(word)
        }
        
        print(matchedWords)
        
    }

    //wordsWithOnlyE(_scrabbleWords: scrabbleSet)

   static  func findProAndIng(_ scrabbleWords: Set<String>) {
        let prefix = "PRO"
        let suffix = "ING"
        var matchedWords = Set<String>()
        
        for word in scrabbleWords where word.count == 11 && word.hasPrefix(prefix) && word.hasSuffix(suffix) {
            matchedWords.insert(word)
        }
        
        print(matchedWords)
    }

    //findProAndIng(scrabbleSet)

   static  func findShortestProAndIng(_ scrabbleWords: Set<String>) {
        let prefix = "PRO"
        let suffix = "ING"
        var currentShortest = Int.max
        var matchedWords = Set<String>()
        
        for word in scrabbleWords where word.hasPrefix(prefix) && word.hasSuffix(suffix) {
            guard word.count <= currentShortest else { continue }
            
            // only two possible outcomes at this point... shorter or exactly the same
            
            if word.count == currentShortest {
                matchedWords.insert(word)
            } else {
                currentShortest = word.count
                matchedWords = [word]
            }
        }
        
        print(matchedWords)
    }

    //findShortestProAndIng(scrabbleSet)

   static  func findWordsWithRSTLNE(_ scrabbleWords: Set<String>) {
        let lettersWeWant: Set<Character> = ["R","S","T","L","N","E"]
        var matchedWords = Set<String>()

        
    outer:  for word in scrabbleWords {
            
                for letter in word where !lettersWeWant.contains(letter) {
                    continue outer
            }
        
        matchedWords.insert(word)
        }
        
        print(matchedWords)
        
    }

    //findWordsWithRSTLNE(scrabbleSet)

   static  func findLongestWithRSTLNE(_ scrabbleWords: Set<String>) {
        let lettersWeWant: Set<Character> = ["R","S","T","L","N","E"]
        var longestWordsWithRSTLNE = Set<String>()
        var currentLongest = Int.min
        
    outer: for word in scrabbleWords where word.count >= currentLongest {
            
            
            for letter in word  where !lettersWeWant.contains(letter) {
                continue outer
            }
        
            if word.count == currentLongest {
                longestWordsWithRSTLNE.insert(word)
            } else {
                currentLongest = word.count
                longestWordsWithRSTLNE = [word]
            }
        }
        print(longestWordsWithRSTLNE)
    }

    //findLongestWithRSTLNE(scrabbleSet)

   static  func findWordsWithoutAEIOSHRTN(_ scrabbleWords: Set<String>) {
        let invalidLetters: Set<Character> = ["A","E","I","O","S","H","R","T","N"]
        var matchedWords = Set<String>()

    outer:   for word in scrabbleWords {
        
                for letter in word where invalidLetters.contains(letter) {
                    continue outer
                }
            matchedWords.insert(word)
    }
            print(matchedWords)
    }

    //findWordsWithoutAEIOSHRTN(scrabbleSet)

   static  func findLongestWithoutAEIOSHRTN(_ scrabbleWords: Set<String>) {
        let invalidLetters: Set<Character> = ["A","E","I","O","S","H","R","T","N"]
        var matchedWords = Set<String>()
        var currentLongest = Int.min
        
    outer: for word in scrabbleWords where word.count >= currentLongest {
            
        for letter in word where invalidLetters.contains(letter) {
            continue outer
        }
        
        if word.count == currentLongest {
            matchedWords.insert(word)
        } else {
            currentLongest = word.count
            matchedWords = [word]
        }
        
    }
        print(matchedWords)
    }

    //findLongestWithoutAEIOSHRTN(scrabbleSet)

   static  func findSubstringInList(_ subString: String) {
        var matchedWords = Set<String>()
        let upperCasedSubString = subString.uppercased()
        for word in scrabbleSet where word.contains(upperCasedSubString) {
            matchedWords.insert(word)
        }
        
        print(matchedWords)
    }

    //findSubstringInList("slug")

   static  func findPrefixInList(prefix: String) {
        var matchedWords = Set<String>()
        let upperPrefix = prefix.uppercased()
        
        for word in scrabbleSet where word.hasPrefix(upperPrefix) {
            matchedWords.insert(word)
        }
        print(matchedWords)
    }
    //findPrefixInList(prefix: "pre")

   static  func findPrefixAndSuffixWithLength(prefix: String, suffix: String, length: Int) {
        let upperPrefix = prefix.uppercased()
        let upperSuffix = suffix.uppercased()
        var matchedWords = Set<String>()
        
        for word in scrabbleSet where word.count == length && word.hasPrefix(upperPrefix) && word.hasSuffix(upperSuffix) {
            matchedWords.insert(word)
        }
        
        if matchedWords.count == 0 {
            print("no words match prefix: \(upperPrefix) && suffix : \(upperSuffix) or is at least \(length) letters long")
        }
        
        print(matchedWords)
        
    }

    //findPrefixAndSuffixWithLength(prefix: "pre", suffix: "ppp", length: 12)

   static  func findAsInString(string: String) {
        var letterACount = 0
        let validLetter: Character = "a"
        let lowerCaseString = string.lowercased()
        
        for letter in lowerCaseString where letter == validLetter {
            letterACount += 1
        }
        print(letterACount)
    }

    //findAsInString(string: "AppalAesAA")

   static  func findLettersInWord(word: String, letter: Character)  -> Int{
        var letterCount = 0
        let lowerCaseWord = word.lowercased()
        let lowerLetter = Character(letter.lowercased())
        
        for character in lowerCaseWord where character == lowerLetter {
            letterCount += 1
        }
        print(letterCount)
        return letterCount
    }

    //findLettersInWord(word: "Poop", letter: "P")

   static  func findCharactersInPhrase(phrase: String) {
        // input is a String                      Key : Value
        
        // return a Dictionary where it has [Character: Int]
        
        // I chose this way of structuring my dictionary so I can keep count of how many times my keys: letter will appear and their count will be the value
        
        /*
         apple
         [a: 1]
         [a: 1], [p:1]
         [a: 1], [p:1 + 1]
         [a: 1], [p:2], [l : 1]
      return after all of the string has been checked:   [a: 1], [p:2] [l:1] , [e:1]
         
         */
        
        // for every letter in the String "L"
        // if "L" exists in dictionary update value of the key to add one
        // if "L"   Not exist then we wanna add "L" into the dictionary with a value of 1
        
        var charCount = [Character: Int]()
        // storage where letters and
        
        
        let lowerPhrase = phrase.lowercased()
        
        
        for letter in lowerPhrase {
            if charCount[letter] != nil {
                if var value = charCount[letter] {
                    value += 1
                    charCount[letter] = value
                }
            } else {
                charCount[letter] = 1
            }
        }
        
        print(charCount)
        
        
    }
}
