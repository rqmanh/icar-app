import 'package:icar/config/app_strings.dart';

import 'package:dio/dio.dart' show DioException, DioExceptionType;

// class DioExceptions implements Exception  {
//   late String message;

//   // DioExceptions(String message) {
//   //   this.message = message;
//   // }

//   DioExceptions.fromDioError(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.cancel:
//         message = AppString.cancelRequest;
//         break;
//       case DioExceptionType.connectionTimeout:
//         message = AppString.connectionTimeOut;
//         break;
//       case DioExceptionType.receiveTimeout:
//         message = AppString.receiveTimeOut;
//         break;
//       case DioExceptionType.badResponse:
//         message = _handleError(
//           dioException.response?.statusCode,
//           dioException.response?.data,
//         );
//         break;
//       case DioExceptionType.sendTimeout:
//         message = AppString.sendTimeOut;
//         break;
//       case DioExceptionType.connectionError:
//         message = AppString.socketException;
//         break;
//       default:
//         message = AppString.unknownError;
//         break;
//     }
//   }

//   String _handleError(int? statusCode, dynamic error) {
//     switch (statusCode) {
//       case 400:
//         return AppString.badRequest;
//       case 401:
//         return AppString.unauthorized;
//       case 403:
//         return AppString.forbidden;
//       case 404:
//         return AppString.notFound;
//       case 422:
//         return AppString.duplicateEmail;
//       case 500:
//         return AppString.internalServerError;
//       case 502:
//         return AppString.badGateway;
//       case 429:
//         return AppString.badRequest;
//       default:
//         return AppString.unknownError;
//     }
//   }

//   @override
//   String toString() => message;
// }

// class ResponseCodeUtils {
//   static String getCode(String code) {
//     switch (code) {
//       case 'S200':
//         return 'Success';
//       case 'E422':
//         return 'Validation errors';
//       case 'E401':
//         return 'Unauthorized';
//       case 'E403':
//         return 'Forbidden';
//       case 'E500':
//         return 'Server errors';
//       case 'E429':
//         return 'Too many requests, please try again later.';
//       default:
//         return 'Unknown error';
//     }
//   }

//   static String getErrorMessage(dynamic errors, String? message) {
//     if (errors is Map) {
//       return _extractErrorsFromMap(errors);
//     } else if (errors is List) {
//       // return _extractErrorsFromList(errors);
//     } else if (errors is String) {
//       return errors;
//     }

//     if (errors == null) {
//       if (message == 'Too Many Requests') {
//         return 'Too many requests, please wait for 1 minute';
//       }
//       if (message == 'Unauthenticated' || message == 'Unauthorized') {
//         return 'Unauthorized';
//       }
//       return 'Please try again later';
//     }
//     return 'Unknown error occurred';
//   }

//   static String _extractErrorsFromMap(Map errors) {
//     List<String> errorMessages = [];
//     errors.forEach((key, value) {
//       if (value is String) {
//         errorMessages.add(value);
//       } else if (value is List) {
//         errorMessages.addAll(_extractErrorsFromList(value));
//       } else if (value is Map) {
//         errorMessages.add(_extractErrorsFromMap(value));
//       }
//     });
//     return errorMessages.join(', ');
//   }

//   static List<String> _extractErrorsFromList(List errors) {
//     List<String> errorMessages = [];
//     for (var value in errors) {
//       if (value is String) {
//         errorMessages.add(value);
//       } else if (value is List) {
//         errorMessages.addAll(_extractErrorsFromList(value));
//       } else if (value is Map) {
//         errorMessages.addAll(_extractErrorsFromMap(value).split(', '));
//       }
//     }
//     return errorMessages;
//   }
// }


class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioException) {
    message = _handleDioError(dioException);
  }

  // Handles different Dio errors and returns user-friendly messages
  String _handleDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return AppString.cancelRequest; // Request was canceled
      case DioExceptionType.connectionTimeout:
        return AppString.connectionTimeOut; // Connection timed out
      case DioExceptionType.receiveTimeout:
        return AppString.receiveTimeOut; // Response receiving timed out
      case DioExceptionType.sendTimeout:
        return AppString.sendTimeOut; // Sending timed out
      case DioExceptionType.connectionError:
        return AppString.socketException; // No Internet connection
      case DioExceptionType.badResponse:
        return _handleBadResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
      default:
        return AppString.unknownError; // Default error message
    }
  }

  // Handle server-side errors based on status codes
  String _handleBadResponse(int? statusCode, dynamic error) {
    return ResponseCodeUtils.getCode(statusCode?.toString() ?? 'Unknown') + 
           ': ' + 
           ResponseCodeUtils.getErrorMessage(error, null);
  }

  @override
  String toString() => message;
}


