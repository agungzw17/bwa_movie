part of 'models.dart';

class TheaterModel extends Equatable {
  final String name;

  TheaterModel(this.name);

  @override
  List<Object> get props => [name];
}

List<TheaterModel> dummyTheater = [
  TheaterModel("CGV 23 Paskal Hyper Square"),
  TheaterModel("CGV Paris Van Java"),
  TheaterModel("XXI Cihampelas Walk"),
  TheaterModel("XXI Bandung Trade Center"),
];
