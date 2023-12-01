//
//  UserService.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 17.11.23..
//

import Foundation

import Alamofire

struct UserService {
    
    static func userId(method: HTTPMethod, header: HTTPHeaders, url: String = Urls.user.urlString, _ closure : @escaping (Result<EmptyResponse, Error>)->()) {
        AF.request(url,  method: method, headers: header)
            .responseDecodable(of: EmptyResponse.self) {response in
                switch (response.result) {
                case .success (let response) :
                    closure(.success(response))
                case .failure (let error) :
                    closure(.failure(error))
                }
            }
    }
    
    static func addToFavorites(method: HTTPMethod,header: HTTPHeaders, url: String, _ closure : @escaping (Result<EmptyResponse,
                                                                                                           Error>)->()) {
        AF.request(url, method: method, headers: header)
            .responseDecodable(of: EmptyResponse.self) {response in
                switch (response.result) {
                case .success(let response) :
                    closure(.success(response))
                case .failure (let error) :
                    closure(.failure(error))
                }
            }
    }
    
    static func removeFromFavorites(method: HTTPMethod, header: HTTPHeaders, url: String, _ closure : @escaping (Result<EmptyResponse,
                                                                                                                 Error>)->()) {
        AF.request(url, method: method, headers: header)
            .responseDecodable(of: EmptyResponse.self) {response in
                switch (response.result) {
                case .success(let response) :
                    closure(.success(response))
                case .failure (let error) :
                    closure(.failure(error))
                }
            }
    }
    
    static func getNotifications(method: HTTPMethod, header: HTTPHeaders, url: String = Urls.notifications.urlString, parameters: Parameters, _ closure : @escaping (Result<NotificationResponse, Error>)->()) {
        AF.request(url,  method: method, parameters: parameters, headers: header)
            .responseDecodable(of: NotificationResponse.self) {response in
                switch (response.result) {
                case .success (let response) :
                    closure(.success(response))
                case .failure (let error) :
                    closure(.failure(error))
                }
            }
    }
}
