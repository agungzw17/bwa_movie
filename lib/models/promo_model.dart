part of 'models.dart';

class PromoModel extends Equatable {
  final String? title;
  final String? subTitle;
  final int? discount;

  PromoModel({@required this.title, @required this.subTitle, @required this.discount});

  @override
  List<Object> get props => [title!, subTitle!, discount!];

}

List<PromoModel> dummyPromo = [
  PromoModel(title: "Student Holiday", subTitle: "Maximal only for two people", discount: 50),
  PromoModel(title: "Family Club", subTitle: "Minimal for three members", discount: 70),
  PromoModel(title: "Student Holiday", subTitle: "Min. one year", discount: 40),
];