import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/models/product_models.dart';
import 'package:store/theme.dart';

class chatBubble extends StatelessWidget {
  final String? isichat;
  final bool? isUser;
  final ProductModel? product;

  chatBubble(
    
    {this.isichat = '',
    this.isUser = true,
    this.product, }
    
  );

  @override
  Widget produtsPrrview() {
    return Container(
      width: 231,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isUser! ? backgroundColor5 : backgroundColor4,
        borderRadius: BorderRadius.only(
          topRight: isUser! ? Radius.circular(0) : Radius.circular(12),
          topLeft: isUser! ? Radius.circular(12) : Radius.circular(0),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  '${product?.galleries![0].url}',
                  height: 70,
                  width: 70,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product?.name}',
                      style: primaryTextStyle,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\$${product?.price}',
                      style: priceTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 21,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: purpleTextStyle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.poppins(
                    color: backgroundColor3,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isUser! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          product is UninitializedProductModel ? SizedBox(): produtsPrrview() ,
          Row(
            mainAxisAlignment:
                isUser! ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: isUser! ? backgroundColor5 : backgroundColor4,
                    borderRadius: BorderRadius.only(
                      topRight:
                          isUser! ? Radius.circular(0) : Radius.circular(12),
                      topLeft:
                          isUser! ? Radius.circular(12) : Radius.circular(0),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(isichat!, style: primaryTextStyle),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
