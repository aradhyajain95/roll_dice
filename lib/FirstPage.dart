import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:single_roll/SecondPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final myController = TextEditingController();
  int total;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Roll a dice",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          color: Colors.red.shade50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex:1,
                child: Center(
                  child: Text(
                    "Enter the Winning Score",style: GoogleFonts.pacifico(color: Colors.black38,fontSize: 24,),
                  ),
                ),
              ),
              Expanded(flex:1,
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                      labelText: "Winning Score",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Enter the Winning Score",
                      labelStyle: GoogleFonts.pacifico(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        height: 0.64,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red.shade900,
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    controller: myController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(flex:1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      total = int.parse(myController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Moving to the game"),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(
                            total: total,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Let's Roll",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
