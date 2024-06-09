import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:you_yemen/files/common/loading_indicator.dart';
import 'package:you_yemen/files/common/warning_popup/warning_popup.dart';
import 'package:you_yemen/files/controllers/my_tune_controller.dart/my_tune_setting_controller.dart';
import 'package:you_yemen/files/enums/enums.dart';
import 'package:you_yemen/files/models/tune_info_model.dart';
import 'package:you_yemen/files/reusable_widgets/buttons/confirm_button.dart';
import 'package:you_yemen/files/reusable_widgets/image/UImage.dart';
import 'package:you_yemen/files/reusable_widgets/u_text.dart';
import 'package:you_yemen/files/router/route_name.dart';
import 'package:you_yemen/files/screens/my_tune_setting_screen/widgets/dedicated_widget/dedicated_view.dart';
import 'package:you_yemen/files/screens/my_tune_setting_screen/widgets/when_widget/when_view.dart';
import 'package:you_yemen/files/screens/my_tune_setting_screen/widgets/whom_widgets/whom_view.dart';
import 'package:you_yemen/files/store_manager/store_manager.dart';
import 'package:you_yemen/files/translation/strings.dart';
import 'package:you_yemen/files/utility/colors.dart';

class MyTuneSettingScreen extends StatelessWidget {
  MyTuneSettingScreen({super.key, required this.info});
  final TuneInfo info;
  final MyTuneSettingController cont = Get.put(MyTuneSettingController());

  @override
  Widget build(BuildContext context) {
    cont.info = info;
    cont.resetData();
    return Obx(() {
      return Stack(
        children: [
          ResponsiveBuilder(
            builder: (context, si) {
              return ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: si.isMobile ? 12 : 30, vertical: 20),
                children: [
                  toggleWidget(si),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: wrapWidget()),
                    ],
                  ),
                ],
              );
            },
          ),
          cont.isLoading.value
              ? Container(
                  color: overLayColor,
                  child: customLoadingIndicator(isOverlay: true),
                )
              : const SizedBox()
        ],
      );
    });
  }

  Widget wrapWidget() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.center,
      spacing: 30,
      direction: Axis.horizontal,
      children: [
        imageAndTuneInfo(),
        SizedBox(width: 700, child: whenWhomContaner()),
      ],
    );
  }

  Widget toggleWidget(SizingInformation si) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UText(
          title: advanceSettingStr.tr,
          enfontName: FontName.helvetica,
          enfontSize: si.isMobile ? 18 : 24,
        ),
        Row(
          children: [
            UText(
              title: defaultToneStr.tr,
              textColor: grey,
              enfontSize: si.isMobile ? 12 : null,
              enfontName: FontName.acMuna,
            ),
            const SizedBox(width: 8),
            CupertinoSwitch(
                value: false,
                onChanged: (v) {
                  openWarning(advanceSettingDeafultEnableInfoStr.tr, () {
                    cont.setDefaultTone();
                  });
                  print("object");
                }),
          ],
        ),
      ],
    );
  }

  Widget imageAndTuneInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: SizedBox(
                height: 200,
                width: 200,
                child: uImage(url: info.toneIdpreviewImageUrl ?? ''))),
        const SizedBox(height: 8),
        UText(
          title: info.toneName ?? '',
          enfontName: FontName.acMuna,
        ),
        UText(
          enfontName: FontName.acMuna,
          title: info.toneName ?? '',
          textColor: grey,
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget whenWhomContaner() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        whomYouWantToPlay(),
        whenYouWantToPlay(),
        buttonContaner(),
      ],
    );
  }

  Widget whomYouWantToPlay() {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Container(
            color: lightGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 20),
                  child: UText(
                    title: whomYouWantToPlayItStr.tr,
                    enfontName: FontName.acMuna,
                    enfontSize: si.isMobile ? 14 : 16,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [whomView(), dedicatedView()],
                ),
              ],
            ));
      },
    );
  }

  Widget whenYouWantToPlay() {
    return Container(
      color: grey.withOpacity(0.4),
      child: Obx(() {
        return AnimatedSizeAndFade(
          alignment: Alignment.centerLeft,
          fadeDuration: const Duration(milliseconds: 300),
          sizeDuration: const Duration(milliseconds: 300),
          child: cont.whomIndex.value == 2 ? const SizedBox() : WhenView(),
        );
      }),
    );
  }

  Widget buttonContaner() {
    return ResponsiveBuilder(
      builder: (context, si) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: si.isMobile ? 12 : 30),
          child: Row(
            mainAxisAlignment: si.isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              confirmButton(
                onTap: () {
                  print("tapped123");
                  cont.confirmButtonTap();
                  cont.onSuccess = () async {
                    await Future.delayed(const Duration(milliseconds: 200));
                    context.goNamed(myTunezRoute);
                  };
                },
              ),
              // customConfirmButton(confirmStr, () {
              //   print("tapped123");
              //   cont.confirmButtonTap();
              //   cont.onSuccess = () async {
              //     await Future.delayed(const Duration(milliseconds: 200));
              //     context.goNamed(myTunezRoute);
              //   };
              // }, width: 150),
              const SizedBox(width: 20),
              confirmButton(
                onTap: () {
                  context.goNamed(myTunezRoute);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
