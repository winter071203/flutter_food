// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:winter_food/common/keep_alive_screen.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/controllers/tab_index_controller.dart';
import 'package:winter_food/views/cart/cart_page.dart';
import 'package:winter_food/views/home/home_page.dart';
import 'package:winter_food/views/profile/profile_page.dart';
import 'package:winter_food/views/search/search_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              children: pageList.map((e) => KeepAlivePage(child: e)).toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: kPrimary,
                  ),
                  child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.black38),
                      selectedIconTheme: const IconThemeData(color: kWhite),
                      currentIndex: controller.tabIndex,
                      onTap: (value) {
                        controller.setTabIndex = value;
                        controller.onItemTapped(value);
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: controller.tabIndex == 0
                                ? const Icon(AntDesign.appstore1)
                                : const Icon(AntDesign.appstore_o),
                            label: 'Home'),
                        const BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: 'Search'),
                        const BottomNavigationBarItem(
                            icon: Badge(
                                label: Text('1',
                                    style: TextStyle(
                                        color: kWhite,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                                child: Icon(FontAwesome.opencart)),
                            label: 'Cart'),
                        BottomNavigationBarItem(
                            icon: controller.tabIndex == 3
                                ? const Icon(FontAwesome.user_circle)
                                : const Icon(FontAwesome.user_circle_o),
                            label: 'Profile'),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
