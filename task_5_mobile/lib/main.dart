import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HNG Task 2',
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController();
  final trackController = TextEditingController();

  String name = '';
  String track = '';

  @override
  void dispose() {
    nameController.dispose();
    trackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'HNG Task 2',
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Name: $name',
              style: TextStyle(color: Colors.grey[600], fontSize: 30),
            ),
            Text(
              'Track: $track',
              style: TextStyle(color: Colors.grey[600], fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: nameController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your name',
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: trackController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.book),
                        hintText: 'Enter your track',
                      ),
                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: new RaisedButton(
                        color: Colors.blueGrey,
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {
                            name = nameController.text;
                            track = trackController.text;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var url = "https://hng.tech/";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        // onTap = () async {
                        //   var url = "https://flutter-examples.com";
                        //   if (await canLaunch(url)) {

                        //     await launch(url);
                        //   } else {
                        //     throw 'Could not launch $url';
                        //   }
                        // }
                        child: Container(
                          height: 34.0,
                          width: 34.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage('assets/images/hng1.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = "https://ingressive.org/";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          height: 34.0,
                          width: 34.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage('assets/images/ing.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = "https://internship.zuri.team/";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          height: 34.0,
                          width: 34.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage('assets/images/zuri.jpeg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
