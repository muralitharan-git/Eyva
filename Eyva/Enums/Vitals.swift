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
    case glucose = "Blood Glucose"
    case oxygen = "Oxygen"
    case temperature = "Temperature"
    case bloodPressure = "Blood Pressure"
    case stress = "Stress Levels"
    case ecg = "ECG"
    
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
    
    var idealRangeVerbiage: String {
        switch self {
        case .heartrate:
            return "60-100 \(unit)"
        case .glucose:
            return "Fasting         70-100 \(unit) \nAfter Food    135-140 \(unit)"
        case .oxygen:
            return "95 % or higher"
        case .temperature:
            return "97.8° F (36.5°C) - 99°F (37.2°C)"
        case .bloodPressure:
            return "90/60\(unit) and 120/80\(unit)"
        case .stress:
            return "95% or higher"
        case .ecg:
            return ""
        }
    }
    
    var unit: String {
        switch self {
        case .heartrate:
            return "BPM"
        case .glucose:
            return "mg/dL"
        case .oxygen:
            return "SPO2"
        case .temperature:
            return "C"
        case .bloodPressure:
            return "mmHg"
        case .stress:
            return "mmHg"
        case .ecg:
            return "mmHg"
        }
    }
    
    var longDescription: String {
        switch self {
        case .heartrate:
            return "Heart rate is important to circulate oxygen and nutrient-rich blood throughout the body."
        case .glucose:
            return "Blood glucose is an important source of energy and provides nutrients to the body's organs, muscles, and nervous system."
        case .oxygen:
            return "A normal SpO2 level is vital to maintaining the health of all tissue in the body."
        case .temperature:
            return "It is important that we maintain an optimum temperature for the enzymes in our bodies. If it's too hot, our enzymes will inactive/lose their function. If it's too cold, the enzymes will too become ineffective (their function will slow down too much)."
        case .bloodPressure:
            return "Normal blood pressure is important for the proper flow of blood from the heart to the body's organs and tissues."
        case .stress:
            return "It might be a demanding boss, distrubed relation with friends or family, Experiencing some stress levels on a daily basis is common. But chronic & overwhelming stress can impact mental and physical health."
        case .ecg:
            return "An ECG (electrocardiogram) is important to see how the heart is functioning. It records the electrical activity of your heart at rest and provides information about your heart rate and rhythm. \n \nHeart diseases and irregular heart beats can be detected in ECGs."
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
        case .heartrate, .ecg:
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
