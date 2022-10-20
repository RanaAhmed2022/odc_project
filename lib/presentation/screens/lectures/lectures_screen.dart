import 'package:flutter/material.dart';
import 'package:odc_workshop/data/models/lectures_model.dart';
import 'package:odc_workshop/presentation/views/Lectures_card_item.dart';

class LecturesScreen extends StatelessWidget {
  LecturesScreen({Key? key}) : super(key: key);

  List<LecturesModel> lecturesModelDummyDataList = [
    LecturesModel(
        title: 'title',
        examDuration: 'examDuration',
        examDate: 'examDate',
        startTime: 'startTime',
        endTime: 'endTime')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: lecturesModelDummyDataList.length,
      itemBuilder: (context, index) =>
          LecturesCardItem(lecturesModel: lecturesModelDummyDataList[index]),
    ));
  }
}
