import 'package:flutter/material.dart';
import 'package:monibie/enums/const.dart';

class ProductsCard extends StatelessWidget {
  final List? products;
  final String? productCategory;

  const ProductsCard({Key? key, this.products, this.productCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: products!
                    .map((e) => Image.asset(e,
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.width / 3))
                    .toList(),
              )),
          SizedBox(height: 10),
          Text(
            productCategory.toString(),
            style: subTitletextStyle,
          )
        ],
      ),
    );
  }
}
