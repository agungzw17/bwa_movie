part of 'models.dart';

class RegistrationDataModel {
  String name;
  String email;
  String password;
  List<String> selectedGenres;
  String selectedLang;
  File? profileImage;

  RegistrationDataModel(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.selectedGenres = const [],
      this.selectedLang = "",
      this.profileImage});
}
