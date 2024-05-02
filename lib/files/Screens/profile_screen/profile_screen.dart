import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/cancel_button.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/loading_indicator.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

import 'package:flutter/services.dart';

// class ProfileScreen extends StatelessWidget {
//   final List<String> imagePaths = [
//     'assets/png/77.png', 'assets/png/77.png', 'assets/png/77.png',
//     'assets/png/77.png', 'assets/png/77.png', 'assets/png/77.png', 'assets/png/77.png',
//   ];
//   final List<String> texts = ['hj', 'jbn', 'bmm', 'nbn', 'jhg', 'gvh', 'hgf'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Padding(
//             padding: const EdgeInsets.only(left: 200.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.pink),
//                   ),
//                   child: Icon(Icons.person, size: 95),
//                 ),
//                 SizedBox(width: constraints.maxWidth * 0.04),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 400.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         UText(title:
//                           'Contact Number',
//                          enfontName: FontName.helvetica,
//                         ),
//                         SizedBox(height: 10),
//                         Container(
//                           width: constraints.maxWidth * 0.6,
//                           height: 35,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             border: Border.all(color: Colors.black),
//                           ),
//                           child: TextField(
//                             keyboardType: TextInputType.number,
//                             inputFormatters: <TextInputFormatter>[
//                               FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                               LengthLimitingTextInputFormatter(10),
//                             ],
//                             decoration: InputDecoration(
//                               hintText: "",
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Padding(
//                           padding: const EdgeInsets.only(left:10.0),
//                           child: UText(title:
//                             'Preferences*',
//                              enfontName: FontName.helvetica,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left:0,right: 90.0), // Add padding to bottom
//                             child: GridView.builder(
//                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                 mainAxisExtent: 100, // Increase the main axis extent
//                                 crossAxisCount: 3,
//                                 mainAxisSpacing: 1,
//                                 crossAxisSpacing: 1,
//                                 childAspectRatio: 1,
//                               ),
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemCount: imagePaths.length,
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   height: 100, // Adjust the height here
//                                   child: Column(
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.circular(20),
//                                         child: Container(height: 70,
//                                           child: Image.asset(
//                                             imagePaths[index],
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 3),
//                                       Text(texts[index]),
//                                     ],
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 3),
//                         SizedBox(width: 80,),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 259.0),
//                           child: Row(
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {}, // Placeholder function
//                                 child: UText(title: 'Cancel',enfontName: FontName.helveticaBold),
//                               ),
//                               SizedBox(width: 10),
//                               ElevatedButton(
//   onPressed: () {}, // Placeholder function
//   style: ButtonStyle(
//     backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
//   ),
//   child: UText(title: 'Save Changes',enfontName: FontName.helveticaBold, textColor: black),
// ),SizedBox(height: 20,)
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: ProfileScreen(),
//   ));
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> imagePaths = [
    'assets/png/77.png',
    'assets/png/77.png',
    'assets/png/77.png',
    'assets/png/77.png',
    'assets/png/77.png',
    'assets/png/77.png',
    'assets/png/77.png',
  ];
  final List<String> texts = ['hj', 'jbn', 'bmm', 'nbn', 'jhg', 'gvh', 'hgf'];

  bool isEditing = false;
  List<bool> selectedItems = List<bool>.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _buildResponsiveLayout();
          } else {
            return _buildDefaultLayout(constraints);
          }
        },
      ),
    );
  }

  Widget _buildDefaultLayout(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.only(left: 200.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCircleAvatar(),
          SizedBox(width: constraints.maxWidth * 0.04),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 400.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContactNumberField(constraints),
                  SizedBox(height: 20),
                  _buildPreferencesGrid(constraints),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      isEditing
                          ? _buildSaveChangesButton()
                          : _buildEditButton(),
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      isEditing ? _buildCancelButton() : SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
          _buildContactNumberField(null),
          SizedBox(height: 20),
          _buildPreferencesGrid(null),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isEditing ? _buildSaveChangesButton() : _buildEditButton(),
              SizedBox(height: 10),
              isEditing ? _buildCancelButton() : SizedBox(),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.pink),
      ),
      child: Icon(Icons.person, size: 95),
    );
  }

  Widget _buildContactNumberField(BoxConstraints? constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Number',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          width: constraints != null ? constraints.maxWidth * 0.6 : null,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(10),
            ],
            decoration: InputDecoration(
              hintText: "",
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreferencesGrid(BoxConstraints? constraints) {
    int itemCount = imagePaths.length;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preferences',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Fixed to 3 columns
                mainAxisExtent: 100,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1,
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
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 70,
                                child: Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(texts[index]),
                          ],
                        ),
                        if (selectedItems[index])
                          Container(
                            margin: EdgeInsets.all(5),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
        _saveChanges();
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

Future<void> _saveChanges() async {
  final url = 'https://callertunez.mtn.co.za/security/Middleware/api/adapter/v1/crbt/edit-profile';

  
  final Map<String, dynamic> body = {
    "clientTxnId": "773237680",
    "identifier": "UpdateUserName",
    "aPartyMsisdn": "0832120732",
    "servType": "UPDATE_USER_NAME",
    "language": "English",
    "name": "0832120732",
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: body,
    );

    if (response.statusCode == 200) {
      // Handle success response
      // You can access response data using response.body
      print('API call successful: ${response.body}');
    } else {
      // Handle error response
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network errors
    print('Network error: $e');
  }
}

  Widget _buildCancelButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isEditing = false;
          // Clear selection
          selectedItems = List<bool>.generate(7, (index) => false);
        });
      },
      child: Text(
        'Cancel',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
