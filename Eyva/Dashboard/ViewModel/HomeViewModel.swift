//
//  HomeViewModel.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import Foundation
import CoreData

enum VitalRecordedState {
    case none
    case one
    case multiple
}

class HomeViewModel {
    
    private let NOT_NORMAL_COUNT = 2
    
    internal var recordedState: VitalRecordedState = .none
    internal var vitalRecords: [VitalInfo] = []
    internal var resultRanges: [ResultRange] = []
    internal var isNotNormalRange = false
    
    internal func numberOfRows() -> Int {
        switch recordedState {
        case .none:
            return 2
        case .one, .multiple:
            return 3
        }
    }

    internal func getVitalRecords() {
        let context = sharedCoreDataManager.managedObjectContext
        let fetchRequest: NSFetchRequest<Vital> = Vital.fetchRequest()
        var vitalsInfo: [VitalInfo] = []
        do {
            let results = try context.fetch(fetchRequest)
            for vital in results {
              let vitaInfo =  VitalInfo(heartrate: vital.heartrate,
                          oxygen: vital.oxygen,
                          glucose: vital.glucose,
                          temperature: vital.temperature,
                          systolic: vital.systolic,
                          diastolic: vital.diastolic,
                          stressLevel: vital.stressLevel,
                          recorededDate: vital.recordedDate ?? Date())
                vitalsInfo.append(vitaInfo)
            }
        } catch {
            print("Something gone wrong")
        }
        vitalRecords = vitalsInfo
        setRecordedState()
        iterateOnRecordsForResultRange()
    }
    
    private func setRecordedState() {
        switch vitalRecords.count {
        case 0:
            recordedState = .none
        case 1:
            recordedState = .one
        default:
            recordedState = .multiple
        }
    }
    
    private func iterateOnRecordsForResultRange() {
        if recordedState == .one, let oneRecord = vitalRecords.first {
            var ranges: [ResultRange] = []
            for type in Vitals.allCases {
                let value = type.getRecordedValue(vitalData: oneRecord)
                let range = type.fetchResultRange(value.0, value2: value.1)
                ranges.append(range)
            }
            resultRanges = ranges
            findoutNotNormalRange()
        }
    }
    
    private func findoutNotNormalRange() {
        let notNormalCount = resultRanges.filter ({
            $0 != ResultRange.normal
        }).count
        isNotNormalRange = notNormalCount >= NOT_NORMAL_COUNT
    }
    
    internal func getFirstRecord() -> VitalInfo? {
        return vitalRecords.first
    }
}
