part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    "Horror",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime"
  ];
  final List<String> languages = ["English", "Japanese", "Korean"];
  final RegistrationDataModel registrationDataModel;

  PreferencePage(this.registrationDataModel);
  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrationDataModel.password = "";

        BlocProvider.of<PageBloc>(context).add(GoToRegistrationPage(widget.registrationDataModel));
        return Future.value(true);
      },
      child: Scaffold(
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 56,
                        margin: EdgeInsets.only(top: 20, bottom: 4),
                        child: GestureDetector(
                            onTap: () {
                              widget.registrationDataModel.password = "";
                              BlocProvider.of<PageBloc>(context).add(GoToRegistrationPage(
                                  widget.registrationDataModel));
                            },
                            child: Icon(Icons.arrow_back))),
                    Text(
                      "Select Your Four\nFavorite Genres",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: generateGenreWidget(context),
                      ),
                    ),
                    Text(
                      "Movie Language\nYou Prefer",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: generateLangWidget(context),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: mainColor,
                        child: Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (selectedGenres.length != 4) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xffff5c83),
                              message: "Please select 4 genres",
                            )..show(context);
                          } else {
                            widget.registrationDataModel.selectedGenres =
                                selectedGenres;
                            widget.registrationDataModel.selectedLang =
                                selectedLanguage;

                            BlocProvider.of<PageBloc>(context).add(
                                GoToAccountConfirmationPage(
                                    widget.registrationDataModel));
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  List<Widget> generateGenreWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 26) / 2;

    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenres.contains(e),
              onTap: () {
                onSelectGenre(e);
              },
            ))
        .toList();
  }

  List<Widget> generateLangWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 26) / 2;

    return widget.languages
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedLanguage == e,
              onTap: () {
                setState(() {
                  selectedLanguage = e;
                });
              },
            ))
        .toList();
  }

  void onSelectGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
