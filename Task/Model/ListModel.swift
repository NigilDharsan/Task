//
//  ListModel.swift
//  Task
//
//  Created by MAHENDRAN on 20/05/23.
//

import Foundation



//typealias WelcomeDetails = [WelcomeElement]
// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    //let word, phonetic: String
  //  let phonetics: [Phonetic]
    let meanings: [Meaning]
//    let license: License
//    let sourceUrls: [String]
}

// MARK: - License
struct License: Codable {
    let name: String
    let url: String
}

// MARK: - Meaning
struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
    let synonyms: [String]
   // let antonyms: [JSONAny]
}

// MARK: - Definition
struct Definition: Codable {
    let definition: String
    let synonyms: [String]
  //  let antonyms: [JSONAny]
    let example: String?
}

// MARK: - Phonetic
//struct Phonetic: Codable {
//    let text: String
//    let audio: String
//    let sourceURL: String?
//    let license: License?
//
////    enum CodingKeys: String, CodingKey {
////        case text, audio
////        case sourceURL
////        case license
////    }
//}
