// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:scholars_padi/constants/status_codes.dart';
// import 'package:simple_connection_checker/simple_connection_checker.dart';

// class WebServices {
//   static Future<Object> sendRequest(String url, context) async {
//     bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

//     try {
//       if (isConnected) {
//         var response = await http.get(Uri.parse(url));

//         if (response.statusCode == 200) {
//           Navigator.pop(context);
//           return Success(response: response.body);
//         } else {
//           return Failure(
//               code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
//         }
//       } else {
//         return const SocketException('No Data Found');
//       }
//     } catch (e) {
//       Navigator.pop(context);
//       return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
//     }
//   }
// }
