import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/Layout/cubit/donation_state.dart';
import '../moduls/post/new_post.dart';
import '../shared/Style/icon_broken.dart';
class homeScr extends StatefulWidget {
  const homeScr({Key? key}) : super(key: key);

  @override
  State<homeScr> createState() => _homeScrState();
}

class _homeScrState extends State<homeScr> {
  @override
  Widget build(BuildContext context) {
    String _selectedLang='en';
    return BlocConsumer<DonationCubit,DonationStates>( listener: (context,state){
      if(state is DonationAddPostState)
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  NewPost_Scr()),
        );
      }
    },
    builder: (context,state){
      var cubit =DonationCubit.get(context);
     return Scaffold(
        backgroundColor: Colors.white,
        body: cubit.Screens[cubit.CurrentIndex],
       bottomNavigationBar: BottomNavigationBar(
         currentIndex: cubit.CurrentIndex,
         type: BottomNavigationBarType.fixed,
         selectedItemColor:Colors.blue,
         unselectedItemColor: Colors.red[300],
         elevation: 20.0,
         backgroundColor:Colors.white,
         onTap: (index){
           cubit.changeBottomNav(index);
         }, items: [
         BottomNavigationBarItem(
             icon: Icon(IconBroken.Home),label: 'الرئيسية', ),
         BottomNavigationBarItem(
             icon: Icon(IconBroken.Chat),label: 'المحادثات'),
         BottomNavigationBarItem(
             icon: Icon(IconBroken.Paper_Upload),label: 'حالة جديدة'),
         BottomNavigationBarItem(
             icon: Icon(IconBroken.Setting),label: 'الاعدادات'),


       ],
       ),
      );
    },
    );
  }
}
