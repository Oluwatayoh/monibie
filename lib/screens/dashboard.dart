import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';
import 'package:monibie/widgets/cards.dart';
import 'package:monibie/widgets/productCard.dart';
import 'package:monibie/widgets/searchBox.dart';
import 'package:monibie/widgets/topSelling.dart';
import 'package:monibie/widgets/topSlider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void search(String query) {}
  Duration? duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(cgreyLight),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SearchBox(text: "Search for products", onChanged: search),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSlider(),
              SizedBox(height: 5),
              TopSellingItems(
                isFlash: false,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Recommended for you",
                style: mainTitletextStyle,
              ),
              Cards(
                isRecommend: true,
              ),
              SizedBox(height: 10),
              Text(
                "Popular Categories",
                style: mainTitletextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              ProductsCard(
                productCategory: "Electronics",
                products: electronicList,
              ),
              SizedBox(
                height: 10,
              ),
              ProductsCard(
                productCategory: "Beuty & Health",
                products: beautyHealth,
              ),
              SizedBox(
                height: 10,
              ),
              ProductsCard(
                productCategory: "Phones & Tablets",
                products: phone,
              ),
              SizedBox(
                height: 10,
              ),
              ProductsCard(
                productCategory: "Phone Accessories",
                products: accessories,
              ),
              SizedBox(
                height: 10,
              ),
              TopSellingItems(
                isFlash: true,
              ),
              SizedBox(
                height: 15,
              ),
            
              
              SizedBox(
                height: 20,
              ),
            ],
          )),
        ));
  }
}
