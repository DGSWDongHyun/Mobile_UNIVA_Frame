package com.example.examplecompose.data.bus.remote.api

import com.example.examplecompose.data.bus.remote.dto.BusStopResponse
import com.example.examplecompose.data.bus.remote.dto.BusStopResponseEntity
import com.example.examplecompose.data.util.Util.serviceKey
import kotlinx.coroutines.flow.Flow
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Query

interface GetBusStopService {
    @GET("getCrdntPrxmtSttnList")
    suspend fun getBusStop(
        @Query("serviceKey") key : String = serviceKey,
        @Query("pageNo") pageNumber : Int,
        @Query("numOfRows") numberRows : Int,
        @Query("gpsLati") gpsLatitude : Double,
        @Query("gpsLong") gpsLongitude : Double,
        @Query("_type") returnType : String = "json",
    ) : BusStopResponseEntity
}