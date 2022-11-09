import 'package:flutter/material.dart';
import 'package:store/models/product_models.dart';
import 'package:store/pages/detailProduct.dart';
import 'package:store/theme.dart';

class ProductsCard extends StatelessWidget {

  final ProductModel product;
  ProductsCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduct(product)))
      },
      child: Container(
        height: 278,
        width: 215,
        margin: EdgeInsets.only(
          right: 30,
        ),
        decoration: BoxDecoration(
          color: Color(0xffECEDEF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.network(
              '${product.galleries![0].url}',
              height: 150,
              width: 215,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.category!.name}',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${product.name}',
                    style: thirdTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
