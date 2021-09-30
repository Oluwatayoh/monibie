import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';
import 'package:monibie/provider/cart_provider.dart';
import 'package:monibie/widgets/cart_item_widget.dart';
import 'package:monibie/widgets/customButton.dart';
import 'package:provider/provider.dart';

class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "My Cart",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                )),
               
              ),
            
            SizedBox(
              height: 5,
            ),
           Consumer<ShoppingCart>(
      builder: (context, provider, child) {
        
                return provider.count == 0 ? Center(child: Column( crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment:MainAxisAlignment.center, children:[
SizedBox(height: 150,), Image.asset("assets/images/empty-cart.png", width: MediaQuery.of(context).size.width / 1.8,), SizedBox(height: 30,), Text("Your cart is empty, kindly add a product", style: titletextStyle,)
                ] )) : Column(
                  children: provider.cart
                      .map((cartItem) => CartItemWidget(cartItem: cartItem,))
                      .toList(),
                );
              }
            ),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              child: CustomButton(color: HexColor(cBlue), onTap: (){}, borderColor: Colors.transparent,  width: MediaQuery.of(context).size.width / 2.2, content: Center(
                child: Text(

                  "Check Out",
                  style: btntextStyle,
// "Pay (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})"
                ),
              ),
                  )
            )
        )],
    );
  }
}
