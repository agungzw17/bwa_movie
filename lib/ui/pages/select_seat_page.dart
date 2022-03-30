part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final TicketModel ticketModel;

  SelectSeatPage(this.ticketModel);
  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {

          BlocProvider.of<PageBloc>(context).add(GoToSelectSchedulePage(widget.ticketModel.movieDetailModel));
          return Future.value(false);
        },
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            Container(color: accentColor1),
            SafeArea(child: Container(color: Colors.white)),
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black.withOpacity(0.04)),
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<PageBloc>(context).add(GoToSelectSchedulePage(widget.ticketModel.movieDetailModel));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: defaultMargin),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 16),
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      widget.ticketModel.movieDetailModel.title ?? "",
                                      style:
                                          blackTextFont.copyWith(fontSize: 20),
                                      maxLines: 2,
                                      textAlign: TextAlign.end,
                                    )),
                                Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(imageBaseURL +
                                                '/w154/' +
                                                "${widget
                                                    .ticketModel
                                                    .movieDetailModel
                                                    .posterPath}"))))
                              ]),
                        ),
                      ],
                    ),
                    Container(
                        width: 277,
                        height: 84,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/screen.png")))),
                    generateSeats(),
                    //Button
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.topCenter,
                      child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: selectedSeats.length > 0
                              ? mainColor
                              : Color(0xFFE4E4E4),
                          child: Icon(
                            Icons.arrow_forward,
                            color: selectedSeats.length > 0
                                ? Colors.white
                                : Color(0xFFBEBEBE),
                          ),
                          onPressed: selectedSeats.length > 0
                              ? () {
                            BlocProvider.of<PageBloc>(context).add(GoToCheckoutPage(
                                widget.ticketModel
                                    .copyWith(seats: selectedSeats)));
                          }
                              : null),
                    ),
                    SizedBox(height: 30,),
                  ],
                )
              ],
            )
          ],
        )));
  }

  Column generateSeats() {
    List<int> numberOfSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            numberOfSeats[i],
            (index) => Padding(
                  padding: EdgeInsets.only(
                      right: index < numberOfSeats[i] - 1 ? 16 : 0, bottom: 16),
                  child: SelectableBox(
                    "${String.fromCharCode(i + 65)}${index + 1}",
                    width: 40,
                    height: 40,
                    textStyle: whiteNumberFont.copyWith(color: Colors.black),
                    onTap: () {
                      String seatNumber =
                          "${String.fromCharCode(i + 65)}${index + 1}";
                      setState(() {
                        if (selectedSeats.contains(seatNumber)) {
                          selectedSeats.remove(seatNumber);
                        } else {
                          selectedSeats.add(seatNumber);
                        }
                      });
                    },
                    isSelected: selectedSeats
                        .contains("${String.fromCharCode(i + 65)}${index + 1}"),
                    isEnabled: index != 0,
                  ),
                )),
      ));
    }

    return Column(children: widgets);
  }
}
