//  Copyright (c) 2018 Loup Inc.
//  Licensed under Apache License v2.0

package io.intheloup.beacons.data

import org.altbeacon.beacon.Beacon

class BeaconModel(
        val ids: List<Any>,
        val distance: Double,
        val rssi: Int
) {
    companion object {
        private fun intOrString(str: String) = str.toIntOrNull() ?: str


        fun parse(beacon: Beacon) = BeaconModel(
                beacon.identifiers?.map { intOrString(it.toString()) } ?: emptyList(),
                beacon.distance,
                beacon.rssi
        )
    }
}