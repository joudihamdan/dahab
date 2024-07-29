import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/shift_time_model.dart';
import 'package:dahab_clinic_management/services/reservation_sevices.dart';

class MockShiftTimeServices implements ReservationSevices {
  @override
  Future<ResultModel> getTimesByDate(int serviceId, int specialistId, String date) async {
    
    List<Map<String, dynamic>> temp = [
      {"id": 1, "time": "09:00:00"},
      {"id": 2, "time": "09:00:00"},
      {"id": 3, "time": "09:00:00"},
      {"id": 4, "time": "09:00:00"},
    ];

    if (temp.isNotEmpty) {
      List<ShiftTimeModel> times = List.generate(
        temp.length,
        (index) => ShiftTimeModel.fromMap(temp[index]),
      );
      print(times);
      print("times get successfully");
      return ListOf(resutl: times);
    }
    throw UnimplementedError();
  }

  @override
  Future<ResultModel> bookAppointment(int timeId) async {
    throw UnimplementedError();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
