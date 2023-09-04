import 'dart:js';

import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/product/component/product_card.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '불타는 떡볶이',
        child: CustomScrollView(
          slivers: [
            renderTop(),
            renderLabel(),
            renderProducts()
          ],
        )


    );
  }

  SliverPadding renderLabel() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),),
      ),
    );
  }

  renderProducts() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProductCard(),
              );
            },
            childCount: 10,
          )
      ),
    );
  }

  SliverToBoxAdapter renderTop() {
    return  SliverToBoxAdapter(
      child: Column(
        children: [
          RestaurantCard(
            image: Image.asset(
                'asset/img/food/ddeok_bok_gi.jpg'
            ),
            name: '불타는 떡볶이',
            tags: tags,
            ratingsCount: ratingsCount,
            deliveryTime: deliveryTime,
            deliveryFee: deliveryFee,
            ratings: ratings,
            detail: '맛있는 떡볶이',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ProductCard(

            ),
          ),

        ],
      ),
    )
  }

}
