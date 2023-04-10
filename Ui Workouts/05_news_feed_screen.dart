import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
      home: ScreenHome(),
    );
  }
}

// Screen Home page
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  List<String> _listTab = [
    'All',
    'Recomended',
    'Sports',
    'Technolegy',
    'Featured',
    'Business',
    'Politics',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _listTab.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 180,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: const [
                TopBarKonst(),
                SearchBarKonst(),
              ],
            ),
          ),
          bottom: TabBar(
            tabs: _listTab.map((e) => Tab(text: e)).toList(),
            isScrollable: true,
            indicatorWeight: .10,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            //indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            indicator: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        body: TabBarView(children: [
          Text('Screens'),
          Text('Screens'),
          SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      NewsCardKonst(),
                      NewsCardKonst(),
                      NewsCardKonst(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Latest',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'More >',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const NewsFeedCard(),
                const NewsFeedCard(),
                const NewsFeedCard(),
                const NewsFeedCard(),
              ],
            ),
          ),
          Text('Screens'),
          Text('Screens'),
          Text('Screens'),
          Text('Screens'),
        ]),
      ),
    );
  }
}

//Widgets FeedCard,NewsCard,SearchBarCustom,TopBarCustom
class NewsFeedCard extends StatelessWidget {
  const NewsFeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/iphone.jpg'))),
          ),
          Column(
            children: [
              Text(
                'New iphone 15 concept design!! \nLeaked Chodala media',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Colors.black45,
                        size: 15,
                      ),
                      Text(
                        ' 47min ago',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 100),
                  Row(
                    children: const [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black45,
                        size: 15,
                      ),
                      Text(
                        ' 1024',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class NewsCardKonst extends StatelessWidget {
  NewsCardKonst({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        height: 270,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            image: DecorationImage(
              image: AssetImage('assets/img/messiwc.jpeg'),
              fit: BoxFit.cover,
            )),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white70,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Leo messi records own the \nWorld Cup, 100 Days ago",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Sports', style: style),
                        Row(
                          children: [
                            const Icon(Icons.watch_later_outlined,
                                color: Colors.black54, size: 15),
                            Text('1hr ago', style: style),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.remove_red_eye_outlined,
                                color: Colors.black54, size: 15),
                            Text('5,264', style: style),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final style = const TextStyle(
    fontWeight: FontWeight.normal,
    color: Colors.black54,
    fontSize: 14,
  );
}

class SearchBarKonst extends StatelessWidget {
  const SearchBarKonst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: ListTile(
            leading: IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Search news..',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
              ),
            ),
            trailing: IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.mic)),
          ),
        ),
      ),
    );
  }
}

class TopBarKonst extends StatelessWidget {
  const TopBarKonst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: const ListTile(
        title: Text(
          'Welcome Back!',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        subtitle: Text(
          "Monday, 28 March",
          style: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        trailing: CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage('assets/img/messi.jpg'),
        ),
      ),
    );
  }
}
