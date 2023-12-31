import 'package:login2/data/models/response/register_response_model.dart';
import 'package:login2/data/models/request/register_model.dart';
import 'package:http/http.dart' as http;

class ApiDatasources {
  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    final response =
        await http.post(Uri.parse('https://api.escuelajs.co/api/v1/users/'),
            // headers: {'Content-Type': 'application/json'},
            body: registerModel.toMap());
    final result = RegisterResponseModel.fromJson(response.body);
    return result;
  }
}
