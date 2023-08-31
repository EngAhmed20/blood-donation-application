import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/home.dart';
import 'package:graduation_project/constants/constants.dart';
import '../Register/register_Scr.dart';
import '../shared/components/Custom_text_filed.dart';
import '../shared/components/toast.dart';
import '../shared/network/local/shared_pref/cache_helper.dart';
import 'login_Cubit/login_State.dart';
import 'login_Cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  var FormKey = GlobalKey<FormState>();
  var passController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => DonateLoginCubit(),
      child: BlocConsumer<DonateLoginCubit, DonateLoginState>(
        listener: (context, state) {
          if(state is DonateLoginSucessState)
          {
            CacheHelper.saveData(key: 'uId', value:state.uId ).then((value)
            {
              MyToast(msg: 'تم تسجيل الدخول بنجاح', state: ToastStates.SUCCESS).showToast();
              uId = state.uId;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homeScr()))
                  .catchError((error){print(error.toString());});});
          }
          if(state is DonateLoginErrorState)
            {
              MyToast(msg: '${state.error}', state: ToastStates.ERROR).showToast();
            }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: FormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                       Image.asset('assets/images/logo.png',
                       height: height *0.2,),
                        SizedBox(
                          height: 30,
                        ),
                    defaulttextform(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'pls enter y email address';
                          }
                        },
                        label: 'البريد الالكتروني',
                        preficon: Icons.email),
                        SizedBox(
                          height: 15,
                        ),
                    defaulttextform(
                        controller: passController,
                        type: TextInputType.visiblePassword,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'pls enter y password';
                          }
                        },
                        label: 'كلمة السر',
                        preficon: Icons.lock,
                        suficon: DonateLoginCubit.get(context).suffix,
                        ispass: DonateLoginCubit.get(context).ispass,
                        sufixpress: () {
                          DonateLoginCubit.get(context)
                              .changePassVisablity();
                        }),
                        SizedBox(
                          height: 25,
                        ),
                        ConditionalBuilder(
                            condition: state is! DonateLoginILoadingState,
                            builder: (context) => Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: MaterialButton(
                                      onPressed: () {
                                        if (FormKey.currentState!.validate()) {
                                          DonateLoginCubit.get(context)
                                              .UserLogin(
                                                  email: emailController.text,
                                                  password:
                                                      passController.text);
                                        }
                                      },
                                      child: Text('دخول')),
                                ),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator())),
                        Directionality(

                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'لا تمتلك حساب ؟ ',
                                style:
                                    TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => registerScr()));
                                },
                                child: Text('سجل الأن'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
