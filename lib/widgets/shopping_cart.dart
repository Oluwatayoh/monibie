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
        print(provider.count);
                return Column(
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

                  "Pay",
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
