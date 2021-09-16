import 'package:bsuir_iis_app/domain/model/lesson.dart';
import 'package:flutter/material.dart';

class ScheduleItemCard extends StatefulWidget {
  final Lesson item;

  const ScheduleItemCard({Key? key, required this.item}) : super(key: key);

  @override
  _ScheduleItemCardState createState() => _ScheduleItemCardState();
}

class _ScheduleItemCardState extends State<ScheduleItemCard> {
  late Image _image;

  @override
  void initState() {
    super.initState();
    _image = Image.network(
      widget.item.employee.first.photoLink,
      fit: BoxFit.cover,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Precaching image is a big hack. If it will be removed image resolving would fail
    // More info: https://github.com/flutter/flutter/issues/60578,
    // https://github.com/flutter/flutter/issues/61228
    precacheImage(_image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // As you see we dont use precached version of this image.
          // But if we do precache earlier error disappears
          Image.network(
            widget.item.employee.first.photoLink,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 0.7,
                colors: [Colors.black54, Colors.transparent],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.item.subject} ${widget.item.lessonType}',
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.item.lessonTime,
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 24,
                  ),
                ),
                Text(
                  '${widget.item.weekNumber.join(',')} неделя',
                  style: const TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 18,
                  ),
                ),
                Text(
                  widget.item.auditory.join(','),
                  style: const TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 18,
                  ),
                ),
                if (widget.item.numSubgroup != 0)
                  Text(
                    '${widget.item.numSubgroup} подгруппа',
                    style: const TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 18,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
