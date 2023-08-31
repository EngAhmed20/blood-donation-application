import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/Layout/home.dart';
import 'package:graduation_project/constants/constants.dart';
import 'package:graduation_project/shared/network/local/shared_pref/cache_helper.dart';
import 'bloc_observe.dart';
import 'firebase_options.dart';
import 'login/login_scr.dart';
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  Widget widget;
  uId=CacheHelper.getData(key: 'uId');
  if(uId !=null)
  {
    widget= homeScr();
  }
  else widget =LoginScreen();
  runApp( MyApp(startWidget: widget,));
}
class MyApp extends StatelessWidget {
   MyApp({super.key,required this.startWidget});
   final Widget startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>DonationCubit()..getUserData()..getPosts(),
      child: MaterialApp(
        home: startWidget,

        debugShowCheckedModeBanner: false,


      ),
    );
  }
}


