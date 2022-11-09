import 'package:flutter/material.dart';
import 'package:store/models/product_models.dart';
import 'package:store/pages/detailProduct.dart';
import 'package:store/theme.dart';

class productsArival extends StatelessWidget {
  final ProductModel product;
  productsArival(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduct(product)))
      },
      child: Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '${product.galleries![0].url}',
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.category!.name}',
                    style: subTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${product.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${product.price}',
                    style:
                        priceTextStyle.copyWith(fontSize: 14, fontWeight: medium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
