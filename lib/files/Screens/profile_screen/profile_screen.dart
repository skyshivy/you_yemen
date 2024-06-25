import 'package:flutter/material.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return UText(title: "Profile screen");
  }
}
/*
class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    cont.getCatgeoryList();
    cont.getProfileDetail();
    super.initState();
  }

  ProfileController cont = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return cont.isloading.value
            ? loadingIndicator(radius: 20)
            : ResponsiveBuilder(
                builder: (context, si) {
                  return si.isMobile
                      ? _buildResponsiveLayout()
                      : _buildDefaultLayout();
                },
              );
      }),
    );
  }

  Widget _buildDefaultLayout() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Align items to start and end of the row
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCircleAvatar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContactNumberField(),
                  SizedBox(height: 2),
                  _buildPreferencesGrid(),
                  SizedBox(height: 2),
                  SizedBox(
                    height: 220,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Align items to center
                      children: [
                        isEditing
                            ? _buildSaveChangesButton()
                            : _buildEditButton(),
                        SizedBox(width: 10),
                        isEditing ? _buildCancelButton() : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildResponsiveLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCircleAvatar(),
          SizedBox(height: 20),
          _buildContactNumberField(),
          SizedBox(height: 20),
          Flexible(
            child: _buildPreferencesGrid(),
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isEditing ? _buildSaveChangesButton() : _buildEditButton(),
              SizedBox(height: 10),
              isEditing ? _buildCancelButton() : SizedBox(),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.pink),
        ),
        child: Icon(Icons.person, size: 95),
      ),
    );
  }

  Widget _buildContactNumberField() {
    textEditingController.text = StoreManager().msisdn;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Number:'),
        Row(
          children: [
            Flexible(
              child: SizedBox(
                  width: 300,
                  child: UMsisdnTextField(
                      enabled: false,
                      hintText: StoreManager().msisdn,
                      textEditingController: textEditingController)),
            )
          ],
        )
      ],
    );
  }

  _buildPreferencesGrid() {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Obx(() {
          return si.isMobile
              ? gridTitleWidget()
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: cont.categories.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 180, mainAxisExtent: 120),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 8),
                        child: gridCellWIthImage(index)
                        // si.isMobile
                        //     ?
                        //     : ,
                        );
                  },
                );
        });
      },
    );
  }

  Widget gridCellWIthImage(int index) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Obx(() {
          return InkWell(
            onTap: !cont.editEnable.value
                ? null
                : () {
                    cont.categories[index].isSelected.value =
                        !cont.categories[index].isSelected.value;
                  },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(contanerCornerRadius),
                  color: white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: uImage(
                        url: cont.categories[index].menuImage ?? '',
                        borderRadius:
                            BorderRadius.circular(contanerCornerRadius)),
                  ),
                  UText(
                    title: cont.categories[index].categoryName ?? '',
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          );
        }),
        Obx(() {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              cont.categories[index].isSelected.value

                  // ? Icons.circle :Icons.fork_right,

                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: yellow,
            ),
          );
        })
      ],
    );
  }

  Widget gridTitleWidget() {
    return Container(
      child: Wrap(
        spacing: 8,
        children: cont.categories.map((e) => prefTitleCell(e)).toList(),
      ),
    );
  }

  Widget prefTitleCell(CategoryList e) {
    return InkWell(
      focusColor: transparent,
      hoverColor: transparent,
      splashColor: transparent,
      highlightColor: transparent,
      onTap: !cont.editEnable.value
          ? null
          : () {
              e.isSelected.value = !e.isSelected.value;
              print("SKY======${e.isSelected.value}");
            },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(contanerCornerRadius),
            color: (e.isSelected.value) ? yellow : lightGrey,
          ),
          child : Padding(
            padding: const EdgeInsets.all(8.0),
            child: UText(
              title: e.categoryName ?? '',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return Obx(() {
      return cont.savingEdit.value
          ? loadingIndicator()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return confirmButton(
                    titlePadding: 32,
                    title: cont.editButtonTitle.value,
                    onTap: () {
                      if (cont.editEnable.value) {
                        cont.saveChanges();
                      } else {
                        cont.editProfile();
                      }
                    },
                  );
                }),
                Obx(() {
                  return cont.editEnable.value
                      ? _buildCancelButton()
                      : SizedBox();
                })
              ],
            );
    });
  }

  Widget _buildSaveChangesButton() {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: confirmButton(
            title: saveChangeStr,
            onTap: () {
              cont.saveChanges();
              // editProfile();

              // getProfileDetailsApi();
              // editProfileAfterSelecting(selectedItems);
            }));
  }

  Widget _buildCancelButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: cancelButton(onTap: () {
        cont.cancelEditing();
      }),
    );
  }
}

////////////////////////////usingggggggggggg imahges
//   List<String> imagePaths = [];
//   List<String> texts = [];

//   @override
//   void initState() {
//     super.initState();

//     fetchImagesAndTexts();
//   }

//   Future<void> fetchImagesAndTexts() async {
//     try {
//       final url = 'https://callertunez.mtn.co.za/apigw/Middleware/api/adapter/v1/crbt/categories?language=English';
//       final response = await NetworkManager().get(url);

//       if (response.containsKey('statusCode') && response['statusCode'] == 200) {
//         final List<dynamic> categories = response['responseMap']['categories'];
//         setState(() {
//   imagePaths = categories.map<String>((category) => category['menuImagePath']).toList();
//   texts = categories.map<String>((category) => category['categoryName']).toList();
//   print('Fetched Image Paths: $imagePaths');
//   print('Fetched Texts: $texts');
// });

//       } else {
//         print('Failed to fetch images or texts. Response: $response');
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }
*/