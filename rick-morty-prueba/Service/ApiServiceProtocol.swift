//
//  ApiServiceProtocol.swift
//  iss-location
//
//  Created by Tomas Ignacio Moyano on 19.11.22.
//

import Foundation

protocol ApiServiceProtocol {
    func getData(with url: URL, completionHandler: @escaping ( _ success: Bool, _ data: Data?, _ error: String? )->())
}
