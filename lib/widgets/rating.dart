import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';
import 'package:monibie/widgets/customButton.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Review (30)   ", style: mainTitletextStyle),
            RatingBarIndicator(
              rating: 2.0,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.orange,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/icons/star.svg",
                  height: 70,
                ),
                SizedBox(height: 10),
                Text("Average rating", style: sub2TitletextStyle),
                Text("450 Reviews", style: rateSubTitletextStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width / 2.5,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 15.0,
                    leading: new Text("5  "),
                    trailing: new Text("  65%"),
                    percent: 0.65,
                    center: Text(""),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.green,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width / 2.5,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 15.0,
                    leading: new Text("4  "),
                    trailing: new Text("  20%"),
                    percent: 0.2,
                    center: Text(""),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.orange,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width / 2.5,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 15.0,
                    leading: new Text("3  "),
                    trailing: new Text("  10%"),
                    percent: 0.1,
                    center: Text(""),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width / 2.5,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 15.0,
                    leading: new Text("2  "),
                    trailing: new Text("    5%"),
                    percent: 0.05,
                    center: Text(""),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: HexColor(cgrey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width / 2.5,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 15.0,
                    leading: new Text("1  "),
                    trailing: new Text("    2%"),
                    percent: 0.02,
                    center: Text(""),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: HexColor(cgrey),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
          borderColor: Colors.transparent,
          color: HexColor(cPurple),
          onTap: () {},
          width: MediaQuery.of(context).size.width,
          content: Text(
            "WRITE A REVIEW",
            textAlign: TextAlign.center,
            style: btntextStyle,
          ),
        )
      ],
    );
  }
}
