import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:microsoft_engage/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

TextEditingController _controller = TextEditingController();
TextEditingController roomController = TextEditingController();
bool isVideoOff = true;
bool isAudioMuted = true;
String username = "";
bool isData = false;

class MeetPage extends StatefulWidget {
  @override
  _MeetPageState createState() => _MeetPageState();
}

class _MeetPageState extends State<MeetPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: Color(0Xff2A2A2A),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your meeting is ready!",
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: Color(0xffFFFFFF),
                  height: 20,
                  thickness: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Enter same code as your team-",
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.white),
                  ),
                ),
                PinCodeTextField(
                  controller: roomController,
                  backgroundColor: Color(0Xff2A2A2A),
                  textStyle: GoogleFonts.poppins(color: Colors.white),
                  autoDisposeControllers: false,
                  length: 6,
                  onChanged: (value) {},
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      activeColor: Colors.white,
                      inactiveColor: Color(0xff9941BF),
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      selectedColor: Colors.white),
                  animationDuration: Duration(microseconds: 300),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _controller,
                  style: GoogleFonts.poppins(color: Colors.white),
                  decoration: InputDecoration(
                    focusColor: Color(0xff9941BF),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Color(0xff9941BF))),
                    fillColor: Color(0xff9941BF),
                    hintText:
                        " Enter Username (This will be visible in the meeting.)",
                    hintStyle:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                  activeColor: Color(0xff9941BF),
                  value: isVideoOff,
                  onChanged: (val) {
                    setState(() {
                      isVideoOff = val;
                    });
                  },
                  title: Text(
                    "Video Off",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                  ),
                ),
                CheckboxListTile(
                  activeColor: Color(0xff9941BF),
                  value: isAudioMuted,
                  onChanged: (val) {
                    setState(() {
                      isAudioMuted = val;
                    });
                  },
                  title: Text(
                    "Audio Muted",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "You can change these settings in your meeting when you join.",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  color: Color(0xff9941BF),
                  height: 48,
                  thickness: 2.0,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: joinMeeting,
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                        color: Color(0xff9941BF),
                        borderRadius: BorderRadius.circular(50)
                        // gradient: LinearGradient(
                        //   colors: GradientColors.facebookMessenger,
                        // ),
                        ),
                    child: Center(
                      child: Text(
                        "Join Meeting",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  joinMeeting() async {
    try {
      Map<FeatureFlagEnum, bool> featureeFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };
      if (Platform.isAndroid) {
        featureeFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureeFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }

      var options = JitsiMeetingOptions()
        ..room = roomController.text // Required, spaces will be trimmed
        ..userDisplayName = _controller.text == "" ? username : _controller.text
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoOff
        ..featureFlag = FeatureFlag()
        ..featureFlag.inviteEnabled = true
        ..featureFlag.addPeopleEnabled = true
        ..featureFlag.meetingPasswordEnabled = true
        ..featureFlag.callIntegrationEnabled = false
        ..featureFlag.pipEnabled = true;

      await JitsiMeet.joinMeeting(options);
    } catch (err) {
      print(err);
    }
  }
}
