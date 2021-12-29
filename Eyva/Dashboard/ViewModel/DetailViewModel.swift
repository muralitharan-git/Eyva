//
//  DetailViewModel.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 28/12/21.
//

import Foundation

class DetailViewModel {
    
    private var vitalType: Vitals
    
    init(_ type: Vitals) {
        vitalType = type
    }
    
    internal func getVitalType() -> Vitals {
        return vitalType
    }
}
