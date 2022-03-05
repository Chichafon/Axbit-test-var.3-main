//
//  NetworkService.swift
//  Axbit test var.3
//
//  Created by 111 on 01.03.2022.
//

import Foundation


class NetworkService {
    func request(urlString: String, complition: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            fatalError("Error getting names URL")
        }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    complition(.failure(error))
                }

                guard let data = data else { return }
                complition(.success(data))
            }
        }.resume()
    }
}
