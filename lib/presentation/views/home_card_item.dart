import 'package:flutter/material.dart';
import 'package:odc_workshop/data/models/home_card_model.dart';
import 'package:odc_workshop/presentation/widges/default_text.dart';
import 'package:sizer/sizer.dart';

class HomeCardItem extends StatelessWidget {
  HomeCardItem({Key? key, required this.homeCardModel}) : super(key: key);

  HomeCardModel homeCardModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => homeCardModel.screen,
            ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
                radius: 20.sp,
                backgroundColor: Colors.grey.withOpacity(0.1),
                child: Icon(
                  homeCardModel.icon,
                  color: Colors.deepOrange,
                  size: 20.sp,
                )),
            DefaultText(text: homeCardModel.title, fontSize: 15.sp),
          ],
        ),
      ),
    );
  }
}
