import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/screens/auth_screens/signUp_screen.dart';
import 'package:task/utils/widgets/bottom_bar.dart';
import '../../resources/r.dart';
import '../../utils/widgets/checkbox.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // pasword visibility
  bool _obscureText = false;

  //controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // form key
  final _formKey = GlobalKey<FormState>();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
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
        obscureText: _obscureText,
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
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off_outlined,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
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
        title: Text("Sign In",
            style: R.styles.fontPoppins
                .merge(R.styles.fz22Fw500)
                .copyWith(color: R.color.primaryColor)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding: const EdgeInsets.all(21),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign In your account",
                    style: R.styles.fontPoppins
                        .merge(R.styles.fz16Fw500)
                        .copyWith(color: R.color.primaryTextColor),
                  ),
                  const SizedBox(height: 30),
                  emailTextfield,
                  const SizedBox(
                    height: 18,
                  ),
                  passwordTextfield,
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      const CustomCheckbox(),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Remember me",
                        style: R.styles.fontPoppins
                            .merge(R.styles.fz10Fw400)
                            .copyWith(color: R.color.primaryTextColor),
                      ),
                      const SizedBox(
                        width: 128,
                      ),
                      Text(
                        "Forgot Password?",
                        style: R.styles.fontPoppins
                            .merge(R.styles.fz10Fw400)
                            .copyWith(color: R.color.primaryColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      signIn(emailController.text, passwordController.text);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: R.color.buttonColor,
                          borderRadius: BorderRadius.circular(8)),
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: Center(
                        child: Text(
                          "Sign In",
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account ? ",
                            style: R.styles.fontPoppins
                                .merge(R.styles.fz14Fw500)
                                .copyWith(color: R.color.secondaryTextColor)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: Text("Sign Up",
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

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const BottomBar())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "invalid-credential":
            errorMessage = "Please enter valid credentials.";
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
}
