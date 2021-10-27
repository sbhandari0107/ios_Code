//
//  StateProtocol.swift
//  MovieBrowser
//
//  Created by Santosh Bhandari on 10/27/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

enum State {
    case error(String)
    case loading
    case success
    case initial
}

protocol StateProtocol: AnyObject {
    func errorWith(message: String)
    func loading()
    func success()
    func initial()
}
