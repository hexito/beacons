//  Copyright (c) 2018 Loup Inc.
//  Licensed under Apache License v2.0

part of beacons;

class Beacon {
  Beacon._(
    this.ids,
    this.distance,
    this.rssi,
    this.txPower,
    this.battery,
    this.temperature,
    this._platformCustoms,
  );

  final List<dynamic> ids;
  final double distance;
  final int rssi;
  final int txPower;
  final double battery;
  final int temperature;
  final Map<String, dynamic> _platformCustoms;
}

class BeaconIBeacon {
  BeaconIBeacon.from(Beacon beacon)
      : proximityUUID = beacon.ids[0],
        major = beacon.ids.length > 1 ? beacon.ids[1] : null,
        minor = beacon.ids.length > 2 ? beacon.ids[2] : null,
        accuracy = beacon.distance,
        rssi = beacon.rssi,
        txPower = beacon.txPower,
        battery = beacon.battery != null ? beacon.battery : -1.0,
        temperature = beacon.temperature != null ? beacon.temperature : -999,
        proximity =
            _JsonCodec.proximityFromJson(beacon._platformCustoms['proximity']),
        powerLevel = beacon._platformCustoms['powerLevel'] != null ? beacon._platformCustoms['powerLevel'] : 0,
        createdAt = DateTime.now();

  final String proximityUUID;
  final int major;
  final int minor;
  final double accuracy;
  final int rssi;
  final int txPower;
  final double battery;
  final int temperature;
  final BeaconProximity proximity;
  final int powerLevel;
  DateTime createdAt;
}

enum BeaconProximity {
  unknown,
  immediate,
  near,
  far,
}
