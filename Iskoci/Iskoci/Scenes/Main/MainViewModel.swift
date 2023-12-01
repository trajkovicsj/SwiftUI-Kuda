//
//  MainViewModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 20.11.23..
//

import Foundation
import Alamofire
import UIKit

final class MainViewModel {
    
    // MARK: - Init
    
    init() {
        setUserID()
    }
    
    var userId = "123456"
    
    var defaults = UserDefaults.standard
    
    var headers: HTTPHeaders {
        ["DeviceId": userId ]
    }
    
    private let key = "isRegistred"
    
    func setUserID() {
        print(defaults.bool(forKey: key))
        
        if !defaults.bool(forKey: key) {
            UserService.userId(method: .post, header: headers) {[weak self] result in
                guard let self else { return }
                guard case .success = result else { return }
                
                self.defaults.set(true, forKey: self.key)
            }
        }
    }
}
