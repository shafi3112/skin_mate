import 'package:skin_mate/models/OtpScreens/OtpMainScreen.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _passwordVisible = true;
  int OTP= 230346;
  TextEditingController _myController1 = TextEditingController();
  TextEditingController _myController2 = TextEditingController();
  TextEditingController _myController3 = TextEditingController();
  TextEditingController _myController4 = TextEditingController();

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
    _myController1.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _myController2.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _myController3.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _myController4.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  /*@override
  void dispose() {
    _myController1.dispose();
    _myController2.dispose();
    _myController3.dispose();
    _myController4.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 20.0,
          width: 20.0,
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset('assets/Profile_Images/arrow_back.png')),
        ),
        title: Text("Sign Up",
          style: TextStyle(
            color: Color(0xff112027),
            fontSize: 17,

          ),),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('Phone Number',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                  controller: _myController1,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Number',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Email Id',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                    controller: _myController2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(
                        color: Color(0xff02122C),
                        fontSize: 12.0,
                      ),
                    ),
                    onChanged: (val) {
                      // setState(() => email = val);
                    }
                ),
              ),
              SizedBox(height: 30.0),
              Text('Set Password',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                    obscureText: !_passwordVisible,
                    controller: _myController3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                        color: Color(0xff02122C),
                        fontSize: 12.0,
                      ),
                      suffixIcon:
                      IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                              //print("Icon button pressed! state: $_passwordVisible"); //Confirmed that the _passwordVisible is toggled each time the button is pressed.
                            });
                          }),
                    ),
                    onChanged: (val) {
                      // setState(() => password = val);
                    }
                ),
              ),
              SizedBox(height: 30.0),
              Text('Confirm Password',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                    obscureText: !_passwordVisible,
                    controller: _myController4,
                    validator: (value) {
                      if (value != _myController3.text) {
                        return 'Password is not matching';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: Color(0xff02122C),
                        fontSize: 12.0,
                      ),
                      suffixIcon:
                      IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible =
                              !_passwordVisible; // print("Icon button pressed! state: $_passwordVisible"); //Confirmed that the _passwordVisible is toggled each time the button is pressed.
                            });
                          }),
                    ),
                    onChanged: (val) {
                      // setState(() => password = val);
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: ButtonTheme(
                  child: Container(
                    width: 335.0,
                    height: 50.0,
                    child: RaisedButton(
                        child: Text('PROCEED',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        textColor: Color(0xffFFFFFF),
                        onPressed: () {
                          if (_myController1.text.isEmpty || _myController2.text
                              .isEmpty || _myController3.text.isEmpty ||
                              _myController4.text.isEmpty)
                            print("please fill all the fields");
                          else {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => OtpMainscreen()));
                          }
                        },
                        color: (_myController1.text.isEmpty ||
                            _myController2.text.isEmpty ||
                            _myController3.text.isEmpty ||
                            _myController4.text.isEmpty)
                            ? Colors.blueGrey[100]
                            : Color(0xff749BAD)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "The  Mobile Number will be verified with One Time Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff25414A)
                        ),)),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Existing User?",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff749BAD)),),
                  GestureDetector(
                    onTap: () {
                      //Navigator.push(
                          //context, MaterialPageRoute(builder: (_) => SignInPage())); //navigate to sigin page
                    },
                    child: Text(" Sign In", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Color(0xff749BAD)
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text('Privacy Policy . Terms and Conditions',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.0,
                      color: Color(0xff749BAD)
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}