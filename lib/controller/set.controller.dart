import 'package:entrance_prep/models/get-one-set.model.dart';
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
      var sets = await RemoteServices.fetchSets();
      setsList.value = sets;
    } finally {
      isLoading(false);
    }
  }
}

class SetDetailsController extends GetxController {
  var isLoading = true.obs;
  var setId = ''.obs;
  var setDetails = SetItemDetail(
    name: '',
    questions: [],
    description: '',
    active: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    id: '',
  ).obs;

  SetDetailsController();

  @override
  void onInit() {
    super.onInit();
    // fetchSetsDetails(setId.value);
  }

  void updateSetId(var id) {
    setId.value = id;
    print("---------------setId.value:------------- ${setId.value}");
  }

  void fetchSetsDetails(var id) async {
    try {
      isLoading(true);
      var detail = await RemoteServices.fetchSetDetails(id);
      print("detail--------" + detail.toString());
      setDetails.value = detail;
    } finally {
      isLoading(false);
    }
  }
}
