//
//  Vitals.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 28/12/21.
//

import Foundation
import UIKit

enum Vitals: String, CustomStringConvertible, CaseIterable {
    case heartrate = "Heart rate"
    case glucose = "Glucose"
    case oxygen = "Oxygen"
    case temperature = "Temperature"
    case bloodPressure = "Blood Pressure"
    case stress = "Stress Levels"
    
    var description: String {
        return rawValue
    }
    
    var idealRange: String {
        switch self {
        case .heartrate:
            return "60 - 80"
        case .glucose:
            return "60 - 80"
        case .oxygen:
            return "60 - 80"
        case .temperature:
            return "60 - 80"
        case .bloodPressure:
            return "60 - 80"
        default:
            return "60 - 80"
        }
    }
    
    var unit: String {
        switch self {
        case .heartrate:
            return "BPM"
        case .glucose:
            return "BPM"
        case .oxygen:
            return "BPM"
        case .temperature:
            return "BPM"
        case .bloodPressure:
            return "BPM"
        default:
            return "BPM"
        }
    }
    
    var longDescription: String {
        switch self {
        case .heartrate:
            return "Having too much sugar in the blood for long periods of time can cause serious health problems if it's not treated. Hyperglycemia can damage the vessels that supply blood to vital organs, which can increase the risk of heart disease and stroke, kidney disease, vision problems, and nerve problems."
        case .glucose:
            return "Having too much sugar in the blood for long periods of time can cause serious health problems if it's not treated. Hyperglycemia can damage the vessels that supply blood to vital organs, which can increase the risk of heart disease and stroke, kidney disease, vision problems, and nerve problems."
        case .oxygen:
            return "Having too much sugar in the blood for long periods of time can cause serious health problems if it's not treated. Hyperglycemia can damage the vessels that supply blood to vital organs, which can increase the risk of heart disease and stroke, kidney disease, vision problems, and nerve problems."
        case .temperature:
            return "Having too much sugar in the blood for long periods of time can cause serious health problems if it's not treated. Hyperglycemia can damage the vessels that supply blood to vital organs, which can increase the risk of heart disease and stroke, kidney disease, vision problems, and nerve problems."
        case .bloodPressure:
            return "Having too much sugar in the blood for long periods of time can cause serious health problems if it's not treated. Hyperglycemia can damage the vessels that supply blood to vital organs, which can increase the risk of heart disease and stroke, kidney disease, vision problems, and nerve problems."
        default:
            return "Having too much sugar in the blood for long periods of time can cause serious health problems if it's not treated. Hyperglycemia can damage the vessels that supply blood to vital organs, which can increase the risk of heart disease and stroke, kidney disease, vision problems, and nerve problems."
        }
    }
    
    var positiveActions: [String] {
        switch self {
        case .heartrate:
            return ["Eat leafy greens",
                    "Drink atleast 2 ltrs water everyday",
                    "Meditate everyday"]
        case .glucose:
            return ["Eat leafy greens",
                    "Drink atleast 2 ltrs water everyday",
                    "Meditate everyday"]
        case .oxygen:
            return ["Eat leafy greens",
                    "Drink atleast 2 ltrs water everyday",
                    "Meditate everyday"]
        case .temperature:
            return ["Eat leafy greens",
                    "Drink atleast 2 ltrs water everyday",
                    "Meditate everyday"]
        case .bloodPressure:
            return ["Eat leafy greens",
                    "Drink atleast 2 ltrs water everyday",
                    "Meditate everyday"]
        default:
                        return ["Eat leafy greens",
                                "Drink atleast 2 ltrs water everyday",
                                "Meditate everyday"]
                        
        }
    }
    
    func getIcon(_ prefix: String) -> UIImage? {
        switch self {
        case .heartrate:
            return UIImage(named: "\(prefix)-heartrate")
        case .glucose:
           return UIImage(named: "\(prefix)-glucose")
        case .oxygen:
            return UIImage(named: "\(prefix)-oxygen")
        case .temperature:
            return UIImage(named: "\(prefix)-temperature")
        case .bloodPressure:
            return UIImage(named: "\(prefix)-bp")
        default:
            return UIImage(named: "\(prefix)-stress")
        }
    }
    
}
