import 'package:flutter/material.dart';
import 'game_button.dart';

class Multeplayer extends StatefulWidget {
  @override
  _Multeplayer createState() => _Multeplayer();
}

class _Multeplayer extends State<Multeplayer> {
  int i = 1;
  int winner1 = 0;
  int winner2 = 0;
  bool line1 = false;
  bool line2 = false;
  bool line3 = false;
  bool line4 = false;
  bool line5 = false;
  bool line6 = false;
  bool line7 = false;
  bool line8 = false;
  String turns = 'player 1 turn';
  int turn = 2;

  List listButton = <GameButton>[
    new GameButton(1),
    new GameButton(2),
    new GameButton(3),
    new GameButton(4),
    new GameButton(5),
    new GameButton(6),
    new GameButton(7),
    new GameButton(8),
    new GameButton(9),
  ];

  void initialisation() {
    for (var i = 0; i < 9; i++) {
      listButton[i].str = "";
      listButton[i].enabled = true;
      listButton[i].clr = Colors.transparent;
    }
    if (turn % 2 == 0) {
      turns = 'player 1 turn';
    } else {
      turns = 'player 2 turn';
    }
    line1 = false;
    line2 = false;
    line3 = false;
    line4 = false;
    line5 = false;
    line6 = false;
    line7 = false;
    line8 = false;
  }

  void putX(i) {
    if (listButton[i].enabled) {
      listButton[i].str = "X";
      listButton[i].enabled = false;
      listButton[i].clr = Colors.black;
    } else {
      putX(i);
    }
  }

  void putO(i) {
    if (listButton[i].enabled) {
      listButton[i].str = "O";
      listButton[i].enabled = false;
      listButton[i].clr = Colors.white;
    } else {
      putO(i);
    }
  }

