package com.example.examplecompose.data.bus

import com.example.examplecompose.data.bus.remote.api.GetBusStopService
import com.example.examplecompose.data.bus.repository.GetBusStopRepositoryImpl
import com.example.examplecompose.data.common.module.RetrofitModule
import com.example.examplecompose.domain.bus.GetBusStopRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import retrofit2.Retrofit
import javax.inject.Singleton

@Module(includes = [RetrofitModule::class])
@InstallIn(SingletonComponent::class)
class BusModule {
    @Singleton
    @Provides
    fun provideBusService(retrofit: Retrofit) : GetBusStopService {
        return retrofit.create(GetBusStopService::class.java)
    }

    @Singleton
    @Provides
    fun provideLoginRepository(busStopService: GetBusStopService) : GetBusStopRepository {
        return GetBusStopRepositoryImpl(busStopService)
    }
}