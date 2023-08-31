import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/Layout/cubit/donation_state.dart';
import 'package:graduation_project/shared/components/Custom_text_filed.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../shared/Style/icon_broken.dart';
import '../../shared/components/default_app_bar.dart';

class editProfile extends StatelessWidget {
  var nameController=TextEditingController();
  var bioController=TextEditingController();
  var phoneController=TextEditingController();
  var userLocationController = TextEditingController();
  var userLastDonationDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DonationCubit,DonationStates>(
      listener: (context,state){},
      builder: (context,state){
        var userModel=DonationCubit.get(context)!.userModel;
        var cubit= DonationCubit.get(context);
        nameController.text=userModel!.name!;
        phoneController.text=userModel!.phone!;
        userLocationController.text=userModel!.userAddress!;
        userLastDonationDateController.text=userModel!.userLastDonation!;

        return Scaffold(
          appBar: DefaultAppBar(
              title: 'تعديل البيانات', context: context,
              actions:[
                MaterialButton(onPressed: (){
                  cubit.updateUser(name: nameController.text
                      , phone: phoneController.text
                      , userAddress: userLocationController.text,
                      userLastDonation: userLastDonationDateController.text);
                },child: Text('حفظ التعديل',style: TextStyle(color: Colors.blue,fontSize: 18),)
                ),
                SizedBox(width: 10,),
              ]
          ),
         body: Padding(
           padding: const EdgeInsets.all(8.0),
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Stack(
                     alignment: AlignmentDirectional.bottomEnd,
                     children: [
                       CircleAvatar(
                         radius: 55,
                         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                         child: CircleAvatar(
                           radius: 50,
                           backgroundImage:
                           NetworkImage('${userModel!.image}'),

                         ),
                       ),
                       CircleAvatar(child: IconButton(onPressed: (){
                         cubit.getProfileImage();
                       },
                           icon: Icon(IconBroken.Camera))),
                     ],
                   ),
                 ],),
                 if(cubit.Profileimage!=null)
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       OutlinedButton(onPressed: (){
                         cubit.uploadProfileImg(name: nameController.text,
                             phone: phoneController.text,
                             userAddress: userLocationController.text,
                             userLastDonation: userLastDonationDateController.text);
                       }, child:Text('تحديث الصورة الشخصية'))
                     ],
                   ),
                 SizedBox(height: 30,),
                 defaulttextform(
                     controller: nameController,
                     type: TextInputType.name,
                     validator: (String? value) {
                       if (value!.isEmpty) {
                         return 'pls enter y name';
                       }
                     },
                     label: 'الاسم',
                     preficon: Icons.person),
                 SizedBox(height: 15,),
                 defaulttextform(
                     controller: phoneController,
                     type: TextInputType.phone,
                     validator: (String? value) {
                       if (value!.isEmpty) {
                         return 'pls enter y Phone Number';
                       }
                     },
                     label: 'الهاتف',
                     preficon: Icons.phone),
                 SizedBox(height: 15,),
                 defaulttextform(
                     controller: userLocationController,
                     type: TextInputType.text,
                     align: TextAlign.right,
                     validator: (String? value) {
                       if (value!.isEmpty) {
                         return 'pls enter y address';
                       }
                     },
                     label: 'العنوان',
                     preficon: Icons.location_city),
                 SizedBox(height: 15,),
                 defaulttextform(
                   controller: userLastDonationDateController,
                   validator: (String? value) {
                     if (value!.isEmpty) {
                       return 'please enter your birth date';
                     }
                   }, label: 'تاريخ اخر تبرع لك',

                   preficon: Icons.date_range,
                   read_only: true,
                   ontap:(){
                     showDatePicker(context: context,
                         initialDate: DateTime.now(),
                         firstDate: DateTime(2020),
                         lastDate: DateTime(2050))
                         .then((value) {
                       userLastDonationDateController.text=DateFormat.yMd().format(value!);
                     })
                     ;
                   },
                 ),


               ],
             ),
           ),
         ),
        );
      },

    );
  }
}
