import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../../global_variables.dart';

class SeatTile extends StatefulWidget {
  final int seatNo;
  final int selectedSeat;

  const SeatTile({Key? key, required this.seatNo, required this.selectedSeat})
      : super(key: key);

  @override
  State<SeatTile> createState() => _SeatTileState();
}

class _SeatTileState extends State<SeatTile> {
  bool isSelected = false;

  late String seatType;

  void calculateSeatType(int seatNo) {
    int seatNumber = seatNo % 8;

    if (seatNumber == 1 || seatNumber == 4) {
      seatType = 'Lower';
    } else if (seatNumber == 2 || seatNumber == 5) {
      seatType = 'Middle';
    } else if (seatNumber == 3 || seatNumber == 6) {
      seatType = 'Upper';
    } else if (seatNumber == 7) {
      seatType = 'Side Lower';
    } else if (seatNumber == 0) {
      seatType = 'Side Upper';
    }
  }

  @override
  void initState() {
    calculateSeatType(widget.seatNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isSelected = false;
    if (widget.seatNo == widget.selectedSeat) {
      devtools.log('seat tile build called --'); //LOG
      devtools.log(widget.selectedSeat.toString());
      setState(() {
        isSelected = true;
      });
    }

    String getLabel(int seatNo) {
      if (seatNo % 8 == 1 || seatNo % 8 == 4) {
        return 'Lower';
      } else if (seatNo % 8 == 2 || seatNo % 8 == 5) {
        return 'Middle';
      } else if (seatNo % 8 == 3 || seatNo % 8 == 6) {
        return 'Upper';
      } else if (seatNo % 8 == 7) {
        return 'Side Lower';
      } else {
        return 'Side Upper';
      }
    }

    bool seatAlign(int seatNo) {
      if (seatNo % 8 == 1 ||
          seatNo % 8 == 2 ||
          seatNo % 8 == 3 ||
          seatNo % 8 == 7) {
        return true;
      } else {
        return false;
      }
    }

    //SEAT STRUCTURE
      return Stack(
         // alignment:
        // seatAlign(widget.seatNo) ? Alignment.topCenter : Alignment.bottomCenter,
        children: [
          Material(
            color: Colors.transparent,
            elevation: isSelected ? 25 : 0,
            shadowColor: Theme.of(context).primaryColor,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: isSelected
                    ? GlobalVariables.selectedColor
                    : Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.seatNo.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: isSelected
                          ? Theme.of(context).canvasColor
                          : Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    getLabel(widget.seatNo),
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected
                          ? Theme.of(context).canvasColor
                          : Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 4,
            color: Theme.of(context).primaryColor,
          ),
        ],
      );
    }
  }
