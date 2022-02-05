//
//  Helper.swift
//  StarsWarsWiki
//
//  Created by Muzammil Peer on 04/02/2022.
//

//import UIKit
import Foundation
import Dispatch


extension DispatchQueue {
    static func mainAsyncIfNeeded(execute work: @escaping () -> Void) {
        if Thread.isMainThread {
            main.async(execute: work)
        } else {
            work()
        }
    }
}
