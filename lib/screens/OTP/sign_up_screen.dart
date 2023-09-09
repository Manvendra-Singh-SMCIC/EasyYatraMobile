import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_yatra/global.dart';
import 'package:easy_yatra/initial_screen.dart';
import 'package:easy_yatra/screens/OTP/login_screen.dart';
import 'package:easy_yatra/screens/OTP/otp.dart';
import 'package:easy_yatra/screens/empty_screens/location.dart';
import 'package:easy_yatra/styles.dart';
import 'package:easy_yatra/utils/app_text.dart';
import 'package:easy_yatra/utils/constant.dart';
import 'package:easy_yatra/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../apis/api_caller.dart';
import '../../authentication/auth_cotroller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  bool isValid(List<TextEditingController> list) {
    bool ans = true;
    for (TextEditingController element in list) {
      ans = ans && element.text.trim().isNotEmpty;
    }
    return ans;
  }

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      final String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        selectedDate = picked;
        dateController.text = formattedDate;
      });
    }
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
          child: SingleChildScrollView(
            child: Container(
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
                        "Lets get Started",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Enter your email and get started with\nfinding the most awesome deals on hotels',
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
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Colors.grey),
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
                                controller: nameController,
                                style: const TextStyle(fontSize: 17),
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: "Ajay Mathur",
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Colors.grey),
                                  counterText: "",
                                  prefixIcon: Icon(Icons.person),
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
                              width: 0.9 * MediaQuery.of(context).size.width,
                              child: TextField(
                                controller: dateController,
                                readOnly: true,
                                onTap: () => _selectDate(context),
                                decoration: const InputDecoration(
                                  hintText: "Select a Date",
                                  prefixIcon: Icon(Icons.calendar_today),
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
                                controller: phoneController,
                                style: const TextStyle(fontSize: 17),
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                decoration: const InputDecoration(
                                  hintText: " +91 928 328 4829",
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Colors.grey),
                                  counterText: "",
                                  prefixIcon: Icon(Icons.phone),
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
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Colors.grey),
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
                          addVerticalSpace(25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: (){
                                  replaceOneScreen(context, const LoginScreen());
                                },
                                child: AppText(
                                    text: "Already a user? Sign in.   ",
                                    color: Colors.blue,
                                    size: 15),
                              ),
                            ],
                          )
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
                      onPressed: () async {
                        valid = isValid([
                          phoneController,
                          emailController,
                          nameController,
                          passwordController,
                          dateController
                        ]);
                        setState(() {});
                        if (valid) {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            Map<String, dynamic> user = await getUsersByEmail(
                                emailController.text.trim());
                            if (user["message"] == "found") {
                              showToast("Email Already Exists");
                            } else {
                              Map<String, dynamic> data = {
                                "name": nameController.text.trim(),
                                "email": emailController.text.trim(),
                                "phoneNumber": phoneController.text.trim(),
                                "password": passwordController.text.trim(),
                                "dob": dateController.text.trim(),
                                "role": "USER",
                              };
                              if (await createUser(data)) {
                                Global.save(
                                    Constants.LOGGEDIN.toString() +
                                        Global.saveKey,
                                    "yes");
                                Global.save(
                                    Constants.EMAIL.toString() + Global.saveKey,
                                    emailController.text.trim());
                                Global.userMap = await getUsersByEmail(
                                    emailController.text.trim());
                                replaceScreen(
                                    context, const InitialScreenPage());
                              } else {
                                showToast("Some error Occured");
                              }
                            }
                          } else {
                            showToast("Please fill in the required fields.");
                          }
                        } else {
                          showToast("Please fill in the required fields.");
                        }
                      },
                      child: !valid
                          ? const Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          : const CircularProgressIndicator(
                              color: white,
                            ),
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
}
