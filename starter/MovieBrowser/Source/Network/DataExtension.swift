//
//  DataExtension.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

extension Data {

    func decode<T: Decodable>() -> T? {
        
        do {
            let json = try JSONSerialization.jsonObject(with: self)
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let detail = try JSONDecoder().decode(T.self, from: data)
            return detail
        } catch {
            print("decoding error - \(error)")
        }
        
        return nil
    }
    
}
