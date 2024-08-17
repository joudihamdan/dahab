import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/rating_service.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
  var rating = 0.0.obs; // Observable for reactive UI
  var reviewRes = ResultModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchRating(); // Fetch rating when the controller is initialized
  }

  void fetchRating() async {
    try {
      double fetchedRating = await RatingService().getRate();
      rating.value = fetchedRating;
    } catch (e) {
      print('Error fetching rating: $e');
    }
  }

  addReview(String review) async {
    reviewRes.value = await RatingService().addReview(review);
  }
}
