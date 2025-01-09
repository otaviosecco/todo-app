import 'package:http_interceptor/http_interceptor.dart';
import 'dart:async';
import 'package:http/http.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);

const String baseUrl = 'http://192.168.0.103:3000';

class LoggingInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) async {
    print('Response');
    print('status code: ${response.statusCode}');
    print('headers: ${response.headers}');
    if (response is Response) {
      print('body: ${response.body}');
    }
    return response;
  }
  
  @override
  FutureOr<bool> shouldInterceptRequest() {
    // TODO: implement shouldInterceptRequest
    throw UnimplementedError();
  }
  
  @override
  FutureOr<bool> shouldInterceptResponse() {
    // TODO: implement shouldInterceptResponse
    throw UnimplementedError();
  }
}
