//
//  ApiService.swift
//  iss-location
//
//  Created by Tomas Ignacio Moyano on 19.11.22.
//

import Foundation

class ApiService: ApiServiceProtocol {

    var session = URLSession.shared
    let sessionConfig = URLSessionConfiguration.default
    
    init() {
        //Configure the timeout for a normal request and for a request for a resource
        sessionConfig.timeoutIntervalForRequest = Constants.TIMEOUT_REQUEST
        sessionConfig.timeoutIntervalForResource = Constants.TIMEOUT_RESOURCE
        session = URLSession(configuration: sessionConfig)
    }
    
    func getData(with url: URL, completionHandler: @escaping (Bool, Data?, String?) -> ()) {
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completionHandler(false, nil, error.localizedDescription.debugDescription)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if (200...299).contains(httpResponse.statusCode) {
                    completionHandler(true, data, nil)
                } else if (400...599).contains(httpResponse.statusCode) {
                    completionHandler(false, nil, "URL not found")
                }
            }
        }
        task.resume()
    }
}
