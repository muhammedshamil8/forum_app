import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/views/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _scrollController = ScrollController();
  Color _appBarBackgroundColor = const Color.fromARGB(255, 39, 39, 39);
  bool _showAppBarText = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 100) {
        // Adjust this value as needed
        // Change app bar style to white background and remove text
        setState(() {
          _appBarBackgroundColor = Colors.white;
          _showAppBarText = false;
        });
      } else {
        // Reset app bar style
        setState(() {
          _appBarBackgroundColor = const Color.fromARGB(255, 39, 39, 39);
          _showAppBarText = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: _appBarBackgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 161, 161, 161),
                    ),
                    color: _appBarBackgroundColor,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      iconSize: 20,
                      icon: const Icon(Icons.message),
                      color: Colors.white,
                      onPressed: () {
                        // openDrawer();
                        // goToProfilePage();
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (_showAppBarText)
              const Column(
                children: [
                  Text('Forum App', style: TextStyle(color: Colors.white)),
                  Text('Post your feeds',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            if (!_showAppBarText)
              const Text('Forum App', style: TextStyle(color: Colors.black)),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 161, 161, 161),
                    ),
                    color: _appBarBackgroundColor,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      iconSize: 20,
                      icon: const Icon(Icons.help),
                      color: Colors.white,
                      onPressed: () {
                        // openDrawer();
                        // goToProfilePage();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: _appBarBackgroundColor,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1), // Height of the border
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: _showAppBarText
                      ? const Color.fromARGB(0, 0, 0, 0).withOpacity(0)
                      : Colors.grey, // Color of the border
                  width: _showAppBarText ? 0 : 1, // Width of the border
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                     margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 20, bottom: 0
                      ),
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
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey)),
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
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey)),
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
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey)),
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
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey)),
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
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey)),
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
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 30.0),
                                            child:
                                                Text('Male', style: GoogleFonts.poppins()),
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
                                              style:
                                                  GoogleFonts.poppins(color: Colors.grey)),
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
                          const SizedBox(height: 20),
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
                                          child: const Text('Cancel',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
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
                            ),
                          const SizedBox( height: 220),
                          const Text('developed by Strikerz dev'),
                          const SizedBox( height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
