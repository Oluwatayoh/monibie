import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';

class SearchBox extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final bool? fromDashboard;
  final TextEditingController? controller;

  const SearchBox(
      {Key? key,
      required this.text,
      required this.onChanged,
      this.controller,
      this.fromDashboard})
      : super(key: key);

  @override
  _SearchBoxState createState() => new _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: HexColor("#B4B4B4")),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0xFFE5E5E5),
                      blurRadius: widget.fromDashboard == true ? 20.0 : 0,
                      spreadRadius: widget.fromDashboard == true ? 3.0 : 0,
                      // offset: Offset(0, 12),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: widget.controller,
                      style: inputtextStyle,
                      onChanged: widget.onChanged,
                      decoration: InputDecoration(
                        hintStyle: hinttextStyle,
                        hintText: "Search for a product",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Container(
                      padding: EdgeInsets.all(2),
                      width: MediaQuery.of(context).size.width / 10,
                      height: 40,
                      decoration: BoxDecoration(
                        color: HexColor("#B824F1"),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        "assets/images/icons/searchIcon.svg",
                        color: Colors.white,
                      ))),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          _notificationBadge()
        ],
      ),
    );
  }

  Widget _notificationBadge() {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/cart'),
      child: Badge(
          position: BadgePosition.topEnd(top: -10, end: -10),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeColor: Colors.red,
          showBadge: true,
          badgeContent: Text(
            "15",
            style: TextStyle(color: Colors.white, fontSize: 8),
          ),
          child: SvgPicture.asset(
            'assets/images/icons/cart.svg',
            width: 30,
            color: Colors.black,
          )),
    );
  }
}
