import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_yatra/utils/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../styles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.edit});

  final bool edit;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;

  ImagePicker picker = ImagePicker();

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  Future<File> convertImageUrlToFile(String imageUrl) async {
    var response = await http.get(Uri.parse(imageUrl));
    var filePath =
        await _localPath(); // Function to get the local directory path
    var fileName = imageUrl.split('/').last;

    File file = File('$filePath/$fileName');
    await file.writeAsBytes(response.bodyBytes);

    return file;
  }

  Future<String> _localPath() async {
    // Function to get the local directory path
    var directory = await getTemporaryDirectory();
    return directory.path;
  }

  DateTime? selectedDate;
  bool isAbove18 = false;
  bool dateSelected = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateSelected = true;
      selectedDate = pickedDate;
      controllers[3].text = DateFormat('dd MMM yyyy').format(selectedDate!);
      print(controllers[3].text);
      isAbove18 = calculateAge(selectedDate!) >= 18;
      setState(() {});
    }
  }

  int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  List<String> titles = ["Name", "Email", "Number", "Date of Birth"];

  List<String> hint = ["Name", "Email", "+91 9398432833", "7 March 1993"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0.5,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
              color: black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          widget.edit ? "Edit Profile" : "Create Account",
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: white,
        width: width(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            addVerticalSpace(15),
            Center(
              child: Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: image == null
                          ? const Image(
                              image:
                                  NetworkImage("https://picsum.photos/200/300"),
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              image!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Stack(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final pickedfile = await picker.pickImage(
                              source: ImageSource.gallery,
                              imageQuality: 80,
                            );
                            final pickedFile = await picker.pickImage(
                              source: ImageSource.gallery,
                              imageQuality: 80,
                            );

                            if (pickedFile != null) {
                              image = File(pickedFile.path);
                              setState(() {});
                            } else {
                              setState(() {});
                              print("No image selected");
                            }
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.5),
                              color: white,
                            ),
                            child:
                                const Icon(LineAwesomeIcons.alternate_pencil),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            addVerticalSpace(15),
            Container(
              padding: EdgeInsets.only(left: 27, right: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  4,
                  (i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles[i],
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17.6,
                          ),
                        ),
                        addVerticalSpace(13),
                        SizedBox(
                          width: width(context) * 0.78,
                          height: 50,
                          child: TextField(
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            maxLength: i == 2 ? 10 : 50,
                            enabled: true,
                            readOnly: i == 3,
                            controller: controllers[i],
                            onTap: i != 3
                                ? () {}
                                : () {
                                    _selectDate(context);
                                  },
                            keyboardType: i == 2
                                ? TextInputType.number
                                : TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              counterText: '',
                              hintText: hint[i],
                              hintStyle: GoogleFonts.lato(
                                fontWeight: FontWeight.normal,
                                color: grey.withOpacity(0.6),
                                fontSize: 16,
                              ),
                              fillColor: greyLight.withOpacity(0.5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: white,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        addVerticalSpace(13),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
