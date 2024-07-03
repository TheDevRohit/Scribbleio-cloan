import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_io/paint_screen.dart';
import 'package:scribble_io/widgets/custom_text_field.dart';

import '../create_room_screen.dart';



class CreateRoomPage extends StatefulWidget {
  const CreateRoomPage({Key? key}) : super(key: key);

  @override
  _CreateRoomPageState createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();
  late String? _maxRoundsValue;
  late String? _roomSizeValue;

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playMusic() async {
    try {
      await _audioPlayer.play(AssetSource("audio/recieve.wav"));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> playOver() async {
    try {
      await _audioPlayer.play(AssetSource("audio/over.mp3"));
    } catch (e) {
      rethrow;
    }
  }

  void createRoom() {
    if (_nameController.text.isNotEmpty &&
        _roomNameController.text.isNotEmpty &&
        _maxRoundsValue != null &&
        _roomSizeValue != null) {
      Map<String, String> data = {
        "nickname": _nameController.text,
        "name": _roomNameController.text,
        "occupancy": _maxRoundsValue!,
        "maxRounds": _roomSizeValue!
      };
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintScreen(data: data, screenFrom: 'createRoom')));
    }else{
      playOver();
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

        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
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
                        CustomTextField(controller: _nameController, hintText: "Enter your name"),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: DropdownButtonFormField(
                                   hint: Text("Max Player"),
                                   decoration: InputDecoration(
                                     border: InputBorder.none
                                   )
                                   ,items: [
                                    DropdownMenuItem(child: Text("2") , value: "2",),
                                    DropdownMenuItem(child: Text("3") , value: "3",),
                                    DropdownMenuItem(child: Text("4") , value: "4",),
                                    DropdownMenuItem(child: Text("5") , value: "5",),
                                  ], onChanged: (val){
                                    setState(() {
                                      _maxRoundsValue = val;
                                    });
                                  }),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: DropdownButtonFormField(
                                      hint: Text("Max Round"),

                                      decoration: InputDecoration(
                                          border: InputBorder.none,

                                      )
                                      ,items: [
                                    DropdownMenuItem(child: Text("2") , value: "2",),
                                    DropdownMenuItem(child: Text("3") , value: "3",),
                                    DropdownMenuItem(child: Text("4") , value: "4",),
                                    DropdownMenuItem(child: Text("5") , value: "5",),
                                  ], onChanged: (val){
                                    setState(() {
                                      _roomSizeValue = val;
                                    });
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        CustomTextField(controller: _roomNameController, hintText: "Enter room name"),

                        Center(
                          child: Container(
                              margin: EdgeInsets.all(10),
                              width: 380,
                              height: 100,
                              child: Image.asset('assets/images/mid-man.png',
                              )),
                        ),
                        InkWell(
                          onTap: createRoom,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.greenAccent,
                            ),
                            width: double.infinity,
                            height: 50,
                            child: Center(child: Text("Create Room!",
                              style: TextStyle(fontSize: 26,fontWeight: FontWeight.w700,color: Colors.white),
                            )),
                          ),
                        ),

                        // InkWell(
                        //   onTap: () => Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (context) => const CreateRoomScreen(),
                        //     ),
                        //   ),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.blueAccent,
                        //     ),
                        //     width: double.infinity,
                        //     height: 40,
                        //     child: Center(child: Text("Create Private Room!",
                        //       style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),
                        //     )),
                        //   ),
                        // )

                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
