
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Register/reg_cubit/regState.dart';
import '../../models/user_model/UserModel.dart';
class DonateRegCubit extends Cubit<DonateRegState>
{
 DonateRegCubit():super(DonateRegInitialState());
  static DonateRegCubit get(context)=>BlocProvider.of(context);

 void UserRegister({
  required String name,
  required String email,
  required String pass,
  required String phone,
   required String diseases,
   required String bloodtype,
   required String userAddress,
   required String userLastDonation,
   required String userBirthDate,
})
  {
    emit(DonateRegLoadingState());
  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass)
      .then((value) {
       UserCreate(name: name,email: email,phone: phone,diseases: diseases,bloodtype: bloodtype,uId:value.user!.uid
       ,userAddress: userAddress,userBirthDate: userBirthDate,userLastDonation: userLastDonation);
        })
      .catchError((error){emit(DonateRegErrorState(error.toString()));
    });

    }
  void UserCreate({
      required String name,
      required String email,
      required String phone,
      required String uId,
    required String diseases,
    required String bloodtype,
    required String userAddress,
    required String userLastDonation,
    required String userBirthDate,


  })
{
  DonateUserModel model =DonateUserModel(
    name: name,
    email: email,
    phone: phone,
    uId: uId,
    image: 'https://img.freepik.com/free-vector/human-blood-donate-white-background_1308-111266.jpg?w=900&t=st=1681951798~exp=1681952398~hmac=eece1edabe831530a8966d2501878acf37bfbd792935ea5c948d135b2b3f5513',
    bio: 'Write your bio .......',
    //cover: 'https://img.freepik.com/free-photo/happy-dark-skinned-girl-enjoys-every-moment-life-dances-moves-raises-arms-clenches-fists-closes-eyes-has-good-mood-wears-denim-sarafan-turtleneck-isolated-pink-wall_273609-42165.jpg?t=st=1670188670~exp=1670189270~hmac=f46da2a4279b52824a9e0227402f975cc3806a1d72ee8873233f646032068fc4',
    diseases: diseases,
    bloodtype: bloodtype,
    userAddress: userAddress,
    userBirthDate: userBirthDate,
    userLastDonation: userLastDonation,



  );
  FirebaseFirestore.instance.collection('users')
      .doc(uId)
      .set(model.toMap()).then((value) {
        emit(DonateCreateUserSucessState(uId));
  }).catchError((error){
    emit(DonateCreateUserErrorState(error));
  });

}
  IconData suffix= Icons.visibility_outlined;
  bool ispass=true;
  void ChangePassVisablity(){
    ispass=!ispass;
    suffix =ispass? Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(DonateRegShowPassState());

  }
}
//https://img.freepik.com/free-photo/charming-beautiful-girl-has-afro-hairstyle_273609-28021.jpg?w=996&t=st=1676731913~exp=1676732513~hmac=33ebae0b63f520c04072545daf6f98ebf55b5a89f4877186c79b3e36c43cb45c