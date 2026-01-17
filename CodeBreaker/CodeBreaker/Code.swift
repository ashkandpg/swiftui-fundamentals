//
//  Code.swift
//  CodeBreaker
//
//  Created by Ashkan Malekloo on 1/1/26.
//


import SwiftUI

extension Peg {
    static let missing = Color.clear
}

struct Code {
    var pegs: [Peg] = Array(repeating: Peg.missing, count: 4)
    var kind: Kind
    
    
    static let missingPeg: Peg = .clear
    
    enum Kind: Equatable {
        case master(isHidden: Bool)
        case guess
        case attempt([Match])
        case unknown
    }
    
    mutating func randomize(from pegChoices: [Peg]){
        for index in pegs.indices {
            pegs[index] = pegChoices.randomElement() ?? Code.missingPeg
        }
    }
    
    var isHidden: Bool {
        switch kind {
            case .master(isHidden: true):
            return true
        default:
            return false
        }
    }
    
    mutating func reset() {
        pegs = Array(repeating: .missing, count: 4)
    }
    
    var matches: [Match]? {
        switch kind {
            case .attempt(let matches):
            return matches
        default:
            return nil
        }
    }
    
    func match(against otherCode: Code) -> [Match] {
        var pegsToMatch = otherCode.pegs
        
        let backwardExactMatches = pegs.indices.reversed().map { index in
            if pegsToMatch.count > index, pegsToMatch[index] == pegs[index] {
                pegsToMatch.remove(at: index)
                return Match.exact
            } else {
                return .nomatch
            }
        }
        let exactMatches = Array(backwardExactMatches.reversed())
        return pegs.indices.map { index in
            if exactMatches[index] != .exact, let matchIndex = pegsToMatch.firstIndex(of: pegs[index]) {
                pegsToMatch.remove(at: matchIndex)
                return .inexact
            }
            else {
                return exactMatches[index]
            }
        }
    }
}

