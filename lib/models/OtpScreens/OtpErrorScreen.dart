import 'package:flutter/material.dart';
import 'package:skin_mate/models/OtpScreens/OtpMainScreen.dart';

Widget openErrorAlert(BuildContext context) {
  Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0.0),
                    topLeft:  Radius.circular(32.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(32.0)
                ),
              ),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                width: 276.0,
                height: 290.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 43.0),
                      child: Center(
                        child: Container(
                            width: 28.3,
                            height: 44.3,
                            child: Image.asset('assets/images/error.png')
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: Container(
                            width: 226.0,
                            height: 40,
                            child: Text("Invalid OTP",
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
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Center(
                        child: Container(
                            width: 225.0,
                            height: 60.0,
                            child: Text("OTP validation failed,\n""Please retry",
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
                        width: 276.0,
                        height: 57.7,
                        padding: EdgeInsets.only(top: 17.0,bottom: 15.0),
                        decoration: BoxDecoration(
                          color: Color(0XFF749BAD),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(32.0)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            OtpScreen(context);
                          },
                          child: Text("RETRY",
                            style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.bold,),
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