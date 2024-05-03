import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 1, 21, 37),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        //Email
        //Change Password
        //Change Username
        //Change Picture
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset("assets/R.jpeg"),
                  )
                ],
              )),
        ));
  }
}
