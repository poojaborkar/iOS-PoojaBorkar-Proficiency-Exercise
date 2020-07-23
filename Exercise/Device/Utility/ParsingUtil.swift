//
//  ParsingUtil.swift
//  CompanionApp

import Foundation

protocol ParsingUtilProtocol {
    func getJsonFromFile(fileName: String, bundle: Bundle) -> String?
}

public class ParsingUtil: ParsingUtilProtocol {
    
    func getJsonFromFile(fileName: String, bundle: Bundle = Bundle.main) -> String? {
        
        guard let fileLocation = bundle.path(forResource: fileName, ofType: "json") else { return nil
        }
        let text: String?
        do {
            text = try String(contentsOfFile: fileLocation)
        } catch {
            text = String()
        }
        
        return text
    }
    
    func deserialization<T>(_ type: T.Type,
                                          from data: Data) -> (T?, error: Error?, data: Data?) where T: Decodable {
        
        var response: T?
        var err: Error?
        do {
            response = try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("\(error.localizedDescription)")
            err = error
        }
        
        return (response, err, data)
    }
}
