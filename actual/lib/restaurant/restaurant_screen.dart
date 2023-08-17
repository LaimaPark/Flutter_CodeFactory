import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Future<List> paginateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get('http://$ip/restaurant',
        options: Options(headers: {'authorization': 'Bearer $accessToken'}));

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FutureBuilder<List> (
              future: paginateRestaurant(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData) {
                  /* Data 가 없으면?? */
                  return Container();
                }

                return ListView.separated(
                    itemBuilder: (_, index) {
                      return RestaurantCard(
                        image: Image.asset(
                          'asset/img/food/ddeok_bok_gi.jpg',
                          fit: BoxFit.cover,
                        ),
                        name: '불타는 떡볶이',
                        tags: ['떡볶이', '치즈', '매운맛'],
                        ratingsCount: 100,
                        deliveryTime: 15,
                        deliveryFee: 2000,
                        ratings: 100,
                      );
                    },
                    separatorBuilder: (_, index) {
                      /* 각 item 사이에 들어가는 공백이라고 보면 댐 */
                      return SizedBox(height: 16.0,);
                    },
                    itemCount: snapshot.data!.length
                );

              },
            )
        ));
  }
}
