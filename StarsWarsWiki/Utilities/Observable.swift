//
//  Observable.swift
//  StarsWarsWiki
//
//  Created by Salman Raza on 12/02/2021.
//

import Foundation

//Observable class to add listener on any property to get notified when value is changed
final class Observable<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