  void playeronewon() {
    bool playeronewon = false;
    if (listButton[0].str == "X" &&
        listButton[1].str == "X" &&
        listButton[2].str == "X") {
      playeronewon = true;
      line1 = true;
    } else if (listButton[3].str == "X" &&
        listButton[4].str == "X" &&
        listButton[5].str == "X") {
      playeronewon = true;
      line2 = true;
    } else if (listButton[8].str == "X" &&
        listButton[6].str == "X" &&
        listButton[7].str == "X") {
      playeronewon = true;
      line3 = true;
    } else if (listButton[0].str == "X" &&
        listButton[3].str == "X" &&
        listButton[6].str == "X") {
      playeronewon = true;
      line4 = true;
    } else if (listButton[1].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X") {
      playeronewon = true;
      line5 = true;
    } else if (listButton[2].str == "X" &&
        listButton[5].str == "X" &&
        listButton[8].str == "X") {
      playeronewon = true;
      line6 = true;
    } else if (listButton[2].str == "X" &&
        listButton[4].str == "X" &&
        listButton[6].str == "X") {
      playeronewon = true;
      line8 = true;
    } else if (listButton[0].str == "X" &&
        listButton[4].str == "X" &&
        listButton[8].str == "X") {
      playeronewon = true;
      line7 = true;
    }
    if (playeronewon) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = Colors.black;
      }
      winner1++;
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text('player 1 had won $winner1 time'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('close'),
                  )
                ]);
          });
      return;
    }
  }

  void playertwowon() {
    bool playertwowon = false;
    if (listButton[0].str == "O" &&
        listButton[1].str == "O" &&
        listButton[2].str == "O") {
      playertwowon = true;
      line1 = true;
    }
    if (listButton[3].str == "O" &&
        listButton[4].str == "O" &&
        listButton[5].str == "O") {
      playertwowon = true;
      line2 = true;
    }
    if (listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[7].str == "O") {
      playertwowon = true;
      line3 = true;
    }
    if (listButton[0].str == "O" &&
        listButton[3].str == "O" &&
        listButton[6].str == "O") {
      playertwowon = true;
      line4 = true;
    }
    if (listButton[1].str == "O" &&
        listButton[4].str == "O" &&
        listButton[7].str == "O") {
      playertwowon = true;
      line5 = true;
    }
    if (listButton[2].str == "O" &&
        listButton[5].str == "O" &&
        listButton[8].str == "O") {
      playertwowon = true;
      line6 = true;
    }
    if (listButton[2].str == "O" &&
        listButton[4].str == "O" &&
        listButton[6].str == "O") {
      playertwowon = true;
      line8 = true;
    }
    if (listButton[0].str == "O" &&
        listButton[4].str == "O" &&
        listButton[8].str == "O") {
      playertwowon = true;
      line7 = true;
    }
    if (playertwowon) {
      for (int i = 0; i < 9; i++) {
        listButton[i].enabled = false;
        listButton[i].clr = Colors.white;
      }
      winner2++;
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text('player 2 had won $winner2 time'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('close'),
                  )
                ]);
          });
      return;
    }
  }

  void checkboxes() {
    bool boxesempty = true;
    bool playertwowin = false;
    bool playeronewin = false;
    if (listButton[0].clr == Colors.white &&
        listButton[1].clr == Colors.white &&
        listButton[2].clr == Colors.white &&
        listButton[3].clr == Colors.white &&
        listButton[4].clr == Colors.white &&
        listButton[5].clr == Colors.white &&
        listButton[6].clr == Colors.white &&
        listButton[7].clr == Colors.white &&
        listButton[8].clr == Colors.white) {
      playertwowin = true;
    }
    if (listButton[0].clr == Colors.black &&
        listButton[1].clr == Colors.black &&
        listButton[2].clr == Colors.black &&
        listButton[3].clr == Colors.black &&
        listButton[4].clr == Colors.black &&
        listButton[5].clr == Colors.black &&
        listButton[6].clr == Colors.black &&
        listButton[7].clr == Colors.black &&
        listButton[8].clr == Colors.black) {
      playeronewin = true;
    }
    if (listButton[0].enabled == false &&
        listButton[1].enabled == false &&
        listButton[2].enabled == false &&
        listButton[3].enabled == false &&
        listButton[4].enabled == false &&
        listButton[5].enabled == false &&
        listButton[6].enabled == false &&
        listButton[7].enabled == false &&
        listButton[8].enabled == false) {
      boxesempty = false;
    }
    if (boxesempty == false && playertwowin == false) {
      if (boxesempty == false && playeronewin == false) {
        for (int i = 0; i < 9; i++) {
          listButton[i].enabled = false;
          listButton[i].clr = Colors.white12;
        }
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(title: Text('DRAW'), actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text('close'),
                )
              ]);
            });
      }
    }
  }

  void player2(index) {
    putO(index);
    playertwowon();
    checkboxes();
  }

  void player1(index) {
    putX(index);

    playeronewon();
    checkboxes();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: <Widget>[
          // ignore: deprecated_member_use
          Container(
            margin: EdgeInsets.only(top: 460, left: 70),
            padding: EdgeInsets.all(10),
            child: Text(
              'X: $winner1 -O: $winner2 ',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 410, left: 117),
            child: Text(' $turns ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(3, 25, 0, 0),
                      padding: EdgeInsets.fromLTRB(178, 4, 190, 16),
                      color: Colors.cyan,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(3, 0, 0, 334),
                      padding: EdgeInsets.fromLTRB(178, 14, 190, 4),
                      color: Colors.cyan,
                    ),
                  ])
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 28, 0, 0),
                      padding: EdgeInsets.fromLTRB(4, 0, 12, 370),
                      color: Colors.cyan,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 28, 6, 0),
                      padding: EdgeInsets.fromLTRB(12, 0, 4, 370),
                      color: Colors.cyan,
                    ),
                  ])
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16.5, left: 3.5),
            child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0),
                itemCount: 9,
                itemBuilder: (context, index) {
                  // ignore: deprecated_member_use
                  return new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      listButton[index].str,
                      style:
                          new TextStyle(color: Colors.red[900], fontSize: 60.0),
                    ),
                    color: listButton[index].clr,
                    disabledColor: Colors.blue[900],
                    onPressed: () {
                      setState(() {
                        if (turn % 2 == 0) {
                          player1(index);
                          turn++;
                        } else {
                          player2(index);
                          turn++;
                        }
                        if (turn % 2 == 0) {
                          turns = 'player 1 turn';
                        } else {
                          turns = 'player 2 turn';
                        }
                      });
                    },
                  );
                }),
          ),
          if (line1) CustomPaint(painter: Face()),
          if (line2) CustomPaint(painter: Face2()),
          if (line3) CustomPaint(painter: Face3()),
          if (line4) CustomPaint(painter: Face4()),
          if (line5) CustomPaint(painter: Face5()),
          if (line6) CustomPaint(painter: Face6()),
          if (line7) CustomPaint(painter: Face7()),
          if (line8) CustomPaint(painter: Face8()),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.replay),
          backgroundColor: Colors.red[800],
          onPressed: () {
            setState(() {
              initialisation();
            });
          },
        ),
      ),
    );
  }
}

class Face extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(15, 80);
    final p2 = Offset(380, 80);
    final paint = Paint()
      ..strokeWidth = 6.0
      ..color = Colors.indigo;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void gamepainter() {}

class Face2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(15, 215);
    final p2 = Offset(380, 215);
    final paint = Paint()
      ..strokeWidth = 6.0
      ..color = Colors.indigo;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Face3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(15, 340);
    final p2 = Offset(380, 340);
    final paint = Paint()
      ..strokeWidth = 6.0
      ..color = Colors.indigo;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Face4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(70, 30);
    final p2 = Offset(70, 397);
    final paint = Paint()
      ..strokeWidth = 6.0
      ..color = Colors.indigo;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Face5 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(198, 30);
    final p2 = Offset(198, 397);
    final paint = Paint()
      ..strokeWidth = 6.0
      ..color = Colors.indigo;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Face6 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(330, 30);
    final p2 = Offset(330, 397);
    final paint = Paint()
      ..strokeWidth = 6.0
      ..color = Colors.indigo;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Face7 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(15, 30);
    final p2 = Offset(380, 397);
    final paint = Paint()
      ..strokeWidth = 6.0
      ..color = Colors.indigo;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Face8 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(15, 397);
    final p2 = Offset(380, 30);
    final paint = Paint()
      ..strokeWidth = 6.0
      ..color = Colors.indigo;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
