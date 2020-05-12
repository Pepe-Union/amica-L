#Cloud Firestore
A Flutter plugin to use the Cloud Firestore API.

###Setup
To use this plugin:

Using the Firebase Console, add an Android app to your project: Follow the assistant, download the generated google-services.json file and place it inside android/app. Next, modify the android/build.gradle file and the android/app/build.gradle file to add the Google services plugin as described by the Firebase assistant. Ensure that your android/build.gradle file contains the maven.google.com as described here.
Using the Firebase Console, add an iOS app to your project: Follow the assistant, download the generated GoogleService-Info.plist file, open ios/Runner.xcworkspace with Xcode, and within Xcode place the file inside ios/Runner. Don't follow the steps named "Add Firebase SDK" and "Add initialization code" in the Firebase assistant.
Add cloud_firestore as a dependency in your pubspec.yaml file.

Add this to your package's pubspec.yaml file:

````
dependencies:
  cloud_firestore:
````
2. Install it
You can install packages from the command line:

with Flutter:

````
$ flutter pub get
````

###Usage #
````
import 'package:cloud_firestore/cloud_firestore.dart';
````
Adding a new DocumentReference:
````
Firestore.instance.collection('books').document()
  .setData({ 'title': 'title', 'author': 'author' });
````
Binding a CollectionReference to a ListView:
````
class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('books').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ' + snapshot.error);
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document['title']),
                  subtitle: new Text(document['author']),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
````
Performing a query:

````
Firestore.instance
    .collection('talks')
    .where("topic", isEqualTo: "flutter")
    .snapshots()
    .listen((data) =>
        data.documents.forEach((doc) => print(doc["title"])));
````
Get a specific document:

````
Firestore.instance
        .collection('talks')
        .document('document-name')
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot
    });
````
Running a transaction:

````
final DocumentReference postRef = Firestore.instance.document('posts/123');
Firestore.instance.runTransaction((Transaction tx) async {
  DocumentSnapshot postSnapshot = await tx.get(postRef);
  if (postSnapshot.exists) {
    await tx.update(postRef, <String, dynamic>{'likesCount': postSnapshot.data['likesCount'] + 1});
  }
});
````