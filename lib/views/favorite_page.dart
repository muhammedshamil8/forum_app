import 'package:flutter/material.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  final bool _showAppBarText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
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
                    color: const Color.fromARGB(255, 39, 39, 39),
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
                      icon: const Icon(Icons.person),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                Text('Liked Feeds', style: TextStyle(color: Colors.white)),
                Text('favorite posts',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 161, 161, 161),
                    ),
                    color: const Color.fromARGB(255, 39, 39, 39),
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
                      icon: const Icon(Icons.person),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
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
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: const Center(
          child: Text(
            'This is the Liked Page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
