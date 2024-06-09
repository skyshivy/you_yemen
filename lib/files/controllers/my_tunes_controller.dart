import 'package:get/get.dart';

import 'package:you_yemen/files/models/my_tunes_model.dart';
import 'package:you_yemen/files/models/playing_tune_list_model.dart';

class MyTunesController extends GetxController {
  var isLoading = true.obs;
  var myTunesModel = MyTuneListModel().obs;
  var error = ''.obs;
  RxList<MyTuneListApk> myTuneList = <MyTuneListApk>[].obs;
  RxList<PlayingToneDetail> playingList = <PlayingToneDetail>[].obs;

  @override
  void onInit() {
    fetchTunes();
    super.onInit();
  }

  void fetchTunes() async {
    // myTuneList.clear();
    // playingList.clear();
    // try {
    //   isLoading(true);
    //   PlayingListModel playingListModel = await getPlayingListApi();
    //   MyTuneListModel myTuneListModel = await myTunesListApi();
    //   myTuneList.value = myTuneListModel.responseMap?.listToneApk ?? [];
    //   try {
    //     playingList.value =
    //         playingListModel.responseMap?.playinglistApk?.first.toneDetails ??
    //             [];
    //   } catch (e) {
    //     print("Error fetchTunes = $e");
    //   }
    // } catch (e) {
    //   error(e.toString());
    // } finally {
    //   isLoading(false);
    // }
  }
}

// class DataController extends GetxController {
//   var datamodels = <DataModel>[].obs;
//   getData() async {
//     try {
//       loading.value = true;
//       if (data != null) {
//         datamodels.value = data;
//         loading.value=false;
//       }
//     } catch (e) {
//       Get.snackbar('title', '$e');
//       loading.value=false;
//     }
//   }

//   @override
//   void onInit(){
//     getData();
//     super.onInit();
//   }
// }

// class MyTunesController extends GetxController {
//   var myTunesModel = <MyTunesModel>[].obs;
//     var isLoading = true.obs;

//   var error = ''.obs;
  
//   MyTunesScreenApi() async {
//     try {
     
//       var data = await MyTunesScreenApi();
//       if (data == null) {
//        myTunesModel.value = data as List<MyTunesModel>;
       
//       }
//     } catch (e) {
//       Get.snackbar('title', '$e');
     
//     }
//   }

//   @override
//   void onInit() {
//      MyTunesScreenApi();;
//     super.onInit();
//   }
// }
