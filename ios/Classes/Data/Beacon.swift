//
//  Copyright (c) 2018 Loup Inc.
//  Licensed under Apache License v2.0
//
import Foundation
import CoreLocation
import SensoroBeaconKit

struct Beacon : Codable {
    let ids: [AnyCodable]
    let distance: Double
    let rssi: Int
    let txPower: Int
    let battery: Double
    let temperature: Int
    let platformCustoms: [String:AnyCodable]
    
    //  init(from beacon: CLBeacon) {
    //    self.ids = [
    //      AnyCodable(beacon.proximityUUID.uuidString),
    //      AnyCodable(beacon.major.intValue),
    //      AnyCodable(beacon.minor.intValue)
    //    ]
    //
    //    self.distance = beacon.accuracy
    //    self.rssi = beacon.rssi
    //    self.txPower = 0
    //    self.battery = 0
    //    self.temperature = 0
    //    self.platformCustoms = [
    //      "proximity": AnyCodable(Proximity(from: beacon.proximity))
    //    ]
    //  }
    
    init(from beacon: Any) {
        switch beacon {
        case let sbkBeacon as SBKBeacon:
            self.ids = [
                AnyCodable(sbkBeacon.beaconID.proximityUUID.uuidString),
                AnyCodable(sbkBeacon.beaconID.major.intValue),
                AnyCodable(sbkBeacon.beaconID.minor.intValue)
            ]
            
            self.distance = sbkBeacon.accuracy
            self.rssi = sbkBeacon.rssi
            self.txPower = 0
            self.battery = sbkBeacon.batteryLevel.doubleValue
            self.temperature = sbkBeacon.temperature.intValue
            self.platformCustoms = [
                "proximity": AnyCodable(Proximity(from: sbkBeacon.proximity)),
                "powerLevel": AnyCodable(sbkBeacon.broadcastTransmitPower)
            ]
        case let clBeacon as CLBeacon:
            self.ids = [
                AnyCodable(clBeacon.proximityUUID.uuidString),
                AnyCodable(clBeacon.major.intValue),
                AnyCodable(clBeacon.minor.intValue)
            ]
            
            self.distance = clBeacon.accuracy
            self.rssi = clBeacon.rssi
            self.txPower = 0
            self.battery = -1.0
            self.temperature = 0
            self.platformCustoms = [
                "proximity": AnyCodable(Proximity(from: clBeacon.proximity))
            ]
        default:
            self.ids = [];
            self.distance = 0
            self.rssi = 0
            self.txPower = 0
            self.battery = -1.0
            self.temperature = 0
            self.platformCustoms = [
                "proximity": "unknown"
            ]
        }
    }
}
