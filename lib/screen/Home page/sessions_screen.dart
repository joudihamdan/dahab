import 'package:dahab_clinic_management/screen/sessions/completed_screen.dart';
import 'package:dahab_clinic_management/screen/sessions/on_progress_screen.dart';
import 'package:dahab_clinic_management/screen/sessions/pending_screen.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/sessions_controller.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final SessionsController controller = Get.put(SessionsController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        controller.setSelectedIndex(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
       backgroundColor:  Theme.of(context).primaryColor,
        title: const Text(
          'Sessions',
          style: StyleManager.kAppBar,
        ),
        bottom: TabBar(
          labelColor: ColorManager.kCreamColor,
          labelStyle:
              const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          splashBorderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(15), topLeft: Radius.circular(15)),
          unselectedLabelColor: ColorManager.kWhiteColor,
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          indicatorColor: ColorManager.kCreamColor,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'On Progress'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: Obx(
        () {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: controller.selectedIndex.value == 0
                ? const PendingScreen(
                    key: ValueKey('Pending'),
                  )
                : controller.selectedIndex.value == 1
                    ? const OnProgressScreen(
                        key: ValueKey('On Progress'),
                      )
                    :  CompletedScreen(
                        key: ValueKey('Completed'),
                      ),
          );
        },
      ),
    );
  }
}

