import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';
import 'package:intl/intl.dart';

class TopSellingItems extends StatefulWidget {
  final bool? isFlash;

  const TopSellingItems({Key? key, this.isFlash}) : super(key: key);
  @override
  _TopSellingItemsState createState() => _TopSellingItemsState();
}

class _TopSellingItemsState extends State<TopSellingItems> {
  static const countDownDuration = Duration(days: 2);
  Duration duration = Duration();
  Timer? timer;

  var formatter = NumberFormat('#,##,000');
  bool isCountdown = true;

  startTimer() {
    Timer.periodic(Duration(seconds: 1), (_) => addTimer());
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countDownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  addTimer() {
    final addSeconds = isCountdown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    reset();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.isFlash! ? "Flash Sales" : "Top Selling Items",
                style: titletextStyle,
              ),
              widget.isFlash! ? buildTime() : Container()
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widget.isFlash!
                  ? flashSales
                      .map((e) => Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(e['image'],
                                          fit: BoxFit.fill,
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                              color: HexColor(cPurple),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Text(
                                            "${e['discount']}%",
                                            style: TextStyle(
                                                fontFamily: "Nunito-Bold",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "₦${formatter.format(e['price'])}",
                                    style: titletextStyle,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "₦${formatter.format(e['previousPrice'])}",
                                    style: title2textStyle,
                                  ),
                                ],
                              )
                            ],
                          ))
                      .toList()
                  : itemArray
                      .map((e) => Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(e['image'],
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width /
                                          3),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "₦${formatter.format(e['price'])}",
                                    style: titletextStyle,
                                  ),
                                  SizedBox(width: 10),
                                  topBtn()
                                ],
                              )
                            ],
                          ))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(60));
    // return Text('$minutes : $seconds');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildTimerCard(time: hours),
        Container(
          margin: EdgeInsets.all(5),
          child: Text(
            ":",
            style: TextStyle(fontFamily: "Nunito-Bold", fontSize: 20),
          ),
        ),
        buildTimerCard(time: minutes),
        Container(
          margin: EdgeInsets.all(5),
          child: Text(
            ":",
            style: TextStyle(fontFamily: "Nunito-Bold", fontSize: 20),
          ),
        ),
        buildTimerCard(time: seconds)
      ],
    );
  }

  Widget buildTimerCard({required String time}) => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(5)),
        child: Text(time,
            style: TextStyle(
                fontFamily: "Nunito-Bold",
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 16)),
      );

  Widget topBtn() => Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
            color: HexColor(cBlue),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset('assets/images/icons/trending.svg',
                width: 15, color: Colors.white),
            SizedBox(
              width: 5,
            ),
            Text(
              "Top",
              style: TextStyle(
                  fontFamily: "Nunito-Bold",
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ],
        ),
      );
}
