import 'package:flutter/material.dart';
import 'package:odc_workshop/constants/app_colors.dart';
import 'package:odc_workshop/data/models/home_card_model.dart';
import 'package:odc_workshop/presentation/screens/events/sections_screen.dart';
import 'package:odc_workshop/presentation/screens/finals/finals_screen.dart';
import 'package:odc_workshop/presentation/screens/lectures/lectures_screen.dart';
import 'package:odc_workshop/presentation/screens/midterms/midterms_screen.dart';
import 'package:odc_workshop/presentation/screens/notes/notes_screen.dart';
import 'package:odc_workshop/presentation/screens/sections/sections_screen.dart';
import 'package:odc_workshop/presentation/views/home_card_item.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeCardModelList = <HomeCardModel>[
    HomeCardModel(title: 'Lectures', icon: Icons.import_contacts_sharp, screen: LecturesScreen()),
    HomeCardModel(title: 'Sections', icon: Icons.groups, screen: const SectionsScreen()),
    HomeCardModel(title: 'Midterms', icon: Icons.description_outlined, screen: const MidtermsScreen()),
    HomeCardModel(title: 'Finals', icon: Icons.task_outlined , screen: const FinalsScreen()),
    HomeCardModel(title: 'Events', icon: Icons.calendar_month_rounded , screen: const EventsScreen()),
    HomeCardModel(title: 'Notes', icon: Icons.note_alt, screen: const NotesScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0.h, bottom: 4.h),
            child: RichText(
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: true,
                  applyHeightToLastDescent: true,
                ),
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Orange',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                    children: [
                      TextSpan(
                          text: ' Digital Center',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ))
                    ])),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) =>  HomeCardItem(homeCardModel:homeCardModelList[index]),
            ),
          ),
        ],
      ),
    );
  }
}