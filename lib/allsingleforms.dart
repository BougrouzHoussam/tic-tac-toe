import 'package:flutter/material.dart';
import 'game_button.dart';
import 'dart:math';

class SINGLE extends StatefulWidget {
  @override
  _SINGLE createState() => _SINGLE();
}

class _SINGLE extends State<SINGLE> {
  int i = 1;
  int turn = 2;

  late int form;
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
  int way1 = 0;
  int way2 = 0;
  int way3 = 0;
  int way4 = 0;
  int way5 = 0;
  int way6 = 0;
  int way7 = 0;
  int way8 = 0;
  int conter = 0;
  int count = 0;
  int round = 0;
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
  void initialisation() {
    line1 = false;
    line2 = false;
    line3 = false;
    line4 = false;
    line5 = false;
    line6 = false;
    line7 = false;
    line8 = false;
    if (turn % 2 == 0) {
      for (int i = 0; i < 9; i++) {
        listButton[i].str = "";
        listButton[i].enabled = true;
        listButton[i].clr = Colors.transparent;
      }
      conter = 0;
      round = 0;
      count = 0;
    } else {
      final playin = Random().nextInt(4);
      for (var i = 0; i < 9; i++) {
        listButton[i].str = "";
        listButton[i].enabled = true;
        listButton[i].clr = Colors.transparent;
      }
      if (playin == 0) {
        listButton[0].str = "O";
        listButton[0].enabled = false;
        listButton[0].clr = Colors.white;
        form = 1;
      } else if (playin == 1) {
        listButton[2].str = "O";
        listButton[2].enabled = false;
        listButton[2].clr = Colors.white;
        form = 2;
      } else if (playin == 2) {
        listButton[8].str = "O";
        listButton[8].enabled = false;
        listButton[8].clr = Colors.white;
        form = 3;
      } else if (playin == 3) {
        listButton[6].str = "O";
        listButton[6].enabled = false;
        listButton[6].clr = Colors.white;
        form = 4;
      }
      way1 = 0;
      way2 = 0;
      way3 = 0;
      way4 = 0;
      way5 = 0;
      way6 = 0;
      way7 = 0;
      way8 = 0;
    }
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
    if (listButton[i].enabled == false) return;
    listButton[i].str = "O";
    listButton[i].enabled = false;
    listButton[i].clr = Colors.white;
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
                title: Text('system had won $winner2 time'),
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

//here where the player begin first
  int conter1(index) {
    putO(1);
    if (round == 1) {
      if (listButton[7].str == 'X') {
        putO(6);
      } else {
        putO(7);
      }
    } else if (round == 2) {
      if (listButton[2].str == 'X') {
        putO(5);
      } else {
        putO(2);
      }
    }
    round++;
    return 1;
  }

  int conter2(index) {
    putO(7);
    if (round == 1) {
      if (listButton[1].str == 'X') {
        putO(0);
      } else {
        putO(1);
      }
    } else if (round == 2) {
      if (listButton[8].str == 'X') {
        putO(5);
      } else {
        putO(8);
      }
    }
    round++;
    return 2;
  }

  void sysgame(index) {
    playertwowon();
    playeronewon();
    checkboxes();
    if (listButton[6].enabled == false &&
        listButton[2].enabled == false &&
        listButton[1].enabled == false &&
        listButton[0].enabled == false &&
        listButton[3].enabled == false &&
        listButton[5].enabled == false &&
        listButton[8].enabled == false &&
        listButton[7].enabled == false &&
        listButton[4].enabled == false) {
      return;
    }
    late int r;

    do {
      r = Random().nextInt(9);
    } while (listButton[r].enabled == false);

    if (listButton[0].str == 'X' && listButton[1].str == 'X') {
      if (listButton[2].enabled == true) {
        putO(2);
      } else {
        putO(r);
      }
    } else if (listButton[3].str == 'X' && listButton[4].str == 'X') {
      if (listButton[5].enabled == true) {
        putO(5);
      } else {
        putO(r);
      }
    } else if (listButton[6].str == 'X' && listButton[7].str == 'X') {
      if (listButton[8].enabled == true) {
        putO(8);
      } else {
        putO(r);
      }
    } else if (listButton[0].str == 'X' && listButton[3].str == 'X') {
      if (listButton[6].enabled == true) {
        putO(6);
      } else {
        putO(r);
      }
    } else if (listButton[1].str == 'X' && listButton[4].str == 'X') {
      if (listButton[7].enabled == true) {
        putO(7);
      } else {
        putO(r);
      }
    } else if (listButton[2].str == 'X' && listButton[5].str == 'X') {
      if (listButton[8].enabled == true) {
        putO(8);
      } else {
        putO(r);
      }
    } else if (listButton[2].str == 'X' && listButton[4].str == 'X') {
      if (listButton[6].enabled == true) {
        putO(6);
      } else {
        putO(r);
      }
    } else if (listButton[0].str == 'X' && listButton[4].str == 'X') {
      if (listButton[8].enabled == true) {
        putO(8);
      } else {
        putO(r);
      }
    } else if (listButton[2].str == 'X' && listButton[1].str == 'X') {
      if (listButton[0].enabled == true) {
        putO(0);
      } else {
        putO(r);
      }
    } else if (listButton[5].str == 'X' && listButton[4].str == 'X') {
      if (listButton[3].enabled == true) {
        putO(3);
      } else {
        putO(r);
      }
    } else if (listButton[8].str == 'X' && listButton[7].str == 'X') {
      if (listButton[6].enabled == true) {
        putO(6);
      } else {
        putO(r);
      }
    } else if (listButton[6].str == 'X' && listButton[3].str == 'X') {
      if (listButton[0].enabled == true) {
        putO(0);
      } else {
        putO(r);
      }
    } else if (listButton[7].str == 'X' && listButton[4].str == 'X') {
      if (listButton[1].enabled == true) {
        putO(1);
      } else {
        putO(r);
      }
    } else if (listButton[8].str == 'X' && listButton[5].str == 'X') {
      if (listButton[2].enabled == true) {
        putO(2);
      } else {
        putO(r);
      }
    } else if (listButton[6].str == 'X' && listButton[4].str == 'X') {
      if (listButton[2].enabled == true) {
        putO(2);
      } else {
        putO(r);
      }
    } else if (listButton[8].str == 'X' && listButton[4].str == 'X') {
      if (listButton[0].enabled == true) {
        putO(0);
      } else {
        putO(r);
      }
    } else if (listButton[0].str == 'X' && listButton[2].str == 'X') {
      if (listButton[1].enabled == true) {
        putO(1);
      } else {
        putO(r);
      }
    } else if (listButton[3].str == 'X' && listButton[5].str == 'X') {
      if (listButton[4].enabled == true) {
        putO(4);
      } else {
        putO(r);
      }
    } else if (listButton[6].str == 'X' && listButton[8].str == 'X') {
      if (listButton[7].enabled == true) {
        putO(7);
      } else {
        putO(r);
      }
    } else if (listButton[0].str == 'X' && listButton[6].str == 'X') {
      if (listButton[3].enabled == true) {
        putO(3);
      } else {
        putO(r);
      }
    } else if (listButton[1].str == 'X' && listButton[7].str == 'X') {
      if (listButton[4].enabled == true) {
        putO(4);
      } else {
        putO(r);
      }
    } else if (listButton[2].str == 'X' && listButton[8].str == 'X') {
      if (listButton[5].enabled == true) {
        putO(5);
      } else {
        putO(r);
      }
    } else if (listButton[2].str == 'X' && listButton[6].str == 'X') {
      if (listButton[4].enabled == true) {
        putO(4);
      } else {
        putO(r);
      }
    } else if (listButton[0].str == 'X' && listButton[8].str == 'X') {
      if (listButton[4].enabled == true) {
        putO(4);
      } else {
        putO(r);
      }
    } else {
      putO(r);
    }
    checkboxes();
  }

  //if system will play first
  int wineasywayfor11(index) {
    int win = 1;
    putO(6);
    if (listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[2].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[4].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[5].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[7].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[8].str == "X") {
      putO(3);
      playertwowon();
    } else if (listButton[3].str == "X") {
      putO(8);
      if (listButton[7].enabled == true && listButton[2].str == "X" ||
          listButton[7].enabled == true && listButton[4].str == "X") {
        putO(7);
        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);
        playertwowon();
      }
    }
    return win;
  }

