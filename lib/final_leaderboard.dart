import 'package:flutter/material.dart';
import 'package:scribble_io/Music/music_play.dart';

class FinalLeaderboard extends StatefulWidget {
  final scoreboard;
  final String winner;
  FinalLeaderboard(this.scoreboard, this.winner);

  @override
  State<FinalLeaderboard> createState() => _FinalLeaderboardState();
}

class _FinalLeaderboardState extends State<FinalLeaderboard> {

  @override
  void initState() {
    MusicPlayer.hurray();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        padding: const EdgeInsets.all(8),
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(children: [


          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
            child: Center(
              child: Container(
                  width: 350,
                  child: Image.asset('assets/images/logo.gif',

                  )),
            ),
          ),



          Container(
            height: MediaQuery.of(context).size.height*0.5,
            child: ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: widget.scoreboard.length,
                itemBuilder: (context, index) {
                  var data = widget.scoreboard[index].values;
                  return ListTile(

                    tileColor: Colors.deepOrange,
                    title: Row(
                      children: [
                        Image.asset('assets/images/single-man.png',
                         height: 50,
                          width: 50,
                        ),

                        Text(data.elementAt(0),
                            style:
                                const TextStyle(color: Colors.black, fontSize: 23)),
                      ],
                    ),
                    trailing: Text("${data.elementAt(1)} Points",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  );
                }),
          ),
          Image.asset('assets/images/mid-man.png',
            height: 100,
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${widget.winner} has won the game!",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ]),
      ),
    );
  }
}
