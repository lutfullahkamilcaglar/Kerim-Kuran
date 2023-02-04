//
//  VerseData.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 31/01/2023.
//

import Foundation

struct Verse: Codable {
    var name: String
    var id: String
    var sureId: Int
    var ayetId: Int
    var ayetValue: String
}

