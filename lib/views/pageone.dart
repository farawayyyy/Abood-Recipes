import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:recipes/views/home.dart';

class Pageone extends StatefulWidget {
  const Pageone({super.key});

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.home,
          size: 50,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(226, 42, 12, 92),
      ),
      body: Container(
        color: const Color.fromARGB(255, 30, 4, 48),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 300,
            width: 300,
            child: Center(
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    splashColor: Colors.pink,
                    minWidth: 150,
                    height: 100,
                    color: Colors.blue,
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.info,
                        animType: AnimType.rightSlide,
                        title: 'Notice!',
                        titleTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 30),
                        desc: 'Do you wanna go to Recipes page?',
                        descTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                        btnCancelColor: Colors.blue,
                        btnOkColor: Colors.purple,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                      ).show();
                    },
                    child: Text(
                      'View Recipes',
                      style: TextStyle(fontSize: 25),
                    ))),
          ),
        ),
      ),
    );
  }
}
