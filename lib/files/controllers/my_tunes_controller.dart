import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/mytunes_api.dart';
import 'package:you_yemen/files/models/my_tunes_model.dart';
import 'package:you_yemen/files/models/playing_tune_list_model.dart';

class MyTunesController extends GetxController {
  var isLoading = true.obs;
  var myTunesModel = MyTuneListModel().obs;
  var error = ''.obs;
  RxList<MyTuneListApk> myTuneList = <MyTuneListApk>[].obs;
  RxList<PlayinglistApk> playingList = <PlayinglistApk>[].obs;

  @override
  void onInit() {
    fetchTunes();
    super.onInit();
  }

  void fetchTunes() async {
    myTuneList.clear();
    playingList.clear();
    try {
      isLoading(true);
      PlayingListModel playingListModel = await getPlayingListApi();
      MyTuneListModel myTuneListModel = await myTunesListApi();
      myTuneList.value = myTuneListModel.responseMap?.listToneApk ?? [];
      playingList.value = playingListModel.responseMap?.playinglistApk ?? [];
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
