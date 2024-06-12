import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:you_yemen/files/api_calls/edit_profile_screen_api.dart';
import 'package:you_yemen/files/api_calls/get_category_list_api.dart';
import 'package:you_yemen/files/api_calls/profile_api.dart';
import 'package:you_yemen/files/model/profile_modal.dart';
import 'package:you_yemen/files/models/category_list_model.dart';
import 'package:you_yemen/files/translation/strings.dart';

class ProfileController {
  TextEditingController textEditingController = TextEditingController();
  RxBool isloading = false.obs;
  RxBool savingEdit = false.obs;
  RxString editButtonTitle = editStr.obs;
  RxBool editEnable = false.obs;
  RxList<Category> categories = <Category>[].obs;
  List<String> selectedCatIds = [];
  ProfileModal? profileModel;
  getCatgeoryList() async {}

  void saveChanges() {
    selectedCatIds = [];
    for (var catIds in categories) {
      if (catIds.isSelected.value) {
        selectedCatIds.add(catIds.categoryId ?? '');
      }
    }
    editEnable.value = false;
    editButtonTitle.value = editStr;
    print("selected category id  = ${selectedCatIds}");
    _editProfileAfterSelecting();
  }

  Future<void> editProfile() async {
    editEnable.value = true;
    editButtonTitle.value = saveChangeStr;

    //  final response = await editProfile();
  }

  getProfileDetail() async {
    isloading.value = true;
    CategoryListModel catModel = await getCategoryListApi();
    categories.value = catModel.responseMap?.categories ?? [];

    profileModel = await getProfileDetailsApi();
    if (profileModel?.statusCode == 'SC0000') {
      List<String> categoryIdList =
          (profileModel?.responseMap?.getProfileDetails?.categories ?? "")
              .split(',');
      for (var cats in categories) {
        if (categoryIdList.contains(cats.categoryId)) {
          cats.isSelected.value = true;
        } else {
          cats.isSelected.value = false;
        }
      }

      isloading.value = false;
    }
  }

  Future<void> _editProfileAfterSelecting() async {
    //isEditing = false;
    savingEdit.value = true;
    final response = await editProfileAfterSelecting(selectedCatIds);
    savingEdit.value = false;
  }

  void cancelEditing() {
    editEnable.value = false;
    editButtonTitle.value = editStr;
    List<String> categoryIdList =
        (profileModel?.responseMap?.getProfileDetails?.categories ?? "")
            .split(',');
    for (var cats in categories) {
      if (categoryIdList.contains(cats.categoryId)) {
        cats.isSelected.value = true;
      } else {
        cats.isSelected.value = false;
      }
    }
  }
}
