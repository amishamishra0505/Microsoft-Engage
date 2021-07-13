import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microsoft_engage/meetPage.dart';

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({Key key}) : super(key: key);

  @override
  _JoinMeetingScreenState createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff2A2A2A),
      appBar: AppBar(
        backgroundColor: Color(0Xff2A2A2A),
        elevation: 0,
        leading: Icon(Icons.person),
        title: Text("Meet"),
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              SizedBox(
                height: 40,
              ),
              Text("Start a Meeting!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 35)),
              Text("Get everyone together even if they don’t have Teams.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: 12)),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image.asset('assets/images/Group 27.png'),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                    child: Text(
                      "Meet Now",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    color: Color(0xff9941BF),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                        return MeetPage();
                      }));
                    }),
              ),

              //   colors: GradientColors.facebookMessenger,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