// class ResponseCodeUtils {
//   // Map status codes to user-friendly messages
//   static String getCode(String code) {
//     switch (code) {
//       case '200':
//         return AppString.success;
//       case '201':
//         return AppString.created;
//       case '400':
//         return AppString.badRequest;
//       case '401':
//         return AppString.unauthorized;
//       case '403':
//         return AppString.forbidden;
//       case '404':
//         return AppString.notFound;
//       case '422':
//         return AppString.validationError;
//       case '500':
//         return AppString.internalServerError;
//       case '502':
//         return AppString.badGateway;
//       case '429':
//         return AppString.tooManyRequests;
//       default:
//         return AppString.unknownError;
//     }
//   }

//   // Extract detailed error messages from response data
//   static String getErrorMessage(dynamic errors, String? message) {
//     if (errors == null) {
//       // Fallback if error details are unavailable
//       return message ?? AppString.unknownError;
//     }

//     // Handle error formats (either Map, List, or String)
//     if (errors is Map) {
//       return _extractErrorsFromMap(errors);
//     } else if (errors is List) {
//       return _extractErrorsFromList(errors).join(', ');
//     } else if (errors is String) {
//       return errors;
//     }

//     return AppString.unknownError;
//   }

//   // Helper method to extract errors from a Map
//   static String _extractErrorsFromMap(Map errors) {
//     List<String> errorMessages = [];
//     errors.forEach((key, value) {
//       if (value is String) {
//         errorMessages.add(value);
//       } else if (value is List) {
//         errorMessages.addAll(_extractErrorsFromList(value));
//       } else if (value is Map) {
//         errorMessages.add(_extractErrorsFromMap(value));
//       }
//     });
//     return errorMessages.join(', ');
//   }

//   // Helper method to extract errors from a List
//   static List<String> _extractErrorsFromList(List errors) {
//     List<String> errorMessages = [];
//     for (var value in errors) {
//       if (value is String) {
//         errorMessages.add(value);
//       } else if (value is List) {
//         errorMessages.addAll(_extractErrorsFromList(value));
//       } else if (value is Map) {
//         errorMessages.addAll(_extractErrorsFromMap(value).split(', '));
//       }
//     }
//     return errorMessages;
//   }
// }

class ResponseCodeUtils {
  // Map status codes to user-friendly messages
  static String getCode(String code) {
    const statusMessages = {
      '200': AppString.success,
      '201': AppString.created,
      '400': AppString.badRequest,
      '401': AppString.unauthorized,
      '403': AppString.forbidden,
      '404': AppString.notFound,
      '422': AppString.validationError,
      '500': AppString.internalServerError,
      '502': AppString.badGateway,
      '429': AppString.tooManyRequests,
    };

    // Return the message if found, otherwise fall back to a default message
    return statusMessages[code] ?? AppString.unknownError;
  }

  // Extract detailed error messages from response data
  static String getErrorMessage(dynamic errors, String? message) {
    if (errors == null) {
      return message ?? AppString.unknownError;
    }

    // Handle error formats (either Map, List, or String)
    if (errors is Map) {
      return _extractErrorsFromMap(errors);
    } else if (errors is List) {
      return _extractErrorsFromList(errors).join(', ');
    } else if (errors is String) {
      return errors;
    }

    return AppString.unknownError;
  }

  // Helper method to extract errors from a Map using entries
  static String _extractErrorsFromMap(Map errors) {
    List<String> errorMessages = errors.entries.map((entry) {
      final value = entry.value;
      if (value is String) {
        return value;
      } else if (value is List) {
        return _extractErrorsFromList(value).join(', ');
      } else if (value is Map) {
        return _extractErrorsFromMap(value);
      }
      return '';
    }).toList();
    
    return errorMessages.join(', ');
  }

  // Helper method to extract errors from a List
  static List<String> _extractErrorsFromList(List errors) {
    return errors.map((value) {
      if (value is String) {
        return value;
      } else if (value is List) {
        return _extractErrorsFromList(value).join(', ');
      } else if (value is Map) {
        return _extractErrorsFromMap(value);
      }
      return '';
    }).toList();
  }
}
