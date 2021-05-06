import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_mate/ProfileSetupScreens/Gender.dart';
import 'package:http/http.dart' as http;

class SetProfile extends StatefulWidget {
  @override
  _SetProfileState createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<Gender> genders = new List<Gender>();
  DateTime _selectedDate;
  Position _currentPosition;
  String _currentAddress;
  String Phonenum;
  String emailll;
  String pasword;
  bool Genderselected= false;
  var gender;
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _bloodGroup = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _insurance = TextEditingController();
  TextEditingController _emergencyName = TextEditingController();
  TextEditingController _emergencyNum = TextEditingController();
  @override
  void initState() {
    super.initState();
    getSignupValues();
    genders.add(new Gender("Male",'assets/Profile_Images/male.png' , false));
    genders.add(new Gender("Female",'assets/Profile_Images/female.png' , false));
    genders.add(new Gender("Others",'assets/Profile_Images/other.png' , false));
    _firstName.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _lastName.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _dob.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _bloodGroup.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _location.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _insurance.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _emergencyName.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _emergencyNum.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }
  getSignupValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      Phonenum = prefs.getString('PhoneNumber') ?? '';
      emailll = prefs.getString('email') ?? '';
      pasword = prefs.getString('password') ?? '';
  }
  String validateMobile(String value) {
    String patttern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please Enter Phone Number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please Enter a Valid Phone Number';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          height: 20.0,
          width: 20.0,
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset('assets/Profile_Images/arrow_back.png')),
        ),
        title: Text("Setup Profile",
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
          autovalidateMode: AutovalidateMode.always,
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('First Name',
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
                  controller: _firstName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCD0D5)),
                    ),
                    hintText: 'Enter First Name',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Last Name',
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
                  controller: _lastName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCD0D5)),
                    ),
                    hintText: 'Enter Last Name',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Gender',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 110.0,
                width: 335.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: genders.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            genders.forEach((gender) => gender.isSelected = false);
                            genders[index].isSelected = true;
                            Genderselected= true;
                            gender= genders[index].name;
                          });
                        },
                        child: CustomRadio(genders[index]),
                      );
                    }),
              ),
              SizedBox(height: 30.0),
              Text('Date of Birth',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                  controller: _dob,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCD0D5)),
                    ),
                    hintText: 'Select Date of Birth',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                    suffixIcon:
                    IconButton(
                        icon: Icon(
                            Icons.calendar_today_outlined
                        ),
                        onPressed: () {
                          _selectDate(context);
                          setState(() {
                          });
                        }),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Select Blood Group',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                  controller: _bloodGroup,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffCCD0D5)),
                      ),
                      hintText: 'Select Blood Group',
                      hintStyle: TextStyle(
                        color: Color(0xff02122C),
                        fontSize: 12.0,
                      ),
                      suffixIcon:
                      new DropdownButton<String>(
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        items: <String>['A+', 'A-', 'B+', 'B-','O+','O-'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (String data) {
                          setState(() {
                            _bloodGroup.text = data;
                          });
                        },
                      )
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  Text('Mailing Address',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff02122C)
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Container(
                      child:IconButton(
                          icon: Icon(Icons.my_location_sharp),
                          onPressed: () {
                            _getCurrentLocation();
                            setState(() {
                              if (_currentAddress != null) {
                                _location.text= (_currentAddress);
                              }
                            });
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      child: GestureDetector(
                          onTap: () {},
                          child: Text("Use Current Location",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12.0,
                                color: Color(0xff699CAF)),)),
                    ),
                  ),
                ],
              ),
              Container(
                width: 335.0,
                height: 44.0,
                child: TextFormField(
                  controller: _location,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCD0D5)),
                    ),
                    hintText: 'Enter Mailing Address',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Insurance Information',
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
                  controller: _insurance,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCD0D5)),
                    ),
                    hintText: 'Enter Insurance Information',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Emergency Contact Name',
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
                  controller: _emergencyName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCD0D5)),
                    ),
                    hintText: 'Enter Emergency Contact Name',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Text('Emergency Number',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xff02122C)
                ),
              ),
              SizedBox(height: 05.0),
              Container(
                width: 335.0,
                //height: 44.0,
                child: TextFormField(
                  controller: _emergencyNum,
                  validator: validateMobile,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffCCD0D5)),
                    ),
                    hintText: 'Enter Emergency Number',
                    hintStyle: TextStyle(
                      color: Color(0xff02122C),
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                      width: 336.0,
                      height: 68.0,
                      child: Text("Note: Name, Gender, Date of Birth & Blood Group once\n" ""
                          "entered cannot be edited later.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xff02122C)
                        ),
                      )
                  ),
                ),
              ),
              Container(
                width: 336.0,
                height: 85.0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("By selecting",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xff25414A)),),
                        Text(" ‘Create my account’ ", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Color(0xff25414A)
                        ),),
                        Text("below, I agree to", style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xff25414A)),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Southwest Michigan Dermatology ’s ", style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xff25414A)),),
                        Text("Terms of Use ", style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12.0,
                            color: Color(0xff25414A)),),
                        Text("and", style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xff25414A)),),
                      ],
                    ),
                    Text("Privacy Policy.", style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12.0,
                        color: Color(0xff25414A)),),
                  ],
                ),
              ),
              ButtonTheme(
                child: Container(
                  width: 335.0,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_firstName.text.isEmpty || _lastName.text.isEmpty||
                            _dob.text.isEmpty|| _bloodGroup.text.isEmpty||
                            _location.text.isEmpty || _insurance.text.isEmpty||
                            _emergencyName.text.isEmpty|| _emergencyNum.text.isEmpty ||
                            Genderselected ==false)
                          return 'Fill all fields';
                        else if(formkey.currentState.validate()) {
                          registerUser();
                        };
                      },
                      child: Text('CREATE MY ACCOUNT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color(0xffFFFFFF),
                        ),),
                      style: ElevatedButton.styleFrom(
                          primary:(_firstName.text.isEmpty || _lastName.text.isEmpty||
                              _dob.text.isEmpty|| _bloodGroup.text.isEmpty||
                              _location.text.isEmpty || _insurance.text.isEmpty||
                              _emergencyName.text.isEmpty|| _emergencyNum.text.isEmpty ||
                              Genderselected ==false)
                              ? Colors.blueGrey[100]
                              : Color(0xff749BAD),
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.red,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _dob
        ..text = DateFormat('dd-MM-yyyy').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dob.text.length,
            affinity: TextAffinity.upstream));
    }

  }
  void _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
  Future registerUser() async {
    var APIURL = Uri.parse("http://65.0.55.180/skinmate/v1.0/customer/registration");
    Map mapeddata = {
      'phoneNumber': Phonenum,
      'email': emailll,
      "firstName": _firstName.text,
      "lastName": _lastName.text,
      "gender": gender,
      "dob": _dob.text,
      "bloodGroup": _bloodGroup.text,
      "loginType": "Flutter",
      "password": pasword,
      "address": _location.text,
      "emergency Number": _emergencyNum.text,
      "insuranceInformation": _insurance.text,
      "emeregencyContactName": _emergencyName.text

    };
    http.Response response = await http.post(APIURL, body: mapeddata);
    var data = jsonDecode(response.body);
    var code = (data[0]['Code']);
    print("code is:"+code);
    if (code == 200) {
      //Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
    }
    else {
      final snackBar = SnackBar(
        content: Text("Please Enter Valid Details"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}




