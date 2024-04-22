// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus_remote.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BusStopRemote implements BusStopRemote {
  _BusStopRemote(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://apis.data.go.kr/1613000/BusSttnInfoInqireService/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BusStopResponseEntity> getBusStopList(
    String key,
    int pageNum,
    int numOfRows,
    double gpsLatitude,
    double gpsLongitude,
    String returnType,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'serviceKey': key,
      r'pageNo': pageNum,
      r'numOfRows': numOfRows,
      r'gpsLati': gpsLatitude,
      r'gpsLong': gpsLongitude,
      r'_type': returnType,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BusStopResponseEntity>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'getCrdntPrxmtSttnList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BusStopResponseEntity.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
