package com.example.examplecompose.data.util

import com.example.examplecompose.data.bus.remote.dto.BusStopResponse
import com.example.examplecompose.domain.bus.entity.BodyEntity
import com.example.examplecompose.domain.bus.entity.BusStopEntity
import com.example.examplecompose.domain.bus.entity.BusStopInfoEntity
import com.example.examplecompose.domain.bus.entity.BusStopResEntity
import com.example.examplecompose.domain.bus.entity.HeaderEntity
import com.example.examplecompose.domain.bus.entity.ItemEntity

object Util {
    const val serviceKey = "Xs27Il/VFZvzB3mA8Z/ESBF5NT5bT1MBL25TqZ2eu4zzYXIq5XKML0aQxVWHr4yR4rGBw23LuXEu1VnQl65CzA==";
    const val getBusStopURL = "http://apis.data.go.kr/1613000/BusSttnInfoInqireService/"
    const val getBusStopArrivalInfo = "https://apis.data.go.kr/1613000/ArvlInfoInqireService/"

}