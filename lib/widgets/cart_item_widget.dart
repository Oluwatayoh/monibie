import 'package:flutter/material.dart';
import 'package:monibie/models/cart_item.dart';

class CartItemWidget extends StatefulWidget {
  final CartItemModel? cartItem;

  const CartItemWidget({Key? key, this.cartItem}) : super(key: key);
  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}
 

class _CartItemWidgetState extends State<CartItemWidget> {
  // var formatter = NumberFormat('#,###,000'); 


int quantity = 1;
double price = 0 ;

quantityIncrement(){
  setState(() {
    quantity ++;
  price = quantity * widget.cartItem!.price!;
  });
  
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();


int quantity = widget.cartItem!.quantity!;
double price = quantity * widget.cartItem!.price!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Padding(
          padding:
          const EdgeInsets.all(8.0),
          child: Image.asset(
            widget.cartItem!.image!,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                    child: Text(
                     widget.cartItem!.desc!,
                    )),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                            Icons.chevron_left),
                        onPressed: () {
                         
                      // quantity ++; 
                          // cartController.decreaseQuantity(cartItem);
                        }),
                    Padding(
                      padding:
                      const EdgeInsets.all(
                          8.0),
                      child: Text(
                       quantity.toString(),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons
                            .chevron_right),
                        onPressed: () {
                           quantityIncrement();
                          // cartController.increaseQuantity(cartItem);
                        }),
                  ],
                )
              ],
            )),
        Padding(
          padding:
          const EdgeInsets.all(14),
          child: Text(
             "\₦$price",
             style: TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold,
             ),
          ),
        ),
      ],
    );
  }
}
