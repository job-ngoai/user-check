import 'package:app_demo/models/ip.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_ip.g.dart';

@RestApi(baseUrl: "https://ipinfo.io")
abstract class RestIpClient {
  factory RestIpClient(Dio dio, {String baseUrl}) = _RestIpClient;

  @GET("/{ip}?token=b8049769faa4d3")
  Future<IpModel> getConfig(@Path("ip") String? ip);
}
