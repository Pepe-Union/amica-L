#firebase_auth plugin
A Flutter plugin to use the Firebase Authentication API.

Add this to your package's pubspec.yaml file:

````
dependencies:
  firebase_auth:
````
2. Install it
You can install packages from the command line:

with Flutter:

````
$ flutter pub get
````

###Usage
####Configure the Google sign-in plugin
The Google Sign-in plugin is required to use the firebase_auth plugin for Google authentication. Follow the Google sign-in plugin installation instructions.

If you're using Google Sign-in with Firebase auth, be sure to include all required fields in the OAuth consent screen. If you don't, you may encounter an ApiException.

``
Import the firebase_auth plugin
``
To use the firebase_auth plugin, follow the plugin installation instructions.

###Android integration
Enable the Google services by configuring the Gradle scripts as such.

Add the classpath to the [project]/android/build.gradle file.
````
dependencies {
  // Example existing classpath
  classpath 'com.android.tools.build:gradle:3.2.1'
  // Add the google services classpath
  classpath 'com.google.gms:google-services:4.3.0'
}
````
Add the apply plugin to the [project]/android/app/build.gradle file.
// ADD THIS AT THE BOTTOM
````
apply plugin: 'com.google.gms.google-services'
````
Note: If this section is not completed you will get an error like this:

````
java.lang.IllegalStateException:
Default FirebaseApp is not initialized in this process [package name].
Make sure to call FirebaseApp.initializeApp(Context) first.
````
Note: When you are debugging on android, use a device or AVD with Google Play services. Otherwise you will not be able to authenticate.

####Use the plugin
Add the following imports to your Dart code:

````
import 'package:firebase_auth/firebase_auth.dart';
Initialize GoogleSignIn and FirebaseAuth:

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
You can now use the Firebase _auth to authenticate in your Dart code, e.g.

Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  print("signed in " + user.displayName);
  return user;
}
````
Then from the sign in button onPress, call the _handleSignIn method using a future callback for both the FirebaseUser and possible exception.

````
_handleSignIn()
    .then((FirebaseUser user) => print(user))
    .catchError((e) => print(e));
Register a user #
final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: 'an email',
      password: 'a password',
    ))
        .user;
````

###After authentication
After a successful authentication, you will receive a FirebaseUser object. You can use this object to check if the email is verified, to update email, to send verification email and so on. See the FirebaseUser API documentation for more details on the FirebaseUser object.

###iOS setup
Enable Phone as a Sign-In method in the Firebase console
When testing you can add test phone numbers and verification codes to the Firebase console.
Enable App verification
Note: App verification may use APNs, if using a simulator (where APNs does not work) or APNs is not setup on the device you are using you must set the URL Schemes to the REVERSE_CLIENT_ID from the GoogleServices-Info.plist file.

###Android setup
Enable Phone as a Sign-In method in the Firebase console
When testing you can add test phone numbers and verification codes to the Firebase console.