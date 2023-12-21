//
//  AdventOfCode2023Day2.swift
//  
//
//  Created by Thomas on 12/20/23.
//

import Foundation

struct Handful {
    var red: Int?
    var green: Int?
    var blue: Int?
}

let comparisonCubes = Handful(red: 12, green: 13, blue: 14)

let sampleIndividualGame = "Game 1: 20 green, 3 red, 2 blue; 9 red, 16 blue, 18 green; 6 blue, 19 red, 10 green; 12 red, 19 green, 11 blue"

let rawInputOfAllGames = """
Game 1: 20 green, 3 red, 2 blue; 9 red, 16 blue, 18 green; 6 blue, 19 red, 10 green; 12 red, 19 green, 11 blue
Game 2: 12 green, 3 blue, 16 red; 6 red, 4 blue, 12 green; 11 green, 4 red, 3 blue; 8 green, 15 red, 5 blue
Game 3: 13 blue, 4 red, 8 green; 2 green, 4 red, 19 blue; 5 blue; 10 blue, 6 green, 2 red; 19 blue; 8 blue, 6 red
Game 4: 14 green, 8 blue, 10 red; 11 green, 7 blue, 8 red; 8 green, 18 blue, 11 red
Game 5: 7 red, 7 green, 1 blue; 2 red, 1 green, 2 blue; 2 blue, 7 green; 7 red, 3 blue, 11 green
Game 6: 3 green, 1 red, 3 blue; 5 green, 19 red, 8 blue; 7 red, 2 green, 10 blue; 1 blue, 1 green, 12 red; 6 blue, 1 green, 16 red
Game 7: 1 blue; 2 blue, 11 red, 3 green; 1 blue, 7 red; 2 green, 2 red; 3 green, 4 red, 1 blue; 3 blue, 3 green, 9 red
Game 8: 4 red, 6 green, 4 blue; 4 red, 1 green; 9 blue, 1 green, 11 red
Game 9: 3 blue, 17 red, 5 green; 8 blue, 9 green, 1 red; 6 green, 2 blue, 2 red
Game 10: 3 green, 8 blue; 2 green, 2 red, 3 blue; 1 green, 2 red, 1 blue; 1 red, 3 green, 9 blue; 11 blue; 7 blue
Game 11: 3 red, 3 blue, 9 green; 3 green, 4 red, 8 blue; 1 red, 12 blue; 2 red, 5 blue, 7 green; 11 blue, 2 red, 6 green
Game 12: 15 green, 3 blue, 1 red; 10 green, 2 blue, 2 red; 2 blue, 15 green; 1 red, 10 green, 2 blue; 16 green, 2 red
Game 13: 2 green, 3 blue, 5 red; 9 green, 5 blue, 1 red; 10 blue, 4 red
Game 14: 1 red, 3 green, 20 blue; 8 red, 5 green, 1 blue; 12 blue, 1 green, 2 red; 8 red, 2 green, 2 blue
Game 15: 14 blue, 3 green, 8 red; 16 red, 10 blue; 2 green, 10 blue, 9 red; 12 red, 3 blue, 2 green; 4 green, 6 red, 4 blue
Game 16: 9 green, 7 red, 5 blue; 15 green, 4 red; 3 green, 6 red
Game 17: 1 green, 7 red, 10 blue; 8 blue, 2 red, 1 green; 7 red, 1 green, 9 blue; 1 red
Game 18: 2 blue, 1 green, 1 red; 9 red, 4 green, 2 blue; 3 green, 10 red, 1 blue
Game 19: 1 blue, 5 green, 13 red; 8 green, 15 red, 1 blue; 4 green, 6 red, 1 blue; 2 blue, 3 green; 8 red, 2 blue, 9 green
Game 20: 1 green, 1 blue, 1 red; 7 blue, 2 red; 3 red, 3 blue, 1 green; 2 blue, 2 red
Game 21: 1 blue, 2 red, 13 green; 13 green, 5 blue, 7 red; 4 green, 13 red, 2 blue
Game 22: 7 green, 16 red, 6 blue; 1 red, 5 blue, 10 green; 5 blue, 4 green, 14 red; 6 green, 6 blue; 6 blue, 4 green, 2 red
Game 23: 2 blue, 3 green, 1 red; 2 blue; 3 red, 4 green
Game 24: 10 red, 6 green, 12 blue; 1 red, 13 blue, 1 green; 7 blue, 9 green, 1 red; 7 red, 7 green, 5 blue
Game 25: 13 green, 15 blue, 10 red; 14 green, 6 blue, 1 red; 14 green, 5 red, 15 blue; 7 green, 6 red, 14 blue; 6 red, 2 blue, 17 green; 13 blue, 4 red, 4 green
Game 26: 16 green, 12 blue; 10 blue, 17 green, 3 red; 12 blue, 12 green; 8 blue, 5 green; 1 red, 10 blue, 2 green
Game 27: 12 blue, 4 red; 12 blue, 2 green, 1 red; 16 blue, 4 red, 1 green; 11 blue, 3 red; 1 green, 3 red, 1 blue
Game 28: 16 green, 2 blue, 14 red; 7 blue, 9 red, 8 green; 6 blue, 12 green, 19 red; 9 blue, 10 red, 15 green; 19 red, 7 blue, 10 green; 5 green, 6 red, 3 blue
Game 29: 1 red, 2 green; 11 blue, 5 green, 4 red; 6 red, 6 green, 12 blue; 14 blue, 5 red, 4 green; 5 green, 8 red, 6 blue; 8 blue, 4 red, 4 green
Game 30: 15 red, 2 blue, 6 green; 4 red, 3 green, 2 blue; 9 blue, 3 green, 16 red; 1 green, 11 blue, 13 red
Game 31: 2 blue, 4 green, 3 red; 3 red, 3 blue, 4 green; 1 red, 6 blue; 3 red, 6 blue, 2 green; 3 green, 1 red, 6 blue; 7 green, 1 blue, 2 red
Game 32: 8 green; 3 blue, 14 green; 8 green, 5 blue, 5 red; 6 green, 9 red, 4 blue
Game 33: 6 red, 10 green; 8 green; 2 blue, 13 green; 3 red, 2 blue, 1 green; 2 red, 3 green; 2 red, 12 green, 1 blue
Game 34: 1 blue, 12 red, 1 green; 2 blue, 7 red; 9 blue, 1 red, 1 green
Game 35: 1 blue, 2 green; 3 red, 1 blue; 2 red; 2 green, 5 red; 1 red, 1 green
Game 36: 12 green, 3 blue, 6 red; 15 green, 10 blue, 3 red; 5 red, 9 green, 14 blue
Game 37: 2 red, 13 green, 6 blue; 2 green; 17 green, 9 blue, 4 red; 7 blue, 1 red, 2 green
Game 38: 9 red, 12 blue; 11 blue, 2 red; 5 red; 10 red, 2 blue; 2 blue, 1 green, 13 red
Game 39: 11 green, 8 red, 17 blue; 3 red, 3 green, 7 blue; 12 blue, 13 red, 11 green; 17 blue, 11 green, 9 red; 8 blue, 12 green, 2 red
Game 40: 4 green, 2 red; 5 green, 1 blue, 12 red; 11 red, 2 green; 6 red, 1 green
Game 41: 13 green, 4 red, 1 blue; 9 green, 1 blue, 3 red; 20 red; 3 green, 19 red, 1 blue
Game 42: 3 green, 1 red, 6 blue; 6 green, 7 blue; 1 red, 11 green, 6 blue; 5 green, 9 blue, 7 red
Game 43: 2 blue, 9 green, 9 red; 8 red, 2 green, 10 blue; 15 green, 6 blue; 6 red, 2 blue, 2 green; 2 green, 2 blue, 13 red; 7 green, 6 blue, 6 red
Game 44: 6 blue, 3 green, 3 red; 4 red, 3 blue; 3 red, 4 green
Game 45: 2 red, 19 blue; 3 red, 19 blue, 17 green; 12 red, 8 green, 19 blue; 14 green, 11 red, 1 blue; 10 red, 8 green, 1 blue; 6 red, 1 blue, 19 green
Game 46: 4 red; 8 blue, 3 green; 3 red, 3 green, 1 blue; 4 blue, 2 green, 5 red
Game 47: 5 blue, 9 red, 2 green; 5 blue, 7 green, 6 red; 13 green, 5 blue, 10 red
Game 48: 8 green, 12 blue, 1 red; 8 green, 9 blue, 2 red; 8 blue, 12 green, 3 red; 5 green, 13 blue, 2 red
Game 49: 4 red, 18 blue; 4 blue, 3 red, 2 green; 7 red, 2 green, 10 blue; 1 green, 5 red, 5 blue; 6 blue, 4 red
Game 50: 13 green, 1 blue, 6 red; 1 blue, 1 red, 13 green; 15 green, 2 red; 1 blue, 1 green, 2 red; 5 green, 1 blue, 1 red; 13 green
Game 51: 1 green, 6 red; 1 green, 3 blue, 6 red; 7 red, 3 blue; 3 blue, 9 red; 2 blue, 2 red
Game 52: 2 red, 12 green, 9 blue; 8 green, 2 red, 11 blue; 13 blue, 2 red, 10 green; 5 blue, 2 green
Game 53: 18 red, 13 blue, 3 green; 10 blue, 6 green, 15 red; 7 red, 1 green, 4 blue; 6 blue, 16 red, 10 green
Game 54: 4 blue, 5 green; 4 green, 4 blue, 2 red; 2 red; 4 green, 1 red
Game 55: 7 green, 1 red, 4 blue; 2 green, 7 red, 2 blue; 4 blue, 4 red, 2 green; 3 blue; 5 blue, 6 red, 12 green; 13 green
Game 56: 10 red, 1 green, 6 blue; 1 blue, 4 green; 4 green, 6 blue, 10 red; 7 green, 4 blue; 10 blue, 7 red, 8 green; 7 blue, 1 green
Game 57: 8 blue, 2 red, 7 green; 8 blue, 1 red, 11 green; 7 blue, 1 green, 7 red; 7 red, 14 green, 5 blue; 7 red, 4 green, 8 blue
Game 58: 17 green, 1 red; 7 blue, 2 red, 18 green; 4 red, 15 green, 18 blue
Game 59: 12 green, 6 blue; 10 green, 8 blue, 2 red; 1 red, 11 green, 1 blue; 4 green, 6 blue, 2 red; 5 blue, 1 green, 2 red
Game 60: 4 green, 2 red; 2 blue, 6 green, 5 red; 1 red, 3 green, 1 blue; 6 blue, 3 green
Game 61: 1 red, 1 blue; 5 red, 11 blue, 1 green; 1 red, 13 blue, 1 green
Game 62: 12 green, 5 blue; 1 blue, 5 red, 18 green; 9 green, 2 red, 10 blue; 11 blue, 7 green; 10 green, 4 red, 3 blue
Game 63: 15 red, 1 blue, 10 green; 2 green, 11 blue, 1 red; 4 blue, 2 green, 9 red
Game 64: 11 red, 2 blue; 1 blue, 14 red; 2 green, 2 blue, 12 red; 3 red; 13 red, 1 blue; 1 green, 12 red
Game 65: 10 blue, 1 red; 12 blue, 1 green; 1 green, 3 blue, 1 red
Game 66: 5 green, 14 blue; 6 green, 9 blue, 1 red; 6 green, 2 blue; 5 green
Game 67: 2 blue, 1 red; 3 blue, 1 red; 5 blue, 2 red; 2 red, 7 blue, 2 green; 1 green, 2 blue, 2 red
Game 68: 2 blue, 13 green; 5 green, 1 red; 2 blue, 9 green, 1 red; 18 green, 1 red
Game 69: 15 green, 8 red, 8 blue; 5 red, 11 green, 2 blue; 9 red, 6 blue, 11 green; 6 green, 4 red, 5 blue
Game 70: 4 blue, 2 red; 1 red, 1 green, 1 blue; 5 blue, 1 green, 2 red; 1 blue; 1 red, 1 green; 3 blue
Game 71: 5 red, 2 blue; 1 blue, 4 green; 10 green, 5 red, 2 blue; 2 blue, 6 green, 4 red
Game 72: 9 blue, 1 green; 1 red, 5 blue; 7 blue, 1 red, 11 green; 3 green, 1 red, 11 blue
Game 73: 1 green, 1 red, 10 blue; 12 blue; 2 red, 9 blue
Game 74: 5 blue; 4 blue, 2 red, 8 green; 1 red, 4 blue, 1 green
Game 75: 9 green, 9 blue, 10 red; 8 blue, 17 green, 1 red; 3 blue, 2 red, 4 green; 10 blue, 8 green, 7 red; 7 blue, 10 red, 5 green
Game 76: 11 green, 12 blue, 8 red; 11 red, 11 green, 8 blue; 6 red, 9 blue, 14 green; 14 blue, 12 red, 9 green
Game 77: 1 red, 3 blue, 2 green; 4 green, 5 blue; 1 blue, 1 red; 3 green, 4 blue, 1 red; 5 green, 1 red, 3 blue; 1 red, 2 green
Game 78: 10 blue, 4 green, 12 red; 6 green, 10 red, 10 blue; 14 blue, 3 green, 8 red; 5 red, 6 green; 4 green; 20 blue, 5 red, 5 green
Game 79: 13 green; 15 green, 9 blue, 6 red; 5 red, 10 green, 6 blue; 13 green, 6 red, 4 blue
Game 80: 1 red, 9 blue; 1 green, 10 blue, 3 red; 9 blue, 1 green, 1 red
Game 81: 2 blue, 1 red; 2 blue, 5 green; 2 red, 7 green, 2 blue; 3 blue; 2 green, 2 red; 7 green, 2 blue, 1 red
Game 82: 7 red, 12 blue, 4 green; 9 red, 11 green, 8 blue; 10 blue, 8 red, 9 green; 6 red, 2 blue, 7 green; 12 red, 8 green, 9 blue
Game 83: 14 blue; 10 blue, 3 red, 4 green; 7 blue, 10 green, 2 red; 3 red, 4 blue, 12 green
Game 84: 12 red, 13 blue, 2 green; 11 red, 3 green, 15 blue; 15 red, 4 green, 5 blue; 1 red, 3 green, 11 blue; 3 green, 4 red, 3 blue
Game 85: 8 blue, 1 green, 1 red; 1 red, 8 blue, 4 green; 3 red, 13 blue, 8 green
Game 86: 9 blue, 4 green, 4 red; 4 red, 2 blue, 4 green; 10 red, 2 green; 7 blue, 4 green, 12 red
Game 87: 1 blue, 9 green, 10 red; 1 red, 11 blue, 2 green; 17 blue, 3 red
Game 88: 12 red, 6 green, 9 blue; 18 blue, 17 red, 7 green; 16 red, 6 green; 6 green, 5 red, 12 blue
Game 89: 12 green, 10 blue, 2 red; 4 blue, 15 green, 1 red; 7 green, 11 blue; 12 green, 7 blue, 2 red; 14 blue, 12 green, 2 red
Game 90: 14 blue, 1 red, 3 green; 3 green, 2 blue, 3 red; 1 red, 16 blue; 1 green, 10 blue
Game 91: 11 red, 5 green; 5 red, 5 green, 1 blue; 8 red, 1 blue, 4 green; 1 blue, 3 green, 8 red
Game 92: 19 green, 2 red, 10 blue; 9 blue, 11 green, 4 red; 10 blue, 5 green, 2 red; 3 red, 5 blue, 7 green
Game 93: 1 green, 7 blue, 5 red; 9 green, 6 red, 13 blue; 11 blue, 12 red, 7 green; 1 red, 12 blue, 7 green
Game 94: 4 red, 9 green, 1 blue; 11 green, 11 blue, 4 red; 10 red, 17 blue, 11 green; 5 blue, 12 red, 2 green; 14 blue, 6 green, 5 red; 8 green, 19 blue, 13 red
Game 95: 5 green, 1 blue, 7 red; 3 blue, 14 red, 17 green; 3 blue, 7 red, 9 green; 17 red, 6 green, 1 blue; 17 red, 4 green
Game 96: 3 red, 10 green; 9 green, 11 red; 2 red, 6 green, 2 blue; 1 blue, 9 red, 1 green; 12 red, 1 blue; 4 green, 12 red
Game 97: 3 green, 11 red, 1 blue; 3 green, 13 red, 4 blue; 1 green, 3 blue, 12 red; 4 green, 10 red; 4 blue, 10 green, 12 red
Game 98: 6 blue, 12 red; 17 red, 1 green, 11 blue; 13 blue, 9 red; 9 red, 6 blue, 2 green
Game 99: 15 green, 1 blue, 11 red; 12 green, 12 blue, 14 red; 12 green, 10 blue, 1 red
Game 100: 1 green, 11 red, 4 blue; 4 green, 1 red; 9 red, 2 blue; 5 blue, 11 red, 9 green
"""

