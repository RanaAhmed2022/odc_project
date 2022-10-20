import 'package:flutter/material.dart';
//import 'package:odc_workshop/constants/app_colors.dart';
import 'package:odc_workshop/presentation/widges/default_text.dart';
import 'package:odc_workshop/presentation/widges/default_text_form_field.dart';
import 'package:sizer/sizer.dart';

import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: ListView(
          children: [
            RichText(
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: true,
                  applyHeightToLastDescent: true,
                ),
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Orange',
                    style:
                    const TextStyle(color: Colors.deepOrange, fontSize: 30),
                    children: [
                      TextSpan(
                          text: ' Digital Center',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.sp,
                          ))
                    ])),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: DefaultText(
                text: 'login',
                textColor: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            DefaultTextFormField(
              controller: emailController,
              validation: () {},
              onChanged: () {},
              hintText: 'Email',
              labelText: 'Email',
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultTextFormField(
              controller: passwordController,
              validation: () {},
              onChanged: () {},
              hintText: 'Password',
              labelText: 'Password',

            ),
            SizedBox(
              height: 3.h,
            ),

            TextButton(
              onPressed: () {
                //forgot password screen
              },

              child: const Text('Forgot Password',),
            ),

            ElevatedButton(

                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                },
                child: const Text('login')),

            TextButton(
              onPressed: () {
                //forgot password screen
              },

              child: const Text('Don’t have acount..?SignUp',),
            ),

          ],

        ),
      ),
    );
  }
}