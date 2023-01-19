import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: controller.isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
              : const Text("Json Place Holder"),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () => controller.getPost()),
        body: ListView.builder(
          itemCount: controller.postModel.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.postModel[index].title),
              subtitle: Text(controller.postModel[index].body),
              leading: Text("${controller.postModel[index].id}"),
            );
          },
        ),
      ),
    );
  }
}
