import 'package:flutter/material.dart';

import '../../apis/api_caller.dart';
import '../../global.dart';
import '../../initial_screen.dart';
import '../../styles.dart';
import '../../utils/constant.dart';
import '../../widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }

  bool isChange = false;
  bool valid = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isValid(List<TextEditingController> list) {
    bool ans = true;
    for (TextEditingController element in list) {
      ans = ans && element.text.trim().isNotEmpty;
    }
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    valid = false;
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          height: height(context),
          width: width(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addVerticalSpace(50),
                  const Text(
                    "Welcome back!!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Enter your email and get back with\nfinding the most awesome deals on hotels',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: height(context) * 0.1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 0.9 * width(context),
                          child: TextField(
                            autofocus: true,
                            // onSubmitted: (hasFocus) {
                            //   setState(() {
                            //     isChange = !isChange;
                            //   });
                            // },
                            onChanged: (val) {
                              if (val.isNotEmpty) {
                                isChange = true;
                                setState(() {});
                              } else {
                                setState(() {});
                                isChange = false;
                              }
                            },
                            controller: emailController,
                            style: const TextStyle(fontSize: 17),
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "ajay1359@xyzmail.com",
                              hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                              counterText: "",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      addVerticalSpace(25),
                      Center(
                        child: Container(
                          width: 0.9 * width(context),
                          child: TextField(
                            autofocus: true,
                            // onSubmitted: (hasFocus) {
                            //   setState(() {
                            //     isChange = !isChange;
                            //   });
                            // },
                            onChanged: (val) {
                              if (val.isNotEmpty) {
                                isChange = true;
                                setState(() {});
                              } else {
                                setState(() {});
                                isChange = false;
                              }
                            },
                            controller: passwordController,
                            style: const TextStyle(fontSize: 17),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              hintText: "********",
                              hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                              counterText: "",
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              Container(
                // height: 5,
                decoration: BoxDecoration(
                  gradient: isChange
                      ? blueGradient()
                      : const LinearGradient(
                    colors: [
                      Color.fromRGBO(94, 94, 94, 1),
                      Color.fromRGBO(94, 94, 94, 1)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                  height: 45,
                  padding: const EdgeInsets.only(top: 5, bottom: 5),

                  // : const Color.fromRGBO(94, 94, 94, 1),
                  onPressed: () async{
                    valid = isValid([emailController, passwordController]);
                    setState(() {
                    });
                    if(valid){
                      if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                        Map<String, dynamic> user = await getUsersByEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
                        if(user["message"] != "found") {
                          showToast("Email or Password does not match.");
                        } else {
                          showToast("Welcome Back!!!");
                            Global.save(Constants.LOGGEDIN.toString()+Global.saveKey, "yes");
                            Global.save(Constants.EMAIL.toString()+Global.saveKey, emailController.text.trim());
                            Global.userMap = user;
                            replaceScreen(context, const InitialScreenPage());
                        }
                      } else {
                        showToast("Please fill in the required fields.");
                      }
                    } else {
                      showToast("Please fill in the required fields.");
                    }
                  },
                  child: !valid?const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ): const CircularProgressIndicator(
                    color: white,
                  ) ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
