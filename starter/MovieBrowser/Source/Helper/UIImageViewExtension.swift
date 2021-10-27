//
//  UIImageViewExtension.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

enum ImageSize: Int {
    case small = 200
    case medium = 500
    case large = 800
}

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func loadImageUsingCacheWith(_ url: URL?) {
        
        self.image = nil

        guard let imageURL = url else {
            return
        }
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: imageURL.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        self.image = UIImage(named: "placeholder")
                
        // if not, download image from url
        URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, _, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: imageURL.absoluteString as NSString)
                    self.image = image
                }
            }
        }).resume()
    }
}
