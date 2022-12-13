import 'package:entrance_prep/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:entrance_prep/models/get-set.model.dart';

class SetController extends GetxController {
  var isLoading = true.obs;
  var setsList = <SetItem>[].obs;

  @override
  void onInit() {
    fetchSetsList();
    super.onInit();
  }

  void fetchSetsList() async {
    try {
      isLoading(true);
      print("fetching sets");
      var sets = await RemoteServices.fetchSets();
      setsList.value = sets;
    } finally {
      isLoading(false);
    }
  }
}
