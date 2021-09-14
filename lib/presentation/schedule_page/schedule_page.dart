import 'package:bsuir_iis_app/presentation/schedule_page/schedule_tab.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('РаСПиСанИе БгУИр'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Сегодня'),
              Tab(text: 'Завтра'),
              Tab(text: 'Пн'),
              Tab(text: 'Вт'),
              Tab(text: 'Ср'),
              Tab(text: 'Чт'),
              Tab(text: 'Пт'),
              Tab(text: 'Сб'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: TabBarView(children: [
          ScheduleTab(type: ScheduleTabType.today),
          ScheduleTab(type: ScheduleTabType.tomorrow),
          ScheduleTab(type: ScheduleTabType.weekDay, weekDay: 'Понедельник'),
          ScheduleTab(type: ScheduleTabType.weekDay, weekDay: 'Вторник'),
          ScheduleTab(type: ScheduleTabType.weekDay, weekDay: 'Среда'),
          ScheduleTab(type: ScheduleTabType.weekDay, weekDay: 'Четверг'),
          ScheduleTab(type: ScheduleTabType.weekDay, weekDay: 'Пятница'),
          ScheduleTab(type: ScheduleTabType.weekDay, weekDay: 'Суббота'),
        ]),
      ),
    );
  }
}
