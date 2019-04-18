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
        private fun String.orInt(): Any { return toIntOrNull() ?: this }


        fun parse(beacon: Beacon) = BeaconModel(
                beacon.identifiers?.map { it.toString().orInt() } ?: emptyList(),
                beacon.distance,
                beacon.rssi
        )
    }
}