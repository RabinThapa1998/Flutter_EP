import 'package:entrance_prep/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:entrance_prep/models/get-set.model.dart';

class SetController extends GetxController {
  var setsList = <SetItem>[].obs;

  void fetchSetsList() async {
    var sets = await RemoteServices.fetchSets();
    print("sets");
    setsList.value = sets;
  }
}
