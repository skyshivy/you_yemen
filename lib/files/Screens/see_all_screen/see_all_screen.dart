import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/generic_gridview.dart';

class SeeAllScreen extends StatelessWidget {
  SeeAllScreen({super.key, required this.lst});
  final List<TuneInfo> lst;
  final RxList<TuneInfo> ls = <TuneInfo>[].obs;
  @override
  Widget build(BuildContext context) {
    ls.value = lst;
    return GenericGridView(list: ls, totalCount: 0);
  }
}
