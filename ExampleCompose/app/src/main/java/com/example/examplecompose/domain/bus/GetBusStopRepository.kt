package com.example.examplecompose.domain.bus

import com.example.examplecompose.data.bus.remote.dto.BusStopResponse
import com.example.examplecompose.data.bus.remote.dto.BusStopResponseEntity
import kotlinx.coroutines.flow.Flow
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Response


interface GetBusStopRepository {
    suspend fun getNearByBusStop(pageNumber : Int, numberRows : Int, gpsLatitude : Double, gpsLongitude : Double) : BusStopResponseEntity
}