// MARK: - Part 1: Get the Sum of the IDs of Possible Games Given a Certain Set of Cubes

// MARK: These inital functions, until "MARK" below, are general functions that are useful in both Parts 1 and 2.

func separateGames(inInputString inputString: String) -> [String] {
    // Call this on the initial input string to separate the one long string into an array of strings.
    return inputString.components(separatedBy: "\n")
}

func getNumberPrefix(fromString string: String) -> Int {
    // Trim string, as the second and third components in each hand will start with a leading space.
    let trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // Get the number string prefix from a cube color/quantity substring (e.g. get "2" from "2 green").
    let numberPrefixString = trimmedString.prefix { Int(String($0)) != nil }
    
    // This function force unwraps the Int conversion because all of these strings in our sample data set have an integer character prefix, and will always successfully typecast to an Int.
    return Int(numberPrefixString)!
}

func separateIntoParseableHandfuls(gameString: String) -> [Handful] {
    // Within one game, separate handfuls by semicolon.
    // Return an array of tuples containing the number of red, green, and blue cubes.
    var output = [Handful]()

    let gameStringTrimmingGameTitle = gameString.trimmingPrefix { $0 != ":" }.dropFirst(2)
    
    let separatedHandfuls = gameStringTrimmingGameTitle.components(separatedBy: ";")
    
    for handful in separatedHandfuls {
        var parseableHandful = Handful()
        
        let cubesSeparatedByColor = handful.components(separatedBy: ",")
        
        for group in cubesSeparatedByColor {
            let numberPrefix = getNumberPrefix(fromString: group)
            
            if group.hasSuffix("red") {
                parseableHandful.red = numberPrefix
            } else if group.hasSuffix("green") {
                parseableHandful.green = numberPrefix
            } else if group.hasSuffix("blue") {
                parseableHandful.blue = numberPrefix
            }
        }
        
        output.append(parseableHandful)
    }
    
    return output
}

