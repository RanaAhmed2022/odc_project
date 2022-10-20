import 'package:flutter/material.dart';
import 'package:odc_workshop/data/models/lectures_model.dart';
import 'package:odc_workshop/presentation/widges/default_text.dart';

class LecturesCardItem extends StatelessWidget {
   LecturesCardItem({required this.lecturesModel,Key? key}) : super(key: key);
  LecturesModel lecturesModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(text:lecturesModel.title,),
              Row(children: [
                Icon(Icons.alarm),
                DefaultText(text: lecturesModel.examDuration,),
              ],)

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DefaultText(text: 'Exam Data'),
                  Row(children: [
                    Icon(Icons.calendar_month_outlined),
                    DefaultText(text: '2hr',),
                  ],)
                ],
              ),

              Column(
                children: [
                  DefaultText(text: 'Start Time'),
                  Row(children: [
                    Icon(Icons.watch_later),
                    DefaultText(text: lecturesModel.startTime,),
                  ],)
                ],
              ),
              Column(
                children: [
                  DefaultText(text: 'End Data'),
                  Row(children: [
                    Icon(Icons.watch_later),
                    DefaultText(text: lecturesModel.endTime,),
                  ],)
                ],
              ),
            ],
          )

        ],
      ),
    );
  }
}
