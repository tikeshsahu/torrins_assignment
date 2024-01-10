import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torrins_assignment/utils/app_constants.dart';
import 'package:torrins_assignment/views/layout/layout_controller.dart';
import 'package:torrins_assignment/views/layout/widgets/nav_bar_widget.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layoutController = Get.put(LayoutController());

    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: AppConstants.normalPadding),
              Expanded(
                flex: 1,
                child: CustomizedNavBarWidget(
                  title: "home".tr,
                  icon: layoutController.currentIndex == 0 ? Icons.home : Icons.home_outlined,
                  index: 0,
                ),
              ),
              const SizedBox(width: AppConstants.normalPadding * 1.5),
              Expanded(flex: 1, child: CustomizedNavBarWidget(title: "downloads".tr, icon: layoutController.currentIndex == 1 ? Icons.download_done : Icons.download_done_outlined, index: 1)),
              const SizedBox(width: AppConstants.normalPadding),
            ],
          ),
        ),
      ),
      body: Obx(
        () => layoutController.bodyPages[layoutController.currentIndex],
      ),
    );
  }
}
