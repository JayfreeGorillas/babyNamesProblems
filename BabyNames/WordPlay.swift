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
        dump(matchedWords)
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
        dump(longestWordsWithRSTLNE)
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
        
        //print(charCount)
        
        
    }
    
 static  func menFromBoys(_ arr: [Int]) -> [Int] {
      var acendingEvens = [Int]()
      var decendingOdds = [Int]()
      var mendAndBoys = [Int]()
      
      for i in arr {
        if i % 2 == 0 {
          acendingEvens.append(i)
          acendingEvens.sort()
        } else {
          decendingOdds.insert(i, at: 0)
          decendingOdds.sort()
        }
          
      }
     var reversedList = decendingOdds.reversed()
        mendAndBoys.append(contentsOf: acendingEvens)
        mendAndBoys.append(contentsOf: reversedList)
        
      return mendAndBoys
    }
    
    
static  func wordsWith3Letters(_ scrabbleWords: Set<String>) {
       // up to 8 count
       // allow only up to 3 characters
       var matchedWords = [String]()
        
outer:   for word in scrabbleWords {
            guard word.count >= 8 else { continue outer }
            
            var foundLetters = Set<Character>()
      
inner:       for letter in word {
                
                if foundLetters.contains(letter) {
                    continue inner
                } else {
                    foundLetters.insert(letter)
                }
            }
    guard foundLetters.count <= 3 else { continue outer }
    matchedWords.append(word)
        }
       dump(matchedWords)
   }
    
    
    
  

    static   func wordsThatAreConsecutive(_ scrabbleWords: Set<String>, alphabet: [String]) {
        var matchedWords: [String] = []
        //   var lettersThatAppearConsecutive: [String:String] = [:]
        
    outer:   for letter in alphabet {
        var doubleLetterCount = 0
        
    inner:  for word in scrabbleWords {
        if word.contains(letter + letter) {
            doubleLetterCount += 1
            continue outer
        } else {
            continue outer
        }
        if doubleLetterCount >= 3 {
            
            matchedWords.append(word)
            break
            
        }
    }
    }
        
    }
    
   static func findThreeOrMoreConsecutives(_ scrabbleWords: Set<String>, alphabet: [String]) {
        var matchedWords = [String]()
        
    outer:       for word in scrabbleWords {
            var consecutiveCount = 0
            
        inner:  for letter in alphabet {
                let consecutiveLetter = letter + letter
                if word.contains(consecutiveLetter) {
                    consecutiveCount += 1
                } else {
                    continue inner
                }
            }
        
        if consecutiveCount >= 3 {
            matchedWords.append(word)
            continue outer
        }
        }
        
        dump(matchedWords)
    }
    
    static func findWordsWithAvailableLetters(in scrabbleSet: Set<String> ,_ letters: String) {
        let uppLetters = letters.uppercased()
        let characters = Array(uppLetters)
        var matches = [String]()
        
    outer:   for word in scrabbleSet {
        
    inner:     for letter in word {
        if characters.contains(letter) {
            continue inner
        } else {
            continue outer
        }
    }
        matches.append(word)
    }
       // dump(matches)
    }
    
//    static func findCompoundWords(_ scrabbleSet: Set<String>) {
//        var matches = [String]()
//        var previousWords = Set<String>()
//
//    outer:    for word in scrabbleSet {
//        // runs n times
//        // 267k
//            previousWords.insert(word)
//            guard !previousWords.isEmpty else { return }
//
//    inner:  for previousWord in previousWords {
//        // gradually incresing to run n times
//        // every previous word gets compared with word
//        // 267k per previous - 267k times * M (previous list)
//        let newWord = previousWord + word
//        let reversedWord = word + previousWord
//
//        if scrabbleSet.contains(newWord)  {
//            matches.append(newWord)
//            print(newWord)
//        } else if  scrabbleSet.contains(reversedWord) {
//            matches.append(reversedWord)
//
//            print(reversedWord)
//        }
//        }
//        }
//
//
//        dump(matches)
//    }
    
