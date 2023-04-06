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
    Size size = MediaQuery.of(context).size;
    int resp() {
      if (size.width <= 500) {
        return 2;
      } else if (size.width <= 800) {
        return 3;
      } else if (size.width <= 1200) {
        return 4;
      } else {
        return 2;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print(size.width);
          },
          icon: const Icon(Icons.align_horizontal_left_rounded),
        ),
        actions: const [
          UserProfileIcon(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ksized20,
          ksized20,
          const NameCardHome(name: 'David'),
          ksized20,
          Expanded(
            child: GridView.count(
              crossAxisCount: resp(),
              mainAxisSpacing: 9,
              crossAxisSpacing: 9,
              padding: const EdgeInsets.all(15),
              children: [
                CardsDetails(
                  icon: CupertinoIcons.tag,
                  integer: 230,
                  type: 'Sales',
                  color: Colors.blue[100],
                ),
                CardsDetails(
                  icon: CupertinoIcons.person,
                  number: 8.549,
                  type: 'Customers',
                  color: Colors.deepPurple[100],
                ),
                CardsDetails(
                  icon: CupertinoIcons.cube_box,
                  number: 1.423,
                  type: 'Products',
                  color: Colors.blueGrey[100],
                ),
                CardsDetails(
                  icon: Icons.attach_money,
                  integer: 9745,
                  type: 'Revenue',
                  color: Colors.pink[100],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: BottomNavigationBar(
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'ho'),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'ho'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.graph_square), label: 'ho'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: 'ho'),
          ],
        ),
      ),
    );
  }
}

// Widget Card,NameCardHome,UserProfile
class CardsDetails extends StatelessWidget {
  const CardsDetails(
      {super.key,
      required this.icon,
      required this.type,
      required this.color,
      this.integer,
      this.number});
  final IconData icon;
  final int? integer;
  final double? number;
  final String type;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(37),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 27,
            color: Colors.black54,
          ),
          kdivider,
          Text(
            integer == null ? '${number}k' : '${integer}k',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
              color: Colors.black87,
            ),
          ),
          kdivider,
          Text(
            type,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class NameCardHome extends StatelessWidget {
  const NameCardHome({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Hello $name",
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
      subtitle: const Text(
        'Welcome Back !',
        style: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(CupertinoIcons.slider_horizontal_3),
      ),
    );
  }
}

class UserProfileIcon extends StatelessWidget {
  const UserProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black54,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.network(
          'https://sb.kaleidousercontent.com/67418/992x558/7632960ff9/people.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
