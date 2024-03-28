abstract class ForgetPasswordState {}

class InitialForgetPasswordState extends ForgetPasswordState {}

class LoadingForgetPasswordState extends ForgetPasswordState {}

class SucessForgetPasswordState extends ForgetPasswordState {
  String message;
  SucessForgetPasswordState(this.message);
}

class FailerForgetPasswordState extends ForgetPasswordState {
  String message;
  FailerForgetPasswordState(this.message);
}

class LoadingResetetPasswordState extends ForgetPasswordState {}

class SucessResetePasswordState extends ForgetPasswordState {
  String message;
  SucessResetePasswordState(this.message);
}

class FailerResetePasswordState extends ForgetPasswordState {
  String message;
  FailerResetePasswordState(this.message);
}
