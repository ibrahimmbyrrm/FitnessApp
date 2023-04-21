//
//  NetworkManager.swift
//  FitnessApp
//
//  Created by İbrahim Bayram on 22.04.2023.
//

import Foundation

struct NetworkManager {
    func fetchData<T : Codable>(queryInput : String?,type : T.Type, url : BaseURLS, method : HTTPMethod, completion : @escaping(Result<[T],HTTPError>)->Void) {
        var request : URLRequest?
        
        if url == .nutritionURL {
            guard let queryInput = queryInput else {return}
            let query = queryInput.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            
            let url = "\(url.rawValue)=\(query!)"
            print(url)
            request = URLRequest(url: url.asURL())
        }else {
            let url = url.rawValue
            request = URLRequest(url: url.asURL())
        }
        request?.allHTTPHeaderFields = ["X-Api-Key" : "\(ProcessInfo.processInfo.environment["API_KEY"]!)"]
        guard let urlRequest = request else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if error != nil {
                completion(.failure(.invalidData))
            }else {
                guard let data = data else {return}
                self.handleResponse(data: data) { response in
                    completion(response)
                }
            }
        }.resume()
    }
    
    func handleResponse<T : Codable>(data : Data, completion : @escaping(Result<[T] , HTTPError>)->Void) {
        do {
            let result = try JSONDecoder().decode([T].self, from: data)
            completion(.success(result))
        }catch {
            completion(.failure(.parsingError))
        }
    }
    
}
