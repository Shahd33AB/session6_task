import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<List<String>> board = List.generate(
      3, (_) => List.generate(3, (_) => ''));
  bool isPlayerX = true;
  int oScore = 0;
  int xScore = 0;
  int length=0;

  bool checkWin(String player) {
    for (int row = 0; row < 3; row++) {
      if (board[row][0] == player && board[row][1] == player && board[row][2] == player) {
        return true;}
      for (int col = 0; col < 3; col++) {
      if (board[0][col] == player && board[1][col] == player && board[2][col] == player) {
        return true;}}
      for (int row=0, col =0; row<3&& col< 3;row++,col++) {
        if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
          return true;}
        if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
          return true;}}
   }return false; }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(
        child: Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(30.0),
                child:
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Player X",
          style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue)),
    Text(
    xScore.toString(),
    style: TextStyle(fontSize: 20,color: Colors.blue,
    )),


          Padding(
          padding: const EdgeInsets.all(30.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Player O', style: TextStyle(fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.blue)
    ),
    Text(
    oScore.toString(),
    style: TextStyle(fontSize: 20,color: Colors.blue),
    ),
        //  )
            //
          ]



          )
            )
          ]
          )
            )
   ] ),
     /*  ]

    )
          )
            )
    )
    ),
    ],*/
Container(
  height:500,
  child:   ListView.builder(



  itemCount: 3,



  itemBuilder: (context,Row)=>Container(

    height: 100,

    child: ListView.builder(







        itemCount: 3,



          scrollDirection: Axis.horizontal,



          shrinkWrap:true,



          physics:NeverScrollableScrollPhysics(),



          itemBuilder: (context,Column)=>GestureDetector(



            onTap:() {



              setState(() {



                if (board[Row][Column] == "") {
                  board[Row][Column] = "x";
                  if (checkWin("x")) {
                    xScore++;
                    showDialog(
                        barrierDismissible: false,
                        context: context, builder: (context) =>
                        AlertDialog(title: Text("X win"),
                          actions: [
                            ElevatedButton(
                              child: Text("Play Again"),
                              onPressed: () {
                                setState(() {
                                  //   board.clear();
                                  board.forEach((element) {
                                    element.fillRange(0, element.length, "");
                                  });
                                });

                                Navigator.pop(context);
                              },
                            ),
                          ],

                        ));
                 return; }

//elseif chexkwino
                  //      else
                  //      if board
                  //    ملينانه
                length = board
                      .expand((element) => element)
                      .where((element) => (element != ""))
                      .toList()
                      .length;

                  if (length <= 8) {
                    final random = Random();

                    int row, col;

                    do {
                      row = random.nextInt(3);

                      col = random.nextInt(3);
                    } while (board[row][col] != "");

                    board[row][col] = "O";
                  }

                   if (checkWin("O")) {
                    oScore++;
                    showDialog(barrierDismissible: false,
                        context: context, builder: (context) =>
                        AlertDialog(
                          title: Text("o win"),
                          actions: [
                            ElevatedButton(
                              child: Text("Play Again"),
                              onPressed: () {
                                setState(() {
                                  // board.clear();
                                  board.forEach((element) {
                                    element.fillRange(0, element.length, "");
                                  });
                                });

                                Navigator.pop(context);
                              },
                            ),
                          ],

                        ));
                    return;  }




                }
             //   print(length);
                  if (length == 9  &&  !checkWin("x")  &&  !checkWin("O")) {
                    showDialog(
                        barrierDismissible: false,
                        context: context, builder: (context) =>
                        AlertDialog(title: Text("Draw"),
                          actions: [
                            ElevatedButton(
                              child: Text("Play Again"),
                              onPressed: () {
                                setState(() {
                                  // board.clear();
                                  board.forEach((element) {
                                    element.fillRange(0, element.length, "");
                                  });
                                });

                                Navigator.pop(context);
                              },
                            ),
                          ],

                        ));
                  }
                });








            },






         child:

              Container(



                height: 100,



                width: 100,


                decoration: BoxDecoration(



                    borderRadius: BorderRadius.circular(20),



                    border: Border.all(color: Colors.black)



                ),



                child: Center(



                  child: Text("${board[Row][Column]}", style: TextStyle(



                      fontWeight: FontWeight.bold,



                      color: Colors.black,



                      fontSize: 40)


                  ),



                ),)



          ),











     ),

  ),



  ),
)
    //)
          ],
        ),
      ),

    );
   // ]
 //   ),
 //   );
  }
}



