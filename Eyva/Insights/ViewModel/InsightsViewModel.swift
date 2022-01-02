//
//  InsightsViewModel.swift
//  Eyva
//
//  Created by Muralitharan on 31/12/21.
//

import Foundation
import UIKit

enum VitalsDataSource {
    case bluetoothDevice
    case local
}

class InsightsViewModel {
    
    private var vitalsInfo: VitalInfo
    internal var dataSource: VitalsDataSource
    
    init(vitalsInfo: VitalInfo, dataSource: VitalsDataSource) {
        self.vitalsInfo = vitalsInfo
        self.dataSource = dataSource
    }
    
    internal func getTrackedDate() -> String {
        return getDateInString(vitalsInfo.recorededDate)
    }
    
    internal func getHeaderDetails() -> NSMutableAttributedString {
        
        let headerText = getMutableAttributedString(text: "Hi ",
                                                    font:  UIFont(name: "Mulish-ExtraBold", size: 25)!,
                                                    textColor: .white,
                                                    lineHeight: 1.00)
        
        let name = getMutableAttributedString(text: sharedCoreDataManager.fetchUserName(),
                                              font:  UIFont(name: "Mulish-ExtraBold", size: 25)!,
                                              textColor: rgb(166, 133, 218, 1.0),
                                              lineHeight: 1.0)
        
        headerText.append(name)
        return headerText
    }
    
    internal func getValue(_ type: Vitals) -> String {
        switch type {
        case .heartrate:
            return "\(Int(vitalsInfo.heartrate))"
        case .glucose:
            return "\(Int(vitalsInfo.glucose))"
        case .stress:
            return "\(Int(vitalsInfo.stressLevel))"
        case .bloodPressure:
            return "\(Int(vitalsInfo.systolic))" + "/" + "\(Int(vitalsInfo.diastolic))"
        case .oxygen:
            return "\(Int(vitalsInfo.oxygen))"
        default:
            return ""
        }
    }
    
    internal func getRecordedValue(_ type: Vitals) -> (Int, Int) {
        switch type {
        case .heartrate:
            return (Int(vitalsInfo.heartrate), 0)
        case .glucose:
            return (Int(vitalsInfo.glucose), 0)
        case .stress:
            return (Int(vitalsInfo.stressLevel), 0)
        case .bloodPressure:
            return (Int(vitalsInfo.systolic), Int(vitalsInfo.diastolic))
        case .oxygen:
            return (Int(vitalsInfo.oxygen), 0)
        default:
            return (0, 0)
        }
    }
}
