import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_workshop/business_logic/auth/register/register_cubit.dart';
import 'package:odc_workshop/constants/app_colors.dart';
import 'package:odc_workshop/presentation/screens/home/home_screen.dart';
import 'package:odc_workshop/presentation/widges/default_text.dart';
import 'package:odc_workshop/presentation/widges/default_text_form_field.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> genderMenu = const [
    DropdownMenuItem(
      value: 'm',
      child: Text('Male'),
    ),
    DropdownMenuItem(
      value: 'f',
      child: Text('Female'),
    ),
  ];

  String gender = 'm';

  void changeGender(val) {
    gender = val;
  }

  var genderSelected = "Select gender";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state is RegisterSuccessState){
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>  HomeScreen(),
              ),
                  (route) => false);        }
      },
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);

        return Scaffold(
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Form(
                key: registerKey,
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
                            style: const TextStyle(
                                color: Colors.deepOrange, fontSize: 30),
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
                        text: 'SignUp',
                        textColor: AppColors.primaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DefaultTextFormField(
                      controller: nameController,
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Plz Enter Your Name';
                        }
                      },

                      hintText: 'Name',
                      labelText: 'Name',
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultTextFormField(
                      controller: emailController,
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Plz Enter Your Email';
                        } else if (!RegExp(
                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                            .hasMatch(value)) {
                          return 'Please Enter Valid as example@gmail.com';
                        }
                      },

                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultTextFormField(
                      controller: passwordController,
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Plz Enter Your password';
                        }
                      },

                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultTextFormField(
                      controller: confirmPasswordController,
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Plz Enter Your Confirm Password';
                        }
                      },

                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultTextFormField(
                      controller: phoneController,
                      validation: (value) {
                        if (value.isEmpty) {
                          return 'Plz Enter Your Phone Number';
                        }
                      },
                      onChanged: () {},
                      hintText: 'Phone Number',
                      labelText: 'Phone Number',
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText(
                          text: 'Gender',
                          fontSize: 15.sp,
                        ),
                        Container(
                          height: 5.h,
                          width: 50.w,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              border: Border.all(
                                  color: Colors.deepOrange, width: 2.sp)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                              value: gender,
                              items: genderMenu,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (registerKey.currentState!.validate()) {
                            cubit.registerRequist(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phoneNumber: phoneController.text,
                                gender: gender);
                          }
                        },
                        child: const Text('SignUp'))
                  ],
                ),
              )),
        );
      },
    );
  }
}
