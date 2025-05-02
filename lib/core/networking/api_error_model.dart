import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  final dynamic errors; // يمكن أن يكون Map أو String أو null

  ApiErrorModel({this.errors, this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    dynamic parsedErrors;
    if (json['errors'] is Map<String, dynamic>) {
      parsedErrors = json['errors'] as Map<String, dynamic>;
    } else if (json['errors'] is String) {
      parsedErrors = json['errors'] as String;
    } else {
      parsedErrors = null;
    }

    return ApiErrorModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
      errors: parsedErrors,
    );
  }

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

