
import 'package:flutter/material.dart';

import '../../shared/components/Custom_text_filed.dart';
class Mail extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(child: Text('إرسل رسالة',style: TextStyle(color: Colors.black),)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaulttextform(
                      controller: nameController,
                      type: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'pls enter y name';
                        }
                      },
                      label: 'الاسم',
                      align: TextAlign.right,
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
                      align: TextAlign.right,
                      preficon: Icons.phone),
                  SizedBox(height: 15,),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      cursorColor: Colors.red,
                      controller: messageController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.red),
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'اكتب رسالتك هنا',
                        labelStyle: const TextStyle(color: Colors.red),
                        prefixIcon: const Icon(
                          Icons.message,
                          color: Colors.red,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      height: 50,
                      width:double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(onPressed: (){
                      },child: Text('ارسل رسالتك',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)),
                  //Submit Button
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
