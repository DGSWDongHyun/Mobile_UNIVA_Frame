package com.example.examplecompose.data.common.module

import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import com.example.examplecompose.data.bus.remote.api.GetBusStopService
import com.example.examplecompose.data.util.Util.getBusStopURL
import com.google.gson.GsonBuilder
import dagger.Provides
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object RetrofitModule {

    @Singleton
    @Provides
    fun getBusStopService() : Retrofit {
        return Retrofit.Builder()
            .baseUrl(getBusStopURL)
            .addConverterFactory(GsonConverterFactory.create(
                GsonBuilder().setLenient().create()
            ))
            .build()
    }
}