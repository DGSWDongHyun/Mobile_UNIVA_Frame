package com.example.examplecompose.data.util.mapper

import com.example.examplecompose.data.bus.remote.dto.BusStopResponse
import com.example.examplecompose.domain.bus.entity.BodyEntity
import com.example.examplecompose.domain.bus.entity.BusStopEntity
import com.example.examplecompose.domain.bus.entity.BusStopInfoEntity
import com.example.examplecompose.domain.bus.entity.BusStopResEntity
import com.example.examplecompose.domain.bus.entity.HeaderEntity
import com.example.examplecompose.domain.bus.entity.ItemEntity

fun BusStopResponse?.toMapping() = BusStopResEntity(res = BusStopEntity(
    header = HeaderEntity(resultCode = this?.header?.resultCode, resultMessage = this?.header?.resultMessage),
    body = BodyEntity(items =
    ItemEntity(item = this?.body?.items?.item?.map
    { it -> BusStopInfoEntity(
        cityCode = it.cityCode,
        gpsLatitude = it.gpsLatitude,
        gpsLongitude = it.gpsLongitude,
        nodeId = it.nodeId,
        nodeName = it.nodeName,
        nodeNumber = it.nodeNumber)
    })
        ,numberOfRows = this?.body?.numberOfRows,
        pageNumber = this?.body?.pageNumber,
        totalCount = this?.body?.totalCount
    ))
)