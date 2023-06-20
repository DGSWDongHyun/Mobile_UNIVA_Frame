package com.example.examplecompose.domain.bus.entity

import com.google.gson.annotations.SerializedName

data class BusStopEntity(
    val header : HeaderEntity,
    val body : BodyEntity?
);

data class HeaderEntity(
    val resultCode : String?,
    val resultMessage : String?
)

data class BodyEntity(
    val items: ItemEntity?,
    val numberOfRows : Int?,
    val pageNumber : Int?,
    val totalCount : Int?,
);

data class ItemEntity(
    @SerializedName("item")
    val item: List<BusStopInfoEntity>?,
);

data class BusStopInfoEntity(
    val cityCode: Int?,
    val gpsLatitude: Double?,
    val gpsLongitude: Double?,
    val nodeId: String?,
    val nodeName: String?,
    val nodeNumber : Int?,
);