//    static func compoundWords(_ scrabble: [String]) {
//        var matches = [String]()
//        let newScrabbleList = scrabble.filter { $0.count >= 4 }
//        let scrabbleSet = Set(newScrabbleList)
//        var iterationCount = 0
//        for word in newScrabbleList {
//            print(word)
//            for nextWord in newScrabbleList {
//                let combinedWord = word + nextWord
//                let swappedCombinedWord = nextWord + word
//                
//                iterationCount += 1
//                if iterationCount % 100000 == 0 {
//                    print(iterationCount)
//                }
//                if scrabbleSet.contains(combinedWord) {
//                    matches.append(combinedWord)
//                } else if scrabbleSet.contains(swappedCombinedWord) {
//                    matches.append(swappedCombinedWord)
//                }
//            }
//        }
//        dump(matches)
//        print(iterationCount)
//    }
    
//  static  func findCompoundWords(_ scrabbleWords: [String]) {
//        var matches = [String]()
//        let scrabbleSet = Set(scrabbleWords)
//
//outer:    for word in scrabbleSet {
//
//
//inner:   for anotherWord in scrabbleSet {
//                let combinedWord = word + anotherWord
//                let swappedCombinedWord = anotherWord + word
//
//               guard scrabbleSet.contains(combinedWord) || scrabbleSet.contains(swappedCombinedWord) else { continue inner }
//
//                if scrabbleSet.contains(combinedWord) {
//                    matches.append(combinedWord)
//                } else if scrabbleSet.contains(swappedCombinedWord) {
//                    matches.append(swappedCombinedWord)
//                }
//            }
//        }
//        dump(matches)
//    }
    
    func combineWordsCheckIfInList(wordOne: String, wordTwo: String, list: Set<String>) -> [String] {
        var matches = [String]()
        let combinedWord = wordOne + wordTwo
        let swappedCombinedWord = wordTwo + wordOne
        
        if list.contains(combinedWord) {
            matches.append(combinedWord)
        } else if list.contains(swappedCombinedWord) {
            matches.append(swappedCombinedWord)
        }
        
        return matches
    }
    
    
    
// static  func compundWords(_ scrabble: [String]) {
//        var matches = [String]()
//        var start = 0
//        var next  = 1
//        let scrabbleSet = Set(scrabble)
//
//
//     while start < scrabble.count {
//
//         var currentWord = scrabble[start]
//         let nextWord = scrabble[next]
//         let newWord = currentWord + nextWord
//         let reversedNewWord = nextWord + currentWord
//         print(next)
//
//         if scrabbleSet.contains(newWord) {
//             matches.append(newWord)
//             next += 1
//         } else if scrabbleSet.contains(reversedNewWord) {
//             matches.append(reversedNewWord)
//             next += 1
//         } else {
//             next += 1
//
//             if next == scrabble.count {
//                 start += 1
//                 next = start + 1
//                 print("reset - \(start)")
//             }
//         }
//     }
//
//        dump(matches)
//
//    }
    
    static  func findCompoundWords(scrabbleWords: Set<String>) {
        var matches = [String]()
        var outerLoopIterations = 0
        var innerLoopIterations = 0

outer: for word in scrabbleWords {
        var leftSideOffSet = 2
        outerLoopIterations += 1
        
        for _ in word {
            innerLoopIterations += 1
            let rightSideOffSet = (word.count - leftSideOffSet)
            let leftSide     = word.prefix(leftSideOffSet)
            
            guard leftSide.count != word.count else { continue outer }
            
            let rightIndexStart = word.index(word.endIndex, offsetBy: -rightSideOffSet)
            let rightSide = word.suffix(from: rightIndexStart)
            
            
            if scrabbleWords.contains(String(leftSide)) && scrabbleWords.contains(String(rightSide))  {
                matches.append(word)
                continue outer
            } else {
                leftSideOffSet += 1
            }
            // n * m
        }
    }
        dump(matches)
        print("outer: \(outerLoopIterations)")
        print("inner: \(innerLoopIterations)")
        
    }
    
    // find words that have at least 1 abcdef example = feedback
    // list of letters abcdef
    // matches = []
    //through every word on my list
    // check the letters in my word to make sure it has required letters
    // can still have other letters
    // make sure at least 1 of each abcdef
    
    static   func findABCDEF(scrabbleList: Set<String>) {
        var matches = [String]()
        let requiredLetters: Set<Character> = ["A","B","C","D","E","F"]
        // n list of words
        // m = lettersOFWord
        
        for word in scrabbleList {
            var foundLetters: Set<Character> = [] // 1 constant
            // word.contains(Set)
            for letter in word {
                if requiredLetters.contains(letter) { // 1 constant
                    foundLetters.insert(letter) //  2 constant
                    
                    if foundLetters.count == requiredLetters.count {
                        matches.append(word)
                        break
                    }
                }
            }
            
            if foundLetters.count == requiredLetters.count { // 2 constant
                matches.append(word) // 3 constant
            }
        }
        // n * m
        dump(matches)
    }
    // A>B>C>D
    // let sortedWord = word.sorted(by >)
    //  letter in the word throw letters in a set
    // word.sort
    // nextLetter < Previous
    // 1 away only
    // A,C,D,E,G,H
    // [A]
    // C - A == 1
    // []
    // [C]
    // D - C == 1
    // [C,D,E]
    //
    // var chainedLetters = [B, C]
    
    
