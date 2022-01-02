//
//  HomeViewModel.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import Foundation

enum VitalRecordedState {
    case none
    case one
    case multiple
}

class HomeViewModel {
    
    internal var recordedState: VitalRecordedState = .none
    
    internal func numberOfRows() -> Int {
        switch recordedState {
        case .none:
            return 2
        case .one, .multiple:
            return 3
        }
    }
}
