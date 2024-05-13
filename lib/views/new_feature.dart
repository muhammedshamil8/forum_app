import 'package:flutter/material.dart';
import 'package:forumapp/views/profile_drawer.dart';

class NewFeaturePage extends StatefulWidget {
  const NewFeaturePage({super.key });

  @override
  State<NewFeaturePage> createState() => _NewFeaturePageState();
}

class _NewFeaturePageState extends State<NewFeaturePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        setState(() {
          _isScrolled = true;
        });
      } else {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

   @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
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
                        onPressed: () {
                          openDrawer();
                          goToProfilePage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
                 Column(
                  children: [
                    Text('Coming Soon', style: TextStyle(color: _isScrolled ? Colors.black : Colors.white)),
                    Text('wait and watch',
                        style: TextStyle(color: _isScrolled ? Colors.black : Colors.white, fontSize: 12)),
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
                        onPressed: () {
                          openDrawer();
                          goToProfilePage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
            centerTitle: true,
            floating: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            foregroundColor: _isScrolled ? Colors.black : Colors.white,
            backgroundColor: _isScrolled ? Colors.white : Colors.black,
          ),
          const SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: IconWithLabel(
                              icon: Icons.settings,
                              label: 'Settings',
                            ),
                          ),
                          Expanded(
                            child: IconWithLabel(
                              icon: Icons.home,
                              label: 'Home',
                            ),
                          ),
                          Expanded(
                            child: IconWithLabel(
                              icon: Icons.notifications,
                              label: 'Notifications',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: IconWithLabel(
                              icon: Icons.access_alarm,
                              label: 'Alarm',
                            ),
                          ),
                          Expanded(
                            child: IconWithLabel(
                              icon: Icons.accessibility,
                              label: 'Accessibility',
                            ),
                          ),
                          Expanded(
                            child: IconWithLabel(
                              icon: Icons.account_balance,
                              label: 'Balance',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: IconWithLabel(
                              icon: Icons.person,
                              label: 'Profile',
                            ),
                          ),
                          Expanded(
                            child: IconWithLabel(
                              icon: Icons.shopping_cart,
                              label: 'Cart',
                            ),
                          ),
                          Expanded(
                            child: IconWithLabel(
                              icon: Icons.favorite,
                              label: 'Favorites',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('List of items'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              childCount: 15,
            ),
          ),
        ],
      ),
    );
    
  }

    void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void goToProfilePage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ProfileDrawer(),
    ));
  }

}


class IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconWithLabel({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 8.0),
        Text(label),
      ],
    );
  }
}
