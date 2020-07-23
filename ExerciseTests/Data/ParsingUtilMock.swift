//
//  ParsingUtilMock.swift
//  ExerciseTests

import Foundation
@testable import Exercise

class ParsingUtilMock: ParsingUtilProtocol {
    var getJsonFromFileCalled = false
    
    func getJsonFromFile(fileName: String, bundle: Bundle) -> String? {
        getJsonFromFileCalled = true
        return ""
    }
}
