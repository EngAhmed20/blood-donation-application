import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/PostModel/Post_Model.dart';

import '../../Layout/cubit/donation_cubit.dart';
import '../../Layout/cubit/donation_state.dart';
import '../../models/message_model/message_model.dart';
import '../../models/user_model/UserModel.dart';

class FeedDetailsScreen extends StatelessWidget {

  PostModel? userModel;
  FeedDetailsScreen({required this.userModel});
  var msgController=TextEditingController();
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context)
    {
      DonationCubit.get(context).getMessages(reciverId: userModel!.uId!);
      return BlocConsumer<DonationCubit,DonationStates>(
        listener:(context,state){},
        builder: (context,state){
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                titleSpacing: 0.0,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Row(children: [
                  CircleAvatar(radius: 20.0,
                    backgroundImage: NetworkImage('${userModel!.image}'),
                  ),
                  SizedBox(width: 15,),
                  Text('${userModel!.name}',style: TextStyle(color: Colors.black),),
                ],),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              body:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(itemBuilder: (context,index)
                      {
                        var msg= DonationCubit.get(context).messages[index];
                        if(DonationCubit.get(context).userModel!.uId==msg.senderId)
                          return buildSenderMessage(context,msg);
                        else
                          return buildReciverMessage(msg);
                      },
                          separatorBuilder:(context,index)=>SizedBox(height: 15,),
                          itemCount: DonationCubit.get(context).messages.length
                      ),
                    ),
                    Container(
                      height: 50,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color:Colors.grey[300],
                        border: Border.all(
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: msgController,
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                hintText: 'الرسالة',
                                border:InputBorder.none,),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            /* decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),*/
                            color: Colors.blue,

                            height: 50,
                            child: MaterialButton(onPressed: (){
                              DonationCubit.get(context).SendMsg(receiverId: userModel!.uId!,
                                  dateTime: DateTime.now().toString(),
                                  text: msgController.text);
                              msgController.clear();
                            },minWidth: 1.0,
                              child:Icon(Icons.send_outlined,color: Colors.white,),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          );
        },
      );
    }

    );
  }
  Widget buildReciverMessage(MessageModel model)=> Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10),
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
          )
      ),
      child: Text('${model.text}'),
    ),
  );
  Widget buildSenderMessage(context,MessageModel model)=>Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.2),
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10),
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
          )
      ),
      child: Text('${model.text}'),
    ),
  );


}
