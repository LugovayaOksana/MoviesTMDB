//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Оксана on 11.11.2021.
//

import Foundation
import Alamofire
import SwiftUI


final class NetworkManager<T: Codable> {
    static func fetch(from urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        AF.request(urlString).responseDecodable(of: T.self) { (resp) in
            if resp.error != nil {
                completion(.failure(.invalidResponse))
                print(resp.error!)
                return
            }

            if let payload = resp.value {
                completion(.success(payload))
                let res = resp.result

                Log.d("\(res)") // DEBUG log
                Log.e("This is an ERROR message") // ERROR log
                Log.i("This is a INFO message") // INFO log
                Log.v("This is a VERBOSE message") // VERBOSE log
                Log.w("This is a WARNING message") // WARNING log
                Log.s("This is a SEVERE message") // SEVERE Error log
                return
            }

            completion(.failure(.nilResponse))
        }
    }
}

enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}
