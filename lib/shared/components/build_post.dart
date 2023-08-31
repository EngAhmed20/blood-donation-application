import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/constants/constants.dart';
import 'package:graduation_project/models/PostModel/Post_Model.dart';
import 'package:graduation_project/moduls/comment/comments_screen.dart';
import 'package:graduation_project/shared/components/navigators.dart';

import '../../moduls/chat_details/ChatDetails.dart';
import '../../moduls/feeds/feed chats.dart';
import '../Style/icon_broken.dart';

Widget BuildPostItem(context,PostModel model, int index)=> Stack(
  alignment: AlignmentDirectional.topEnd,
  children: [
    Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                  NetworkImage('${model.image}'),

                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${model.name}',style: Theme.of(context).textTheme
                              .titleMedium?.copyWith(fontWeight:FontWeight.bold,height: 1.3)),
                          SizedBox(width: 10,),
                          Text('${model.bloodtype}',style: TextStyle(height: 1.3,color: Colors.red),),
                        ],
                      ),
                      Text('${model.dateTime!.substring(0,16)}',style: Theme.of(context).textTheme.caption
                          ?.copyWith(height: 1.3),),

                    ],
                  ),
                ),
                if(model.uId==DonationCubit.get(context).userModel!.uId)
                  IconButton(onPressed: (){
                    DonationCubit.get(context).DeletePost(index);
                  }, icon: Icon(Icons.close),color: Colors.red,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Container(height: 1,width: double.infinity,color: Colors.grey[300],),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Text('الاسم',style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.red)),
                  Text(':',style: (TextStyle(fontSize: 20)),),
                  SizedBox(width: 10,),
                  Text('${model.patient_name}',style:Theme.of(context).textTheme.subtitle1,),
                ],),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Text('فصيلة الدم',style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.red)),
                  Text(':',style: (TextStyle(fontSize: 20)),),
                  SizedBox(width: 10,),
                  Text('${model.patient_blood_type}',style:Theme.of(context).textTheme.subtitle1,),
                ],),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Text('العنوان',style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.red)),
                  Text(':',style: (TextStyle(fontSize: 20)),),
                  SizedBox(width: 10,),
                  Text('${model.patient_address}',style:Theme.of(context).textTheme.subtitle1,),
                ],),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Text('سبب الاحتياج للتبرع',style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.red)),
                  Text(':',style: (TextStyle(fontSize: 20)),),
                  SizedBox(width: 10,),
                  Text('${model.patient_disease}',style:Theme.of(context).textTheme.subtitle1,),
                ],),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Text('السن',style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.red)),
                  Text(':',style: (TextStyle(fontSize: 20)),),
                  SizedBox(width: 10,),
                  Text('${model.patient_age}',style:Theme.of(context).textTheme.subtitle1,),
                ],),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Text('رقم التواصل',style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.red)),
                  Text(':',style: (TextStyle(fontSize: 20)),),
                  SizedBox(width: 10,),
                  Text('${model.patient_phone}',style:Theme.of(context).textTheme.subtitle1,),
                ],),
            ),

            //////////////////////////////////////////////////////////////////photo
            SizedBox(height: 10,),
           if(model.PostImage!='')
              Container(
              height: 140,width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image:
                  NetworkImage('${model.PostImage}'
                  ),fit: BoxFit.cover,

                  )
              ),
            ),
            SizedBox(height: 10,),
            //////////////////////likes number
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Icon(IconBroken.Heart,size: 16,color: Colors.red,),
                          SizedBox(width: 5,),
                          Text('${DonationCubit.get(context).likesNumber[DonationCubit.get(context).postsId[index]]}',style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(IconBroken.Chat,size: 16,color: Colors.red,),
                          SizedBox(width: 5,),
                          Text('${DonationCubit.get(context).commentsNumber[DonationCubit.get(context).postsId[index]]}',style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                    onTap: (){},
                  ),
                ),


              ],
            ),
            //////////////
            ///////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(height: 1,width: double.infinity,color: Colors.grey[300],),
            ),
            /////////////////////////////////////write comment make like
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage:
                          NetworkImage('${DonationCubit.get(context).userModel!.image}'),
                        ),
                        SizedBox(width: 20,),
                        Text('اكتب تعليق'),
                      ],
                    ),
                    onTap: (){
                      MyNavigators.navigateTo(context, CommentsScreen(postId: DonationCubit.get(context).postsId[index],));

                    },
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Icon(IconBroken.Heart,size: 16,color: Colors.red,),
                        SizedBox(width: 5,),
                        Text('تفاعل',style: Theme.of(context).textTheme.caption,),
                      ],
                    ),
                  ),
                  onTap: (){
                    DonationCubit.get(context)
                        .likePost(DonationCubit.get(context).postsId[index]);
                  },
                ),
              ],
            ),

          ],

        ),
      ),

    ),
    ////////////////////////////////////////////////////connect
    if(model.uId!=DonationCubit.get(context).userModel!.uId)
      Container(
          margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          height: 25,
          width:100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: MaterialButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>FeedDetailsScreen(userModel: model,))
            );
          },child: Text('تواصل',style: TextStyle(color: Colors.white),),)),


  ],
);