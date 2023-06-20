package com.example.examplecompose.data.util.wrapper

import com.example.examplecompose.data.bus.remote.dto.BusStopResponseEntity
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import retrofit2.Response
import java.lang.Exception


suspend fun <T> safeApiCall(
    dispatcher: CoroutineDispatcher,
    apiCall: suspend () -> T
) : ApiResponse<T> {

    return withContext(dispatcher) {
        try {
            Success(apiCall.invoke())
        }catch (e : Exception) {
            Error(exception = e)
        }
    }
}

sealed class ApiResponse<out T : Any?>

data class Success<out T : Any?>(val data: T) : ApiResponse<T>()

data class Error(val exception: Exception) : ApiResponse<Nothing>()