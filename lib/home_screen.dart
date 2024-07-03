import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scribble_io/Music/music_play.dart';
import 'package:scribble_io/paint_screen.dart';
import 'package:scribble_io/widgets/create_room_page.dart';
import 'package:scribble_io/widgets/custom_text_field.dart';

import 'create_room_screen.dart';
import 'join_room_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();




  @override
  void initState() {
    if(!MusicPlayer.isVolumeOff) {
      MusicPlayer.playMain();
    }
    super.initState();
  }


  void joinRoom() {
    if (_nameController.text.isNotEmpty &&
        _roomNameController.text.isNotEmpty) {
      Map<String, String> data = {
        "nickname": _nameController.text,
        "name": _roomNameController.text
      };
      MusicPlayer.playMusic();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PaintScreen(data: data, screenFrom: 'joinRoom')));
    }else{
      MusicPlayer.playOver();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(onPressed: (){
                setState(() {
                  MusicPlayer.OnOFValume();
                });
              }, icon: MusicPlayer.isVolumeOff ?  Icon(Icons.volume_off_outlined,color: Colors.white,) : Icon(Icons.volume_up_outlined,color: Colors.white,)),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Center(
                  child: Container(
                      width: 300,
                      child: Image.asset('assets/images/logo.gif',

                      )),
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(right: 50),
                      width: 380,

                      child: Image.asset('assets/images/man.png',
                      )),
                ),

                Container(
                  margin: EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  height: 360,
                  width: 340,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: CustomTextField(controller: _nameController, hintText: "Enter your name")),
                            SizedBox(width: 10,),
                            Expanded(child: CustomTextField(controller: _roomNameController, hintText: "Enter room name")),

                          ],
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: Container(
                              margin: EdgeInsets.all(10),
                              width: 380,

                              child: Image.asset('assets/images/mid-man.png',
                              )),
                        ),
                        InkWell(
                          onTap: joinRoom,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.greenAccent,
                            ),
                            width: double.infinity,
                            height: 50,
                            child: Center(child: Text("Play!",
                              style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700,color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: () {
                            MusicPlayer.win();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CreateRoomPage(),
                              ),
                            );

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blueAccent,
                            ),
                            width: double.infinity,
                            height: 40,
                            child: Center(child: Text("Create Private Room!",
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),
                            )),
                          ),
                        )

                      ],
                    ),
                  ),
                )
                // const Text(
                //   "Create/Join a room to play!",
                //   style: TextStyle(color: Colors.black, fontSize: 24),
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.1,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ElevatedButton(
                //       onPressed: () => Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (context) => const CreateRoomScreen(),
                //         ),
                //       ),
                //       style: ButtonStyle(
                //           backgroundColor: MaterialStateProperty.all(Colors.blue),
                //           textStyle: MaterialStateProperty.all(
                //               TextStyle(color: Colors.white)),
                //           minimumSize: MaterialStateProperty.all(
                //               Size(MediaQuery.of(context).size.width / 2.5, 50))),
                //       child: const Text(
                //         "Create",
                //         style: TextStyle(fontSize: 16),
                //       ),
                //     ),
                //     ElevatedButton(
                //
                //       style: ButtonStyle(
                //           backgroundColor: MaterialStateProperty.all(Colors.blue),
                //           textStyle: MaterialStateProperty.all(
                //               TextStyle(color: Colors.white)),
                //           minimumSize: MaterialStateProperty.all(
                //               Size(MediaQuery.of(context).size.width / 2.5, 50))),
                //       child: const Text(
                //         "Join",
                //         style: TextStyle(fontSize: 16),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
