import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/home.dart';
import 'package:graduation_project/Register/reg_cubit/Reg_cubit.dart';
import 'package:graduation_project/Register/reg_cubit/regState.dart';
import 'package:graduation_project/shared/constants.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;

import '../constants/constants.dart';
import '../constants/locale_keys.g.dart';
import '../shared/components/Custom_text_filed.dart';
import '../shared/network/local/shared_pref/cache_helper.dart';
import '../styles/custom_colors.dart';

class registerScr extends StatefulWidget {
  @override
  State<registerScr> createState() => _registerScrState();
}

class _registerScrState extends State<registerScr> {
  var FormKey =GlobalKey<FormState>();

  var passController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var nameController = TextEditingController();

  var userLocationController = TextEditingController();

  var userBirthDateController = TextEditingController();

  var userLastDonationDateController = TextEditingController();

  String? Status;
  String? bloodType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DonateRegCubit(),
      child: BlocConsumer<DonateRegCubit, DonateRegState>(
        listener: (context, state) {
          if(state is DonateCreateUserSucessState)
          {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              uId = state.uId;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => homeScr()));
            }); }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Form(
              key: FormKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'إنشاء حساب جديد',
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
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
                      SizedBox(
                        height: 20,
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
                      suficon: DonateRegCubit.get(context).suffix,
                      ispass: DonateRegCubit.get(context).ispass,
                      sufixpress: (){DonateRegCubit.get(context).ChangePassVisablity();}
                  ),
                      SizedBox(
                        height: 20,
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
                        height: 20,
                      ),
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
                      SizedBox(height: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'هل تعاني من أمراض مزمنة ؟',
                            style: TextStyle(fontSize: 20,color: CustomColors.primaryRedColor)
                          ),
                          DropdownButton(
                            alignment: Alignment.center,
                            dropdownColor:
                            Theme.of(context).scaffoldBackgroundColor,
                            isExpanded: true,
                            iconSize: 25,
                            iconEnabledColor: CustomColors.primaryRedColor,
                            value: Status,
                            hint: Text(
                              'أختر ',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            borderRadius: Constants.primaryBorderRadius,
                            items: [
                              DropdownMenuItem(
                                child: Center(
                                  child: Text(
                                    'لا توجد أمراض مزمنة',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'لا توجد أمراض مزمنة',
                              ),

                              DropdownMenuItem(
                                child: Center(
                                  child: Text(
                                    'أمراض فقر الدم',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'أمراض فقر الدم',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text(
                                      'أمراض الدم الوراثية ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'أمراض الدم الوراثية ',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text('التهاب الكبد الفيروسي',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'التهاب الكبد',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text('الملاريا',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'الملاريا',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text('أمراض السرطان',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'السرطان',
                              ),

                            ],
                            onChanged: (value) {
                              setState(
                                    () {
                                  Status = value as String?;
                                },
                              );

                            },
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'فصائل الدم',
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
                                value: 'O+',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text('O-',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'O-',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text("A+",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'A+',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text("A-",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'A-',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text("B+",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'B+',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text("B-",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'B-',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text("AB+",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'AB+',
                              ),
                              DropdownMenuItem(
                                child: Center(
                                  child: Text("AB+",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                value: 'AB+',
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

                      defaulttextform(
                        controller: userBirthDateController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your birth date';
                          }
                        }, label: 'تاريخ الميلاد',

                        preficon: Icons.date_range,
                        read_only: true,
                        ontap:(){
                          showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2030))
                          .then((value) {
                            userBirthDateController.text=DateFormat.yMd().format(value!);
                          })
                          ;
                        },
                      ),
                      SizedBox(height: 20,),
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
                      SizedBox(height: 20,),
                      defaulttextform(
                       align: TextAlign.right,
                          controller: userLocationController,
                          type: TextInputType.text,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'pls enter y address';
                            }
                          },
                          label: 'العنوان',
                          preficon: Icons.email),
                      SizedBox(height: 20,),

                      ConditionalBuilder(condition:state is! DonateRegLoadingState, builder: (context)=>
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: CustomColors.primaryRedColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: MaterialButton(onPressed: () {
                                if(FormKey.currentState!.validate())
                                {
                                  DonateRegCubit.get(context).UserRegister(email: emailController.text, pass: passController.text
                                      ,phone: phoneController.text,name: nameController.text,diseases: Status.toString(),
                                    bloodtype: bloodType.toString(),userLastDonation: userLastDonationDateController.text,
                                    userBirthDate: userBirthDateController.text,userAddress: userLocationController.text
                                  );

                                }
                              }
                                  , child: Text('إنشاء حساب جديد')),
                            ),
                            fallback:(context)=> Center(child: CircularProgressIndicator())),

                    ],
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
/*Container(
height: 20,
width: double.infinity,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'any desert',
style: Theme.of(context).textTheme.headline1?.copyWith(
color: CustomColors.primaryRedColor,
),
),
DropdownButton(
alignment: Alignment.center,
dropdownColor:
Theme.of(context).scaffoldBackgroundColor,
iconSize: 25,
iconEnabledColor: CustomColors.primaryRedColor,
value: Status,
hint: Text(
'اختر ',
style: const TextStyle(color: Colors.grey),
),
borderRadius: Constants.primaryBorderRadius,
items: [
DropdownMenuItem(
child: Center(
child: Text(
'لا توجد امراض مزمنة',
style: Theme.of(context).textTheme.headline2,
),
),
value: 'لا توجد امراض مزمنة',
),
DropdownMenuItem(
child: Center(
child: Text(
'امراض فقر الدم',
style: Theme.of(context).textTheme.headline2,
),
),
value: 'امراض فقر الدم',
),
DropdownMenuItem(
child: Center(
child: Text(
'امراض الدم الوراثية ',
style: Theme.of(context).textTheme.headline2),
),
value: 'امراض الدم الوراثية ',
),
DropdownMenuItem(
child: Center(
child: Text('التهاب الكبد',
style: Theme.of(context).textTheme.headline2),
),
value: 'التهاب الكبد',
),
DropdownMenuItem(
child: Center(
child: Text('الملاريا',
style: Theme.of(context).textTheme.headline2),
),
value: 'الملاريا',
),
DropdownMenuItem(
child: Center(
child: Text('السرطان',
style: Theme.of(context).textTheme.headline2),
),
value: 'السرطان',
),
],
onChanged: (value) {

},
)
],
),
),*/
