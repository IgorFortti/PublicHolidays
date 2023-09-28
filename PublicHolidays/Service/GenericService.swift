//
//  GenericService.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation
//MARK: - Protocol
protocol GenericService: AnyObject {
    typealias Completion <T> = (_ result: T?, _ failure: Error?) -> Void
}
