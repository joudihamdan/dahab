import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../screen/category_screen.dart';
import '../../screen/offre_details_screen.dart';
import '../../screen/service_screen.dart';
import '../../utils/assets_manager.dart';
import '../../widgets/signup&homepge/genetate_dots.dart';
import '../../widgets/signup&homepge/home_card.dart';
import '../../widgets/signup&homepge/home_text.dart';

int pageNo1 = 0;
int pageNo2 = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController categoryController = PageController();
  late PageController serviceController = PageController();

  @override
  void initState() {
    categoryController = PageController(initialPage: 0, viewportFraction: 0.65);
    serviceController = PageController(initialPage: 0, viewportFraction: 0.45);
    super.initState();
  }

  @override
  void dispose() {
    categoryController.dispose();
    serviceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Apply theme to status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      statusBarBrightness: Theme.of(context).brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Theme.of(context).primaryColor,
        actions: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Home',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 24),
            ),
          ),
          SizedBox(width: width * 0.62),
          Icon(Icons.notifications_active_rounded,
              size: height * 0.035,
              color: Theme.of(context).colorScheme.onPrimary),
          SizedBox(width: width * 0.04),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(),
          home_text(height, width, 'Discover Our Categories'),
          SizedBox(
            height: height * 0.24,
            child: PageView.builder(
              padEnds: false,
              controller: categoryController,
              onPageChanged: (index) {
                pageNo1 = index;
                setState(() {});
              },
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                  animation: categoryController,
                  builder: (ctx, child) {
                    return child!;
                  },
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => CategoryScreen(
                            categoryId: index + 1,
                          ));
                    },
                    child: categories_card(
                      350,
                      550,
                      AssetsManager.testImg,
                      'Skin Care',
                      // backgroundColor: Theme.of(context).colorScheme.surface,
                      // textColor: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          generate_category_dots(height, 5),
          const Spacer(),
          home_text(height, width, 'Top Services'),
          SizedBox(
            height: height * 0.15,
            child: PageView.builder(
              padEnds: false,
              controller: serviceController,
              onPageChanged: (index) {
                pageNo2 = index;
                setState(() {});
              },
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                  animation: serviceController,
                  builder: (ctx, child) {
                    return child!;
                  },
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => ServiceScreen(
                              id: index + 1,
                            ));
                      },
                      child: service_card(
                        width,
                        height,
                        'assets/images/im.png',
                        'Derma',
                        // backgroundColor: Theme.of(context).colorScheme.surface,
                        // textColor: Theme.of(context).colorScheme.onSurface,
                      )),
                );
              },
              itemCount: 5,
            ),
          ),
          const Spacer(),
          generate_service_dots(height, 5),
          const Spacer(),
          home_text(height, width, 'Catch Up with Our Offers!'),
          Center(
            child: Container(
              height: height * 0.15,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 6.0,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(height * 0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Derma Offer!",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontSize: width * 0.06,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                )),
                        const Spacer(),
                        Text(
                          "Discount 10% on your session",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                fontSize: width * 0.04,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                        const Spacer(),
                        Text("Offer ends at 2/2/2222",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: width * 0.035,
                                      color: Colors.grey,
                                    )),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      margin: EdgeInsets.all(height * 0.01),
                      height: height * 0.05,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const OffreDetailsScreen(offerId: 1));
                        },
                        child: Text(
                          'Book!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontSize: width * 0.05,
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
