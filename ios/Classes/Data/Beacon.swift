//
//  Copyright (c) 2018 Loup Inc.
//  Licensed under Apache License v2.0
//

import Foundation
import CoreLocation

struct Beacon : Codable {
  let ids: [AnyCodable]
  let distance: Double
  let rssi: Int
  let platformCustoms: [String:AnyCodable]
  
  init(from beacon: CLBeacon) {
    self.ids = [
      AnyCodable(beacon.proximityUUID.uuidString),
      AnyCodable(beacon.major),
      AnyCodable(beacon.minor)
    ]
    
    self.distance = beacon.accuracy
    self.rssi = beacon.rssi
    self.platformCustoms = [
      "proximity": AnyCodable(Proximity(from: beacon.proximity))
    ]
  }
}


