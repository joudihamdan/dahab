import 'package:dahab_clinic_management/controllers/profile_controller.dart';
import 'package:dahab_clinic_management/services/rating_service.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:dahab_clinic_management/widgets/ratinr_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(_controller.name.value, style: StyleManager.kAppBar),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(_controller.isDarkMode.value
                      ? Icons.dark_mode
                      : Icons.light_mode),
                  onPressed: _controller.toggleTheme,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorManager.blackColor
                : const Color(0xffFEF3EC),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15,),
              //   child: Text(_controller.name.value,style: StyleManager.kAppBar),
              // ),
              const SizedBox(height: 16.0),
              ListTile(
                title: const Text('Language'),
                leading: const Icon(Icons.language_outlined),
                trailing: DropdownButton<String>(
                  value: _controller.selectedLanguage.value,
                  onChanged: _controller.changeLanguage,
                  items: const [
                    DropdownMenuItem(value: 'ar', child: Text('Arabic')),
                    DropdownMenuItem(value: 'en', child: Text('English')),
                  ],
                  dropdownColor: Theme.of(context).colorScheme.surface,
                  elevation: 8,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () async {
                  await RatingService().getRate();

                  _showRatingDialog(context);
                },
                title: const Text(
                  "Rate us",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: const Icon(
                  Icons.star_rate_outlined,
                  size: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ListTile(
                title: Text(
                  "Log out",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: Icon(
                  Icons.login_outlined,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

void _showRatingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return RatingDialog(onRatingSelected: (rating) {
        RatingService().addRate(rating);
        print('User selected rating: $rating');
        RatingService().getRate();
        _showAverageRatingDialog(context, 4.2);
      });
    },
  );
}

void _showAverageRatingDialog(BuildContext context, double averageRating) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Average Rating'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return Icon(
              Icons.star_rounded,
              color: index < averageRating.round() ? Colors.amber : Colors.grey,
              size: 40,
            );
          }),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
