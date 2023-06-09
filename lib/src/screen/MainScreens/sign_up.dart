import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/src/providers/firebase_provider.dart';
import 'package:myapp/src/screen/MainScreens/login.dart';
import 'package:provider/provider.dart';
import 'package:myapp/src/repository/login_info.dart';
import 'package:myapp/src/constants/colors.dart';
import 'package:myapp/src/constants/images_str.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Controller

  final TextEditingController userName = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //String userName = _userName.text;
  //String passWord = _password.text;

  @override
  void dispose() {
    emailController.dispose();
    userName.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: sExtraColor1,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: sAssistColor),
        backgroundColor: sPrimaryColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 80, right: 80),
          child: Text(
            'Sign Up',
            style: TextStyle(color: sFontColor, fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Image(image: AssetImage(sRegisterScreenImage)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.5, horizontal: 8),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            eMail = value;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sSecondaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sPrimaryColor),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sFontColor),
                            ),
                            prefixIcon: const Icon(Icons.mail),
                            prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return sPrimaryColor;
                              }
                              if (states.contains(MaterialState.error)) {
                                return Colors.red;
                              }
                              return sSecondaryColor;
                            }),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: sPrimaryColor,
                            )),
                            labelText: 'E-Mail',
                            labelStyle: const TextStyle(color: sPrimaryColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                emailController.clear();
                              },
                              icon: const Icon(FontAwesomeIcons.trashCan,
                                  size: 23),
                              color: sPrimaryColor,
                            )),
                        controller: emailController,
                        cursorColor: sAssistColor,
                        cursorWidth: 5,
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.5, horizontal: 8),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            user_Name = value;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sSecondaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sPrimaryColor),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sFontColor),
                            ),
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return sPrimaryColor;
                              }
                              if (states.contains(MaterialState.error)) {
                                return Colors.red;
                              }
                              return sSecondaryColor;
                            }),
                            border: const OutlineInputBorder(),
                            labelText: 'Username',
                            labelStyle: const TextStyle(color: sPrimaryColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                userName.clear();
                              },
                              icon: const Icon(FontAwesomeIcons.trashCan,
                                  size: 23),
                              color: sPrimaryColor,
                            )),
                        controller: userName,
                        cursorColor: sAssistColor,
                        cursorWidth: 5,
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.5, horizontal: 8),
                      child: TextField(
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            passWord = value;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sSecondaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sPrimaryColor),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sFontColor),
                            ),
                            prefixIcon: const Icon(Icons.key),
                            prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return sPrimaryColor;
                              }
                              if (states.contains(MaterialState.error)) {
                                return Colors.red;
                              }
                              return sSecondaryColor;
                            }),
                            border: const OutlineInputBorder(),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: sPrimaryColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                passwordController.clear();
                              },
                              icon: const Icon(FontAwesomeIcons.trashCan,
                                  size: 23),
                              color: sPrimaryColor,
                            )),
                        controller: passwordController,
                        cursorColor: sAssistColor,
                        cursorWidth: 5,
                        maxLength: 6,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 2),
                  child: OutlinedButton(
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        context.read<FlutterFireAuthService>().signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          context: context,
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            backgroundColor: sPrimaryColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.5, horizontal: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Please enter the credentials',
                                    style: TextStyle(color: sSecondaryColor),
                                  ),
                                  const SizedBox(height: 5),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Close',
                                      style: TextStyle(color: sFontColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: sPrimaryColor,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: sPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Or you can register via',
                    style: TextStyle(color: sPrimaryColor, fontSize: 13),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.5, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                            color: sPrimaryColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: sPrimaryColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.twitter,
                            color: sPrimaryColor,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
