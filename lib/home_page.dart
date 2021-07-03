import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true;
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 100, bottom: 80, left: 40, right: 40),
          child: Column(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Player X',
                            style: GoogleFonts.montserrat(
                                fontSize: 22, color: Colors.white)),
                        SizedBox(
                          height: 12,
                        ),
                        Text(exScore.toString(),
                            style: GoogleFonts.orbitron(
                                fontSize: 40, color: Colors.blue)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Player O',
                          style: GoogleFonts.montserrat(
                              fontSize: 22, color: Colors.white),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(ohScore.toString(),
                            style: GoogleFonts.orbitron(
                                fontSize: 40, color: Colors.blue)),
                      ],
                    ),
                  )
                ],
              )),
              Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0xff171A22),
                                )),
                            child: Center(
                              child: Text(
                                displayExOh[index],
                                style: GoogleFonts.varelaRound(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              GestureDetector(
                onTap: () {
                  ohScore = 0;
                  exScore = 0;
                  _clearBoard();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(25),
                    color: Colors.blue,
                    child: Center(
                      child: Text('RESET  GAME',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white, letterSpacing: 3))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'o';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'x';
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
    }

    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
    }

    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }

    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          String loser;
          if (winner == 'o') {
            loser = 'x';
          } else {
            loser = 'o';
          }
          return AlertDialog(
            title: Text(
              winner + " wins!",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.blue)),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            actions: [
              GestureDetector(
                onTap: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/trophy.png',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: Text(loser + ' goes first next!',
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });

    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "It's a Draw!",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.blue)),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            actions: [
              GestureDetector(
                onTap: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/equal.png',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: Text('Play Again',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Colors.white,
                            ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });

    filledBoxes = 0;
  }
}
