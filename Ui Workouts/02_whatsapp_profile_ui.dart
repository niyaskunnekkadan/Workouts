import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const ksized20 = SizedBox(height: 20);
const kdivider = Divider(color: Colors.transparent, height: 6);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const ScreenHome(),
    );
  }
}

// Screen Home
class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 19, 18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const DpSection(),
            const ListTilesKonst(
              hint: 'Name',
              name: 'Larry',
              icon: Icons.person,
              showText: true,
              showIcon: true,
            ),
            Divider(color: Colors.grey[900]),
            const ListTilesKonst(
              hint: 'About',
              name: 'Available',
              icon: Icons.info_outline,
              showText: false,
              showIcon: true,
            ),
            Divider(color: Colors.grey[900]),
            const ListTilesKonst(
              hint: 'Phone',
              name: '+91 9966884554',
              icon: Icons.call,
              showText: false,
              showIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}

// Widgets DpSection,CustomListTile
class DpSection extends StatelessWidget {
  const DpSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/img/profile.jpg'),
          radius: 90,
        ),
        Positioned(
          bottom: 8,
          right: 0,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: const Color.fromARGB(255, 0, 138, 69),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.camera_fill),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class ListTilesKonst extends StatelessWidget {
  const ListTilesKonst({
    super.key,
    required this.hint,
    required this.name,
    required this.icon,
    required this.showText,
    required this.showIcon,
  });

  final String hint;
  final String name;
  final IconData icon;
  final bool showText;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.grey,
          ),
          title: Text(
            hint,
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          subtitle: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          trailing: Visibility(
            visible: showIcon,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              color: const Color.fromARGB(255, 0, 138, 69),
            ),
          ),
        ),
        Visibility(
          visible: showText,
          child: const ListTile(
            leading: CircleAvatar(backgroundColor: Colors.transparent),
            subtitle: Text(
              'This is not your username or pin.This name wil be visible to your WhatsApp contacts.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
