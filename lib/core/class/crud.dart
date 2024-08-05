import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<Statusrequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await ckeckInternet()) {
        print("Internet is available");
        print("Sending request to $linkurl with data: $data");
        var response = await http.post(Uri.parse(linkurl), body: data);
        print("Received response with status code: ${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print("Response body: $responsebody");
          if (responsebody['status'] == 'success') {
            return Right(responsebody);
          } else {
            return const Left(Statusrequest.failure);
          }
        } else {
          return const Left(Statusrequest.serverfailure);
        }
      } else {
        print("No internet connection");
        return const Left(Statusrequest.offlinefailure);
      }
    } catch (e) {
      print("Exception: $e");
      return const Left(Statusrequest.severException);
    }
  }
}

/* class Crud {
  Future<Either<Statusrequest, Map>> postData(String linkurl, Map data) async {
    if (await ckeckInternet()) {
      try {
        print('Sending data...');
        var response = await http.post(Uri.parse(linkurl), body: data);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        print('Response status: ${response.statusCode}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(Statusrequest.serverfailure);
        }
      } catch (e) {
        print("Exception: $e");
        return const Left(Statusrequest.severException);
      }
    } else {
      return const Left(Statusrequest.offlinefailure);
    }
  }
}
 */