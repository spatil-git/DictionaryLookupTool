//
//  WordDefinitionModel.swift
//  DictionaryLookupApp
//
//  Created by Sanjay Patil on 9/17/19.
//  Copyright © 2019 Sanjay Patil. All rights reserved.
//

import Foundation

struct Examples:Codable {
    let text:String
}

struct Senses:Codable {
    let id:String
    let shortDefinitions:[String]?
    let meanings:[String]?
    let examples:[Examples]?
    private enum CodingKeys: String, CodingKey {
        case meanings = "definitions"
        case shortDefinitions = "shortDefinitions"
        case examples = "examples"
        case id = "id"
    }
}

struct Entries:Codable {
    let senses:[Senses]
}

struct LexicalEntries:Codable {
    let entries:[Entries]
}
struct Result:Codable {
    let lexicalEntries:[LexicalEntries]
}

struct WordDefinitionModel:Codable {
    let results:[Result]
    
    /*func definitions() -> [String] {
        return results[0].lexicalEntries[0].entries[0].senses[0].meanings
    }

    func example() -> String {
        return results[0].lexicalEntries[0].entries[0].senses[0].examples[0].text
    }*/
}
