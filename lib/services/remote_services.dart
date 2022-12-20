import 'package:entrance_prep/models/get-one-set.model.dart';
import 'package:entrance_prep/models/get-set.model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<SetItem>> fetchSets() async {
    var response =
        await client.get(Uri.parse(dotenv.env['BASE_URL']! + '/sets'));

    if (response.statusCode == 200) {
      var jsonString = response.body;

      return Sets.fromJson(jsonString).data;
    } else {
      return [] as List<SetItem>;
    }
  }

  static Future<SetItemDetail> fetchSetDetails(var id) async {
    var response =
        await client.get(Uri.parse(dotenv.env['BASE_URL']! + '/sets/${id}'));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      var res = SetDetails.fromJson(jsonString);
      return res.data;
    } else {
      return {} as SetItemDetail;
    }
  }
}
