import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "edit_profile.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //Email
        //Change Password
        //Change Username
        //Change Picture
        body: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/R.jpeg'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sherryl Mwangi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              const Text('test123@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // ignore: prefer_const_constructors
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                    },
                    child: const Text('Edit Profile',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 11, 46, 74)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ))
            ],
          )),
    ));
  }
}
