import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/api_calls/Profile_api.dart';
import 'package:you_yemen/files/api_calls/catrgory_api.dart';
import 'package:you_yemen/files/api_calls/edit_profile_screen_api.dart';
import 'package:you_yemen/files/controllers/profile_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/model/edit_modal.dart';
import 'package:you_yemen/files/network_manager/network_manager.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/cancel_button.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/reusable_widgets/u_text_field/u_msisdn_textfield.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

import 'package:flutter/services.dart';

import 'package:you_yemen/files/utility/constants.dart';



import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   final ProfileController controller;

//   ProfileScreen({required this.controller});
//  TextEditingController textEditingController = TextEditingController();


//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ResponsiveBuilder(
//         builder: (context, si) {
//           return si.isMobile ? _buildResponsiveLayout() : _buildDefaultLayout();
//         },
//       ),
//     );
//   }

//   Widget _buildDefaultLayout() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildCircleAvatar(),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 40.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildContactNumberField(),
//                   SizedBox(height: 2),
//                   _buildPreferencesGrid(),
//                   SizedBox(height: 2),
//                   SizedBox(
//                     height: 220,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         widget.controller.isEditing
//                             ? _buildSaveChangesButton()
//                             : _buildEditButton(),
//                         SizedBox(width: 10),
//                         widget.controller.isEditing ? _buildCancelButton() : SizedBox(),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(width: 16), 
//         ],
//       ),
//     );
//   }

//   Widget _buildResponsiveLayout() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _buildCircleAvatar(),
//           SizedBox(height: 20),
//           _buildContactNumberField(),
//           SizedBox(height: 20),
//           Flexible(
//             child: _buildPreferencesGrid(),
//           ),
//           SizedBox(height: 20),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               widget.controller.isEditing ? _buildSaveChangesButton() : _buildEditButton(),
//               SizedBox(height: 10),
//               widget.controller.isEditing ? _buildCancelButton() : SizedBox(),
//             ],
//           ),
//           SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   Widget _buildCircleAvatar() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(color: Colors.pink),
//         ),
//         child: Icon(Icons.person, size: 95),
//       ),
//     );
//   }

//   Widget _buildContactNumberField() {
//     widget.controller.textEditingController.text = StoreManager().msisdn;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Contact Number:'),
//         Row(
//           children: [
//             Flexible(
//               child: SizedBox(
//                   width: 300,
//                   child: UMsisdnTextField( 
//                       enabled: false,hintText: StoreManager().msisdn,
//                       textEditingController: widget.controller.textEditingController)),
//             )
//           ],
//         )
//       ],
//     );
//   }

//   Widget _buildPreferencesGrid() {
//     bool isScreenMinimized = MediaQuery.of(context).size.width < 600; 
    
//     if (isScreenMinimized) {
//       return SingleChildScrollView(
//         scrollDirection: Axis.horizontal, 
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: widget.controller.texts.map((text) {
//               int index = widget.controller.texts.indexOf(text);
//               return Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: GestureDetector(
//                   onTap: () {
//                     if (widget.controller.isEditing) {
//                       setState(() {
//                         widget.controller.selectedItems[index] = !widget.controller.selectedItems[index];
//                       });
//                     }
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: widget.controller.selectedItems[index] ? Colors.orange : Colors.grey,
//                       borderRadius: BorderRadius.circular(20), 
//                     ),
//                     padding: EdgeInsets.all(10),
//                     child: UText(
//                       title: text,
//                       enfontName: FontName.helvetica,
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       );
//     }

//     int itemCount = widget.controller.imagePaths.length;
//     double screenWidth = MediaQuery.of(context).size.width;
//     int crossAxisCount = (screenWidth / 120).floor(); 

//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Preference',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   mainAxisExtent: 100,
//                   mainAxisSpacing: 10,
//                   crossAxisSpacing: 40,
//                   childAspectRatio: 1,
//                   crossAxisCount: crossAxisCount,
//                 ),
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: itemCount,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       if (widget.controller.isEditing) {
//                         setState(() {
//                           widget.controller.selectedItems[index] = !widget.controller.selectedItems[index];
//                         });
//                       }
//                     },
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Stack(
//                         alignment: Alignment.topLeft,
//                         children: [
//                           Column(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.network(
//                                   widget.controller.imagePaths[index],
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               SizedBox(height: 3),
//                               Text(
//                                 widget.controller.texts[index],
//                               ),
//                             ],
//                           ),
//                           if (widget.controller.selectedItems[index])
//                             Container(
//                               margin: EdgeInsets.all(5),
//                               width: 20, 
//                               height: 20, 
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.yellow,
//                               ),
//                               child: Icon(Icons.check, size: 14, color: Colors.white),
//                             ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEditButton() {
//     return ElevatedButton(
//       onPressed: () {
//         widget.controller.isEditing = true;
//       },
//       child: Text('Edit'),
//     );
//   }

//   Widget _buildSaveChangesButton() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10.0),
//       child: ElevatedButton(
//         onPressed: () {
//           // widget.controller.editProfile();
//           // widget.controller.saveChanges();
//           // widget.controller.getProfileDetailsApi();
//           // widget.controller.editProfileAfterSelecting(widget.controller.selectedItems);
//         },
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
//         ),
//         child: Text(
//           'Save Changes',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//       ),
//     );
//   }

//   Widget _buildCancelButton() {
//     return ElevatedButton(
//       onPressed: () {
//         widget.controller.cancelEditing();
//       },
//       child: Text('Cancel'),
//     );
//   }
// }






class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ResponsiveBuilder(
        builder: (context, si) {
          return si.isMobile ? _buildResponsiveLayout() : _buildDefaultLayout();
        },
      ),
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
                      enabled: false,hintText: StoreManager().msisdn,
                      textEditingController: textEditingController)),
            )
          ],
        )
      ],
    );
  }


  Widget _buildPreferencesGrid() {
  bool isScreenMinimized = MediaQuery.of(context).size.width < 600;

  if (isScreenMinimized) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: texts.map((text) {
            int index = texts.indexOf(text);
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  if (isEditing) {
                    setState(() {
                      selectedItems[index] = !selectedItems[index];
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedItems[index] ? Colors.orange : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  child: UText(
                    title: text,
                    enfontName: FontName.helvetica,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  int itemCount = imagePaths.length;
  double screenWidth = MediaQuery.of(context).size.width;
  int crossAxisCount = (screenWidth / 120).floor();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Preference',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 100,
            mainAxisSpacing: 10,
            crossAxisSpacing: 40,
            childAspectRatio: 1,
            crossAxisCount: crossAxisCount,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (isEditing) {
                  setState(() {
                    selectedItems[index] = !selectedItems[index];
                  });
                }
              },
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 3),
                        Flexible(
                          child: Text(
                            texts[index],overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    if (selectedItems[index])
                      Container(
                        margin: EdgeInsets.all(5),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                        child: Icon(Icons.check, size: 14, color: Colors.white),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}


  Widget _buildEditButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isEditing = true;
        });
      },
      child: Text('Edit'),
    );
  }

  Widget _buildSaveChangesButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ElevatedButton(
        onPressed: () {
          editProfile();
          saveChanges();
          getProfileDetailsApi();
          editProfileAfterSelecting(selectedItems);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
        ),
        child: Text(
          'Save Changes',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isEditing = false;
          selectedItems = List<bool>.generate(7, (index) => false);
        });
      },
      child: Text('Cancel'),
    );
  }

  void saveChanges() {
    setState(() {
      isEditing = false;
    });
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