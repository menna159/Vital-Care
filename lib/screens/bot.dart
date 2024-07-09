import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BotPage extends StatefulWidget {
 const BotPage({super.key});

  @override
  State<BotPage> createState() => BotPageState();
}

class BotPageState extends State<BotPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 85),
                child: GestureDetector(
                  child: Image.asset(
                    'images/chatbot (9).png',
                    width: 230,
                    height: 230,
                  ),
                  onTap: () async {
                    launchUrl(
                      Uri.parse('https://t.me/DragonsTeamCancerAssistantBot'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
              ),
             const Text(
                "Welcome to chat bot",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
    );
  }
}
