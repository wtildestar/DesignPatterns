//
//  Box.swift
//  MVVM-2
//
//  Created by wtildestar on 31/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import Foundation

// класс обертка data binding
class Box<T> {
    
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    // связываю св-во с наблюдателем
    func bind(listener: @escaping Listener) {
        // связываю слушателя
        self.listener = listener
        // присваиваю значение слушателю ( если не присвоить то первое значение выпадет )
        listener(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}
