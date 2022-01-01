//
//  Vitals.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 28/12/21.
//

import Foundation
import UIKit

enum ResultRange {
    case normal
    case high
    case low
}

enum VitalEnabled {
    case yes
    case no
}

enum Vitals: String, CustomStringConvertible, CaseIterable {
    case heartrate = "Heart rate"
    case glucose = "Blood Glucose"
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
            return "60-80"
        case .glucose:
            return "70-150"
        case .oxygen:
            return "95% or Higher"
        case .temperature:
            return "60 - 80"
        case .bloodPressure:
            return "90/60 - 120/80"
        case .stress:
            return "22-60"
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
        }
    }
    
    func getVitalSupportState() -> VitalEnabled {
        switch self {
        case .temperature:
            return .no
        default:
            return .yes
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
    
    func fetchResultRange(_ value: Int, value2: Int) -> ResultRange {
        switch self {
        case .heartrate:
            return heartRateRange(value)
        case .oxygen:
            return oxygenRange(value)
        case .stress:
            return stressLevelRange(value)
        case .glucose:
            return glucoseRange(value)
        case .bloodPressure:
            return bloodPressureRange(value, diastolic: value2)
        default:
            return .normal
        }
    }
    
    func heartRateRange(_ value: Int) -> ResultRange {
        let normalRange = 60...80
        if normalRange.contains(value) {
            return .normal
        } else {
            if value < 60 {
               return .low
            } else {
                return .high
            }
        }
    }
    
    func oxygenRange(_ value: Int) -> ResultRange {
        if value < 95 {
            return .low
        } else {
            return .normal
        }
    }
    
    func stressLevelRange(_ value: Int) -> ResultRange {
        if value > 60 {
            return .high
        } else {
            return .normal
        }
    }
    
    func glucoseRange(_ value: Int) -> ResultRange {
        let normalRange = 70...150
        if normalRange.contains(value) {
            return .normal
        } else {
            if value < 70 {
                return .low
            } else {
                return .high
            }
        }
    }
    
    func bloodPressureRange(_ systolic: Int, diastolic: Int) -> ResultRange {
        let systolicRange = 90...120
        let diastolicRange = 60...80
        
        if systolicRange.contains(systolic) && diastolicRange.contains(diastolic) {
            return .normal
        } else {
            if systolic > 120 || diastolic > 80 {
                return .high
            } else {
                return .low
            }
        }
    }
    
    func getListOfActionsBasedOnResult(_ range: ResultRange) -> [String] {
        switch self {
        case .bloodPressure:
            return getBloodPressureActions(range)
        case .glucose:
            return getGlucoseActions(range)
        case .stress:
            return getStressLevelActions(range)
        case .oxygen:
            return getOxygenActions(range)
        case .heartrate:
            return getHeartRateActions(range)
        default:
            return []
        }
    }
    
    func getBloodPressureActions(_ range: ResultRange) -> [String] {
        switch range {
        case .normal:
            return ["Continue having the right meal at the right times. Skip on more salts.",
                    "Continue to rest well and the good night sleep.",
                    "Continue to exercise and keep a watch on your waistline."]
        case .high:
            return ["Cut on preserved food and salts.",
                    "Cut off on caffeine if any.",
                    "Reduce alcohol consumption."]
        case .low:
            return ["Staying hydrated and avoiding alcoholic drinks.",
                    "Eat fruits and natural sugars. Include less carbs in the daily meal.",
                    "Rising slowly when you've been sitting or lying down."]
        }
    }
    
    func getGlucoseActions(_ range: ResultRange) -> [String] {
        switch range {
        case .normal:
            return ["Continue having right meal at right times.",
                    "Continue to rest well and the good night sleep.",
                    "Keep an eye on stress levels to maintain right HbA1C levels."]
        case .high:
            return ["Being mindful of portion sizes.",
                    "Eat regularly, every 3-5 hours.",
                    "Take a stroll for 20 mins post meal."]
        case .low:
            return ["Check for any weakness or palpitations.",
                    "Eat fruits and natural sugars. Include some carbs in the daily meal.",
                    "Have Breakfast within an hour of waking up."]
        }
    }
    
    func getStressLevelActions(_ range: ResultRange) -> [String] {
        switch range {
        case .normal:
            return ["Start slow, try working out gradually. Meet 50% of your maximum heart.",
                    "Listen to your body always. Stop when it becomes uncomfortable to breathe.",
                    "Relax & take a stroll in the greens."]
        default:
            return ["Start slow, try working out gradually. Meet 50% of your maximum heart.",
                    "Listen to your body always. Stop when it becomes uncomfortable to breathe.",
                    "Relax & take a deep breath."]
        }
    }
    
    func getOxygenActions(_ range: ResultRange) -> [String] {
        switch range {
        case .normal:
            return ["Maintain the same and keep checking the levels.",
                    "Continue drinking more water.",
                    "Train & maintain your breath. Try Yoga."]
        default:
            return ["Eat iron rich foods like beetroot and leafy green vegetables.",
                    "Get fresh air. There’s a lot of it in your lawn.",
                    "Drink more water and exercise."]
        }
    }
    
    func getHeartRateActions(_ range: ResultRange) -> [String] {
        switch range {
        case .normal:
            return ["Start slow, try working out gradually. Meet 50% of your maximum heart.",
                    "Listen to your body always. Stop when it becomes uncomfortable to breathe.",
                    "Don't get overly fixated on numbers. Relax & take a stroll in the greens."]
        case .high:
            return ["Take it easy. Meet 50% of your maximum heart.",
                    "Listen to your body always. Stop when it becomes uncomfortable to breathe.",
                    "Relax & take a deep breath."]
        case .low:
            return ["Get rest & eat healthy.",
                    "Relax & take a stroll in the greens."]
        }
    }
    
    func getResultLongDescription() -> String {
        switch self {
        case .heartrate:
            return "The Average resting heart rate is between 60 to 100. The more fit you are, the lower the resting heart is. The average heart rate of a very fit person is in the range of 40 to 50 bpm."
        case .oxygen:
            return "Normal Oxygen levels are above 95%. Healthy oxygen levels are important for smooth functioning of Brain, Heart, lungs and kidneys."
        case .stress:
            return "It might be a demanding boss, distrubed relation with friends or family, Experiencing some stress levels on a daily basis is common. But chronic & overwhelming stress can impact mental and physical health."
        case .glucose:
            return "Blood glucose is the main source of energy to the body. The average fasting glucose level is supposed to be less than 100 mg/dL for a healthy adult. A normal blood glucose level for adults, without diabetes, two hours after eating is 90 to 110 mg/dL."
        case .bloodPressure:
            return "Blood pressure is the pressure of blood pushing against the walls of your arteries. Arteries carry blood from your heart to other parts of your body. Your blood pressure normally rises and falls throughout the day."
        default:
            return ""
        }
    }
}
