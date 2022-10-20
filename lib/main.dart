import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_workshop/business_logic/auth/register/register_cubit.dart';
import 'package:odc_workshop/business_logic/notes/notes_cubit.dart';
import 'package:odc_workshop/data/data_provider/local/cache_helper.dart';
import 'package:odc_workshop/data/data_provider/local/sql_helperl.dart';
import 'package:sizer/sizer.dart';

import 'constants/app_colors.dart';
import 'data/data_provider/remote/dio_helper.dart';
import 'presentation/screens/register/register_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SqlHelper.initialDB();
  CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NotesCubit(),
            ),
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sizer',
            home: const RegisterScreen(),
            theme: ThemeData(
                elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
            )),
          ),
        );
      },
    );
  }
}
