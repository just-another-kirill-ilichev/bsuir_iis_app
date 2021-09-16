import 'package:bsuir_iis_app/config/app_routes.dart';
import 'package:bsuir_iis_app/domain/model/schedule.dart';
import 'package:bsuir_iis_app/domain/model/lesson.dart';
import 'package:bsuir_iis_app/presentation/schedule_page/schedule_item_card.dart';
import 'package:bsuir_iis_app/state/schedule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ScheduleTabType {
  today,
  tomorrow,
  weekDay,
}

class ScheduleTab extends StatelessWidget {
  final ScheduleTabType type;
  final String? weekDay;

  ScheduleTab({
    Key? key,
    required this.type,
    this.weekDay,
  }) : super(key: key) {
    assert((type == ScheduleTabType.weekDay) != (weekDay == null));
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ScheduleBloc>(context, listen: false);

    return StreamBuilder<Schedule?>(
      stream: bloc.schedule,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
              child: const Text('Выберете группу'),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: bloc.updateSchedule,
          child: ListWheelScrollView(
            controller: FixedExtentScrollController(),
            itemExtent: 300,
            children: _getItems(snapshot.data!)
                .map<Widget>((e) => ScheduleItemCard(item: e))
                .toList(),
          ),
        );
      },
    );
  }

  List<Lesson> _getItems(Schedule schedule) {
    switch (type) {
      case ScheduleTabType.today:
        return schedule.todaySchedules;
      case ScheduleTabType.tomorrow:
        return schedule.tomorrowSchedules;
      case ScheduleTabType.weekDay:
        if (schedule.schedules.any((e) => e.weekDay == weekDay)) {
          return schedule.schedules
              .firstWhere((e) => e.weekDay == weekDay)
              .schedule;
        } else {
          return [];
        }
    }
  }
}
