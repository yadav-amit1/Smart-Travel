import 'package:flutter/material.dart';

Widget buildTextField(
    IconData icon, String hintText, bool isPassword1, bool isEmail) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextField(
      obscureText: isPassword1,
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
      onChanged: (newValue) {
        print(newValue);
      },
    ),
  );
}

Widget buildReenterPassword(IconData icon, String hintText, bool isPassword2) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextField(
      obscureText: isPassword2,
      keyboardType: isPassword2 ? TextInputType.text : TextInputType.text,
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
      onChanged: (value) {
        print(value);
      },
    ),
  );
}

Widget buildPhoneField(IconData icon, String hintText, bool isNumber) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextField(
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
      onChanged: (value) {
        print(value);
      },
    ),
  );
}
