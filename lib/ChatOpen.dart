import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microsoft_engage/JoinMeeting.dart';
import 'package:microsoft_engage/chatPage.dart';

class ChatOne extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ChatOneState createState() => _ChatOneState();
}

class _ChatOneState extends State<ChatOne> {
  List widgets = [ChatPage(), JoinMeetingScreen()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0Xff1E1E1E),
        selectedItemColor: Color(0XffFFFFFF),
        unselectedItemColor: Color(0XffFFFFFF),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text("Chats"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            title: Text("Video Meet"),
          ),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
