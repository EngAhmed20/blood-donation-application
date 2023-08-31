import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/Layout/cubit/donation_state.dart';
import 'package:graduation_project/shared/Style/icon_broken.dart';
import '../../Styles/custom_colors.dart';
import '../../shared/components/Custom_text_filed.dart';
import '../../shared/components/default_app_bar.dart';
import '../../shared/constants.dart';

class NewPost_Scr extends StatefulWidget {
  @override
  State<NewPost_Scr> createState() => _NewPost_ScrState();
}

class _NewPost_ScrState extends State<NewPost_Scr> {
  var nameController=TextEditingController();
  var userLocationController=TextEditingController();
  var phoneController=TextEditingController();
  var reasonofneed = TextEditingController();
  var age = TextEditingController();
  String? bloodType;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DonationCubit,DonationStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit =DonationCubit.get(context);
        return Scaffold(
          appBar:DefaultAppBar(context: context,title: 'تسجيل حالة جديدة',
              actions: [
                MaterialButton(onPressed: (){
                  var now =DateTime.now();
                  if(cubit.PostImage== null)
                    {
                      cubit.CreateNewPost(dateTime: now.toString(),
                          patient_name: nameController.text,
                          patient_blood_type: bloodType.toString(),
                          patient_address: userLocationController.text,
                          patient_disease: reasonofneed.text,
                          patient_age: age.text,
                          patient_phone: phoneController.text);
                    } else{
                    cubit.UploadPostImage(dateTime: now.toString(),
                        patient_name: nameController.text,
                        patient_blood_type: bloodType.toString(),
                        patient_address: userLocationController.text,
                        patient_disease: reasonofneed.text,
                        patient_age: age.text,
                        patient_phone: phoneController.text);
                  }
                },
                  child: Text('نشر',
                      style: 
                      TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold)),
                )
              ]
          ),
          body:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                 if( state is DonationCreatePostLoadingState)
                  LinearProgressIndicator(),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                          NetworkImage('${cubit.userModel!.image}'),
                        ),
                        Text('${cubit.userModel!.name}',style: Theme.of(context).textTheme
                            .titleMedium?.copyWith(fontWeight:FontWeight.bold,height: 1.3)),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  //////////////////////////////////name
                  defaulttextform(
                      controller: nameController,
                      type: TextInputType.name,
                      align: TextAlign.right,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'pls enter y name';
                        }
                      },
                      label: 'اسم المريض',
                      preficon: Icons.person),
                  SizedBox(height: 20,),
                  /////////////////////////////////////////bloodtype
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'فصيلة الدم',
                        style: TextStyle(
                          color: CustomColors.primaryRedColor,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 20),
                      DropdownButton(
                        dropdownColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        alignment: Alignment.center,
                        iconSize: 30,
                        iconEnabledColor: CustomColors.primaryRedColor,
                        value: bloodType,
                        isExpanded: true,
                        borderRadius: Constants.primaryBorderRadius,
                        hint: Text(
                          'أختر فصيلة الدم',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Center(
                              child: Text("O+",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            value: '+O',
                          ),
                          DropdownMenuItem(
                            child: Center(
                              child: Text('O-',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            value: '-O',
                          ),
                          DropdownMenuItem(
                            child: Center(
                              child: Text("A+",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            value: '+A',
                          ),
                          DropdownMenuItem(
                            child: Center(
                              child: Text("A-",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            value: '-A',
                          ),
                          DropdownMenuItem(
                            child: Center(
                              child: Text("B+",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            value: '+B',
                          ),
                          DropdownMenuItem(
                            child: Center(
                              child: Text("B-",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            value: '-B',
                          ),
                          DropdownMenuItem(
                            child: Center(
                              child: Text("AB+",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            value: '+AB',
                          ),
                          DropdownMenuItem(
                            child: Center(
                              child: Text("AB-",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            value: '-AB',
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            bloodType = value as String?;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  /////////////////////////////////address
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
                      preficon: Icons.email),
                  SizedBox(height: 20,),
                  //////////////////////////////////reason
                  defaulttextform(
                      controller: reasonofneed,
                      align: TextAlign.right,
                      type: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'pls complete this field';
                        }
                      },
                      label: 'سبب الاحتياج للتبرع',
                      preficon: Icons.note_add),
                  SizedBox(height: 20,),
                  //////////////////////////age
                  defaulttextform(
                    controller: age,
                    align: TextAlign.right,
                    type: TextInputType.number,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'pls enter your age';
                      }
                    },
                    label: 'عمر المريض',),
                  SizedBox(height: 20,),
                  //////////////////////////phone
                  defaulttextform(
                      controller: phoneController,
                      type: TextInputType.number,
                      align: TextAlign.right,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'pls enter your phone number';
                        }
                      },
                      label: 'رقم التواصل',preficon: Icons.phone),
                  SizedBox(height: 20,),
                  /////////////////////////////////////////////////////////
                  if(cubit.PostImage!=null)
                   Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children:
                      [
                        Align(
                          child: Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),topRight:Radius.circular(4) ),
                              image: DecorationImage(image: FileImage(cubit.PostImage!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        IconButton(
                          icon: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.close),

                          ),
                          onPressed: (){cubit.removePostImage();},
                        ),
                      ]
                  ),
                  SizedBox(height: 15,),
                  ///////////////////////////add photos
                  TextButton(onPressed: (){
                    cubit.getPostImage();
                  },
                      child: Row(
                        children: [
                          Icon(IconBroken.Image,color: Colors.red,),
                          SizedBox(width: 5,),
                          Text('اضافة صورة',style: TextStyle(color: Colors.red),),
                        ],
                      )),

                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
