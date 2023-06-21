package com.example.examplecompose.domain.bus.usecase

import com.example.examplecompose.data.bus.remote.dto.BusStopResponse
import com.example.examplecompose.data.bus.remote.dto.BusStopResponseEntity
import com.example.examplecompose.data.bus.repository.GetBusStopRepositoryImpl
import com.example.examplecompose.domain.bus.GetBusStopRepository
import com.example.examplecompose.domain.bus.entity.BusStopResEntity
import kotlinx.coroutines.flow.Flow
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Response
import javax.inject.Inject

class GetBusStopUseCase @Inject constructor(private val getBusStopRepository: GetBusStopRepository) {
    suspend fun getBusStop(pageNumber : Int, numberRows : Int, gpsLatitude : Double, gpsLongitude : Double) : BusStopResEntity {
        return getBusStopRepository.getNearByBusStop(pageNumber = pageNumber, numberRows = numberRows, gpsLatitude = gpsLatitude, gpsLongitude = gpsLongitude)
    }
}