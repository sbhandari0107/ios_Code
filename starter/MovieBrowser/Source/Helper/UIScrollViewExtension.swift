//
//  UIScrollViewExtension.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func addRefreshControl() -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.addSubview(refreshControl)
        return refreshControl
    }
}
