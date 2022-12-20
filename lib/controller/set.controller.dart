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
  var questions = <Question>[].obs;
  var selectionList = Map<String, String>().obs;

  SetDetailsController();

  void updateSetId(var id) {
    setId.value = id;
  }

  void fetchSetsDetails(var id) async {
    try {
      isLoading(true);
      var detail = await RemoteServices.fetchSetDetails(id);
      questions.value = detail.questions;
      detail.questions.forEach((e) => selectionList.value[e.question] = '');
      print("selectionList---------------------------------");

      print(selectionList);
    } finally {
      isLoading(false);
    }
  }
}
