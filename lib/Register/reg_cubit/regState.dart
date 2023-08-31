
abstract class DonateRegState{}
class DonateRegInitialState extends DonateRegState{

}
class DonateRegLoadingState extends DonateRegState{

}
class DonateRegSucessState extends DonateRegState{



}
class DonateRegErrorState extends DonateRegState{
  final String error ;


  DonateRegErrorState(this.error);
}
class DonateRegShowPassState extends DonateRegState{}

class DonateCreateUserSucessState extends DonateRegState{

  final String uId;

  DonateCreateUserSucessState(this.uId);

}
class DonateCreateUserErrorState extends DonateRegState{
  final String error ;


  DonateCreateUserErrorState(this.error);
}