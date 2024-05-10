import 'package:flutter/material.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/constants.dart';

class SuccessPopupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          width: popupWidth,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150),
              Center(
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 10),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Icon(Icons.check, size: 60, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UText(
                      title: 'Your Suggested tune is sent to your  ',
                      enfontName: FontName.helvetica,
                      textColor: Colors.white,
                      enfontSize: 20,
                    ),
                    UText(
                      title: 'friends ',
                      enfontName: FontName.helvetica,
                      textColor: Colors.white,
                      enfontSize: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.white,
                  height: 35,
                  width: 100,
                  child: Center(
                    child: UText(title: 'OK', textColor: Colors.teal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
