import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:monibie/enums/const.dart';
import 'package:monibie/models/cart_item.dart';
import 'package:monibie/provider/cart_provider.dart';
import 'package:monibie/widgets/customButton.dart';
import 'package:monibie/widgets/pDetailProductContainer.dart';
import 'package:monibie/widgets/rating.dart';
import 'package:monibie/widgets/review.dart';
import 'package:monibie/widgets/shopping_cart.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  var product;
  ProductDetails({Key? key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
 
 showinfo(){
   InfoAlertBox(context: context, infoMessage: "", title: "Product already added");
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Details",
            style: TextStyle(
                fontFamily: 'Nunito-Bold',
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w900),
          ),
        ),
        actions: [
          InkWell(
          onTap: () => Navigator.pushNamed(context, '/'),
            child: SvgPicture.asset(
              'assets/images/icons/home2.svg',
              width: 25,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          _notificationBadge(context),
          SizedBox(
            width: 20,
          ),
        ],
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    '${widget.product['image']}',
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '${widget.product['desc']}',
                  style: mainTitletextStyle,
                ),
                SizedBox(
                  height: 30,
                  child: Divider(
                    height: 5,
                    thickness: 3,
                  ),
                ),
                Text(
                  '₦21,000 - 32,000',
                  style: mainTitletextStyle,
                ),
                Row(
                  children: [
                    Text(
                      "₦10,000",
                      style: title2textStyle,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          color: HexColor(cPurple),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(
                        "31% OFF",
                        style: TextStyle(
                            fontFamily: "Nunito-Bold",
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                
                SizedBox(
                  height: 30,
                  child: Divider(
                    height: 5,
                    thickness: 3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shipping to your state",
                            style: sub2TitletextStyle),
                        SizedBox(
                          height: 2,
                        ),
                        Text("Estimated days of delivery: 2-3 Days",
                            style: subTitletextStyle),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                  child: Divider(
                    height: 5,
                    thickness: 3,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                    leading: Image.asset('assets/images/icons/user-boss.png'),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pro & Sons Designs Store...  ",
                            style: sub2TitletextStyle),
                        FittedBox(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/icons/chat-filled.svg',
                                height: 20,
                                width: 20,
                                color: HexColor(cPurple),
                              ),
                              Text("  Chat Seller",
                                  style: TextStyle(
                                      fontFamily: 'Nunito-Bold',
                                      fontSize: 14.0,
                                      color: HexColor(cPurple))),
                              SizedBox(
                                width: 50,
                              ),
                              Text("225k  ", style: sub2TitletextStyle),
                              Text("Followers", style: subTitletextStyle),
                            ],
                          ),
                        ),
                      ],
                    ),
                    subtitle: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          CustomButton(
                            color: Colors.transparent,
                            borderColor: HexColor(cPurple),
                            width: MediaQuery.of(context).size.width / 4,
                            onTap: () {},
                            content: Text(
                              "Follow",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  fontSize: 16.0,
                                  color: HexColor(cPurple),
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          CustomButton(
                            color: HexColor(cPurple),
                            borderColor: Colors.transparent,
                            width: MediaQuery.of(context).size.width / 2,
                            onTap: () {},
                            content: Text(
                              "Visit Store",
                              textAlign: TextAlign.center,
                              style: btntextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    isThreeLine: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Divider(
                    height: 5,
                    thickness: 3,
                  ),
                ),
                Text("Description", style: sub2TitletextStyle),
                Text(
                  "This Men's white, slim fitted shirt is designed with an elegant single button pointed collar and 2 button single cuffs. Finer details include stripe contrast detail on the inner collar and inner cuffs. Our fitted shirts have been flatteringly designed with darts at the waist and bust, creating a streamlined silhouette.",
                  style: TextStyle(
                      color: HexColor(cgreyMedium),
                      fontFamily: "Nunito",
                      fontSize: 15),
                  softWrap: true,
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset("assets/images/icons/tecno.png"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Image.asset("assets/images/icons/1.png")),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Image.asset("assets/images/icons/2.png"))
                  ],
                ),
                Image.asset("assets/images/icons/3.png"),
                Image.asset("assets/images/icons/4.png"),
                SizedBox(
                  height: 30,
                  child: Divider(
                    height: 5,
                    thickness: 3,
                  ),
                ),
                CustomRating(),
                SizedBox(
                  height: 30,
                ),
                Review()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: HexColor(cgreyLight),
                blurRadius: 5.0,
                spreadRadius: 1.0,
                offset: Offset(0.5, 0))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                color: HexColor(cYellow),
                borderColor: Colors.transparent,
                width: MediaQuery.of(context).size.width / 3,
                onTap: (){

CartItemModel product = CartItemModel.fromMap(widget.product);
print(product.id);
 bool _isItemAlreadyAdded(CartItemModel product) =>
      context.read<ShoppingCart>().cart
          .where((item) => item.id == product.id)
          .isNotEmpty;
if(_isItemAlreadyAdded(product)){
  return  showinfo();
}
                  context.read<ShoppingCart>().addItem(product);
                },
                content: Text(
                  "Add to cart",
                  textAlign: TextAlign.center,
                  style: btntextStyle,
                ),
              ),
              CustomButton(
                color: HexColor(cPurple),
                borderColor: Colors.transparent,
                width: MediaQuery.of(context).size.width / 3,
                onTap: () {},
                content: Text(
                  "Buy now",
                  textAlign: TextAlign.center,
                  style: btntextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// enum _SelectedTab { home, feeds, chat, account }
Widget _notificationBadge(context) {
    ShoppingCart pn = Provider.of<ShoppingCart>(context, listen: false);
  return InkWell(
    onTap: () =>   showBarModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: Colors.white,
                      child: ShoppingCartWidget(),
                    ),
                  ),
   child: Consumer<ShoppingCart>(
        builder: (context, provider, child)  {
          return Badge(
              position: BadgePosition.topEnd(top: -5, end: -10),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeColor: Colors.red,
              showBadge:provider.count== 0 ?false : true,
              badgeContent: Text(
              provider.count == 0 ? "":  "${provider.count}",
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
              child: SvgPicture.asset(
                'assets/images/icons/cart.svg',
                width: 30,
                color: Colors.black,
              ));
        }
      ),
  );
}
