// ignore_for_file: body_might_complete_normally_catch_error

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/screens/auth_screens/Signin_screen.dart';
import 'package:task/utils/widgets/bottom_bar.dart';
import '../../model/user_model.dart';
import '../../resources/r.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // password visibility
  bool _obscurePass = false;
  bool _obscureConfirmPass = false;

  // instance of firebaseAuth
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();

  //controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
// full name field

    final fullNameTextField = TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          prefixIcon: Image.asset("assets/images/user.png"),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Full Name",
          hintStyle: R.styles.fontPoppins
              .merge(R.styles.fz14Fw500)
              .copyWith(color: R.color.hintTextColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
        ));

    //email field
    final emailTextfield = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Image.asset("assets/images/mail.png"),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: R.styles.fontPoppins
              .merge(R.styles.fz14Fw500)
              .copyWith(color: R.color.hintTextColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
        ));

    // password filed
    final passwordTextfield = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: _obscurePass,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Image.asset("assets/images/lock.png"),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: R.styles.fontPoppins
              .merge(R.styles.fz14Fw500)
              .copyWith(color: R.color.hintTextColor),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscurePass = !_obscurePass;
                });
              },
              icon: Icon(
                _obscurePass ? Icons.visibility : Icons.visibility_off_outlined,
                color: R.color.primaryTextColor,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
        ));

    //confirm password

    final confirmPasswordTextfield = TextFormField(
        controller: confirmPassController,
        obscureText: _obscureConfirmPass,
        decoration: InputDecoration(
          prefixIcon: Image.asset("assets/images/lock.png"),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirmPass
                  ? Icons.visibility
                  : Icons.visibility_off_outlined,
              color: R.color.primaryTextColor,
            ),
            onPressed: () {
              setState(() {
                _obscureConfirmPass = !_obscureConfirmPass;
              });
            },
          ),
          hintText: "Confirm password",
          hintStyle: R.styles.fontPoppins
              .merge(R.styles.fz14Fw500)
              .copyWith(color: R.color.hintTextColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: R.color.borderColor)),
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",
            style: R.styles.fontPoppins
                .merge(R.styles.fz22Fw500)
                .copyWith(color: R.color.primaryColor)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              // Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(21),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create account and enjoy all services",
                    style: R.styles.fontPoppins
                        .merge(R.styles.fz16Fw500)
                        .copyWith(color: R.color.primaryTextColor),
                  ),
                  const SizedBox(height: 30),
                  fullNameTextField,
                  const SizedBox(
                    height: 18,
                  ),
                  emailTextfield,
                  const SizedBox(
                    height: 18,
                  ),
                  passwordTextfield,
                  const SizedBox(
                    height: 18,
                  ),
                  confirmPasswordTextfield,
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      signUp(emailController.text, passwordController.text);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: R.color.buttonColor,
                          borderRadius: BorderRadius.circular(8)),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: R.styles.fontPoppins
                              .merge(R.styles.fz16Fw500)
                              .copyWith(color: R.color.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Already have an account ? ",
                        style: R.styles.fontPoppins
                            .merge(R.styles.fz14Fw500)
                            .copyWith(color: R.color.secondaryTextColor)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: Text("Sign In",
                          style: R.styles.fontPoppins
                              .merge(R.styles.fz14Fw600)
                              .copyWith(color: R.color.primaryColor)),
                    )
                  ])
                ],
              ),
            )),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = nameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const BottomBar()),
        (route) => false);
  }
}
