//  Copyright (c) 2018 Loup Inc.
//  Licensed under Apache License v2.0

package io.intheloup.beacons.data

import org.altbeacon.beacon.Beacon

class BeaconModel(
        val ids: List<Any>,
        val distance: Double,
        val rssi: Int,
        val txPower: Int,
        val advertismentByte: ByteArray,
        val battery: Int,
        val temperature: Int,
        val platformCustoms: Map<String, String> = mapOf("proximity" to "unknown")
) {
    companion object {
        fun parse(beacon: Beacon) = BeaconModel(
                beacon.identifiers?.map { it.toString().toIntOrNull() ?: it.toString() }
                        ?: emptyList(),
                beacon.distance,
                beacon.rssi,
                beacon.txPower,
                beacon.getmAdvertismentByte(),
                beacon.batteryLevel,
                beacon.temperature ?: -999
        )
    }
}