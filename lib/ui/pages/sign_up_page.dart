part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationDataModel registrationDataModel;

  SignUpPage(this.registrationDataModel);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();

    nameController.text = widget.registrationDataModel.name;
    emailController.text = widget.registrationDataModel.email;
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ThemeBloc>(context).add(ChangeTheme(ThemeData().copyWith(primaryColor: Colors.grey)));

    return WillPopScope(
        onWillPop: () {
          BlocProvider.of<PageBloc>(context).add(GoToSplashPage());
          return Future.value(false);
        },
        child: Scaffold(
          body: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 20, bottom: 22),
                      height: 56,
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<PageBloc>(context).add(GoToSplashPage());
                                  },
                                  child: Icon(Icons.arrow_back,
                                      color: Colors.black))),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Create New\nAccount",
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center,
                              )),
                        ],
                      )),
                  Container(
                      width: 90,
                      height: 104,
                      child: Stack(
                        children: <Widget>[
                          Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: (widget.registrationDataModel
                                                  .profileImage ==
                                              null)
                                          ? AssetImage("assets/user_pic.png") as ImageProvider
                                          : FileImage(widget
                                              .registrationDataModel
                                              .profileImage ?? File(""))))),
                          GestureDetector(
                            onTap: () async {
                              if (widget.registrationDataModel.profileImage ==
                                  null) {
                                widget.registrationDataModel.profileImage =
                                    await getImage();
                              } else {
                                widget.registrationDataModel.profileImage =
                                    null;
                              }

                              setState(() {});
                            },
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage((widget
                                                        .registrationDataModel
                                                        .profileImage ==
                                                    null)
                                                ? "assets/btn_add_photo.png"
                                                : "assets/btn_del_photo.png"))))),
                          ),
                        ],
                      )),
                  SizedBox(height: 36),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Full Name",
                                hintText: "Full Name"),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Email",
                                hintText: "Email"),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Password",
                                hintText: "Password"),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            obscureText: true,
                            controller: reTypePasswordController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: "Confirm Password",
                                hintText: "Confirm Password"),
                          ),
                          SizedBox(height: 30),
                          FloatingActionButton(
                            onPressed: () {
                              if (!(nameController.text.trim() != "" &&
                                  emailController.text.trim() != "" &&
                                  passwordController.text.trim() != "" &&
                                  reTypePasswordController.text.trim() != "")) {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xffff5c83),
                                  message: "Please fill all the fields",
                                )..show(context);
                              } else if (passwordController.text !=
                                  reTypePasswordController.text) {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xffff5c83),
                                  message:
                                      "Mismatch password and confirmed password",
                                )..show(context);
                              } else if (passwordController.text.length < 6) {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xffff5c83),
                                  message: "Password's length min 6 characters",
                                )..show(context);
                              } else if (!EmailValidator.validate(
                                  emailController.text)) {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xffff5c83),
                                  message: "Wrong formatted email address",
                                )..show(context);
                              } else {
                                widget.registrationDataModel.name =
                                    nameController.text;
                                widget.registrationDataModel.email =
                                    emailController.text;
                                widget.registrationDataModel.password =
                                    passwordController.text;

                                BlocProvider.of<PageBloc>(context).add(GoToPreferencePage(
                                    widget.registrationDataModel));

                              }
                            },
                            child: Icon(Icons.arrow_forward),
                            backgroundColor: mainColor,
                            elevation: 0,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
