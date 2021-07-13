import 'package:flutter/material.dart';
import 'package:microsoft_engage/models/chatUsersModel.dart';
import 'package:microsoft_engage/widgets/conversationList.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Irene",
        messageText: "Hi",
        imageURL: ("assets/images/userImage5.png"),
        time: "Now"),
    ChatUsers(
        name: "Lisa",
        messageText: "That's Great",
        imageURL: ("assets/images/userImage2.png"),
        time: "Yesterday"),
    ChatUsers(
        name: "Lucas",
        messageText: "Hey where are you?",
        imageURL: ("assets/images/userImage4.png"),
        time: "31 Mar"),
    ChatUsers(
        name: "Philip",
        messageText: "Call me in 20 mins",
        imageURL: ("assets/images/userImage3.png"),
        time: "28 Mar"),
    ChatUsers(
        name: "Debra",
        messageText: "Thankyou",
        imageURL: ("assets/images/userImage1.png"),
        time: "23 Mar"),
    ChatUsers(
        name: "Rose",
        messageText: "will update you in evening",
        imageURL: ("assets/images/userImage5.png"),
        time: "17 Mar"),
    ChatUsers(
        name: "Suga",
        messageText: "Can you please share the file?",
        imageURL: ("assets/images/userImage4.png"),
        time: "24 Feb"),
    ChatUsers(
        name: "John",
        messageText: "How are you?",
        imageURL: ("assets/images/userImage2.png"),
        time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0Xff2A2A2A),
        elevation: 0,
        leading: Icon(Icons.person),
        title: Text("Chat"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.videocam,
              color: Color(0XffFFFFFF),
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Color(0XffFFFFFF)),
            onPressed: null,
          )
        ],
      ),
      backgroundColor: Color(0Xff2A2A2A),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0Xff9941BF),
        onPressed: () {},
        child: Icon(
          Icons.people,
          color: Color(0XffFFFFFF),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Color(0xff090909),
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xff090909))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color(0xffFFFFFF),
              height: 20,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
