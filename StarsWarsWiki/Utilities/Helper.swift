//
//  Helper.swift
//  StarsWarsWiki
//
//  Created by Muzammil Peer on 04/02/2022.
//

import Foundation

extension DispatchQueue {
    static func mainAsyncIfNeeded(execute work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            main.async(execute: work)
        }
    }
}
