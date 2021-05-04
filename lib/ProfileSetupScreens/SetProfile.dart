
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:skin_mate/ProfileSetupScreens/Gender.dart';

class SetProfile extends StatefulWidget {
  @override
  _SetProfileState createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  List<Gender> genders = new List<Gender>();
  DateTime _selectedDate;
  Position _currentPosition;
  String _currentAddress;
  bool Genderselected= false;
  TextEditingController _myController1 = TextEditingController();
  TextEditingController _myController2 = TextEditingController();
  TextEditingController _myController3 = TextEditingController();
  TextEditingController _myController4 = TextEditingController();
  TextEditingController _myController5 = TextEditingController();
  TextEditingController _myController6 = TextEditingController();
  TextEditingController _myController7 = TextEditingController();
  TextEditingController _myController8 = TextEditingController();
  @override
  void initState() {
    super.initState();
    genders.add(new Gender("Male",'assets/Profile_Images/male.png' , false));
    genders.add(new Gender("Female",'assets/Profile_Images/female.png' , false));
    genders.add(new Gender("Others",'assets/Profile_Images/other.png' , false));
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
    _myController5.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _myController6.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _myController7.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _myController8.addListener(() {
      setState(() {}); // setState every time text changes
    });
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
                  controller: _myController1,
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
                  controller: _myController2,
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
                  controller: _myController3,
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
                  controller: _myController4,
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
                            _myController4.text = data;
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
                                _myController5.text= (_currentAddress);
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
                  controller: _myController5,
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
                  controller: _myController6,
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
                  controller: _myController7,
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
                height: 44.0,
                child: TextFormField(
                  controller: _myController8,
                  decoration: InputDecoration(
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
                  child: RaisedButton(
                      child: Text('CREATE MY ACCOUNT',
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
                            _myController4.text.isEmpty || _myController5.text.isEmpty || _myController6.text
                            .isEmpty || _myController7.text.isEmpty ||
                            _myController8.text.isEmpty || Genderselected ==false)
                          print("please fill all the fields");
                        else {}
                      },
                      color: _myController1.text.isEmpty || _myController2.text
                          .isEmpty || _myController3.text.isEmpty ||
                          _myController4.text.isEmpty || _myController5.text.isEmpty || _myController6.text
                          .isEmpty || _myController7.text.isEmpty ||
                          _myController8.text.isEmpty || Genderselected ==false
                          ? Colors.blueGrey[100]
                          : Color(0xff749BAD)
                  ),
                ),
              ),
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
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _myController3
        ..text = DateFormat('dd-MM-yyyy').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _myController3.text.length,
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
}




