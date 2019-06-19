//  Copyright (c) 2018 Loup Inc.
//  Licensed under Apache License v2.0

import 'dart:async';

import 'package:beacons/beacons.dart';

import 'tab_base.dart';

class RangingTab extends ListTab {
  RangingTab() : super(title: 'Ranging');

  @override
  Stream<ListTabResult> stream(BeaconRegion region) {
    return Beacons
        .ranging(
      region: region,
      inBackground: false,
    )
        .map((result) {
      String text;
      if (result.isSuccessful) {
        String battery = result.beacons.first.battery.toStringAsFixed(2);
        double batteryPercent = num.parse(battery) * 100;
        text = result.beacons.isNotEmpty
            ? 'RSSI: ${result.beacons.first.rssi} battery: ${result.beacons.first.battery}%'
            : 'No beacon in range';
      } else {
        text = result.error.toString();
      }

      return new ListTabResult(text: text, isSuccessful: result.isSuccessful);
    });
  }
}