// MARK: TODO- able to sort a word into an abcdef < alphabetical order grab my compare chained sequence with a count of previous largest chain || abcdef || bcdefgh
    static func chainedLetters(word: String) -> [String]{
        let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

        var currentChain = [String]()
        var bestChainFound = [String]()
        let sortedWord = Set(word)
        
        for letter in alphabet {
            
            let character = Character(letter)
            if sortedWord.contains(character) {
                currentChain.append(letter)
            } else {

                if currentChain.count > bestChainFound.count {
                    bestChainFound = currentChain
                }
                currentChain = []
            }
        }
        //dump(bestChainFound)
        return bestChainFound
    }
    static func findLongestChain(scrabbleWords: Set<String>) -> [String] {
        var longestChain = [String]()
        var wordWithLongestChain = ""
        
        for word in scrabbleWords {
            let wordChain = chainedLetters(word: word)
            
            if wordChain.count > longestChain.count {
                longestChain = wordChain
                wordWithLongestChain = word
            }
        }
        dump(longestChain)
        print(wordWithLongestChain)
        return longestChain
        
    }
    // for every letter in alphabet find longest chain
    // A
    //foundword
    // add next indexLetter
    // AB
    // addtheindex Letter
    // ABC
//    func findLongestChain(scrabbleWords: Set<String>) {
//        var chain = ""
//        var longestChain = [String]()
//        var isAChain = true
//
//        for word in scrabbleWords {
//
//        }
//        // imlement old function in here to check required chains and seeing if i get a result!
//
//    }
}


//requiredLetters.append(letter)
// if word does not contain A
// replace my required "B"
// required letters= "B""C"
// required = "D"
// DF
// DFG
// a
// Think about edge cases
// bcdefAAaaaaaaaaaaaaaa
// set of word^ = bcdefa
// abcdef   g    h
// requiredletters = h
// for letter in alphabet
// requriedletts add letter
// abcdef G
// id word does not contain letter
// requiredLetters = []
// H
// AB
// AB
// C
// CD
// ABC
// ABCD
// ABCDE
// ABCDEF
// ABCDEFG
// A,B,C,D,E, F
// A B C D E F   KLIPP
// Set(word)
// sortedWord = word.sorted
// var currentLongestChain = []
// for letter(G) in my alphabet (A....Z)
// if sortedWord.contain(letter) {
//  add letter to longestChain
// longest chain = ABCDEF
//} else -> return longest chain
// continue alphabetLoop
// currentLongestResult  = ABCDEF
// required = "H"
// required = "I"
// IJ
// current result I
// is currentRult > currentLongestResult
// currentLong = current Result
