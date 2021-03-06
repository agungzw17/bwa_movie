part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xff503E9F);
Color accentColor1 = Color(0xff2C1F63);
Color accentColor2 = Color(0xfffbd460);
Color accentColor3 = Color(0xffadadad);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle purpleTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);

TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: accentColor3);
TextStyle yellowNumberFont =
    GoogleFonts.openSans().copyWith(color: accentColor2);
