import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/Layout/cubit/donation_state.dart';

import '../../models/user_model/UserModel.dart';
import '../chat_details/ChatDetails.dart';

class ChatScr extends StatelessWidget {
  const ChatScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DonationCubit,DonationStates>(
      listener: (context,state){},
      builder: (context,state){
      return ConditionalBuilder(
        condition:DonationCubit.get(context).allUsers.length>0 ,
        builder: (context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildChatItem(context,DonationCubit.get(context).allUsers[index]),
            separatorBuilder: (context,index)=>Container(height: 1,width: double.infinity,color: Colors.grey[300],),
            itemCount: DonationCubit.get(context).allUsers.length),
        fallback:(context)=> Center(child: CircularProgressIndicator()),
      );

      },


    );
  }
  Widget buildChatItem(context,DonateUserModel model)=>InkWell(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage:
            NetworkImage('${model.image}'),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Text('${model.name}',style: Theme.of(context).textTheme
                .titleMedium?.copyWith(fontWeight:FontWeight.bold,height: 1.3)),
          ),

        ],
      ),
    ),
    onTap: (){
      Navigator.push(context,
      MaterialPageRoute(builder: (context)=>ChatDetailsScreen(userModel: model,))
      );
    },
  );
}
