import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/cancel_button.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/utility/colors.dart';


import 'package:flutter/material.dart';

void showPopover(BuildContext context) {
  final RenderBox overlay =
      Overlay.of(context)!.context.findRenderObject() as RenderBox;
  final Offset target = Offset(
      overlay.size.width / 2, overlay.size.height / 2); // Adjust as needed

  late OverlayEntry popover;

  popover = OverlayEntry(
    builder: (context) => Positioned(
      left: target.dx - 150, 
      top: target.dy - 200,
      width: 350,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(width: 2,),
                    Text(
                      "  Buy Tune",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                         // Text color set to white
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        popover.remove();
                      },
                      child: Icon(Icons.close,
                          color: Colors.black), // Cross color set to white
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                
                child: Image.asset(
                  'assets/png/you_yamen.png', // Replace 'assets/images/image.png' with your actual asset path
                  height: 150,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Text(
                  "CELA SKHULUME",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Text(
                  "DJ TIRA AND XOWLA FEAT",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Text(
                  "Tune Charges",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Text(
                  "R5/Month with 1st DAY FREE",
                  style: TextStyle(
                    
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Text(
                  "Please enter mobile number",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(
                      hintText: " +27 | Please enter mobile number ",
                      
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Color:
                        Colors.yellow;
                        popover.remove();
                      },
                      child: Text("Cancel"),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Color:
                          Colors.yellow;
                          popover.remove();
                        },
                        child: Text("Confirm"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    ),
  );

  Overlay.of(context)!.insert(popover);
}