  int wineasywayfor21(index) {
    putO(2);
    if (listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[6].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[4].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[5].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[7].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[8].str == "X") {
      putO(1);
      playertwowon();
    } else if (listButton[1].str == "X" && listButton[2].str == "O") {
      putO(8);
      if (listButton[5].enabled == true && listButton[6].str == "X" ||
          listButton[5].enabled == true && listButton[4].str == "X") {
        putO(5);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor31(index) {
    putO(2);

    if (listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[3].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[4].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[6].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[7].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[8].str == "X") {
      putO(1);

      playertwowon();
    } else if (listButton[1].str == "X") {
      putO(6);
      if (listButton[3].enabled == true && listButton[4].str == "X" ||
          listButton[3].enabled == true && listButton[8].str == "X") {
        putO(3);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor41(index) {
    putO(6);

    if (listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[2].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[4].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[5].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[1].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[8].str == "X") {
      putO(3);

      playertwowon();
    } else if (listButton[3].str == "X") {
      putO(2);
      if (listButton[1].enabled == true && listButton[8].str == "X" ||
          listButton[1].enabled == true && listButton[4].str == "X") {
        putO(1);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor51(index) {
    putO(6);

    if (listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[1].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[4].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[5].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[7].str == "X" ||
        listButton[3].enabled == true &&
            listButton[6].str == "O" &&
            listButton[8].str == "X") {
      putO(3);

      playertwowon();
    } else if (listButton[3].str == "X") {
      putO(8);
      if (listButton[7].enabled == true && listButton[5].str == "X" ||
          listButton[7].enabled == true && listButton[4].str == "X") {
        putO(7);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[1].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor61(index) {
    putO(2);

    if (listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[3].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[4].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[5].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[7].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[8].str == "X") {
      putO(1);

      playertwowon();
    } else if (listButton[1].str == "X") {
      putO(8);
      if (listButton[5].enabled == true && listButton[7].str == "X" ||
          listButton[5].enabled == true && listButton[4].str == "X") {
        putO(5);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[3].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor71(index) {
    putO(2);
    if (listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[6].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[4].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[5].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[7].str == "X" ||
        listButton[1].enabled == true &&
            listButton[2].str == "O" &&
            listButton[3].str == "X") {
      putO(1);

      playertwowon();
    } else if (listButton[1].str == "X") {
      putO(6);
      if (listButton[3].enabled == true && listButton[5].str == "X" ||
          listButton[3].enabled == true && listButton[4].str == "X") {
        putO(3);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int nrmlcase1(index) {
    int win = 1;
    putO(8);
    void winplan1() {
      if (listButton[5].str == "X" &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true &&
          listButton[1].enabled == true) {
        putO(1);
      } else if (listButton[1].str == "X" &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true &&
          listButton[5].enabled == true) {
        putO(5);
      } else if (listButton[3].str == "X" &&
          listButton[5].enabled == true &&
          listButton[7].enabled == true &&
          listButton[1].enabled == true) {
        putO(1);
      } else if (listButton[7].str == "X" &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true &&
          listButton[5].enabled == true) {
        putO(5);
      }
      return;
    }

    // win with plan two if "O" get 6
    void winplan2() {
      if (listButton[5].str == "X" &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true &&
          listButton[7].enabled == true) {
        putO(7);
      } else if (listButton[1].str == "X" &&
          listButton[5].enabled == true &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true) {
        putO(3);
      } else if (listButton[3].str == "X" &&
          listButton[5].enabled == true &&
          listButton[1].enabled == true &&
          listButton[7].enabled == true) {
        putO(7);
      } else if (listButton[7].str == "X" &&
          listButton[1].enabled == true &&
          listButton[5].enabled == true &&
          listButton[3].enabled == true) {
        putO(3);
      }
      return;
    }

    if (listButton[0].str == "O" &&
        listButton[1].enabled == true &&
        listButton[2].enabled == true &&
        listButton[3].enabled == true &&
        listButton[4].enabled == false &&
        listButton[5].enabled == true &&
        listButton[6].enabled == false &&
        listButton[7].enabled == true &&
        listButton[8].str == "O") {
      putO(2);
    } else if (listButton[0].str == "O" &&
        listButton[1].enabled == true &&
        listButton[2].enabled == false &&
        listButton[3].enabled == true &&
        listButton[4].enabled == false &&
        listButton[5].enabled == true &&
        listButton[6].enabled == true &&
        listButton[7].enabled == true &&
        listButton[8].str == "O") {
      putO(6);
    }
    if (listButton[2].str == "O" || listButton[6].str == "O") {
      if (listButton[2].str == "O" && listButton[6].str == "X") {
        winplan1();
      } else if (listButton[6].str == "O" && listButton[2].str == "X") {
        winplan2();
      }
    } else {
      if (listButton[0].str == "O" &&
          listButton[5].str == "O" &&
          listButton[8].str == "O" &&
          listButton[4].str == "X" &&
          listButton[7].str == "X" &&
          listButton[3].str == "X") {
        putO(2);
        playertwowon();
      } else if (listButton[0].str == "O" &&
          listButton[8].str == "O" &&
          listButton[5].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X" &&
          listButton[1].str == "X") {
        putO(2);
        playertwowon();
      } else if (listButton[0].str == "O" &&
          listButton[8].str == "O" &&
          listButton[3].str == "O" &&
          listButton[4].str == "X" &&
          listButton[5].str == "X" &&
          listButton[1].str == "X" &&
          listButton[6].enabled == true &&
          listButton[2].enabled == true) {
        putO(6);
        playertwowon();
      } else if (listButton[0].str == "O" &&
          listButton[8].str == "O" &&
          listButton[3].str == "O" &&
          listButton[4].str == "X" &&
          listButton[5].str == "X" &&
          listButton[7].str == "X" &&
          listButton[6].enabled == true &&
          listButton[2].enabled == true) {
        putO(6);
        playertwowon();
      }

      if (listButton[0].str == "O" &&
          listButton[4].str == "X" &&
          listButton[8].str == "O" &&
          listButton[7].str == "X") {
        putO(1);
        if (listButton[2].enabled == true && listButton[3].str == "X" ||
            listButton[2].enabled == true && listButton[5].str == "X" ||
            listButton[2].enabled == true && listButton[6].str == "X") {
          putO(2);
        } else if (listButton[2].enabled == false) {
          putO(6);
        }
      } else if (listButton[0].str == "O" &&
          listButton[8].str == "O" &&
          listButton[4].str == "X" &&
          listButton[1].str == "X") {
        putO(7);
        if (listButton[6].enabled == true && listButton[2].str == "X" ||
            listButton[6].enabled == true && listButton[3].str == "X" ||
            listButton[6].enabled == true && listButton[5].str == "X") {
          putO(6);
        } else if (listButton[6].enabled == false) {
          putO(2);
        }
      } else if (listButton[0].str == "O" &&
          listButton[8].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X") {
        putO(5);
        if (listButton[2].enabled == true && listButton[1].str == "X" ||
            listButton[2].enabled == true && listButton[7].str == "X" ||
            listButton[2].enabled == true && listButton[6].str == "X") {
          putO(2);
        } else if (listButton[2].str == "X") {
          putO(6);
        }
      } else if (listButton[0].str == "O" &&
          listButton[4].str == "X" &&
          listButton[8].str == "O" &&
          listButton[5].str == "X") {
        putO(3);
        if (listButton[6].enabled == true && listButton[1].str == "X" ||
            listButton[6].enabled == true && listButton[7].str == "X" ||
            listButton[6].enabled == true && listButton[2].str == "X") {
          putO(6);
        } else if (listButton[6].enabled == false) {
          putO(2);
        }
      }
    }
    if (listButton[0].str == "O" &&
        listButton[5].str == "O" &&
        listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[2].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[3].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    }
    if (listButton[0].str == "O" &&
        listButton[1].str == "O" &&
        listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[2].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[5].str == "X" &&
        listButton[3].enabled == true) {
      putO(3);
    } else if (listButton[0].str == "O" &&
        listButton[1].str == "O" &&
        listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[2].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[3].str == "X" &&
        listButton[5].enabled == true) {
      putO(5);
    } else if (listButton[0].str == "O" &&
        listButton[2].str == "O" &&
        listButton[8].str == "O" &&
        listButton[7].str == "O" &&
        listButton[1].str == "X" &&
        listButton[4].str == "X" &&
        listButton[6].str == "X" &&
        listButton[5].str == "X" &&
        listButton[3].enabled == true) {
      putO(3);
    } else if (listButton[0].str == "O" &&
        listButton[2].str == "O" &&
        listButton[8].str == "O" &&
        listButton[7].str == "O" &&
        listButton[1].str == "X" &&
        listButton[4].str == "X" &&
        listButton[6].str == "X" &&
        listButton[3].str == "X" &&
        listButton[5].enabled == true) {
      putO(5);
    } else if (listButton[0].str == "O" &&
        listButton[5].str == "O" &&
        listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[3].str == "X" &&
        listButton[2].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    } else if (listButton[0].str == "O" &&
        listButton[5].str == "O" &&
        listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[3].str == "X" &&
        listButton[2].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    } else if (listButton[0].str == "O" &&
        listButton[3].str == "O" &&
        listButton[8].str == "O" &&
        listButton[2].str == "O" &&
        listButton[5].str == "X" &&
        listButton[6].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    } else if (listButton[0].str == "O" &&
        listButton[3].str == "O" &&
        listButton[8].str == "O" &&
        listButton[2].str == "O" &&
        listButton[5].str == "X" &&
        listButton[6].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    }
    if (listButton[2].str == "O" &&
        listButton[7].str == "O" &&
        listButton[8].str == "O" &&
        listButton[3].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[6].str == "X") {
      putO(5);
      playertwowon();
      return win;
    }
    if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[6].str == "O" &&
        listButton[1].str == "X" &&
        listButton[8].str == "O" &&
        listButton[3].str == "X" &&
        listButton[2].enabled == true &&
        listButton[5].enabled == true &&
        listButton[7].enabled == true) {
      putO(7);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[6].str == "O" &&
        listButton[2].str == "X" &&
        listButton[8].str == "O" &&
        listButton[3].str == "X" &&
        listButton[1].enabled == true &&
        listButton[7].enabled == true &&
        listButton[5].enabled == true) {
      putO(7);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[6].str == "O" &&
        listButton[1].str == "X" &&
        listButton[2].str == "O" &&
        listButton[5].str == "X" &&
        listButton[7].enabled == true &&
        listButton[3].enabled == true &&
        listButton[8].enabled == true) {
      putO(3);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[2].str == "O" &&
        listButton[1].str == "X" &&
        listButton[8].str == "O" &&
        listButton[3].str == "X" &&
        listButton[7].enabled == true &&
        listButton[5].enabled == true &&
        listButton[6].enabled == true) {
      putO(5);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[2].str == "O" &&
        listButton[1].str == "X" &&
        listButton[8].str == "O" &&
        listButton[6].str == "X" &&
        listButton[3].enabled == true &&
        listButton[5].enabled == true &&
        listButton[7].enabled == true) {
      putO(5);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[6].str == "O" &&
        listButton[7].str == "X" &&
        listButton[2].str == "O" &&
        listButton[3].str == "X" &&
        listButton[1].enabled == true &&
        listButton[5].enabled == true &&
        listButton[8].enabled == true) {
      putO(1);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[6].str == "O" &&
        listButton[8].str == "X" &&
        listButton[2].str == "O" &&
        listButton[1].str == "X" &&
        listButton[3].enabled == true &&
        listButton[5].enabled == true &&
        listButton[7].enabled == true) {
      putO(3);
      playertwowon();
      return win;
    }
    playertwowon();

    checkboxes();
    return win;
  }

  int wineasywayfor12(index) {
    int win = 1;
    putO(8);
    if (listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[0].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[3].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[4].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[7].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[6].str == "X") {
      putO(5);
      playertwowon();
    } else if (listButton[5].str == "X") {
      putO(6);
      if (listButton[7].enabled == true && listButton[0].str == "X" ||
          listButton[7].enabled == true && listButton[4].str == "X") {
        putO(7);
        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);
        playertwowon();
      }
    }
    return win;
  }

  int wineasywayfor22(index) {
    putO(0);
    if (listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[6].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[4].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[5].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[7].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[8].str == "X") {
      putO(1);
      playertwowon();
    } else if (listButton[1].str == "X") {
      putO(8);
      if (listButton[5].enabled == true && listButton[6].str == "X" ||
          listButton[5].enabled == true && listButton[4].str == "X") {
        putO(5);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor32(index) {
    putO(0);

    if (listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[3].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[4].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[6].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[7].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[8].str == "X") {
      putO(1);

      playertwowon();
    } else if (listButton[1].str == "X") {
      putO(6);
      if (listButton[3].enabled == true && listButton[4].str == "X" ||
          listButton[3].enabled == true && listButton[8].str == "X") {
        putO(3);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor42(index) {
    putO(8);

    if (listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[0].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[4].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[1].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[3].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[6].str == "X") {
      putO(5);

      playertwowon();
    } else if (listButton[5].str == "X") {
      putO(0);
      if (listButton[1].enabled == true && listButton[6].str == "X" ||
          listButton[1].enabled == true && listButton[4].str == "X") {
        putO(1);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor52(index) {
    putO(8);

    if (listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[1].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[4].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[3].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[7].str == "X" ||
        listButton[5].enabled == true &&
            listButton[8].str == "O" &&
            listButton[6].str == "X") {
      putO(5);

      playertwowon();
    } else if (listButton[5].str == "X") {
      putO(6);
      if (listButton[7].enabled == true && listButton[3].str == "X" ||
          listButton[7].enabled == true && listButton[4].str == "X") {
        putO(7);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[1].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor62(index) {
    putO(0);

    if (listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[3].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[4].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[5].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[7].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[8].str == "X") {
      putO(1);
      playertwowon();
    } else if (listButton[1].str == "X") {
      putO(8);
      if (listButton[5].enabled == true && listButton[7].str == "X" ||
          listButton[5].enabled == true && listButton[4].str == "X") {
        putO(5);
        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[3].str == "X") {
        putO(4);
        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor72(index) {
    putO(0);
    if (listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[6].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[4].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[5].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[7].str == "X" ||
        listButton[1].enabled == true &&
            listButton[0].str == "O" &&
            listButton[3].str == "X") {
      putO(1);

      playertwowon();
    } else if (listButton[1].str == "X") {
      putO(6);
      if (listButton[3].enabled == true && listButton[5].str == "X" ||
          listButton[3].enabled == true && listButton[4].str == "X") {
        putO(3);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int nrmlcase2(index) {
    int win = 1;
    putO(6);
    void winplan1() {
      if (listButton[5].str == "X" &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true &&
          listButton[1].enabled == true) {
        putO(3);
      } else if (listButton[1].str == "X" &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true &&
          listButton[5].enabled == true) {
        putO(3);
      } else if (listButton[3].str == "X" &&
          listButton[5].enabled == true &&
          listButton[7].enabled == true &&
          listButton[1].enabled == true) {
        putO(1);
      } else if (listButton[7].str == "X" &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true &&
          listButton[5].enabled == true) {
        putO(1);
      }
      return;
    }

    void winplan2() {
      if (listButton[5].str == "X" &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true &&
          listButton[7].enabled == true) {
        putO(7);
      } else if (listButton[1].str == "X" &&
          listButton[5].enabled == true &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true) {
        putO(7);
      } else if (listButton[3].str == "X" &&
          listButton[5].enabled == true &&
          listButton[1].enabled == true &&
          listButton[7].enabled == true) {
        putO(5);
      } else if (listButton[7].str == "X" &&
          listButton[1].enabled == true &&
          listButton[5].enabled == true &&
          listButton[3].enabled == true) {
        putO(5);
      }
      return;
    }

    if (listButton[2].str == "O" &&
        listButton[1].enabled == true &&
        listButton[0].enabled == true &&
        listButton[3].enabled == true &&
        listButton[4].enabled == false &&
        listButton[5].enabled == true &&
        listButton[8].enabled == false &&
        listButton[7].enabled == true &&
        listButton[6].str == "O") {
      putO(0);
    } else if (listButton[2].str == "O" &&
        listButton[1].enabled == true &&
        listButton[8].enabled == true &&
        listButton[3].enabled == true &&
        listButton[4].enabled == false &&
        listButton[5].enabled == true &&
        listButton[0].enabled == false &&
        listButton[7].enabled == true &&
        listButton[6].str == "O") {
      putO(8);
    }
    if (listButton[0].str == "O" || listButton[8].str == "O") {
      if (listButton[0].str == "O" && listButton[8].str == "X") {
        winplan1();
      } else if (listButton[8].str == "O" && listButton[0].str == "X") {
        winplan2();
      }
    } else {
      if (listButton[2].str == "O" &&
          listButton[3].str == "O" &&
          listButton[6].str == "O" &&
          listButton[4].str == "X" &&
          listButton[7].str == "X" &&
          listButton[5].str == "X") {
        putO(0);
        playertwowon();
      } else if (listButton[2].str == "O" &&
          listButton[6].str == "O" &&
          listButton[3].str == "O" &&
          listButton[4].str == "X" &&
          listButton[5].str == "X" &&
          listButton[1].str == "X") {
        putO(0);
        playertwowon();
      } else if (listButton[2].str == "O" &&
          listButton[6].str == "O" &&
          listButton[5].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X" &&
          listButton[1].str == "X" &&
          listButton[8].enabled == true &&
          listButton[0].enabled == true) {
        putO(8);
        playertwowon();
      } else if (listButton[2].str == "O" &&
          listButton[6].str == "O" &&
          listButton[5].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X" &&
          listButton[7].str == "X" &&
          listButton[8].enabled == true &&
          listButton[0].enabled == true) {
        putO(8);
        playertwowon();
      }

      if (listButton[2].str == "O" &&
          listButton[4].str == "X" &&
          listButton[6].str == "O" &&
          listButton[7].str == "X") {
        putO(1);
        if (listButton[0].enabled == true && listButton[3].str == "X" ||
            listButton[0].enabled == true && listButton[5].str == "X" ||
            listButton[0].enabled == true && listButton[8].str == "X") {
          putO(0);
        } else if (listButton[0].enabled == false) {
          putO(8);
        }
      } else if (listButton[2].str == "O" &&
          listButton[6].str == "O" &&
          listButton[4].str == "X" &&
          listButton[1].str == "X") {
        putO(7);
        if (listButton[8].enabled == true && listButton[0].str == "X" ||
            listButton[8].enabled == true && listButton[3].str == "X" ||
            listButton[8].enabled == true && listButton[5].str == "X") {
          putO(8);
        } else if (listButton[8].enabled == false) {
          putO(0);
        }
      } else if (listButton[2].str == "O" &&
          listButton[6].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X") {
        putO(5);
        if (listButton[8].enabled == true && listButton[1].str == "X" ||
            listButton[8].enabled == true && listButton[7].str == "X" ||
            listButton[8].enabled == true && listButton[0].str == "X") {
          putO(8);
        } else if (listButton[8].str == "X") {
          putO(0);
        }
      } else if (listButton[2].str == "O" &&
          listButton[4].str == "X" &&
          listButton[6].str == "O" &&
          listButton[5].str == "X") {
        putO(3);
        if (listButton[0].enabled == true && listButton[1].str == "X" ||
            listButton[0].enabled == true && listButton[7].str == "X" ||
            listButton[0].enabled == true && listButton[8].str == "X") {
          putO(0);
        } else if (listButton[0].enabled == false) {
          putO(8);
        }
      }
    }
    if (listButton[2].str == "O" &&
        listButton[5].str == "O" &&
        listButton[0].str == "O" &&
        listButton[6].str == "O" &&
        listButton[8].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[3].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    }
    if (listButton[2].str == "O" &&
        listButton[1].str == "O" &&
        listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[0].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[3].str == "X" &&
        listButton[5].enabled == true) {
      putO(5);
    } else if (listButton[2].str == "O" &&
        listButton[1].str == "O" &&
        listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[0].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[5].str == "X" &&
        listButton[3].enabled == true) {
      putO(3);
    } else if (listButton[0].str == "O" &&
        listButton[2].str == "O" &&
        listButton[6].str == "O" &&
        listButton[7].str == "O" &&
        listButton[1].str == "X" &&
        listButton[4].str == "X" &&
        listButton[8].str == "X" &&
        listButton[3].str == "X" &&
        listButton[5].enabled == true) {
      putO(5);
    } else if (listButton[0].str == "O" &&
        listButton[2].str == "O" &&
        listButton[6].str == "O" &&
        listButton[7].str == "O" &&
        listButton[1].str == "X" &&
        listButton[4].str == "X" &&
        listButton[8].str == "X" &&
        listButton[5].str == "X" &&
        listButton[3].enabled == true) {
      putO(3);
    } else if (listButton[2].str == "O" &&
        listButton[3].str == "O" &&
        listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[5].str == "X" &&
        listButton[0].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    } else if (listButton[2].str == "O" &&
        listButton[3].str == "O" &&
        listButton[8].str == "O" &&
        listButton[6].str == "O" &&
        listButton[5].str == "X" &&
        listButton[0].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    } else if (listButton[0].str == "O" &&
        listButton[5].str == "O" &&
        listButton[6].str == "O" &&
        listButton[2].str == "O" &&
        listButton[3].str == "X" &&
        listButton[8].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    } else if (listButton[0].str == "O" &&
        listButton[5].str == "O" &&
        listButton[6].str == "O" &&
        listButton[2].str == "O" &&
        listButton[3].str == "X" &&
        listButton[8].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    }
    if (listButton[0].str == "O" &&
        listButton[7].str == "O" &&
        listButton[6].str == "O" &&
        listButton[5].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[8].str == "X") {
      putO(3);
      playertwowon();
      return win;
    }
    if (listButton[2].str == "O" &&
        listButton[4].str == "X" &&
        listButton[6].str == "O" &&
        listButton[1].str == "X" &&
        listButton[8].str == "O" &&
        listButton[5].str == "X" &&
        listButton[0].enabled == true &&
        listButton[3].enabled == true &&
        listButton[7].enabled == true) {
      putO(7);
      playertwowon();
      return win;
    } else if (listButton[2].str == "O" &&
        listButton[4].str == "X" &&
        listButton[6].str == "O" &&
        listButton[0].str == "X" &&
        listButton[8].str == "O" &&
        listButton[5].str == "X" &&
        listButton[1].enabled == true &&
        listButton[7].enabled == true &&
        listButton[3].enabled == true) {
      putO(7);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[8].str == "O" &&
        listButton[1].str == "X" &&
        listButton[2].str == "O" &&
        listButton[3].str == "X" &&
        listButton[7].enabled == true &&
        listButton[5].enabled == true &&
        listButton[6].enabled == true) {
      putO(5);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[2].str == "O" &&
        listButton[1].str == "X" &&
        listButton[6].str == "O" &&
        listButton[5].str == "X" &&
        listButton[7].enabled == true &&
        listButton[3].enabled == true &&
        listButton[8].enabled == true) {
      putO(3);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[2].str == "O" &&
        listButton[1].str == "X" &&
        listButton[6].str == "O" &&
        listButton[8].str == "X" &&
        listButton[3].enabled == true &&
        listButton[5].enabled == true &&
        listButton[7].enabled == true) {
      putO(3);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[8].str == "O" &&
        listButton[7].str == "X" &&
        listButton[2].str == "O" &&
        listButton[5].str == "X" &&
        listButton[1].enabled == true &&
        listButton[3].enabled == true &&
        listButton[6].enabled == true) {
      putO(1);
      playertwowon();
      return win;
    } else if (listButton[0].str == "O" &&
        listButton[4].str == "X" &&
        listButton[8].str == "O" &&
        listButton[6].str == "X" &&
        listButton[2].str == "O" &&
        listButton[1].str == "X" &&
        listButton[3].enabled == true &&
        listButton[5].enabled == true &&
        listButton[7].enabled == true) {
      putO(5);
      playertwowon();
      return win;
    }
    checkboxes();
    return win;
  }

  int wineasywayfor13(index) {
    int win = 1;
    putO(2);

    if (listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[6].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[3].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[4].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[1].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[0].str == "X") {
      putO(5);
      playertwowon();
    } else if (listButton[5].str == "X") {
      putO(0);
      if (listButton[1].enabled == true && listButton[6].str == "X" ||
          listButton[1].enabled == true && listButton[4].str == "X") {
        putO(1);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);
        playertwowon();
      }
    }
    return win;
  }

  int wineasywayfor23(index) {
    putO(6);
    if (listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[0].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[4].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[5].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[1].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[2].str == "X") {
      putO(7);
      playertwowon();
    } else if (listButton[7].str == "X") {
      putO(2);
      if (listButton[5].enabled == true && listButton[0].str == "X" ||
          listButton[5].enabled == true && listButton[4].str == "X") {
        putO(5);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor33(index) {
    putO(6);

    if (listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[3].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[4].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[0].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[1].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[2].str == "X") {
      putO(7);

      playertwowon();
    } else if (listButton[7].str == "X") {
      putO(0);
      if (listButton[3].enabled == true && listButton[4].str == "X" ||
          listButton[3].enabled == true && listButton[2].str == "X") {
        putO(3);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor43(index) {
    putO(2);

    if (listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[6].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[4].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[7].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[3].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[0].str == "X") {
      putO(5);

      playertwowon();
    } else if (listButton[5].str == "X") {
      putO(6);
      if (listButton[7].enabled == true && listButton[0].str == "X" ||
          listButton[7].enabled == true && listButton[4].str == "X") {
        putO(7);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor53(index) {
    putO(2);

    if (listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[7].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[4].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[3].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[1].str == "X" ||
        listButton[5].enabled == true &&
            listButton[2].str == "O" &&
            listButton[0].str == "X") {
      putO(5);

      playertwowon();
    } else if (listButton[5].str == "X") {
      putO(0);
      if (listButton[1].enabled == true && listButton[3].str == "X" ||
          listButton[1].enabled == true && listButton[4].str == "X") {
        putO(1);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[1].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor63(index) {
    putO(6);

    if (listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[3].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[4].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[5].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[1].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[2].str == "X") {
      putO(7);

      playertwowon();
    } else if (listButton[7].str == "X") {
      putO(2);
      if (listButton[5].enabled == true && listButton[1].str == "X" ||
          listButton[5].enabled == true && listButton[4].str == "X") {
        putO(5);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[3].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor73(index) {
    putO(6);
    if (listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[0].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[4].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[5].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[1].str == "X" ||
        listButton[7].enabled == true &&
            listButton[6].str == "O" &&
            listButton[3].str == "X") {
      putO(7);

      playertwowon();
    } else if (listButton[7].str == "X") {
      putO(0);
      if (listButton[3].enabled == true && listButton[5].str == "X" ||
          listButton[3].enabled == true && listButton[4].str == "X") {
        putO(3);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int nrmlcase3(index) {
    int win = 1;

    putO(0);
    void winplan1() {
      if (listButton[5].str == "X" &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true &&
          listButton[1].enabled == true) {
        putO(3);
      } else if (listButton[7].str == "X" &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true &&
          listButton[5].enabled == true) {
        putO(3);
      } else if (listButton[3].str == "X" &&
          listButton[5].enabled == true &&
          listButton[7].enabled == true &&
          listButton[1].enabled == true) {
        putO(7);
      } else if (listButton[1].str == "X" &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true &&
          listButton[5].enabled == true) {
        putO(7);
      }
      return;
    }

    void winplan2() {
      if (listButton[5].str == "X" &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true &&
          listButton[7].enabled == true) {
        putO(1);
      } else if (listButton[7].str == "X" &&
          listButton[5].enabled == true &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true) {
        putO(1);
      } else if (listButton[3].str == "X" &&
          listButton[5].enabled == true &&
          listButton[1].enabled == true &&
          listButton[7].enabled == true) {
        putO(5);
      } else if (listButton[1].str == "X" &&
          listButton[7].enabled == true &&
          listButton[5].enabled == true &&
          listButton[3].enabled == true) {
        putO(5);
      }
      return;
    }

    if (listButton[8].str == "O" &&
        listButton[1].enabled == true &&
        listButton[6].enabled == true &&
        listButton[3].enabled == true &&
        listButton[4].enabled == false &&
        listButton[5].enabled == true &&
        listButton[2].enabled == false &&
        listButton[7].enabled == true &&
        listButton[0].str == "O") {
      putO(6);
    } else if (listButton[8].str == "O" &&
        listButton[1].enabled == true &&
        listButton[2].enabled == true &&
        listButton[3].enabled == true &&
        listButton[4].enabled == false &&
        listButton[5].enabled == true &&
        listButton[6].enabled == false &&
        listButton[7].enabled == true &&
        listButton[0].str == "O") {
      putO(2);
    }
    if (listButton[6].str == "O" || listButton[2].str == "O") {
      if (listButton[6].str == "O" && listButton[2].str == "X") {
        winplan1();
      } else if (listButton[2].str == "O" && listButton[6].str == "X") {
        winplan2();
      }
    } else {
      if (listButton[8].str == "O" &&
          listButton[3].str == "O" &&
          listButton[0].str == "O" &&
          listButton[4].str == "X" &&
          listButton[1].str == "X" &&
          listButton[5].str == "X") {
        putO(6);
        playertwowon();
      } else if (listButton[8].str == "O" &&
          listButton[0].str == "O" &&
          listButton[3].str == "O" &&
          listButton[4].str == "X" &&
          listButton[5].str == "X" &&
          listButton[7].str == "X") {
        putO(6);
        playertwowon();
      } else if (listButton[8].str == "O" &&
          listButton[0].str == "O" &&
          listButton[5].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X" &&
          listButton[7].str == "X" &&
          listButton[2].enabled == true &&
          listButton[6].enabled == true) {
        putO(2);
        playertwowon();
      } else if (listButton[8].str == "O" &&
          listButton[0].str == "O" &&
          listButton[5].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X" &&
          listButton[1].str == "X" &&
          listButton[2].enabled == true &&
          listButton[6].enabled == true) {
        putO(2);
        playertwowon();
      }
      if (listButton[8].str == "O" &&
          listButton[4].str == "X" &&
          listButton[0].str == "O" &&
          listButton[1].str == "X") {
        putO(7);
        if (listButton[6].enabled == true && listButton[3].str == "X" ||
            listButton[6].enabled == true && listButton[5].str == "X" ||
            listButton[6].enabled == true && listButton[2].str == "X") {
          putO(6);
        } else if (listButton[6].enabled == false) {
          putO(2);
        }
      } else if (listButton[8].str == "O" &&
          listButton[0].str == "O" &&
          listButton[4].str == "X" &&
          listButton[7].str == "X") {
        putO(1);
        if (listButton[2].enabled == true && listButton[6].str == "X" ||
            listButton[2].enabled == true && listButton[3].str == "X" ||
            listButton[2].enabled == true && listButton[5].str == "X") {
          putO(2);
        } else if (listButton[2].enabled == false) {
          putO(6);
        }
      } else if (listButton[8].str == "O" &&
          listButton[0].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X") {
        putO(5);
        if (listButton[2].enabled == true && listButton[7].str == "X" ||
            listButton[2].enabled == true && listButton[1].str == "X" ||
            listButton[2].enabled == true && listButton[6].str == "X") {
          putO(2);
        } else if (listButton[2].str == "X") {
          putO(6);
        }
      } else if (listButton[8].str == "O" &&
          listButton[4].str == "X" &&
          listButton[0].str == "O" &&
          listButton[5].str == "X") {
        putO(3);
        if (listButton[6].enabled == true && listButton[1].str == "X" ||
            listButton[6].enabled == true && listButton[7].str == "X" ||
            listButton[6].enabled == true && listButton[2].str == "X") {
          putO(6);
        } else if (listButton[6].enabled == false) {
          putO(2);
        }
      }
    }
    if (listButton[8].str == "O" &&
        listButton[5].str == "O" &&
        listButton[6].str == "O" &&
        listButton[0].str == "O" &&
        listButton[2].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[3].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    }
    if (listButton[8].str == "O" &&
        listButton[7].str == "O" &&
        listButton[2].str == "O" &&
        listButton[0].str == "O" &&
        listButton[6].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[3].str == "X" &&
        listButton[5].enabled == true) {
      putO(5);
    } else if (listButton[8].str == "O" &&
        listButton[7].str == "O" &&
        listButton[2].str == "O" &&
        listButton[0].str == "O" &&
        listButton[6].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[5].str == "X" &&
        listButton[3].enabled == true) {
      putO(3);
    } else if (listButton[6].str == "O" &&
        listButton[8].str == "O" &&
        listButton[0].str == "O" &&
        listButton[1].str == "O" &&
        listButton[7].str == "X" &&
        listButton[4].str == "X" &&
        listButton[2].str == "X" &&
        listButton[3].str == "X" &&
        listButton[5].enabled == true) {
      putO(5);
    } else if (listButton[6].str == "O" &&
        listButton[8].str == "O" &&
        listButton[0].str == "O" &&
        listButton[1].str == "O" &&
        listButton[7].str == "X" &&
        listButton[4].str == "X" &&
        listButton[2].str == "X" &&
        listButton[5].str == "X" &&
        listButton[3].enabled == true) {
      putO(3);
    } else if (listButton[8].str == "O" &&
        listButton[3].str == "O" &&
        listButton[2].str == "O" &&
        listButton[0].str == "O" &&
        listButton[5].str == "X" &&
        listButton[6].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    } else if (listButton[8].str == "O" &&
        listButton[3].str == "O" &&
        listButton[2].str == "O" &&
        listButton[0].str == "O" &&
        listButton[5].str == "X" &&
        listButton[6].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    } else if (listButton[6].str == "O" &&
        listButton[5].str == "O" &&
        listButton[0].str == "O" &&
        listButton[8].str == "O" &&
        listButton[3].str == "X" &&
        listButton[2].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    } else if (listButton[6].str == "O" &&
        listButton[5].str == "O" &&
        listButton[0].str == "O" &&
        listButton[8].str == "O" &&
        listButton[3].str == "X" &&
        listButton[2].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    }
    if (listButton[6].str == "O" &&
        listButton[1].str == "O" &&
        listButton[0].str == "O" &&
        listButton[5].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[2].str == "X") {
      putO(3);
      playertwowon();
      return win;
    }
    if (listButton[8].str == "O" &&
        listButton[4].str == "X" &&
        listButton[0].str == "O" &&
        listButton[7].str == "X" &&
        listButton[2].str == "O" &&
        listButton[5].str == "X" &&
        listButton[6].enabled == true &&
        listButton[3].enabled == true &&
        listButton[1].enabled == true) {
      putO(1);
      playertwowon();
      return win;
    } else if (listButton[8].str == "O" &&
        listButton[4].str == "X" &&
        listButton[0].str == "O" &&
        listButton[6].str == "X" &&
        listButton[2].str == "O" &&
        listButton[5].str == "X" &&
        listButton[7].enabled == true &&
        listButton[1].enabled == true &&
        listButton[3].enabled == true) {
      putO(1);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[2].str == "O" &&
        listButton[7].str == "X" &&
        listButton[8].str == "O" &&
        listButton[3].str == "X" &&
        listButton[1].enabled == true &&
        listButton[5].enabled == true &&
        listButton[0].enabled == true) {
      putO(5);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[8].str == "O" &&
        listButton[7].str == "X" &&
        listButton[0].str == "O" &&
        listButton[5].str == "X" &&
        listButton[1].enabled == true &&
        listButton[3].enabled == true &&
        listButton[2].enabled == true) {
      putO(3);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[8].str == "O" &&
        listButton[7].str == "X" &&
        listButton[0].str == "O" &&
        listButton[2].str == "X" &&
        listButton[3].enabled == true &&
        listButton[5].enabled == true &&
        listButton[1].enabled == true) {
      putO(3);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[2].str == "O" &&
        listButton[1].str == "X" &&
        listButton[8].str == "O" &&
        listButton[5].str == "X" &&
        listButton[7].enabled == true &&
        listButton[3].enabled == true &&
        listButton[0].enabled == true) {
      putO(7);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[2].str == "O" &&
        listButton[0].str == "X" &&
        listButton[8].str == "O" &&
        listButton[7].str == "X" &&
        listButton[3].enabled == true &&
        listButton[5].enabled == true &&
        listButton[1].enabled == true) {
      putO(5);
      playertwowon();
      return win;
    }
    playertwowon();
    checkboxes();
    return win;
  }

  int wineasywayfor14(index) {
    int win = 1;
    putO(0);

    if (listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[8].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[4].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[5].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[1].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[2].str == "X") {
      putO(3);

      playertwowon();
    } else if (listButton[3].str == "X") {
      putO(2);
      if (listButton[1].enabled == true && listButton[8].str == "X" ||
          listButton[1].enabled == true && listButton[4].str == "X") {
        putO(1);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);
        playertwowon();
      }
    }
    return win;
  }

  int wineasywayfor24(index) {
    putO(8);
    if (listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[0].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[4].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[5].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[1].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[2].str == "X") {
      putO(7);
      playertwowon();
    } else if (listButton[7].str == "X") {
      putO(2);
      if (listButton[5].enabled == true && listButton[0].str == "X" ||
          listButton[5].enabled == true && listButton[4].str == "X") {
        putO(5);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor34(index) {
    putO(8);

    if (listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[3].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[4].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[0].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[1].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[2].str == "X") {
      putO(7);

      playertwowon();
    } else if (listButton[7].str == "X") {
      putO(0);
      if (listButton[3].enabled == true && listButton[4].str == "X" ||
          listButton[3].enabled == true && listButton[2].str == "X") {
        putO(3);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);
        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor44(index) {
    putO(0);

    if (listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[8].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[4].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[5].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[7].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[2].str == "X") {
      putO(3);

      playertwowon();
    } else if (listButton[3].str == "X") {
      putO(8);
      if (listButton[7].enabled == true && listButton[2].str == "X" ||
          listButton[7].enabled == true && listButton[4].str == "X") {
        putO(7);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor54(index) {
    putO(0);

    if (listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[7].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[4].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[5].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[1].str == "X" ||
        listButton[3].enabled == true &&
            listButton[0].str == "O" &&
            listButton[2].str == "X") {
      putO(3);

      playertwowon();
    } else if (listButton[3].str == "X") {
      putO(2);
      if (listButton[1].enabled == true && listButton[5].str == "X" ||
          listButton[1].enabled == true && listButton[4].str == "X") {
        putO(1);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[1].str == "X" ||
          listButton[4].enabled == true && listButton[7].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor64(index) {
    putO(8);

    if (listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[3].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[4].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[5].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[1].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[2].str == "X") {
      putO(7);

      playertwowon();
    } else if (listButton[7].str == "X") {
      putO(2);
      if (listButton[5].enabled == true && listButton[1].str == "X" ||
          listButton[5].enabled == true && listButton[4].str == "X") {
        putO(5);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[5].str == "X" ||
          listButton[4].enabled == true && listButton[3].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int wineasywayfor74(index) {
    putO(8);
    if (listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[0].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[4].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[5].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[1].str == "X" ||
        listButton[7].enabled == true &&
            listButton[8].str == "O" &&
            listButton[3].str == "X") {
      putO(7);

      playertwowon();
    } else if (listButton[7].str == "X") {
      putO(0);
      if (listButton[3].enabled == true && listButton[5].str == "X" ||
          listButton[3].enabled == true && listButton[4].str == "X") {
        putO(3);

        playertwowon();
      } else if (listButton[4].enabled == true && listButton[3].str == "X" ||
          listButton[4].enabled == true && listButton[1].str == "X") {
        putO(4);

        playertwowon();
      }
    }
    int win = 1;
    return win;
  }

  int nrmlcase4(index) {
    int win = 1;
    putO(2);
    //decide how it should work
    // win with plan one if O get 2
    void winplan1() {
      if (listButton[5].str == "X" &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true &&
          listButton[1].enabled == true) {
        putO(7);
      } else if (listButton[7].str == "X" &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true &&
          listButton[5].enabled == true) {
        putO(5);
      } else if (listButton[3].str == "X" &&
          listButton[5].enabled == true &&
          listButton[7].enabled == true &&
          listButton[1].enabled == true) {
        putO(7);
      } else if (listButton[1].str == "X" &&
          listButton[7].enabled == true &&
          listButton[3].enabled == true &&
          listButton[5].enabled == true) {
        putO(5);
      }
      return;
    }

    // win with plan two if "O" get 6
    void winplan2() {
      if (listButton[5].str == "X" &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true &&
          listButton[7].enabled == true) {
        putO(1);
      } else if (listButton[7].str == "X" &&
          listButton[5].enabled == true &&
          listButton[1].enabled == true &&
          listButton[3].enabled == true) {
        putO(3);
      } else if (listButton[3].str == "X" &&
          listButton[5].enabled == true &&
          listButton[1].enabled == true &&
          listButton[7].enabled == true) {
        putO(1);
      } else if (listButton[1].str == "X" &&
          listButton[7].enabled == true &&
          listButton[5].enabled == true &&
          listButton[3].enabled == true) {
        putO(3);
      }
      return;
    }

    // there will be 2 choices for win
    // and some cases when plan of wining will not work
    if (listButton[6].str == "O" &&
        listButton[1].enabled == true &&
        listButton[8].enabled == true &&
        listButton[3].enabled == true &&
        listButton[4].enabled == false &&
        listButton[5].enabled == true &&
        listButton[0].enabled == false &&
        listButton[7].enabled == true &&
        listButton[2].str == "O") {
      putO(8);
    } else if (listButton[6].str == "O" &&
        listButton[1].enabled == true &&
        listButton[8].enabled == false &&
        listButton[3].enabled == true &&
        listButton[4].enabled == false &&
        listButton[5].enabled == true &&
        listButton[0].enabled == true &&
        listButton[7].enabled == true &&
        listButton[2].str == "O") {
      putO(0);
    }
    //here where we should deside how to win
    // code had work 100%
    //remember to check after you done evrything
    if (listButton[8].str == "O" || listButton[0].str == "O") {
      if (listButton[8].str == "O" && listButton[0].str == "X") {
        winplan1();
      } else if (listButton[0].str == "O" && listButton[8].str == "X") {
        winplan2();
      }
    } else {
      if (listButton[6].str == "O" &&
          listButton[5].str == "O" &&
          listButton[2].str == "O" &&
          listButton[4].str == "X" &&
          listButton[1].str == "X" &&
          listButton[3].str == "X") {
        putO(8);
        playertwowon();
      } else if (listButton[6].str == "O" &&
          listButton[2].str == "O" &&
          listButton[5].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X" &&
          listButton[7].str == "X") {
        putO(8);
        playertwowon();
      } else if (listButton[6].str == "O" &&
          listButton[2].str == "O" &&
          listButton[3].str == "O" &&
          listButton[4].str == "X" &&
          listButton[5].str == "X" &&
          listButton[7].str == "X" &&
          listButton[0].enabled == true &&
          listButton[8].enabled == true) {
        putO(0);
        playertwowon();
      } else if (listButton[6].str == "O" &&
          listButton[2].str == "O" &&
          listButton[3].str == "O" &&
          listButton[4].str == "X" &&
          listButton[5].str == "X" &&
          listButton[1].str == "X" &&
          listButton[0].enabled == true &&
          listButton[8].enabled == true) {
        putO(0);
        playertwowon();
      }

      if (listButton[6].str == "O" &&
          listButton[4].str == "X" &&
          listButton[2].str == "O" &&
          listButton[1].str == "X") {
        putO(7);
        if (listButton[8].enabled == true && listButton[3].str == "X" ||
            listButton[8].enabled == true && listButton[5].str == "X" ||
            listButton[8].enabled == true && listButton[0].str == "X") {
          putO(8);
        } else if (listButton[8].enabled == false) {
          putO(0);
        }
      } else if (listButton[6].str == "O" &&
          listButton[2].str == "O" &&
          listButton[4].str == "X" &&
          listButton[7].str == "X") {
        putO(1);
        if (listButton[0].enabled == true && listButton[8].str == "X" ||
            listButton[0].enabled == true && listButton[3].str == "X" ||
            listButton[0].enabled == true && listButton[5].str == "X") {
          putO(0);
        } else if (listButton[0].enabled == false) {
          putO(8);
        }
      } else if (listButton[6].str == "O" &&
          listButton[2].str == "O" &&
          listButton[4].str == "X" &&
          listButton[3].str == "X") {
        putO(5);
        if (listButton[8].enabled == true && listButton[1].str == "X" ||
            listButton[8].enabled == true && listButton[7].str == "X" ||
            listButton[8].enabled == true && listButton[0].str == "X") {
          putO(8);
        } else if (listButton[8].str == "X") {
          putO(0);
        }
      } else if (listButton[6].str == "O" &&
          listButton[4].str == "X" &&
          listButton[2].str == "O" &&
          listButton[5].str == "X") {
        putO(3);
        if (listButton[0].enabled == true && listButton[1].str == "X" ||
            listButton[0].enabled == true && listButton[7].str == "X" ||
            listButton[0].enabled == true && listButton[8].str == "X") {
          putO(0);
        } else if (listButton[0].enabled == false) {
          putO(8);
        }
      }
    }
    if (listButton[6].str == "O" &&
        listButton[5].str == "O" &&
        listButton[2].str == "O" &&
        listButton[0].str == "O" &&
        listButton[8].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[3].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    }
    if (listButton[6].str == "O" &&
        listButton[7].str == "O" &&
        listButton[2].str == "O" &&
        listButton[0].str == "O" &&
        listButton[8].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[5].str == "X" &&
        listButton[3].enabled == true) {
      putO(3);
    } else if (listButton[6].str == "O" &&
        listButton[7].str == "O" &&
        listButton[2].str == "O" &&
        listButton[0].str == "O" &&
        listButton[8].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[3].str == "X" &&
        listButton[5].enabled == true) {
      putO(5);
    } else if (listButton[6].str == "O" &&
        listButton[8].str == "O" &&
        listButton[2].str == "O" &&
        listButton[1].str == "O" &&
        listButton[7].str == "X" &&
        listButton[4].str == "X" &&
        listButton[0].str == "X" &&
        listButton[5].str == "X" &&
        listButton[3].enabled == true) {
      putO(3);
    } else if (listButton[6].str == "O" &&
        listButton[8].str == "O" &&
        listButton[2].str == "O" &&
        listButton[1].str == "O" &&
        listButton[7].str == "X" &&
        listButton[4].str == "X" &&
        listButton[0].str == "X" &&
        listButton[3].str == "X" &&
        listButton[5].enabled == true) {
      putO(5);
    } else if (listButton[6].str == "O" &&
        listButton[5].str == "O" &&
        listButton[2].str == "O" &&
        listButton[0].str == "O" &&
        listButton[3].str == "X" &&
        listButton[8].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    } else if (listButton[6].str == "O" &&
        listButton[5].str == "O" &&
        listButton[2].str == "O" &&
        listButton[0].str == "O" &&
        listButton[3].str == "X" &&
        listButton[8].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    } else if (listButton[6].str == "O" &&
        listButton[3].str == "O" &&
        listButton[2].str == "O" &&
        listButton[8].str == "O" &&
        listButton[5].str == "X" &&
        listButton[0].str == "X" &&
        listButton[4].str == "X" &&
        listButton[1].str == "X" &&
        listButton[7].enabled == true) {
      putO(7);
    } else if (listButton[6].str == "O" &&
        listButton[3].str == "O" &&
        listButton[2].str == "O" &&
        listButton[8].str == "O" &&
        listButton[5].str == "X" &&
        listButton[0].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[1].enabled == true) {
      putO(1);
    }
    if (listButton[8].str == "O" &&
        listButton[1].str == "O" &&
        listButton[2].str == "O" &&
        listButton[3].str == "X" &&
        listButton[4].str == "X" &&
        listButton[7].str == "X" &&
        listButton[0].str == "X") {
      putO(5);
      playertwowon();
      return win;
    }
    if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[0].str == "O" &&
        listButton[7].str == "X" &&
        listButton[2].str == "O" &&
        listButton[3].str == "X" &&
        listButton[8].enabled == true &&
        listButton[5].enabled == true &&
        listButton[1].enabled == true) {
      putO(1);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[0].str == "O" &&
        listButton[8].str == "X" &&
        listButton[2].str == "O" &&
        listButton[3].str == "X" &&
        listButton[1].enabled == true &&
        listButton[7].enabled == true &&
        listButton[5].enabled == true) {
      putO(1);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[0].str == "O" &&
        listButton[7].str == "X" &&
        listButton[8].str == "O" &&
        listButton[5].str == "X" &&
        listButton[1].enabled == true &&
        listButton[3].enabled == true &&
        listButton[2].enabled == true) {
      putO(3);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[8].str == "O" &&
        listButton[7].str == "X" &&
        listButton[2].str == "O" &&
        listButton[3].str == "X" &&
        listButton[1].enabled == true &&
        listButton[5].enabled == true &&
        listButton[0].enabled == true) {
      putO(5);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[8].str == "O" &&
        listButton[7].str == "X" &&
        listButton[2].str == "O" &&
        listButton[0].str == "X" &&
        listButton[3].enabled == true &&
        listButton[5].enabled == true &&
        listButton[1].enabled == true) {
      putO(5);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[0].str == "O" &&
        listButton[1].str == "X" &&
        listButton[8].str == "O" &&
        listButton[3].str == "X" &&
        listButton[7].enabled == true &&
        listButton[5].enabled == true &&
        listButton[2].enabled == true) {
      putO(7);
      playertwowon();
      return win;
    } else if (listButton[6].str == "O" &&
        listButton[4].str == "X" &&
        listButton[0].str == "O" &&
        listButton[2].str == "X" &&
        listButton[8].str == "O" &&
        listButton[7].str == "X" &&
        listButton[3].enabled == true &&
        listButton[5].enabled == true &&
        listButton[1].enabled == true) {
      putO(3);
      playertwowon();
      return win;
    }
    // 2-check if system had won
    playertwowon();
    checkboxes();

    return win;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 410, left: 70),
            padding: EdgeInsets.all(10),
            child: Text(
              'X: $winner1 - O: $winner2 ',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                padding: EdgeInsets.all(10.0),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 10.0),
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
                          putX(index);
                          playeronewon();
                          if (conter == 1) {
                            if (listButton[8].str == 'X' &&
                                    listButton[0].str == 'X' &&
                                    listButton[1].enabled == true &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true ||
                                count == 1) {
                              count = conter1(index);
                              playertwowon();
                              playeronewon();
                              checkboxes();
                            } else if (listButton[6].str == 'X' &&
                                    listButton[2].str == 'X' &&
                                    listButton[1].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[8].enabled == true &&
                                    listButton[7].enabled == true ||
                                count == 2) {
                              count = conter2(index);
                              playertwowon();
                              playeronewon();
                              checkboxes();
                            } else {
                              conter = 3;
                            }
                          } else if (conter == 0) {
                            if (listButton[8].str == 'X' ||
                                listButton[6].str == 'X' ||
                                listButton[2].str == 'X' ||
                                listButton[0].str == 'X') {
                              putO(4);
                              conter = 1;
                            }
                          }
                          if (conter == 0 || conter == 3) {
                            if (listButton[6].enabled == false &&
                                listButton[2].enabled == false &&
                                listButton[1].enabled == false &&
                                listButton[0].enabled == false &&
                                listButton[3].enabled == false &&
                                listButton[5].enabled == false &&
                                listButton[8].enabled == false &&
                                listButton[7].enabled == false) {
                              checkboxes();
                              return;
                            } else {
                              sysgame(index);
                              conter = 3;
                              playeronewon();
                              playertwowon();
                              checkboxes();
                            }
                          }
                        } else {
                          if (listButton[0].str == "O" &&
                                  listButton[1].enabled == true &&
                                  listButton[2].enabled == true &&
                                  listButton[3].enabled == true &&
                                  listButton[4].enabled == true &&
                                  listButton[5].enabled == true &&
                                  listButton[6].enabled == true &&
                                  listButton[7].enabled == true &&
                                  listButton[8].enabled == true ||
                              form == 1) {
                            putX(index);
                            if (listButton[0].str == "O" &&
                                    listButton[1].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way1 == 1) {
                              way1 = wineasywayfor11(index);
                            } else if (listButton[0].str == "O" &&
                                    listButton[3].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way2 == 1) {
                              way2 = wineasywayfor21(index);
                            } else if (listButton[0].str == "O" &&
                                    listButton[5].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way3 == 1) {
                              way3 = wineasywayfor31(index);
                            } else if (listButton[0].str == "O" &&
                                    listButton[7].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[8].enabled == true ||
                                way4 == 1) {
                              way4 = wineasywayfor41(index);
                            } else if (listButton[0].str == "O" &&
                                    listButton[2].str == "X" &&
                                    listButton[1].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way5 == 1) {
                              way5 = wineasywayfor51(index);
                            } else if (listButton[0].str == "O" &&
                                    listButton[6].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way6 == 1) {
                              way6 = wineasywayfor61(index);
                            } else if (listButton[0].str == "O" &&
                                    listButton[8].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[1].enabled == true ||
                                way7 == 1) {
                              way7 = wineasywayfor71(index);
                            }
                            if (listButton[0].str == "O" &&
                                    listButton[4].str == "X" &&
                                    listButton[1].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[2].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way8 == 1) {
                              way8 = nrmlcase1(index);
                            }
                          } else if (listButton[2].str == "O" &&
                                  listButton[1].enabled == true &&
                                  listButton[0].enabled == true &&
                                  listButton[3].enabled == true &&
                                  listButton[4].enabled == true &&
                                  listButton[5].enabled == true &&
                                  listButton[6].enabled == true &&
                                  listButton[7].enabled == true &&
                                  listButton[8].enabled == true ||
                              form == 2) {
                            putX(index);
                            if (listButton[2].str == "O" &&
                                    listButton[1].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way1 == 1) {
                              way1 = wineasywayfor12(index);
                            } else if (listButton[2].str == "O" &&
                                    listButton[3].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way2 == 1) {
                              way2 = wineasywayfor22(index);
                            } else if (listButton[2].str == "O" &&
                                    listButton[5].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way3 == 1) {
                              way3 = wineasywayfor32(index);
                            } else if (listButton[2].str == "O" &&
                                    listButton[7].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[8].enabled == true ||
                                way4 == 1) {
                              way4 = wineasywayfor42(index);
                            } else if (listButton[2].str == "O" &&
                                    listButton[0].str == "X" &&
                                    listButton[1].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way5 == 1) {
                              way5 = wineasywayfor52(index);
                            } else if (listButton[2].str == "O" &&
                                    listButton[6].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way6 == 1) {
                              way6 = wineasywayfor62(index);
                            } else if (listButton[2].str == "O" &&
                                    listButton[8].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[1].enabled == true ||
                                way7 == 1) {
                              way7 = wineasywayfor72(index);
                            }
                            if (listButton[2].str == "O" &&
                                    listButton[4].str == "X" &&
                                    listButton[1].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way8 == 1) {
                              way8 = nrmlcase2(index);
                              playertwowon();
                            }
                          } else if (listButton[8].str == "O" &&
                                  listButton[1].enabled == true &&
                                  listButton[0].enabled == true &&
                                  listButton[3].enabled == true &&
                                  listButton[4].enabled == true &&
                                  listButton[5].enabled == true &&
                                  listButton[6].enabled == true &&
                                  listButton[7].enabled == true &&
                                  listButton[2].enabled == true ||
                              form == 3) {
                            putX(index);
                            if (listButton[8].str == "O" &&
                                    listButton[7].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[2].enabled == true ||
                                way1 == 1) {
                              way1 = wineasywayfor13(index);
                            } else if (listButton[8].str == "O" &&
                                    listButton[3].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[2].enabled == true ||
                                way2 == 1) {
                              way2 = wineasywayfor23(index);
                            } else if (listButton[8].str == "O" &&
                                    listButton[5].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[2].enabled == true ||
                                way3 == 1) {
                              way3 = wineasywayfor33(index);
                            } else if (listButton[8].str == "O" &&
                                    listButton[1].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[2].enabled == true ||
                                way4 == 1) {
                              way4 = wineasywayfor43(index);
                            } else if (listButton[8].str == "O" &&
                                    listButton[6].str == "X" &&
                                    listButton[1].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[2].enabled == true ||
                                way5 == 1) {
                              way5 = wineasywayfor53(index);
                            } else if (listButton[8].str == "O" &&
                                    listButton[0].str == "X" &&
                                    listButton[6].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[2].enabled == true ||
                                way6 == 1) {
                              way6 = wineasywayfor63(index);
                            } else if (listButton[8].str == "O" &&
                                    listButton[2].str == "X" &&
                                    listButton[0].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[1].enabled == true ||
                                way7 == 1) {
                              way7 = wineasywayfor73(index);
                            }
                            if (listButton[8].str == "O" &&
                                    listButton[4].str == "X" &&
                                    listButton[1].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[6].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[2].enabled == true ||
                                way8 == 1) {
                              way8 = nrmlcase3(index);
                            }
                          } else if (listButton[6].str == "O" &&
                                  listButton[1].enabled == true &&
                                  listButton[0].enabled == true &&
                                  listButton[3].enabled == true &&
                                  listButton[4].enabled == true &&
                                  listButton[5].enabled == true &&
                                  listButton[8].enabled == true &&
                                  listButton[7].enabled == true &&
                                  listButton[2].enabled == true ||
                              form == 4) {
                            putX(index);
                            if (listButton[6].str == "O" &&
                                    listButton[7].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[8].enabled == true ||
                                way1 == 1) {
                              way1 = wineasywayfor14(index);
                            } else if (listButton[6].str == "O" &&
                                    listButton[3].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way2 == 1) {
                              way2 = wineasywayfor24(index);
                            } else if (listButton[6].str == "O" &&
                                    listButton[5].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way3 == 1) {
                              way3 = wineasywayfor34(index);
                            } else if (listButton[6].str == "O" &&
                                    listButton[1].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way4 == 1) {
                              way4 = wineasywayfor44(index);
                            } else if (listButton[6].str == "O" &&
                                    listButton[8].str == "X" &&
                                    listButton[1].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[2].enabled == true ||
                                way5 == 1) {
                              way5 = wineasywayfor54(index);
                            } else if (listButton[6].str == "O" &&
                                    listButton[0].str == "X" &&
                                    listButton[2].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[1].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way6 == 1) {
                              way6 = wineasywayfor64(index);
                            } else if (listButton[6].str == "O" &&
                                    listButton[2].str == "X" &&
                                    listButton[8].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[4].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[1].enabled == true ||
                                way7 == 1) {
                              way7 = wineasywayfor74(index);
                            }
                            if (listButton[6].str == "O" &&
                                    listButton[4].str == "X" &&
                                    listButton[1].enabled == true &&
                                    listButton[3].enabled == true &&
                                    listButton[2].enabled == true &&
                                    listButton[5].enabled == true &&
                                    listButton[0].enabled == true &&
                                    listButton[7].enabled == true &&
                                    listButton[8].enabled == true ||
                                way8 == 1) {
                              way8 = nrmlcase4(index);
                            }
                          }
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
          backgroundColor: Colors.red[900],
          onPressed: () {
            setState(() {
              turn++;
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
