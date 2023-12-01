//
//  EventService.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 8.11.23..
//

import Foundation
import Alamofire

struct EventService {
    
    static func getEvents(method: HTTPMethod, header: HTTPHeaders, url: String = Urls.events.urlString, parameters: Parameters, _ closure : @escaping (Result<EventResponse, Error>)->()) {
        AF.request(url,  method: method, parameters: parameters, headers: header)
            .responseDecodable(of: EventResponse.self) {response in
                switch (response.result) {
                case .success (let response) :
                    closure(.success(response))
                case .failure (let error) :
                    closure(.failure(error))
                }
            }
    }
    
    static func getFavorites(method: HTTPMethod, header: HTTPHeaders, url: String = Urls.favorites.urlString, parameters: Parameters, _ closure : @escaping (Result<EventResponse, Error>)->()) {
        AF.request(url,  method: method, parameters: parameters, headers: header)
            .responseDecodable(of: EventResponse.self) {response in
                switch (response.result) {
                case .success (let response) :
                    closure(.success(response))
                case .failure (let error) :
                    closure(.failure(error))
            }
        }
    }
    
    static func selectableSearchRequest(method: HTTPMethod, header: HTTPHeaders , url: String = Urls.search.urlString, parameters: Parameters, _ closure : @escaping (Result<EventResponse, Error>)->()) {
        AF.request(url,  method: method, parameters: parameters, headers: header)
            .responseDecodable(of: EventResponse.self) {response in
                switch (response.result) {
                case .success (let response) :
                    closure(.success(response))
                case .failure (let error) :
                    closure(.failure(error))
            }
        }
    }
    
    static func getEventById(method: HTTPMethod, header: HTTPHeaders, url: String, _ closure : @escaping (Result<EventIdResponse, Error>)->()) {
        AF.request(url, method: method, headers: header)
            .responseDecodable(of: EventIdResponse.self) {response in
                switch (response.result) {
                case .success (let response) :
                    closure(.success(response))
                case .failure (let error) :
                    closure(.failure(error))
                }
            }
    }
}
