import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product_models.dart';
import 'package:store/pages/home/detail_chat_page.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/providers/wishlist_provider.dart';
import 'package:store/theme.dart';

class DetailProduct extends StatefulWidget {
  
  final ProductModel product;
  const DetailProduct(this.product);
  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {


  List shoesfamiliar = [
    'assets/detailsepatu.png',
    'assets/detailsepatu2.png',
    'assets/detailsepatu3.png',
    'assets/detailsepatu4.png',
    'assets/detailsepatu5.png',
    'assets/detailsepatu6.png',
    'assets/detailsepatu7.png',
    'assets/detailsepatu8.png',
  ];

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Future<void> showSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width - (2 * defaultMargin),
        child: AlertDialog(
          backgroundColor: backgroundColor3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: primaryTextColor,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/berhasil.png',
                  width: 100,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Hurray :)',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Item added successfully',
                  style: fourTextStyle.copyWith(fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 154,
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), 
                      ),
                    ),
                    child: Text(
                      'View My Cart',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget indicator(index) {
    return Container(
      height: 4,
      width: currentindex == index ? 16 : 4,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          color: currentindex == index ? primaryColor : Color(0xffC4C4C4),
          borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget header() {
    int index = -1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                ),
              ),
              Icon(
                Icons.shopping_bag,
                color: backgroundColor1,
              ),
            ],
          ),
        ),
        CarouselSlider(
          items: widget.product.galleries!
              .map(
                (e) => Image.network(
                  '${e.url}',
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
          options: CarouselOptions(
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                currentindex = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.product.galleries!.map((e) {
            index++;
            return indicator(index);
          }).toList(),
        ),
      ],
    );
  }

  Widget familiarShoes(String i) {
    return Container(
      width: 54,
      height: 54,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: backgroundColor6,
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: AssetImage(
            i,
          ),
        ),
      ),
    );
  }

  Widget isi() {
    int index = -1;
    return Container(
      margin: const EdgeInsets.only(
        top: 17,
      ),
      padding: const EdgeInsets.only(
        top: 30,
        // left: 30,
        // right: 30,
      ),
      decoration: BoxDecoration(
        color: backgroundColor1,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.product.name}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        '${widget.product.category?.name}',
                        style: fourTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    wishlistProvider.setwishlist(widget.product);

                    if (wishlistProvider.iswishlist(widget.product)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: secondaryColor,
                          content: Text(
                            'Has been added to the wishlist',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: alertColor,
                          content: Text(
                            'Has been removed from the wishlist',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  },
                  child: Image.asset(
                    wishlistProvider.iswishlist(widget.product)
                        ? 'assets/wishlist_nyala.png'
                        : 'assets/button_wishlist_mati.png',
                    height: 46,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price starts from',
                  style: primaryTextStyle.copyWith(fontSize: 14),
                ),
                Text(
                  '\$${widget.product.price}',
                  style: priceTextStyle.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: 30, left: defaultMargin, right: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '${widget.product.description}',
                  style: subTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: defaultMargin, left: defaultMargin, right: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fimiliar Shoes',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: shoesfamiliar.map((e) {
                  index++;
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? defaultMargin : 0,
                    ),
                    child: familiarShoes(e),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: transparent,
                    border: Border.all(
                      color: primaryColor,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => detailChat(widget.product)));
                    },
                    child: Image.asset(
                      'assets/icon_chat.png',
                      width: 23,
                      height: 22,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 54,
                    child: TextButton(
                      onPressed: () {
                        cartProvider.addCart(widget.product);
                        showSuccessDialog();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  
    return Scaffold(
      body: Container(
        color: backgroundColor6,
        child: ListView(
          children: [
            header(),
            isi(),
          ],
        ),
      ),
    );
  }
}
