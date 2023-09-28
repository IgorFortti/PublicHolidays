//
//  Holiday.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation
//MARK: - Struct
struct Holiday: Decodable {
    var date: String?
    var localName: String?
    var name: String?
    var countryCode: String?
    var fixed: Bool?
    var global: Bool?
    var counties: [String]?
    var launchYear: Int?
    var types: [String]?
}
