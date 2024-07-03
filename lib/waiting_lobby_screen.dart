import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WaitingLobbyScreen extends StatefulWidget {
  final int occupancy;
  final int noOfPlayers;
  final String lobbyName;
  final players;
  const WaitingLobbyScreen(
      {Key? key,
      required this.occupancy,
      required this.noOfPlayers,
      required this.lobbyName,
      required this.players})
      : super(key: key);

  @override
  _WaitingLobbyScreenState createState() => _WaitingLobbyScreenState();
}

class _WaitingLobbyScreenState extends State<WaitingLobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Align(alignment: Alignment.topLeft  ,child: TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("back",
              style: TextStyle(fontSize: 18,color: Colors.white),
             ))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Center(
              child: Container(
                  width: 300,
                  child: Image.asset('assets/images/logo.gif',

                  )),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                    textAlign: TextAlign.center,
                    'Waiting for ${widget.occupancy - widget.noOfPlayers} players to join',
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                readOnly: true,
                onTap: () {
                  // copy room code
                  Clipboard.setData(ClipboardData(text: widget.lobbyName));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Copied!')));
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  filled: true,
                  fillColor: const Color(0xffF5F5FA),
                  hintText: 'Tap to copy room name!',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text('Joined Players: ', style: TextStyle(fontSize: 25,
             color: Colors.white,
              fontWeight: FontWeight.bold
            )),
            Container(
              width: 350,
              child: ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  itemCount: widget.noOfPlayers,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        trailing: Image.asset('assets/images/single-man.png'),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        tileColor: Colors.white,
                        leading: Text(
                          "# ${index + 1}",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          widget.players[index]['nickname'].toString().toUpperCase(),
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("0 points"),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
