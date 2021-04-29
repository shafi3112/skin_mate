import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Text("Welcome to",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),)),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Container(
                      width: 130.0,
                      height: 40,
                      child: Text("SkinMate",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Center(
                    child: Container(
                        width: 70,
                        height: 90,
                        child: Image.asset('asset/images/logo1.jpg')),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.asset('asset/images/logo2.png')),
              ),
            ),
            Padding(
              //padding: EdgeInsets.symmetric(vertical: 110.0),
              padding: const EdgeInsets.only(top:90.0),
              child: Container(
                constraints: BoxConstraints.expand(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.width,
                    height: 300.0
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(0.0)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,right: 15.0,top:50.0,bottom: 0),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 60.0,
                        buttonColor: Colors.blueGrey[800],
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            child: Text('SIGN UP',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(28.0),
                              side: BorderSide(color: Colors.blue.shade100),
                            ),
                            textColor: Colors.white,
                            onPressed: () {
                              //Navigator.push(
                               //   context, MaterialPageRoute(builder: (_) => SignupScreen()));
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 13.0, bottom: 0),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 60.0,
                        buttonColor: Colors.blueGrey[400],
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            child: Text('SIGN IN',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(28.0),
                              side: BorderSide(color: Colors.blueGrey[500]),
                            ),
                            textColor: Colors.white,
                            onPressed: () {
                              //Navigator.push(
                                 // context, MaterialPageRoute(builder: (_) => SignInPage()));
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Text('Privacy Policy . Terms and Conditions',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.blueGrey
                      ),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}