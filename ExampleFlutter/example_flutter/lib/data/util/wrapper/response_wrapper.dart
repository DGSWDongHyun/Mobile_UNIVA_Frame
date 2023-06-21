Future<ApiResult<T>> safeApiCall<T>({required Future<T> callApi}) async {
  try {
    return ApiResult(await callApi, null);
  }catch(e) {
    return ApiResult(null, e);
  }
}

class ApiResult<T> {
  final T? result;
  final Object? exception;

  ApiResult(this.result, this.exception);
}