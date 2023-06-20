package com.example.examplecompose.data.bus.remote.dto

import com.google.gson.annotations.SerializedName

data class BusStopResponseEntity(
    @SerializedName("response")
    val res : BusStopResponse? = null,
)

data class BusStopResponse(
    @SerializedName("header")
    val header : HeaderResponse? = null,
    @SerializedName("body")
    val body : BodyResponse? = null
)

data class HeaderResponse(
    @SerializedName("resultCode")
    val resultCode : String?,
    @SerializedName("resultMsg")
    val resultMessage : String?
)

data class BodyResponse(
    @SerializedName("items")
    val items: ItemResponse?,
    @SerializedName("numOfRows")
    val numberOfRows : Int?,
    @SerializedName("pageNo")
    val pageNumber : Int?,
    @SerializedName("totalCount")
    val totalCount : Int?,
);

data class ItemResponse(
    @SerializedName("item")
    val item: List<BusStopInfo>?,
);

data class BusStopInfo(
    @SerializedName("citycode")
    val cityCode: Int?,
    @SerializedName("gpslati")
    val gpsLatitude: Double?,
    @SerializedName("gpslong")
    val gpsLongitude: Double?,
    @SerializedName("nodeid")
    val nodeId: String?,
    @SerializedName("nodenm")
    val nodeName: String?,
    @SerializedName("nodeno")
    val nodeNumber : Int?,
);