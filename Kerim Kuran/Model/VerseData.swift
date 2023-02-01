//
//  VerseData.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 31/01/2023.
//

import Foundation

struct VerseData: Codable {
    var id: String
    var ayetValue: String
}



//struct Verse : Codable {
//    let id: String
//    let ayetValue: String
//}
//
//func loadJson(fileName: String) -> Verse? {
//   let decoder = JSONDecoder()
//   guard
//        let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
//        let data = try? Data(contentsOf: url),
//        let verse = try? decoder.decode(Verse.self, from: data)
//   else {
//        return nil
//   }
//   return verse
//}

