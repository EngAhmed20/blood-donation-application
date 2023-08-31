import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/Layout/cubit/donation_state.dart';
import 'package:graduation_project/donarsearch.dart';
import 'package:graduation_project/moduls/search/search_screen.dart';
import 'package:graduation_project/shared/Style/icon_broken.dart';
import 'package:graduation_project/shared/components/build_post.dart';

import '../../shared/components/navigators.dart';

class FeedsScr extends StatelessWidget {
  const FeedsScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List users =DonationCubit.get(context).allUsers;
    return BlocConsumer<DonationCubit,DonationStates>(
      listener: (context,state){},
      builder: (context,state){
       return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title:Text('الصفحة الرئيسية',style: TextStyle(color: Colors.black),),
              actions: [
                IconButton(onPressed: (){
                  MyNavigators.navigateTo(context,search_hos());
                }, icon:Icon( IconBroken.Location,color: Colors.black,)),
                IconButton(onPressed: (){
                  //showSearch(context: context, delegate: dataSearch(list: users));
                  MyNavigators.navigateTo(context, FindDonorsScreen());

                }, icon:Icon( IconBroken.Search,color: Colors.black,)),
                IconButton(onPressed: (){}, icon:Icon( IconBroken.Notification,color: Colors.black,)),
                /*DropdownButton(items: [
            DropdownMenuItem(child: Text('en'),value: 'en',),
            DropdownMenuItem(child: Text('ar'),value: 'ar',),

          ],value: _selectedLang,
              onChanged: (value){
                setState(() {
                  _selectedLang=value!;
                });
                Get.updateLocale(Locale(_selectedLang));
              }),
        ],*/
              ] ),
          body: ConditionalBuilder(condition: DonationCubit.get(context).posts.length>0,
          builder: (context)=>SingleChildScrollView(


              physics:BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 20,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image(image: AssetImage('assets/images/help_others.png'),
                          width: double.infinity,fit: BoxFit.cover,height: 200,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('وَمَنْ أَحْيَاهَا فَكَأَنَّمَا أَحْيَا النَّاسَ جَمِيعاً',style: TextStyle(fontSize: 20,color:Colors.red),),
                      ),
                    ],
                  ),
                ),
                ListView.separated(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index)=>BuildPostItem(context,
                        DonationCubit.get(context).posts[index],index), separatorBuilder: (context,index)=>SizedBox(height: 10,),
                    itemCount: DonationCubit.get(context).posts.length),
              ],

            ),
          ),
            fallback: (context)=>Center(child: CircularProgressIndicator(),),
          )
        );
      },


    );
  }
}

/*
* Card(
                  child: Image(
                    image: NetworkImage('https://img.freepik.com/free-photo/young-man-being-ill-hospital-bed_23-2149017254.jpg?w=996&t=st=1682230551~exp=1682231151~hmac=f39b8e5db940a693cdeb5e5ebf07953c2c2f04dc06dc07d367225d85c5b48aef'),

                  ),
                ),
* */


