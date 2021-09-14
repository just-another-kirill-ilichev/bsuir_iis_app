import 'package:bsuir_iis_app/domain/model/schedule.dart';
import 'package:http/http.dart' as http;

class ScheduleService {
  static const String _baseUrl = 'https://journal.bsuir.by/api/v1/';

  Future<Schedule> getGroupScheduleByName(String name) async {
    var url = Uri.parse(_baseUrl + 'studentGroup/schedule?studentGroup=$name');
    var response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception(); // TODO
    }

    return Schedule.fromJson(response.body);
  }
}
