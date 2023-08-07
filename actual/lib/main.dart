import 'package:flutter/material.dart';

import 'common/component/custom_text_form_field.dart';

void main() {
  runApp(
    // 최상위에는 무조건 MaterialApp 이 들어가야한다.
    // 그래서 _App 안에서 최상위 return = Material
    _App()
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false /* debug 없애기 */,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              /* requied 를 안쓰면 강제는 아닌가 싶다! */
              hintText: '이메일을 입력해주세요',
              onChanged: (String value) { },
            ),
            CustomTextFormField(
              /* requied 를 안쓰면 강제는 아닌가 싶다! */
              hintText: '비밀번호 입력해주세요',
              obscureText: true,
              onChanged: (String value) { },
            )
          ],
        )
      ),
    );
  }
}
