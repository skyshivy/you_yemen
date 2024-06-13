import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/utility/colors.dart';
import 'package:you_yemen/files/utility/constants.dart';

class NumberPagination extends StatefulWidget {
  const NumberPagination({
    Key? key,
    required this.totalItem,
    required this.tappedIndex,
    this.hidePagination,
  }) : super(key: key);
  final int totalItem;
  final bool? hidePagination;

  final Function(int) tappedIndex;
  @override
  _NumberPaginationState createState() => _NumberPaginationState();
}

class _NumberPaginationState extends State<NumberPagination> {
  NumberPaginatorController controller = NumberPaginatorController();
  int _numPages = 0;
  //int _currentPage = 0;
  @override
  void initState() {
    if (widget.totalItem < 2) {
      _numPages = 1;
    } else {
      var anc = (widget.totalItem / pagePerCount).ceil(); //.floor(); //
      _numPages = anc;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          !((widget.hidePagination) ?? (widget.totalItem < (pagePerCount))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: black.withOpacity(0.7),
        ),
        width: 500,
        child: NumberPaginator(
          config: NumberPaginatorUIConfig(
            height: 40,
            buttonPadding: const EdgeInsets.all(0),
            buttonSelectedForegroundColor: black,
            buttonTextStyle: TextStyle(
                fontFamily: FontName.helveticaBold.name,
                fontSize: 12,
                color: black),
            buttonUnselectedForegroundColor: white,
            buttonSelectedBackgroundColor: white,
          ),
          controller: controller,
          numberPages: _numPages,
          onPageChange: (int index) {
            widget.tappedIndex(index);
            setState(() {
              //_currentPage = index;
              print("Page tapped $index");
            });
          },
        ),
      ),
    );
  }
}
