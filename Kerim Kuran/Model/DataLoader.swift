//
//  DataLoader.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 31/01/2023.
//

import Foundation

public class DataLoader {
    @Published var verseData = [VerseData]()
    init() {
        load()
    }
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "p1", withExtension: "json"){
            do{
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJSON = try jsonDecoder.decode([VerseData].self, from: data)
                self.verseData = dataFromJSON
            }catch{
                print(error)
            }
        }
    }
}