// MARK: The functions below, up until Part 2, are specfic to Part 1.

func determineCompatabilityOfSampleHandful(_ sampleHandful: Handful, givenComparisonCubes comparisonCubes: Handful) -> Bool {
    var redIsCompatible = false
    var greenIsCompatible = false
    var blueIsCompatible = false
    
    /*
     This looks terrible because it, err, kind of is.
     
     For each color (red, green, and blue), this function checks for multiple situations to determine compatibility of a sample handful given a set of comparison cubes:
     
     START: Do the comparison cubes have ANY of a specific color?
        a. If YES, does the sample handful have ANY cubes of that specific color?
            1. If YES, is the number of cubes of that color in the sample hand less than or equal to the amount of cubes in the comparison hand?
                a. If YES, the sample hand IS compatible.
                b. If NO, the sample hand IS NOT compatible.
            2. If NO, the sample handful IS compatible.
        b. If NO, does the sample handful have ANY cubes of that color?
            1. If YES, the sample handful IS NOT compatible.
            2. If NO, the sample handful IS compatible.
     */
    
    if let comparisonRed = comparisonCubes.red {
        if let sampleRed = sampleHandful.red {
            if sampleRed <= comparisonRed {
                redIsCompatible = true
            }
        } else {
            redIsCompatible = true
        }
    } else {
        if sampleHandful.red == nil {
            redIsCompatible = true
        }
    }
    
    if let comparisonGreen = comparisonCubes.green {
        if let sampleGreen = sampleHandful.green {
            if sampleGreen <= comparisonGreen {
                greenIsCompatible = true
            }
        } else {
            greenIsCompatible = true
        }
    } else {
        if sampleHandful.green == nil {
            greenIsCompatible = true
        }
    }
    
    if let comparisonBlue = comparisonCubes.blue {
        if let sampleBlue = sampleHandful.blue {
            if sampleBlue <= comparisonBlue {
                blueIsCompatible = true
            }
        } else {
            blueIsCompatible = true
        }
    } else {
        if sampleHandful.blue == nil {
            blueIsCompatible = true
        }
    }
    
    if redIsCompatible && greenIsCompatible && blueIsCompatible {
        return true
    } else {
        print("Sample handful is not compatible with comparison cubes:\nRed is compatible: \(redIsCompatible)\nGreen is compatible: \(greenIsCompatible)\nBlue is compatible: \(blueIsCompatible)")
        return false
    }
}

