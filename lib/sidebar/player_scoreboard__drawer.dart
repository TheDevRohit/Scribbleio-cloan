import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerScore extends StatelessWidget {
  final List<Map> userData;
  PlayerScore(this.userData);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
            child: Column(
              children: [

                Center(
                  child: Container(
                      width: 280,
                      child: Image.asset('assets/images/logo.gif',

                      )),
                ),
                SizedBox(height: 30,),
                Text("All Player Point"),
                Container(
                  height: double.maxFinite,
                  child: ListView.builder(
                    itemCount: userData.length,
                    itemBuilder: (context, index) {
                    var data = userData[index].values;
                    return ListTile(
                      title: Row(
                        children: [
                          Center(
                            child: Container(
                                height: 40,
                                width: 40,
                                child: Image.asset('assets/images/single-man.png',

                                )),
                          ),
                          Text(data.elementAt(0), style: TextStyle(color: Colors.black, fontSize: 23)),
                        ],
                      ),
                      trailing: Text(data.elementAt(1), style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold)),
                    );
                  })
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}