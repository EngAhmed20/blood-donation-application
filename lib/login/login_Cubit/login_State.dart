abstract class DonateLoginState{}
class DonateLoginInitialState extends DonateLoginState{

}
class DonateLoginILoadingState extends DonateLoginState{

}
class DonateLoginSucessState extends DonateLoginState{
  final String uId;

  DonateLoginSucessState(this.uId);


}
class DonateLoginErrorState extends DonateLoginState{
  final String error ;

  DonateLoginErrorState(this.error);
}
class DonateLoginIShowPassState extends DonateLoginState{}
class GetUserSuccessState extends DonateLoginState {}
class GetUserErrorState extends DonateLoginState {
  final String error;

  GetUserErrorState(this.error);
}
class GetUserLoadingState extends DonateLoginState {}



