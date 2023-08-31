import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_State.dart';


class DonateLoginCubit extends Cubit<DonateLoginState>
{
  DonateLoginCubit():super(DonateLoginInitialState());
  static DonateLoginCubit get(context)=>BlocProvider.of(context);
//  SocialLoginModel? loginModel;
  IconData suffix= Icons.visibility_outlined;
  bool ispass= true;
  void changePassVisablity(){
    suffix= ispass?Icons.visibility_outlined:Icons.visibility_off_outlined;
    ispass=!ispass;
    emit(DonateLoginIShowPassState());

  }

  void UserLogin({required String email,required String password})
  {
    emit(DonateLoginILoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          emit(DonateLoginSucessState(value.user!.uid));}).catchError((error){
      print(error.toString());
      emit(DonateLoginErrorState(error.toString()));
    });

  }
 /* SocialUserModel? userModel;

  void getUser() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).get().then((value) {
      userModel = SocialUserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetUserErrorState(error.toString()));
    });*/
  }



