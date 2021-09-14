import 'package:bsuir_iis_app/domain/model/schedule.dart';
import 'package:bsuir_iis_app/domain/service/preferences_service.dart';
import 'package:bsuir_iis_app/domain/service/schedule_service.dart';
import 'package:rxdart/subjects.dart';

class ScheduleBloc {
  final ScheduleService scheduleService;
  final PreferencesService preferencesService;

  final BehaviorSubject<Schedule?> _scheduleController = BehaviorSubject();
  final BehaviorSubject<String?> _groupController = BehaviorSubject();

  Stream<Schedule?> get schedule => _scheduleController.stream;
  Stream<String?> get group => _groupController.stream;

  String? _group;

  ScheduleBloc(this.scheduleService, this.preferencesService) {
    _initialize();
  }

  void _initialize() async {
    _group = await preferencesService.getGroup();
    _groupController.sink.add(_group);

    await updateSchedule();
  }

  Future<void> updateSchedule() async {
    if (_group == null || _group!.isEmpty) {
      _scheduleController.sink.add(null);
      return;
    }

    var schedule = await scheduleService.getGroupScheduleByName(_group!);
    _scheduleController.sink.add(schedule);
  }

  Future<void> setGroup(String group) async {
    _group = group;
    _groupController.sink.add(_group);

    await preferencesService.setGroup(group);
    await updateSchedule();
  }

  void dispose() {
    _scheduleController.close();
    _groupController.close();
  }
}
