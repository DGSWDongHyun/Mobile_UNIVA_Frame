package com.example.examplecompose.data.bus.repository

import android.util.Log
import com.example.examplecompose.data.bus.remote.dto.BusStopResponse
import com.example.examplecompose.data.bus.remote.api.GetBusStopService
import com.example.examplecompose.data.bus.remote.dto.BusStopResponseEntity
import com.example.examplecompose.domain.bus.GetBusStopRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Response
import javax.inject.Inject

class GetBusStopRepositoryImpl @Inject constructor(private val service : GetBusStopService) : GetBusStopRepository {
    override suspend fun getNearByBusStop(
        pageNumber: Int,
        numberRows: Int,
        gpsLatitude: Double,
        gpsLongitude: Double
    ): BusStopResponseEntity {
        return service.getBusStop(pageNumber = pageNumber, numberRows = numberRows, gpsLatitude = gpsLatitude, gpsLongitude = gpsLongitude)
    }
}