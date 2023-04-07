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

// Screen Home page
class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 27),
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: ListView(
                            children: [
                              PerChat.from(content: "Hey there! What's up?"),
                              PerChat.to(
                                  content:
                                      "Nothing.Just chilling and Watching Yesterday's \nChodala match in Youtube. \nWhat about you?"),
                              PerChat.from(
                                  content:
                                      "Same here! Been watching Youtube for the \npast 5 hours despite of having so much \nto do!"),
                              PerChat.from(
                                  content: "It's hard to be productive man"),
                              PerChat.to(
                                  content:
                                      "Yeh Man!! Remove your phone and Just playing \ndaily,\n\n'Practice makes Improvement'"),
                              PerChat.to(
                                  content:
                                      "Those who always play on mobile phones won't \nget the world cup"),
                              PerChat.from(
                                  content: "Yeah i know. I'm trying my best"),
                              const SizedBox(height: 60)
                            ],
                          ),
                        ),
                        const Positioned(
                          bottom: 15,
                          right: 10,
                          left: 10,
                          child: BottomMessageInput(),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Widgets MsgInput,ChatItem,custom iButton,Per chat, custom tButton,TopBar
class BottomMessageInput extends StatelessWidget {
  const BottomMessageInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: 300,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Colors.grey[300],
          ),
          child: const Center(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type your message',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Colors.purple[700],
          )),
        )
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.fromOrTo,
    required this.content,
  });

  final bool fromOrTo;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft:
                fromOrTo ? const Radius.circular(0) : const Radius.circular(20),
            bottomRight:
                fromOrTo ? const Radius.circular(20) : const Radius.circular(0),
          )),
      child: Center(
        child: Text(content),
      ),
    );
  }
}

class IconButtonKonst extends StatelessWidget {
  const IconButtonKonst({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, size: 22),
      color: Colors.white,
      padding: const EdgeInsets.all(9),
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white24),
      ),
    );
  }
}

class PerChat extends StatelessWidget {
  PerChat.from({super.key, required this.content}) {
    fromOrTo = true;
  }
  PerChat.to({super.key, required this.content}) {
    fromOrTo = false;
  }
  bool? fromOrTo;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: fromOrTo!
          ? Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/img/messi.jpg'),
                  radius: 22,
                ),
                const SizedBox(width: 10),
                ChatItem(fromOrTo: true, content: content)
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ChatItem(fromOrTo: false, content: content),
                const SizedBox(width: 10),
              ],
            ),
    );
  }
}

class textButtonKonst extends StatelessWidget {
  const textButtonKonst({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(label,
          style: const TextStyle(
            color: Colors.white30,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              textButtonKonst(label: 'Back'),
              textButtonKonst(label: 'Search'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Leo Messi",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Row(
                  children: const [
                    IconButtonKonst(icon: Icons.call),
                    IconButtonKonst(icon: CupertinoIcons.videocam_fill),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
