import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_page';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String userName;
  String mobileNumber;
  String email;
  String password;

  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF320D36),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'REGISTRATION',
          style: GoogleFonts.roboto(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 80),
          padding: EdgeInsets.only(left: 50, right: 20),
          // height: 600,
          width: 400,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  buildTextField(
                      Icons.account_circle, 'Username', false, false),
                  SizedBox(
                    height: 10,
                  ),
                  buildEmailField(Icons.email_rounded, 'E-mail', false, true),
                  SizedBox(
                    height: 10,
                  ),
                  buildPassword(Icons.lock_rounded, 'Password', true),
                  SizedBox(
                    height: 10,
                  ),
                  buildRePassword(
                      Icons.lock_rounded, 'Re-enter Password', true),
                  SizedBox(
                    height: 10,
                  ),
                  buildMobileField(Icons.call, 'Mobile Number', true),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 230,
                    margin: EdgeInsets.only(top: 20),
                    child: RichText(
                      text: TextSpan(
                        text: "On clicking 'Register' you agree to our ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            // recognizer: ,
                            text: "terms and condition",
                            style: TextStyle(
                              color: Colors.yellowAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 92,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            print(userName);
                            print(mobileNumber);
                            print(email);
                            print(password);
                            print('New account registered successfully.');
                            if (_formKey.currentState.validate()) {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return;
                                  },
                                ),
                              );
                            } else {
                              return;
                            }
                          },
                          child: Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      IconData icon, String hintText, bool isPassword1, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        obscureText: isPassword1,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please enter username";
          }
          return null;
        },
        onSaved: (name) {
          userName = name;
        },
        onChanged: (name) {
          userName = name;
        },
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildEmailField(
      IconData icon, String hintText, bool isPassword1, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        obscureText: isPassword1,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please enter email";
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return "Please enter valid email";
          }
          return null;
        },
        onSaved: (String email) {
          email = email;
        },
        onChanged: (value) {
          email = value;
        },
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildMobileField(IconData icon, String hintText, bool isNumber) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        validator: (String value) {
          if (value.isEmpty) {
            return "Please enter Mobile number";
          }
          if (value.length < 10 || value.length > 10) {
            return "Please enter valid Mobile number";
          }
          return null;
        },
        onSaved: (number) {
          mobileNumber = number;
        },
        onChanged: (value) {
          mobileNumber = value;
        },
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildPassword(IconData icon, String hintText, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: _password,
        obscureText: isPassword,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please enter password";
          }
          return null;
        },
        keyboardType: isPassword ? TextInputType.text : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildRePassword(IconData icon, String hintText, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: _confirmpassword,
        obscureText: isPassword,
        validator: (String value) {
          if (value.isEmpty) {
            return "Please Re-enter password";
          }
          if (_password.text != _confirmpassword.text) {
            return "Password Mismatch";
          }
          return null;
        },
        keyboardType: isPassword ? TextInputType.text : TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
