import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Layout/cubit/donation_state.dart';
import 'package:graduation_project/models/PostModel/Post_Model.dart';
import 'package:graduation_project/models/message_model/message_model.dart';
import 'package:graduation_project/moduls/chat/chats.dart';
import 'package:graduation_project/moduls/feeds/feeds_scr.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/constants.dart';
import '../../models/comment_model.dart';
import '../../models/user_model/UserModel.dart';
import '../../moduls/post/new_post.dart';
import '../../moduls/settings/setting_scr.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class DonationCubit extends Cubit<DonationStates>
{
  DonationCubit() :super (DonationInatialState());
  static DonationCubit get(context)=>BlocProvider.of(context);
  DonateUserModel? userModel;
  void getUserData()
  {
    emit(DonationGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get()
    .then((value){
      userModel=DonateUserModel.fromJson(value.data()!);
      emit(DonationGetUserSuccessState());
    }).catchError((error){
      emit(DonationGetUserErrorState(error));
    });

  }
  int CurrentIndex=0;
  List<Widget> Screens=[
    FeedsScr(),
    ChatScr(),
    NewPost_Scr(),
    SettingsScr(),
  ];
  void changeBottomNav(int index)
  {
    if(index==1)
       GetAllUser();
    if(index==2)
      emit(DonationAddPostState());

      else{
      CurrentIndex=index;
      emit(DonationChangeBottomNav());
    }


  }
  List<String> titles=[
    'Home',
    'Chat',
    'new post',
    'users',
    'setting',
  ];
////////////////////////////////////////select profile img
  File? Profileimage;
  final picker =ImagePicker();
  Future<void> getProfileImage() async{
    final pickedImage = await picker.pickImage(source:ImageSource.gallery);
    if (pickedImage !=null)
    {
      Profileimage= File(pickedImage.path);
      emit(ImageProfilePickedSucess());
    }
    else
    {
      print('no img selected');
      emit(ImageProfilePickedError());
    }
  }
///////////////////////////////////////uplod pro img
void uploadProfileImg({
  required String name,
  required String phone,
  required String userAddress,
  required String userLastDonation,
}){
  firebase_storage
      .FirebaseStorage
      .instance.ref()
      .child('users/${Uri.file(Profileimage!.path).pathSegments.last}')
      .putFile(Profileimage!)
      .then((value){
        value.ref.getDownloadURL().then((value) {
          updateUser(name: name, phone: phone, userAddress: userAddress, userLastDonation: userLastDonation,image: value);
          emit(UploadImageProfilePickedSucess());
        }).catchError((error){
          emit(UploadImageProfilePickedError());
        });
  })
      .catchError((error){
    emit(UploadImageProfilePickedError());

  });
}
//////////////////////////////////////update user
Future<void> updateUser({
  required String name,
  required String phone,
  required String userAddress,
  required String userLastDonation,
  String? image,
})async
{
  emit(LoadingUpateUserState());
  DonateUserModel model =DonateUserModel(
    name: name,
    email: userModel!.email,
    phone: phone,
    uId: userModel!.uId,
    image: image ?? userModel!.image,
    bio: userModel!.bio,
    diseases: userModel!.diseases,
    bloodtype: userModel!.bloodtype,
    userAddress: userAddress,
    userBirthDate: userModel!.userBirthDate,
    userLastDonation: userLastDonation,
  );

  FirebaseFirestore.instance
      .collection('users')
      .doc(userModel!.uId)
      .update(model.toMap())
      .then((value) {
        getUserData();
  })
      .catchError((error){
        emit(updateusererrorstate(error.toString()));
  });
}
//////////////////////////////////////select post image
  File? PostImage;
  Future<void> getPostImage() async{
    final pickedImage = await picker.pickImage(source:ImageSource.gallery);
    if (pickedImage !=null)
    {
      PostImage= File(pickedImage.path);
      emit(ImagePostPickedSucess());
    }
    else
    {
      print('no img selected');
      emit(ImagePostPickedError());
    }
  }
  ///////////////////////////////////////////////upload post image
  void UploadPostImage({
    required String dateTime,
    required String patient_name,
    required String patient_blood_type,
    required String patient_address,
    required String patient_disease,
    required String patient_age,
    required String patient_phone,
})
  {
    emit(DonationCreatePostLoadingState());
    firebase_storage.FirebaseStorage
    .instance.ref()
    .child('posts/${Uri.file(PostImage!.path).pathSegments.last}')
    .putFile(PostImage!)
    .then((value){
      value.ref.getDownloadURL().
      then((value){
        CreateNewPost(dateTime: dateTime,
            patient_phone: patient_phone,
            patient_age: patient_age,
            patient_disease: patient_disease,
            patient_address: patient_address,
          patient_blood_type: patient_blood_type,
          patient_name: patient_name,
          PostImage: value,
        );
      } )
          .catchError((error){});
    }).catchError((error){});
  }
/////////////////////////////////////////////create post
void CreateNewPost({
  String? PostImage,
  required String dateTime,
  required String patient_name,
  required String patient_blood_type,
  required String patient_address,
  required String patient_disease,
  required String patient_age,
  required String patient_phone,
})
{
  emit(DonationCreatePostLoadingState());
  PostModel postModel =PostModel(
    name: userModel!.name,
    uId: userModel!.uId,
    image: userModel!.image,
    dateTime: dateTime,
    PostImage: PostImage??'',
    patient_name: patient_name,
    patient_blood_type: patient_blood_type,
    patient_address: patient_address,
    patient_disease: patient_disease,
    patient_age: patient_age,
    patient_phone: patient_phone,
    bloodtype: userModel!.bloodtype,
  );
  FirebaseFirestore.instance
  .collection('posts')
  .add(postModel!.toMap())
  .then((value) {
    emit(DonationCreatePostSuccessState());
  })
  .catchError((error){
    emit(DonationCreatePostErrorState(error));
  });
}
/////////////////////////////////////remove post image
void removePostImage()
{
  PostImage=null;
  emit(DonationRemovePostImage());
}

///////////////////////////get posts
  List<PostModel> posts=[];
  List<String> postsId=[];
  Map<String, int> likesNumber = {};
  Map<String, int> commentsNumber = {};
void getPosts()
{
  FirebaseFirestore.instance
      .collection('posts')
      .orderBy('dateTime')
      .get()
      .then((value) {
    for (var post in value.docs) {
      post.reference.collection('comments').get().then((value) {
        commentsNumber.addAll({
          post.id: value.docs.length,
        });
        print(
            '=======================>>>>> Comments Number ${commentsNumber[post.id]}');
      }).catchError((error) {
        print(error);
      });
    }

    for (var post in value.docs) {
      post.reference.collection('likes').get().then((value) {
        posts.add(PostModel.fromJson(post.data()));
        postsId.add(post.id);
        likesNumber.addAll({
          post.id: value.docs.length,
        });
        print(
            '=======================>>>>> Likes Number ${likesNumber[post.id]}');
        emit(DonationGetPostsSuccessState());
      });
    }
  }).catchError((error) {
    emit(DonationGetPostsErrorState(error));
  });

}
//////////////////////////////////////////delete posts
  void DeletePost(int index)
  {
    posts.removeAt(index);

  }
  //////////////////////////////////////////////get all users
  List<DonateUserModel> allUsers=[];
  void GetAllUser()
  {
   if(allUsers.length==0)
    FirebaseFirestore
    .instance.collection('users')
        .get().then((value) {
          value.docs.forEach((element) {
            if(element.data()['uId'] != userModel!.uId)
               allUsers.add(DonateUserModel.fromJson(element.data()));
          });
          emit(DonationGetAllUserSuccessState());

    }).catchError((error){
      emit(DonationGetAllUserErrorState(error));
    });
  }
  //////////////////////////////////////////////////////send msg
void SendMsg({
  required String receiverId,
  required String dateTime,
  required String text,
})
{
 MessageModel model= MessageModel(
   text: text,
   senderId: userModel!.uId,
   receiverId: receiverId,
   dateTime: dateTime,

 );
 ////////set sender chats
 FirebaseFirestore.instance
 .collection('users')
 .doc(userModel!.uId)
 .collection('chats')
 .doc(receiverId)
 .collection('Messages')
 .add(model.toMap())
 .then((value) {
   emit(DonationSendMsgSuccessState());
 }).catchError((error){
   emit(DonationSendMsgErrorState());
 });
 ////////////////set reciver chat
 FirebaseFirestore.instance
     .collection('users')
     .doc(receiverId)
     .collection('chats')
     .doc(userModel!.uId)
     .collection('Messages')
     .add(model.toMap())
     .then((value) {
   emit(DonationSendMsgSuccessState());
 }).catchError((error){
   emit(DonationSendMsgErrorState());
 });

}
//////////////////////////////////////////////getmsg
  List <MessageModel> messages=[];
void getMessages({required String reciverId})
{
  FirebaseFirestore
  .instance
      .collection('users')
      .doc(userModel!.uId)
      .collection('chats')
      .doc(reciverId)
      .collection('Messages').orderBy('dateTime')
      .snapshots()
      .listen((event) {
        messages=[];
        event.docs.forEach((element) {
          messages.add(MessageModel.fromJson(element.data()));
        });
        emit(DonationGetMsgSuccessState());
  });


}
////////////////////////////////////////////comment
  CommentModel? commentModel;

  void writeComment({
    required String postId,
    required String dateTime,
    required String text,
  }) {
    commentModel = CommentModel(
      name: userModel!.name,
      uId: userModel!.uId,
      profileImage: userModel!.image,
      dateTime: dateTime,
      text: text,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .add(commentModel!.toMap())
        .then((value) {
      emit(WriteCommentSuccessState());
    }).catchError((error) {
      emit(WriteCommentErrorState());
    });
  }
  List<CommentModel> comments = [];
  void getComments({
    required String postId,
  }) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      comments = [];
      event.docs.forEach((element) {
        comments.add(CommentModel.fromJson(element.data()));
      });
      emit(GetCommentsSuccessState());
    });
  }
  //////////////////////like
  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc('${userModel!.uId}')
        .set({
      'like': true,
    }).then((value) {
      emit(SocialLikePostsSucessState());
    }).catchError((error) {
      emit(SocialLikePostsErrorState());
    });
  }

  void unlikePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc('${userModel!.uId}')
        .delete()
        .then((value) {
      emit(UnlikePostSuccessState());
    }).catchError((error) {
      emit(UnlikePostErrorState());
    });
  }


}
/*FirebaseFirestore
  .instance.collection('posts')
      .get()
      .then((value) {
        value.docs.forEach((element) {
         posts.add(PostModel.fromJson(element.data()));
        });
        emit(DonationGetPostsSuccessState());
  })
      .catchError((error){
        emit(DonationGetPostsErrorState(error));
  });

}*/