part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationDataModel registrationDataModel;

  AccountConfirmationPage(this.registrationDataModel);
  @override
  State<AccountConfirmationPage> createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    print("gambarnya ${widget
        .registrationDataModel.profileImage}");
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<PageBloc>(context).add(GoToPreferencePage(widget.registrationDataModel));

        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 20, bottom: 90),
                        height: 56,
                        child: Stack(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                    onTap: () {

                                      BlocProvider.of<PageBloc>(context).add(GoToPreferencePage(
                                          widget.registrationDataModel));
                                    },
                                    child: Icon(Icons.arrow_back,
                                        color: Colors.black))),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Confirm\nNew Account",
                                  style: blackTextFont.copyWith(fontSize: 20),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: (widget.registrationDataModel
                                            .profileImage ==
                                        null)
                                    ? AssetImage("assets/user_pic.png") as ImageProvider
                                    : FileImage(widget
                                        .registrationDataModel.profileImage ?? File(''))))),
                    Text("Welcome",
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w300)),
                    Text("${widget.registrationDataModel.name}",
                        style: blackTextFont.copyWith(fontSize: 20)),
                    SizedBox(height: 110),
                    (isSigningUp)
                        ? SpinKitFadingCircle(
                            color: Color(0xff3e9d9d), size: 45)
                        : SizedBox(
                            width: 250,
                            height: 45,
                            child: RaisedButton(
                                onPressed: () async {
                                  setState(() {
                                    isSigningUp = true;
                                  });

                                  imageFileToUpload = widget
                                      .registrationDataModel.profileImage;

                                  SignInSignUpResult result =
                                      await AuthServices.signUp(
                                          widget.registrationDataModel.email,
                                          widget.registrationDataModel.password,
                                          widget.registrationDataModel.name,
                                          widget.registrationDataModel
                                              .selectedGenres,
                                          widget.registrationDataModel
                                              .selectedLang);

                                  if (result.userModel == null) {
                                    setState(() {
                                      isSigningUp = false;
                                    });

                                    Flushbar(
                                      duration: Duration(milliseconds: 1500),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Color(0xffff5c83),
                                      message: "${result.message}",
                                    )..show(context);
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                color: Color(0xff3e9d9d),
                                child: Text("Create My Account",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 16))))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
