part of 'extensions.dart';

//firebase terbaru

extension FirebaseUserExtension on User {
  UserModel convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      UserModel(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  Future<UserModel> fromFireStore() async =>
      await UserServices.getUser(this.uid);
}

// extension FirebaseUserExtension on FirebaseUser {
//   UserModel convertToUser(
//           {String name = "No Name",
//           List<String> selectedGenres = const [],
//           String selectedLanguage = "English",
//           int balance = 999999999999}) =>
//       UserModel(this.uid, this.email,
//           name: name,
//           balance: balance,
//           selectedGenres: selectedGenres,
//           selectedLanguage: selectedLanguage);
//
//   Future<UserModel> fromFireStore() async =>
//       await UserServices.getUser(this.uid);
// }
