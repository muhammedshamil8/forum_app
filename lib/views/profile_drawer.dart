import 'package:flutter/material.dart';
import '/views/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      // appBar: AppBar(
      //     title: Row(
      //   children: [
      //     const Icon(Iconsax.arrow_left),
      //     const SizedBox(width: 28),
      //     Text(
      //       'change Name',
      //       style: GoogleFonts.poppins(
      //         fontSize: 16,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     )
      //   ],
      // )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/user.png'),
              ),
            ),
            // const Text('change Profile Picture',
            //     style: TextStyle(
            //         color: Colors.grey,
            //         fontSize: 13,
            //         fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Container(
              height: 2,
              width: double.infinity,
              color: const Color.fromARGB(255, 211, 211, 211),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile Information',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text('Name',
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Text(
                                'Taimoor Sikander',
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ),
                          const Icon(Iconsax.arrow_right_3),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text('Username',
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Text('taimoor_sikander',
                                  style: GoogleFonts.poppins()),
                            ),
                          ),
                          const Icon(Iconsax.arrow_right_3),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: const Color.fromARGB(255, 211, 211, 211),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text('User ID',
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child:
                                  Text('45689', style: GoogleFonts.poppins()),
                            ),
                          ),
                          const Icon(Iconsax.copy),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text('E-mail',
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                'mrtaimoorsikaner@gmail.com',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ),
                          const Icon(Iconsax.arrow_right_3),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text('Phone Number',
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text('+923329121290',
                                  style: GoogleFonts.poppins()),
                            ),
                          ),
                          const Icon(Iconsax.arrow_right_3),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text('Gender',
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text('Male', style: GoogleFonts.poppins()),
                            ),
                          ),
                          const Icon(Iconsax.arrow_right_3),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Text('Date of Birth',
                                style: GoogleFonts.poppins(color: Colors.grey)),
                          ),
                          Expanded(
                            child: Text('10 Oct, 1994',
                                style: GoogleFonts.poppins()),
                          ),
                          const Icon(Iconsax.arrow_right_3),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: const Color.fromARGB(255, 211, 211, 211),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the alert dialog
                          },
                          child: const Text('Cancel' , 
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            final box = GetStorage();
                            box.remove('token'); // Remove the token
                            Get.offAll(() =>
                                const LoginPage()); // Navigate to the login page
                          },
                          child: const Text('Logout',
                              style: TextStyle(
                                  color: Color.fromARGB(232, 238, 115, 106),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Logout',
                  style: TextStyle(
                      color: Color.fromARGB(232, 238, 115, 106),
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
