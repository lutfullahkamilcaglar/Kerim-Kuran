//
//  DataLoader.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 31/01/2023.
//

import Foundation

public class DataLoader {
    
    let jsonDecoder = JSONDecoder()
    
    @Published var verseData = [Verse]()
    @Published var verseInfoData = [VerseInfo]()
    
    init() {
        self.verseData = decodeJson(resourceName: "VerseData") // quran verses
        self.verseInfoData = decodeJson(resourceName: "VerseInfoData")
    }
    
    func decodeJson<T: Decodable>(
        resourceName: String
    ) -> [T] {
        do {
            let fileLocation = Bundle.main.url(forResource: resourceName, withExtension: "json")
            let data = try Data(contentsOf: fileLocation!)
            return try jsonDecoder.decode([T].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
