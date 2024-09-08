import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:prj/core/class/statusrequest.dart';
import 'package:prj/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

Map<String, String> _myheaders = {
  "Content-Type": "application/json",
  //"Authorization": "Bearer your_token_here", // Remplacez par votre token si nécessaire
};

class Crud {
  Future<Either<Statusrequest, Map>> postData(String linkurl, Map data) async {
    try {
      print('Sending data...');
      if (await ckeckInternet()) {
        print('Internet available');

        // Construire l'URI correctement
        Uri uri = Uri.parse(linkurl);

        var response = await http.post(
          uri,
          //headers: {"Content-Type": "application/x-www-form-urlencoded"},
          body: data, // Encoder les données
        );

        print('Response status: ${response.statusCode}');

        if (response.statusCode >= 200 && response.statusCode < 300) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          print('Response body: ${response.body}');
          if (responseBody['status'] == 'succes') {
            return Right(responseBody);
          } else {
            return const Left(Statusrequest.failure);
          }
        } else {
          return const Left(Statusrequest.serverfailure);
        }
      } else {
        return const Left(Statusrequest.offlinefailure);
      }
    } catch (e) {
      print("Exception: $e");
      return const Left(Statusrequest.severException);
    }
  }

  Future<Either<Statusrequest, Map>> addRequestWithImageOne(
      String url, Map data, File? image,
      [String? namerequest]) async {
    try {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(_myheaders);

      if (image != null) {
        var length = await image.length();
        var stream = http.ByteStream(image.openRead());
        var multipartFile = http.MultipartFile(
          'categories_image', // Le nom de champ attendu par le backend
          stream,
          length,
          filename: basename(image.path),
        );
        request.files.add(multipartFile);
      }

      // Ajouter les données au formulaire
      data.forEach((key, value) {
        request.fields[key] = value;
      });

      // Envoyer la requête
      var myrequest = await request.send();
      var response = await http.Response.fromStream(myrequest);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(Statusrequest.serverfailure);
      }
    } catch (e) {
      print("Erreur lors de l'envoi de la requête : $e");
      return const Left(Statusrequest.failure);
    }
  }
}

/* 

Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "files";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  } */