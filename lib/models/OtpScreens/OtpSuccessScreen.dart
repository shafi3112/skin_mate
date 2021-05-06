import 'package:flutter/material.dart';
import 'package:skin_mate/ProfileSetupScreens/SetProfile.dart';

  Widget SuccessAlert(BuildContext context) {
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0.0),
                  topLeft: Radius.circular(32.0),
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(32.0)
              ),
            ),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 276.0,
              height: 337.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: Center(
                      child: Container(
                          width: 48,
                          height: 47,
                          child: Image.asset('assets/images/success.png')
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: Container(
                          width: 226.0,
                          height: 40,
                          child: Text("The OTP has been\n"
                              " succesfully verified",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff112027)
                            ),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Container(
                          width: 225.0,
                          height: 100.0,
                          child: Text("A verification mail has been\n"
                              " sent to your mail id.Kindly verify\n"
                              " it for proceeding.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xff02122C)
                            ),
                          )
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 13.0),
                      decoration: BoxDecoration(
                        color: Color(0xff749BAD),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) =>
                              SetProfile()));
                        },
                        child: Text("OKAY",
                          style: TextStyle(color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }