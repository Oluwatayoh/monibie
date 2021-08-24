import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';
import 'package:intl/intl.dart';
import 'package:monibie/screens/productDetail.dart';

class Cards extends StatefulWidget {
  final bool? isRecommend;

  const Cards({Key? key, this.isRecommend}) : super(key: key);
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  var formatter = NumberFormat('#,###,000');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isRecommend!
        ? GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 5 / 6),
            itemCount: recommendedItems.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, i) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetails(product: recommendedItems[i]),
                    )),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Hero(
                                  tag: 'product',
                                  child: Image.asset(
                                      recommendedItems[i]['image'],
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                      // height: MediaQuery.of(context).size.height / 5,
                                      width: MediaQuery.of(context).size.width /
                                          2.5),
                                ),
                              ),
                              recommendedItems[i]['discount'] == 0
                                  ? SizedBox()
                                  : Positioned(
                                      top: 10,
                                      left: 10,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 3),
                                        decoration: BoxDecoration(
                                            color: HexColor(cBlue),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Text(
                                          "${recommendedItems[i]['discount']}% OFF",
                                          style: TextStyle(
                                              fontFamily: "Nunito-Bold",
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      )),
                            ],
                          ),
                        ),
                        Text(
                          "${recommendedItems[i]['desc']}",
                          style: subTitletextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "₦${formatter.format(recommendedItems[i]['price'])}",
                              style: titletextStyle,
                            ),
                            SizedBox(width: 10),
                            recommendedItems[i]['previousPrice'] == 0
                                ? SizedBox()
                                : Text(
                                    "₦${formatter.format(recommendedItems[i]['previousPrice'])}",
                                    style: title2textStyle,
                                  ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: brands
                  .map((e) => Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(e,
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width / 4),
                        ),
                      ))
                  .toList(),
            ),
          );
  }
}
