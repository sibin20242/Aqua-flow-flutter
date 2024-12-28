import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('PWSMS'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Main Content Area'),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo.shade900,
              ),
              accountName: Text(
                'WELCOME',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'PRANAV',
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            DrawerItem(icon: Icons.person, title: 'PROFILE'),
            DrawerItem(icon: Icons.language, title: 'LANGUAGE'),
            DrawerItem(icon: Icons.light_mode, title: 'MODE'),
            DrawerItem(icon: Icons.info_outline, title: 'About'),
            DrawerItem(icon: Icons.share, title: 'Share'),
            DrawerItem(icon: Icons.logout, title: 'Log Out', iconColor: Colors.red),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;

  DrawerItem({required this.icon, required this.title, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Colors.blueAccent,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {},
    );
  }
}
