abstract class AppStates{}

class AppInitState extends AppStates{}

//Register States
class RegisterLoading extends AppStates{}
class RegisterDone extends AppStates{}
class RegisterError extends AppStates{
  final error;

  RegisterError(this.error);
}
//Login States
class LoginLoading extends AppStates{}
class LoginDone extends AppStates{}
class LoginError extends AppStates{
  final error;

  LoginError(this.error);
}



class FaceBookLoginLoading extends AppStates{}
class FaceBookLoginDone extends AppStates{}
class FaceBookLoginError extends AppStates{
  final error;

  FaceBookLoginError(this.error);
}