func getIDNumberOfGameStringIfPossible(_ gameString: String, givenComparisonCubes comparisonCubes: Handful) -> Int {
    let sampleGameAsHandfuls = separateIntoParseableHandfuls(gameString: gameString)
    
    for handful in sampleGameAsHandfuls {
        if determineCompatabilityOfSampleHandful(handful, givenComparisonCubes: comparisonCubes) == false {
            // If the game is not possible, return 0, because we will ultimately be adding up all of the ID numbers to get the final result at the end. Returning zero will effectively ignore all imposible games.
            return 0
        }
    }
    
    // We know that every game will be prefixed by "Game" + [space] + [number] + ":", so:
    // 1. Get the prefix up to the colon
    // 2. Drop the first five characters, which will always be "Game "
    // 3. Typecast that substring to a String, so that it can be converted to an Int
    // 4. Convert it to an Int; return that Int.
    let IDNumberString = String(gameString.prefix { $0 != ":"}.dropFirst(5))
    
    // It is safe to force unwrap this typecasting to an Int, because the characters left between "Game " and ":" should always be integers.
    return Int(IDNumberString)!
}

func getSumOfIDNumbersFromPossibleGamesIn(rawInputString: String, givenComparisonCubes comparisonCubes: Handful) -> Int {
    var sumOfPossibleGameIDs = 0
    
    let games = separateGames(inInputString: rawInputString)
    
    for game in games {
        sumOfPossibleGameIDs += getIDNumberOfGameStringIfPossible(game, givenComparisonCubes: comparisonCubes)
    }
    
    return sumOfPossibleGameIDs
}

