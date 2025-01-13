import 'package:dio/dio.dart';

class DataAuth {
  static final Dio dio = Dio();

  static postData (
      {required name,
      required email,
      required phone,
      required nationalId,
      required password,
      required token,
      required profileImage,
      required gender}) async {
    var response =
        await dio.post("https://elwekala.onrender.com/user/register", data: {
      "name": name,
      "email": email,
      "phone": phone,
      "nationalId": nationalId,
      "gender": gender,
      "password": password,
      "token": token,
      "profileImage": profileImage,
    });
    try {
      var data = response.data;
      print("=======");

      print(data["message"]);
      print("=======");
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data["message"]);
        var failure= error.response!.data["message"];
        return failure;
      }
    }
  }
}