import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:monibie/enums/const.dart';
import 'package:monibie/models/cart_item.dart';
import 'package:monibie/provider/cart_provider.dart';
import 'package:provider/src/provider.dart';

class CartItemWidget extends StatefulWidget {
  final CartItemModel? cartItem;

  const CartItemWidget({Key? key, this.cartItem}) : super(key: key);
  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}
 

class _CartItemWidgetState extends State<CartItemWidget> {
  // var formatter = NumberFormat('#,###,000'); 


int quantity = 1;
double ? price ;

quantityIncrement(){
  setState(() {
    quantity ++;
  price = quantity * widget.cartItem!.price!;
  });
  
}

quantityDecrement(){
  if(quantity == 0){
    return;
  }else{
    setState(() {
    quantity --;
  price = quantity * widget.cartItem!.price!;
  });
  }
  
  
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();


 quantity = widget.cartItem!.quantity!;
 price = quantity * widget.cartItem!.price!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
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
                          quantityDecrement();
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
                        }),
                  ],
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                          icon: Icon(
                              Icons.delete, color: HexColor(cRed)),
                          onPressed: () {
                            
                             context.read<ShoppingCart>().removeItem(widget.cartItem!);
                          }),
              Text(
                 "\₦$price",
                 style: TextStyle(
                   fontSize: 22,
                   fontWeight: FontWeight.bold,
                 ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ],
    );
  }
}
