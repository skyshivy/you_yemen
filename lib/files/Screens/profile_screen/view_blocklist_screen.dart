


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/Screens/profile_screen/blocklist_screen.dart';

import 'package:you_yemen/files/controllers/view_block_controller.dart';

class ViewBlackListScreen extends StatelessWidget {
  ViewBlackListScreen({super.key});

  final BlackListController controller = Get.put(BlackListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        return ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(color: Colors.yellow[700], height: 250),
                Container(
                  height: 50,
                  color: Colors.grey[300],
                  child: Row(
                    children: [
                      isMobile ? SizedBox(width: 52) : SizedBox(width: 60),
                      Text(
                        'My Account  > ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w900,
                            fontSize: isMobile ? 12 : 15),
                      ),
                      Text(
                        ' Blacklist',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: isMobile ? 12 : 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Blacklist',
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'How to create a blacklist? ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Learn More >',
                                  style: TextStyle(
                                    color: Colors.yellow[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateBlackListScreen(),
                            ),
                            (route) => true,
                          );
                        },
                        child: Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.yellow[700],
                          ),
                          child: Center(
                            child: Text(
                              'Create a Blacklist',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Obx(() {
                    return GridView.builder(
                      itemCount: controller.blackList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 340,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.1,
                      ),
                      itemBuilder: (context, index) {
                        final item = controller.blackList[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color.fromRGBO(224, 224, 224, 1),
                            ),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color.fromRGBO(
                                        251, 192, 45, 1),
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  child: Text(
                                    item["initials"]!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item["name"]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                item["phone"]!,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton.icon(
                                onPressed: () {
                                  controller.deleteItem(index);
                                },
                                icon: Icon(Icons.delete),
                                label: Text('Delete'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  side: BorderSide(color: Colors.pink),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        );
      }),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// //import 'package:mtn_responsive/Views/black_list/contact_card.dart';

// import 'package:you_yemen/files/Screens/profile_screen/blocklist_screen.dart';
// import 'package:you_yemen/files/controllers/blacklist_controller.dart';

// class ViewBlackListScreen extends StatelessWidget {
//   ViewBlackListScreen({super.key});

//   final List<Map<String, String>> blackList = [
//     {"initials": "AM", "name": "Abhilash Manik", "phone": "91-8765470987"},
//     {"initials": "HG", "name": "Harsh Gupta", "phone": "91-9876543210"},
//     {"initials": "HJ", "name": "Himanshu Jha", "phone": "91-1234567890"},
//     {"initials": "LJ", "name": "Lalit Jain", "phone": "91-2345678901"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(builder: (context, constraints) {
//         bool isMobile = constraints.maxWidth < 600;
//         return ListView(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(color: Colors.yellow[700], height: 250),
//                 Container(
//                   height: 50,
//                   color: Colors.grey[300],
//                   child: Row(
//                     children: [
//                       isMobile ? SizedBox(width: 52) : SizedBox(width: 60),
//                       Text(
//                         'My Account  > ',
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w900,
//                             fontSize: isMobile ? 12 : 15),
//                       ),
//                       Text(
//                         ' Blacklist',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w900,
//                             fontSize: isMobile ? 12 : 15),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 40),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 55),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Blacklist',
//                             style: TextStyle(
//                               fontSize: isMobile ? 16 : 20,
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 'How to create a blacklist? ',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               InkWell(
//                                 onTap: () {},
//                                 child: Text(
//                                   'Learn More >',
//                                   style: TextStyle(
//                                     color: Colors.yellow[600],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       InkWell(
//                           onTap: () {
//                             Navigator.pushAndRemoveUntil(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => CreateBlackListScreen(),
//                                 ),
//                                 (route) => true);
//                           },
//                           child: Container(
//                             height: 35,
//                             width: 130,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(35),
//                               color: Colors.yellow[700],
//                             ),
//                             child: Center(
//                                 child: Text('Create a Blacklist',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w900))),
//                           ))
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 100),
//                   child: GridView.builder(
//                     itemCount: blackList.length,
//                     shrinkWrap: true,
//                     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: 340,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                       childAspectRatio: 1.1,
//                     ),
//                     itemBuilder: (context, index) {
//                       final item = blackList[index];
//                       return Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(
//                               color: const Color.fromRGBO(224, 224, 224, 1),
//                             ),
//                             borderRadius: BorderRadius.circular(4),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.2),
//                                 spreadRadius: 4,
//                                 blurRadius: 5,
//                                 offset: Offset(0, 3),
//                               )
//                             ]),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color: const Color.fromRGBO(
//                                         251, 192, 45, 1),
//                                   )),
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.yellow,
//                                 child: Text(
//                                   item["initials"]!,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w900,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               item["name"]!,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w900,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               item["phone"]!,
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                             SizedBox(height: 8),
//                             ElevatedButton.icon(
//                               onPressed: () {},
//                               icon: Icon(Icons.delete),
//                               label: Text('Delete'),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                                 foregroundColor: Colors.black,
//                                 side: BorderSide(color: Colors.pink),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }