import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:skin_mate/models/OtpScreens/OtpErrorScreen.dart';
import 'package:skin_mate/models/OtpScreens/OtpSuccessScreen.dart';

class OtpMainscreen extends StatefulWidget {
  @override
  _OtpMainscreenState createState() => _OtpMainscreenState();
}

class _OtpMainscreenState extends State<OtpMainscreen> {
  TextEditingController _myController5 = TextEditingController();
  @override
  void initState() {
    _myController5.addListener(() {// setState every time text changes
    });
  }
  /*@override
  void dispose() {
    _myController5.dispose();
  }*/

  @override
  Widget build(context) {
    return Scaffold(
        body: bottomscreen(context)
    );
  }
  Widget bottomscreen(BuildContext context)
  {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),),
        ),
        builder: (context) =>
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                constraints: BoxConstraints.expand(
                    width: 375.0,
                    height: 419.0
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 36.5),
                        child: Center(
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 60,
                            child: Text("Enter OTP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Color(0xff02122C)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32.5),
                        child: Center(
                          child: Container(
                              width: 60,
                              height: 60,
                              child: Image.asset('assets/images/phone.png')
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 29.0),
                        child: Center(
                          child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 60,
                            child: Text("Please enter OTP sent to\n"
                                "(598) 4995515",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xff02122C
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 40.0),
                            Container(
                              height: 46.0,
                              width: 333.0,
                              child: TextFormField(
                                controller: _myController5,
                                //keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 32.0),
                            child: buildTimer(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 190.0, right: 10.0, top: 32.0, bottom: 0),
                            child: Container(
                                child: Text("Resend OTP",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xffCCD0D5),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ButtonTheme(
                          minWidth: 340.0,
                          height: 60.0,
                          buttonColor: (_myController5.text.isEmpty)
                              ? Colors.blueGrey[100]
                              : Color(0xff749BAD),
                          child: Container(
                            child: RaisedButton(
                                child: Text('CONFIRM',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                textColor: Colors.white,
                                onPressed: () {
                                  if (_myController5.text.isEmpty)
                                    print("please Enter OTP");
                                  else {
                                    if (_myController5.text == "123456")
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (_) => OtpScreen()));
                                    else
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (_) =>
                                                OtpErrorscreen()));
                                  }
                                }
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ),
      );
    });
  }
  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0.0),
          duration: Duration(seconds: 60),
          builder: (_, value, child) =>
              Text(
                "0m ${value.toInt()}s",
              ),
        ),
      ],
    );
  }
}
