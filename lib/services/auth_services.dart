part of "services.dart";

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // AuthResult result = await _auth.createUserWithEmailAndPassword(
      //     email: email, password: password);

      UserModel userModel = result.user!.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(userModel);

      return SignInSignUpResult(userModel: userModel);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // AuthResult result = await _auth.signInWithEmailAndPassword(
      //     email: email, password: password);

      UserModel userModel = await result.user!.fromFireStore();

      return SignInSignUpResult(userModel: userModel);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User?> get userStream => _auth.authStateChanges();
  // static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SignInSignUpResult {
  final UserModel? userModel;
  final String? message;

  SignInSignUpResult({this.userModel, this.message});
}
