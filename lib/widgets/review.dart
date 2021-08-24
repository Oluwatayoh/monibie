import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';
import 'package:monibie/widgets/cards.dart';
import 'package:monibie/widgets/custome_circleAvatar.dart';

String dropdownValue = '';

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: HexColor(cgreyLight),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: HexColor(cgrey)),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: DropdownButton<String>(
              value: dropdownValue,
              isExpanded: true,
              hint: Text(
                "Sort by recent",
                style: rateSubTitletextStyle,
              ),
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 0,
                color: Colors.deepPurpleAccent,
              ),
              items: <String>[].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        _reviewContent(),
        SizedBox(height: 20),
        _reviewContent(),
        SizedBox(height: 20),
        Cards(
          isRecommend: true,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _reviewContent() {
    return Column(
      children: [
        Row(
          children: [
            CustomCircleAvatar(
              myImage: NetworkImage(
                "",
              ),
              initials: Icons.person,
              iconSize: 30,
              avatarRadius: 15,
            ),
            Text("    Review (30)   ", style: titletextStyle),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "This Men's white, slim fitted shirt is designed with an elegant single button pointed collar and 2 button single cuffs. Finer details include stripe contrast detail on the inner collar and inner cuffs. Our fitted shirts have been flatteringly designed with darts at the waist and bust, creating a streamlined silhouette.",
            style: TextStyle(
                color: HexColor(cgreyMedium),
                fontFamily: "Nunito",
                fontSize: 15),
            softWrap: true,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: HexColor("#FFE9AD"),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: reviewImage
                        .map((e) => Image.asset(
                              e,
                              width: 50,
                            ))
                        .toList()),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Review on 22/01/2019", style: reviewDateextStyle),
            ],
          ),
        )
      ],
    );
  }
}
