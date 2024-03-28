abstract class PreSignUpdState {}

class InitialPreSignUpState extends PreSignUpdState{}
class LoadingPreSignUpState extends PreSignUpdState{}
class SucessPreSignUpState extends PreSignUpdState{}
class FailerPreSignUpState extends PreSignUpdState{
  String message;
  FailerPreSignUpState(this.message);
}

class InitialSignUpState extends PreSignUpdState{}
class LoadingSignUpState extends PreSignUpdState{}
class SucessSignUpState extends PreSignUpdState{}
class FailerSignUpState extends PreSignUpdState{
  String message;
  FailerSignUpState(this.message);
}
