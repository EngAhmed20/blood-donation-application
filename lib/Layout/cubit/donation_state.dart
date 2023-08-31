abstract class DonationStates{}
class DonationInatialState extends DonationStates{}
class DonationGetUserLoadingState extends DonationStates{}
class DonationGetUserSuccessState extends DonationStates{}
class DonationGetUserErrorState extends DonationStates{
  final String error;
  DonationGetUserErrorState(this.error);
}
class DonationChangeBottomNav extends DonationStates{}
class DonationAddPostState extends DonationStates{}
/////////////////////////////////////////////////////////////////profile img
class ImageProfilePickedSucess extends DonationStates{
}
class ImageProfilePickedError extends DonationStates{
}
class UploadImageProfilePickedSucess extends DonationStates{
}
class UploadImageProfilePickedError extends DonationStates{
}
class LoadingUpateUserState extends DonationStates{
}
class updateusererrorstate extends DonationStates{
  final String error;

  updateusererrorstate(this.error);
}
///////////////////////////post
class DonationCreatePostLoadingState extends DonationStates{}
class DonationCreatePostSuccessState extends DonationStates{}
class DonationCreatePostErrorState extends DonationStates{
  final String error;
  DonationCreatePostErrorState(this.error);
}
////////////////////////post image
class ImagePostPickedSucess extends DonationStates{
}
class ImagePostPickedError extends DonationStates{
}

class DonationRemovePostImage extends DonationStates{
}
///////////////////////////////getposts
class DonationGetPostsLoadingState extends DonationStates{}
class DonationGetPostsSuccessState extends DonationStates{}
class DonationGetPostsErrorState extends DonationStates{
  final String error;
  DonationGetPostsErrorState(this.error);
}
class DeletePost extends DonationStates{
}
//////////////////////////////////////////////////get all users
class DonationGetAllUserLoadingState extends DonationStates{}
class DonationGetAllUserSuccessState extends DonationStates{}
class DonationGetAllUserErrorState extends DonationStates{
  final String error;
  DonationGetAllUserErrorState(this.error);
}
/////////////////////////////////////////msg
class DonationSendMsgSuccessState extends DonationStates{}
class DonationSendMsgErrorState extends DonationStates{}
class DonationGetMsgSuccessState extends DonationStates{}
class DonationGetMsgErrorState extends DonationStates{}
class DonationSignOutSuccessState extends DonationStates{}
class SocialLikePostsSucessState extends DonationStates{}
class SocialLikePostsErrorState extends DonationStates{

}
class WriteCommentSuccessState extends DonationStates{}
class WriteCommentErrorState extends DonationStates{}
class GetCommentsSuccessState extends DonationStates{}
class UnlikePostSuccessState extends DonationStates{}
class UnlikePostErrorState extends DonationStates{}



