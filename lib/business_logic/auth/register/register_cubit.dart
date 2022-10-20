import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:odc_workshop/constants/constant_methods.dart';
import 'package:odc_workshop/constants/end_points.dart';
import 'package:odc_workshop/data/data_provider/remote/dio_helper.dart';
import 'package:odc_workshop/presentation/screens/home/home_screen.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

 static RegisterCubit get(context) => BlocProvider.of(context);
  Future registerRequist(
      {required String name,
        required String email,
        required String password,
        required String phoneNumber,
        required String gender,
        context}) async {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "gender": gender,
    }).then((value) {
      if (value.statusCode == 200) {

        flutterToast(msg: 'Registered Successfully', color: Colors.green);


        emit(RegisterSuccessState());
      }
    }).catchError((error) {

        print(error.toString());

      emit(RegisterErrorState());
    });
  }
}