getSumOfIDNumbersFromPossibleGamesIn(rawInputString: rawInputOfAllGames, givenComparisonCubes: comparisonCubes)

// MARK: - Part 2: Get the "Power" of Each Handful of Cubes

func getPower(ofGameString gameString: String) -> Int {
    var redCubesRequired = 0
    var greenCubesRequired = 0
    var blueCubesRequired = 0
    
    let sampleGameAsHandfuls = separateIntoParseableHandfuls(gameString: gameString)
    
    for handful in sampleGameAsHandfuls {
        if let numberOfRedCubes = handful.red {
            if numberOfRedCubes > redCubesRequired {
                redCubesRequired = numberOfRedCubes
            }
        }
        
        if let numberOfGreenCubes = handful.green {
            if numberOfGreenCubes > greenCubesRequired {
                greenCubesRequired = numberOfGreenCubes
            }
        }
        
        if let numberOfBlueCubes = handful.blue {
            if numberOfBlueCubes > blueCubesRequired {
                blueCubesRequired = numberOfBlueCubes
            }
        }
    }
    
    return redCubesRequired * greenCubesRequired * blueCubesRequired
}

func getSumOfPowersFromGamesIn(rawInputString: String) -> Int {
    var sumOfPowers = 0
    
    let games = separateGames(inInputString: rawInputString)
    
    for game in games {
        sumOfPowers += getPower(ofGameString: game)
    }
    
    return sumOfPowers
}

getSumOfPowersFromGamesIn(rawInputString: rawInputOfAllGames)
