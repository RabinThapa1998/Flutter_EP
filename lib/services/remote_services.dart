import 'package:entrance_prep/models/get-set.model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<SetItem>> fetchSets() async {
    var response = await client
        .get(Uri.parse('http:192.168.1.88:8000/api/v1/dashboard/sets'));

    if (response.statusCode == 200) {
      print("response");
      var jsonString = response.body;

      return Sets.fromJson(jsonString).data;
    } else {
      print("error............................................");
      return [] as List<SetItem>;
    }
  }
}
