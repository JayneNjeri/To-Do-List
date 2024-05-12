import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 21, 37),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title:
              const Text('Edit Profile', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/R.jpeg'),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 120,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Icon(Icons.camera_alt_rounded,
                                color: Colors.black, size: 20),
                          )),
                    ],
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
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          // ignore: prefer_const_constructors
                          Navigator.pop(context);
                        },
                        // ignore: sort_child_properties_last
                        child: const Text('Save Changes',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 11, 46, 74)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ))
                ],
              )),
        ));
  }
}
