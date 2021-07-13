import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff2A2A2A),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0Xff2A2A2A),
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage("assets/images/userImage1.png"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Kriss Benwat",
                        style: GoogleFonts.poppins(fontSize: 16,color: Colors.white,fontWeight:FontWeight.w600)
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style:   GoogleFonts.poppins(fontSize: 13,color: Colors.white,fontWeight:FontWeight.w600)
                  
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Color(0xff090909),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xff9941BF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      style: GoogleFonts.poppins(color:Colors.white),
                      decoration: InputDecoration(
                          hintText: "Write message",
                          hintStyle: GoogleFonts.poppins(color: Colors.white),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor:Color( 0xff9941BF),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
