import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/restaurant/restaurant_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab>
    with SingleTickerProviderStateMixin /* tabBar 쓰기 위해서 필요함 */{

  late TabController controller;

  @override
  void initState() {
    super.initState();

    /* TabController 초기화 */
    controller = TabController(
        length: 4 /* item lenght */,
        vsync: this /* with 에서 받아오는거임 */
    );
    controller.addListener(tabListener);

  }

  /* tab 속성이 바뀔때마다 이 함수가 호출 */
  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  int index = 0; /* Nav 초기값 */

  @override
  Widget build(BuildContext context) {

    return DefaultLayout(
      title: '코팩 딜리버리',
      child: TabBarView(
        physics: NeverScrollableScrollPhysics() /* swipe 방지 */,
        controller: controller,
        children: [
          RestaurantScreen(),
          Container(child: Text('음식'),),
          Container(child: Text('주문'),),
          Container(child: Text('프로필'),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        // type: BottomNavigationBarType.shifting, /* 기본값 : 선택항목이 조금 큼 */
        type: BottomNavigationBarType.fixed, /* 애니메이션 없는 형태 */
        onTap: (int index) {
          /* tab click 이동 */
          controller.animateTo(index);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood_outlined), label: '음식'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: '주문'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: '프로필')
        ],
      ),
    );
  }

}
