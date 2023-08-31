import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/Layout/cubit/donation_state.dart';
import 'package:graduation_project/constants/constants.dart';
import 'package:graduation_project/moduls/settings/benefits.dart';
import 'package:graduation_project/shared/Style/icon_broken.dart';
import 'package:graduation_project/shared/network/local/shared_pref/cache_helper.dart';
import 'package:intl/intl.dart' as intl;

import '../../login/login_scr.dart';
import '../../shared/components/sign_out/Sign_out.dart';
import '../edit_profile/edit_profile_screen.dart';
import 'contact_us.dart';

class SettingsScr extends StatelessWidget {
  const SettingsScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DonationCubit,DonationStates>(
     listener: (context,state){},
      builder: (context,state){
       var userModel=DonationCubit.get(context).userModel;
       DateTime now = DateTime.now();

       return SingleChildScrollView(
         child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 225,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      ///////cover
                      /////wrap align to make it in top
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 180,width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight:Radius.circular(10.0),topLeft:Radius.circular(10)),
                            image: DecorationImage(image: AssetImage('assets/images/bblooodccover.png'),fit:BoxFit.cover),
                          ),
                        ),
                      ),
                      ///////profile
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                          NetworkImage('${userModel!.image}'),

                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///////////name
                    Text('${userModel!.name}',style: Theme.of(context).textTheme.bodyText1,),
                    SizedBox(width: 6),
                    Icon(Icons.circle,color: Colors.lightBlueAccent,size: 15,),
                  ],
                ),
                SizedBox(height: 5),
                ConditionalBuilder(
                  condition: userModel!.diseases=='لا توجد أمراض مزمنة',
                    builder: (context)=>Text('لا تعاني من اي امراض تمنعك من التبرع'),

                    fallback: (context)=>  Text('${userModel!.diseases}'),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${userModel!.bloodtype}',style: Theme.of(context).textTheme.bodyText1,),
                    Text(' : فصيلة الدم ',style: Theme.of(context).textTheme.bodyText1,),
                    SizedBox(width:10),
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' تاريخ اخر تبرع :',style: Theme.of(context).textTheme.bodyText1,),
                      SizedBox(width: 10,),
                      Text('${userModel!.userLastDonation}',style: Theme.of(context).textTheme.bodyText1,),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  editProfile()),
                      );
                    },child: Text('تعديل البيانات',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  benefits()),
                      );
                    },child: Text(' معلومات تهمك',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Mail()),
                      );
                    },child: Text(' تواصل معنا',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(onPressed: (){

                      CacheHelper.SignOut(key: 'uId').then((value){
                        if(value)
                          {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                          }
                      });
                    },child: Text('  تسجيل الخروج',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)),






              ],
            ),
          ),
       );
      },
    );
  }
}
