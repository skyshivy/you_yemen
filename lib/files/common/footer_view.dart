import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/utility/colors.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: yellow,
      child: UText(title: "Footer view"),
    );
  }
}
