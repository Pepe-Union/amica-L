#SplashScreen

Use the SplashScreen template with basic widgets and validations. You can also customize it. And you can use the below snippet to navigate to the login screen from any action.

````
Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SplashScreen()));
````
class MyHomePage2 extends StatelessWidget {
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "By tapping log in ,you agree with our teams of"
                  " service and privacy policy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 0, fontFamily: 'Poppins1'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Material(
                  elevation: 0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Login.id);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    height: 55.0,
                    minWidth: 320,
                    child: Text(
                      'Log in with email address',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontSize: 17),
                    ),
                    splashColor: Colors.red,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Text('Or',
                    style: TextStyle(
                      fontFamily: "Poppins1",
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Material(
                  elevation: 0,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(OtpScreen.id);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    height: 55.0,
                    minWidth: 320,
                    child: Text(
                      'Log in with phone number',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.red,
                          fontSize: 17),
                    ),
                    splashColor: Colors.white,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Text('Or',
                    style: TextStyle(
                      fontFamily: "Poppins1",
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      heroTag: "c",
                      child: Image.asset('assets/images/download.jpeg'),
                      onPressed: () {},
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      heroTag: "b",
                      child: Image.asset(
                          'assets/images/facebook-hd-png-facebook-png-hd-png-image-2023.png'),
                      onPressed: () {},
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      heroTag: "a",
                      child: Image.asset('assets/images/download.png'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "We don't post anything to any platform",
                  textAlign: TextAlign.center,
                  style: TextStyle(letterSpacing: 0, fontFamily: 'Poppins1'),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
