import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_cubit.dart';
import 'package:graduation_project/Layout/cubit/donation_state.dart';

import '../../models/comment_model.dart';

class CommentsScreen extends StatelessWidget {
  final String postId;

  CommentsScreen({Key? key, required this.postId}) : super(key: key);

  final commentController = TextEditingController();
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        DonationCubit.get(context).getComments(postId: postId);

        return BlocConsumer<DonationCubit, DonationStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              /*appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Center(child: Text('التعليقات',style: TextStyle(color: Colors.black),)),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),*/
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ConditionalBuilder(
                      condition: DonationCubit.get(context).comments.isNotEmpty,
                      builder: (context) => Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return _buildCommentItem(context,
                                DonationCubit.get(context).comments[index]);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                          itemCount: DonationCubit.get(context).comments.length,
                        ),
                      ),
                      fallback: (context) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Column(
                          children: [
                            Container(
                              height: 120,width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/no-chatting.png'),fit:BoxFit.contain),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text('لا توجد تعليقات حتي الان',style: TextStyle(fontSize:15),),
                          ],
                        ),
                      ),
                      ),
                    ),
                    _buildWriteCommentRow(context),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  _buildCommentItem(context, CommentModel comment) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                '${comment.profileImage}',
              ),
              radius: 22,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Text(
                                '${comment.name}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12, left: 12,),
                          child: Text(
                            '${comment.text}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildWriteCommentRow(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'اكتب تعليقاّّ',
                    border: InputBorder.none,
                  ),
                  controller: commentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontSize: 16),
                  cursorHeight: 20,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                DonationCubit.get(context).writeComment(
                  postId: postId,
                  dateTime: now.toString(),
                  text: commentController.text,
                );
                commentController.clear();
              },
              icon: Transform.translate(
                offset: const Offset(10, 0),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
