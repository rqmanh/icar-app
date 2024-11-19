
import 'package:json_annotation/json_annotation.dart';

part 'api_response_model.g.dart';

@JsonSerializable()
class ApiResponseModel {
  final bool? status;
  final String? code;
  final String? message;
  final dynamic data;
  final dynamic errors;

  ApiResponseModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.errors,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) => _$ApiResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseModelToJson(this);
  List<String> getAllErrors() {
    if (errors is Map) {
      return (errors as Map).values.map((e) => e.toString()).toList();
    }
    return [];
  }
}
