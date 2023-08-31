import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/Layout/cubit/donation_state.dart';

import '../../shared/components/default_app_bar.dart';

class search_hos extends StatelessWidget {
  const search_hos({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
return BlocConsumer<DonationCubit,DonationStates>(listener: (context,state){},
builder: (context,state){
  var cubit =DonationCubit.get(context);
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
     // title: Center(child: Text('البحث عن متبرعين',style: TextStyle(color: Colors.black),)),
    ),
    body: Column(
      children: [
        Container(
          height: 500,width:400 ,
        ),
      ],

    ),

  );

},
);
  }
}
