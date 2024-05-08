import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ProfileController {
  TextEditingController textEditingController = TextEditingController();
  
  final List<String> imagePaths = [
    'https://funtone.ooredoo.com.mm/stream-media/get-category-menu-image?menuId=11',
    'https://funtone.ooredoo.com.mm/stream-media/get-category-menu-image?menuId=22',
    'https://funtone.ooredoo.com.mm/stream-media/get-category-menu-image?menuId=96',
    'https://funtone.ooredoo.com.mm/stream-media/get-category-menu-image?menuId=101',
  ];
  final List<String> texts = [
    'Myanmar Rock',
    'Myanmar',
    'Myanmar Dance',
    'Rnb Music'
  ];
  bool isEditing = false;
  List<bool> selectedItems = List<bool>.generate(7, (index) => false);

  void saveChanges() {
    isEditing = false;
  }
  Future<void> editProfile() async {
    isEditing = false;
    //  final response = await editProfile();
  }

 
   Future<void> editProfileAfterSelecting(List<bool> selectedItems) async {
    isEditing = false;
    //  final response = await editProfileAfterSelecting(selectedItems);
  }


  void cancelEditing() {
    isEditing = false;
    selectedItems = List<bool>.generate(7, (index) => false);
  }








//   import 'package:network_manager/network_manager.dart';

// class ProfileController {
//   TextEditingController textEditingController = TextEditingController();
//   List<String> imagePaths = [];
//   List<String> texts = [];
//   bool isEditing = false;
//   List<bool> selectedItems = List<bool>.generate(7, (index) => false);

//   Future<void> fetchDataFromApi() async {
//     try {

//       NetworkManager networkManager = NetworkManager();
      

//       Response response = await networkManager.getRequest(
//         url: 'YOUR_API_ENDPOINT',
//       );


//       if (response.statusCode == 200) {

//         dynamic data = response.data;
        

//         List<dynamic> apiImagePaths = data['imagePaths'];
//         List<dynamic> apiTexts = data['texts'];

//         // Convert dynamic lists to string lists
//         imagePaths = apiImagePaths.cast<String>();
//         texts = apiTexts.cast<String>();
//       } else {
//         // Handle error if the request was not successful
//         print('Failed to fetch data from the API: ${response.statusCode}');
//       }
//     } catch (error) {
//       // Handle any errors that occurred during the HTTP request
//       print('Error fetching data from the API: $error');
//     }
//   }

//   void saveChanges() {
//     isEditing = false;
//   }

//   void editProfile() {
//     isEditing = true;
//   }

//   void cancelEditing() {
//     isEditing = false;
//     selectedItems = List<bool>.generate(7, (index) => false);
//   }
// }




}
