import 'package:app_demo/dto/base_response.dart';
import 'package:app_demo/models/config.model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:stacked/stacked_annotations.dart';
// 67.215.232.59
part 'api.g.dart';

@RestApi(baseUrl: "http://67.215.232.59:4020")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/api/v1/getFb/create")
  Future<void> postUser(@Body() String body);

  @POST("/api/v1/getFb/login")
  Future<BaseResponse> loginUser(@Body() String body);

  @POST("/api/v1/getFb/register")
  Future<BaseResponse> registerUser(@Body() String body);

  @GET("/api/v1/config")
  Future<List<ConfigModel>> getConfig(@Query("id") int? id);
}
