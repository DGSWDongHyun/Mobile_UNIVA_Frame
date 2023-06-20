package com.example.examplecompose.presentation.ui.viewmodel.activities

import android.util.Log
import androidx.compose.runtime.MutableState
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.snapshots.SnapshotStateList
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.examplecompose.data.bus.remote.dto.BusStopInfo
import com.example.examplecompose.data.bus.remote.dto.BusStopResponseEntity
import com.example.examplecompose.data.bus.remote.dto.ItemResponse
import com.example.examplecompose.data.util.wrapper.Error
import com.example.examplecompose.data.util.wrapper.Success
import com.example.examplecompose.data.util.wrapper.safeApiCall
import com.example.examplecompose.domain.bus.usecase.GetBusStopUseCase
import com.example.examplecompose.presentation.util.STATUS
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import java.lang.Exception
import javax.inject.Inject

@HiltViewModel
class MainViewModel @Inject constructor(
    private val getBusStopUseCase: GetBusStopUseCase
): ViewModel() {

    val listOfBusStation : SnapshotStateList<BusStopInfo> = mutableStateListOf()
    val stateOfLoading = mutableStateOf(STATUS.COMPLETE)

    fun getBusStopInit(gpsLatitude : Double, gpsLongitude : Double) {
        stateOfLoading.value = STATUS.LOADING
        viewModelScope.launch {
            val response = safeApiCall(Dispatchers.IO) {
                getBusStopUseCase.getBusStop(
                    pageNumber = 1,
                    numberRows = 10,
                    gpsLatitude = gpsLatitude,
                    gpsLongitude = gpsLongitude
                )
            }

            when(response) {
                is Success -> {
                    listOfBusStation.apply {
                        clear()
                        addAll(response.data.res!!.body!!.items!!.item ?: listOf())
                    }
                    Log.d("TAG" , "res : ${response.data}")
                }

                is Error -> {
                    Log.d("TAG" , "exception : ${response.exception.cause}")
                }
            }

            stateOfLoading.value = STATUS.COMPLETE
        }
    }
}