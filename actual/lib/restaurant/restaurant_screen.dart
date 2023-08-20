import 'package:actual/common/const/data.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  /* Future return -> async */
  Future<List> paginateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get('http://$ip/restaurant',
        options: Options(headers: {'authorization': 'Bearer $accessToken'}));

    /* API response 에서 필요한게 data */
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
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      /* item 실행할때마다 생성댐 */
                      final item = snapshot.data![index];
                      return RestaurantCard(
                        /* Network 로부터 이미지 가져옴 */
                        image: Image.network(
                          'http://$ip${item['thumUrl']}',
                          fit: BoxFit.cover,
                        ),
                        // image: Image.asset(
                        //   'asset/img/food/ddeok_bok_gi.jpg',
                        //   fit: BoxFit.cover,
                        // ),
                        name: item['name'],
                        tags: List<String>.from(item['tags']) /* Casting */,
                        ratingsCount: item['ratingsCount'],
                        deliveryTime: item['deliveryTime'],
                        deliveryFee: item['deliveryFee'],
                        ratings: item['ratings'],
                      );
                    },
                    separatorBuilder: (_, index) {
                      /* 각 item 사이에 들어가는 공백이라고 보면 댐 */
                      return SizedBox(height: 16.0,);
                    },
                );

              },
            )
        ));
  }
}
