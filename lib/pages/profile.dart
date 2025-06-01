import 'package:chatapp/pages/onboarding.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/shared_pref.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? myUsername, myName, myEmail, mypicture;

  getthesahredpref() async {
    myUsername = await SharedpreferenceHelper().getUserName();
    myName = await SharedpreferenceHelper().getUserDisplayName();
    myEmail = await SharedpreferenceHelper().getUserEmail();
    mypicture = await SharedpreferenceHelper().getUserImage();
    print(myUsername);

    setState(() {});
  }

  @override
  void initState() {
    getthesahredpref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff703eff),
      body: myName == null
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(60),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60)),
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xff406fd9),
                                size: 30.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 30.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          child: Column(
                            children: [
                              Center(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.network(
                                  mypicture!,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              )),
                              SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                child: Material(
                                  elevation: 3.0,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Icon(
                                        Icons.person_outline,
                                        color: Color(0xff406fd9),
                                        size: 35.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            myName!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                child: Material(
                                  elevation: 3.0,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 10.0,
                                        bottom: 10.0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(children: [
                                      Icon(
                                        Icons.mail_outline,
                                        color: Color(0xff406fd9),
                                        size: 35.0,
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Email",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            myEmail!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await AuthMethods().SignOut().then((value) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Onboarding()));
                                  });
                                },
                                child: Container(
                                  child: Material(
                                    elevation: 3.0,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          top: 15.0,
                                          bottom: 15.0),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(children: [
                                        Icon(
                                          Icons.logout,
                                          color: Color(0xff406fd9),
                                          size: 35.0,
                                        ),
                                        SizedBox(
                                          width: 30.0,
                                        ),
                                        Text(
                                          "LogOut",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xff406fd9),
                                          size: 30.0,
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await AuthMethods()
                                      .deleteuser()
                                      .then((value) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Onboarding()));
                                  });
                                },
                                child: Container(
                                  child: Material(
                                    elevation: 3.0,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          top: 15.0,
                                          bottom: 15.0),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(children: [
                                        Icon(
                                          Icons.delete,
                                          color: Color(0xff406fd9),
                                          size: 35.0,
                                        ),
                                        SizedBox(
                                          width: 30.0,
                                        ),
                                        Text(
                                          "Delete Account",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xff406fd9),
                                          size: 30.0,
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ],
              ),
            ),
    );
  }
}
