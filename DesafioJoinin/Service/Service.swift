//
//  HomeService.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 09/08/23.
//

import Foundation
import Alamofire

class Service: GenericService {
    
    //MARK: - Public Methods
    public func getHolidayList(countryCode: String, year: Int, completion: @escaping Completion<[Holiday]>) {
        let url: String = "https://date.nager.at/api/v3/PublicHolidays/\(year)/\(countryCode)"
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: [Holiday].self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let holidays):
                completion(holidays, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func getCountries(completion: @escaping Completion<[Country]>) {
        let url: String = "https://date.nager.at/api/v3/AvailableCountries"
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: [Country].self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let holidays):
                completion(holidays, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
