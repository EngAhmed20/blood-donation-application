import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Styles/custom_colors.dart';

Widget defaulttextform(
        {required TextEditingController controller,
        TextInputType? type,
        Function(String)? onSubmit,
        Function(String)? onChange,
        VoidCallback? ontap,
        required String? Function(String?)? validator,
        String? label,
        TextAlign align=TextAlign.start,
        String? hint,
        IconData? preficon,
        VoidCallback? sufixpress,
        bool ispass = false,
        IconData? suficon,
        bool isCleckable = true,
        bool read_only = false}) =>
    new Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        textDirection: TextDirection.ltr,
        enabled: isCleckable,
        obscureText: ispass,
        onChanged: onChange,
        readOnly: read_only,
        onTap: ontap,
        textAlign:align ,
        cursorColor: Colors.red,
        style: TextStyle(color: Colors.red),
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          label: Text(label!),
          hintText: hint,
          labelStyle: TextStyle(
            color: CustomColors.primaryRedColor,
            fontSize: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(preficon),
          suffixIcon: IconButton(onPressed: sufixpress, icon: Icon(suficon)),
        ),
        validator: validator,
      ),
    );
