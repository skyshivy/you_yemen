import 'package:get/get.dart';
import 'package:you_yemen/files/api_calls/mytunes_api.dart';
import 'package:you_yemen/files/models/my_tunes_model.dart';

class MyTunesController extends GetxController {
  var isLoading = true.obs;
  var myTunesModel = MyTunesModel().obs;
  var error = ''.obs;

  @override
  void onInit() {
    fetchTunes();
    super.onInit();
  }

  void fetchTunes() async {
    try {
      isLoading(true);
      var response = await MyTunesScreenApi();
      var response1 = await MyTunesScreenApi1();
      myTunesModel(response);
      myTunesModel(response1);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
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
