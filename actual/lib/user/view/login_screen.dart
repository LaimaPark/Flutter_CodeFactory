import 'dart:convert';
import 'dart:io';

import 'package:actual/common/const/colors.dart';
import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/common/view/root_tab.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../common/component/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    /* 두번 호출 할 예정이라 최상위에다가 선언 */
    final dio = Dio();


    return DefaultLayout(
      child: SingleChildScrollView( /* 밑에 있는 child 들을 스크롤 가능하게 해준다 */
        /* keyboardDismissBehavior : onDrag - 드래그 하면 키보드 내려감 */
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          /* SafeArea : 앱 위 아래 영역까지 활용하기 */
          top: true,
          bottom: false,
          child: Padding(
            /* symmetric : horizontal(좌우) or 상하 */
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              /* crossAxis : X축(stretch = start), mainAxis : Y축 */
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Title(),
                const SizedBox(height: 16.0),
                _SubTitle(),
                Image.asset(
                    'asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                  /* MediaQuery == getContext */
                  /* 스크린 넓이 가져옴 */
                ),
                CustomTextFormField(
                  /* required 를 안쓰면 강제는 아닌가 싶다! */
                  hintText: '이메일을 입력해주세요',
                  onChanged: (String value) { /* TextWatcher */
                    username = value;
                  },
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  /* requied 를 안쓰면 강제는 아닌가 싶다! */
                  hintText: '비밀번호 입력해주세요',
                  obscureText: true,
                  onChanged: (String value) { /* TextWatcher */
                    password = value;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                    onPressed: () async /* 비동기 */ {
                      /* ID & 비밀번호 */
                      final rawString = '$username:$password';

                      /* Dart 에서 BASE64 인코딩 하는 법(암기하기) */
                      // <String, String> String 넣어서 return String
                      Codec<String, String> stringToBase64 = utf8.fuse(base64);
                      String token = stringToBase64.encode(rawString);

                      final resp = await dio.post(
                        'http://$ip/auth/login',
                        options: Options(
                          headers: {
                            /* header 넣는 곳*/
                            'authorization': 'Basic $token',
                          },
                        ),
                      );

                      final refreshToken = resp.data['refreshToken'];
                      final accessToken = resp.data['accessToken'];

                      /* await = 동작이 완료될때까지 기다림 */
                      await storage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);
                      await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

                      /* 위에서 에러가 나면 밑으로 가지 않음 */

                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RootTab(),
                          ),
                      );

                    },
                    /* primary -> backgroundColor deprecated Migrate */
                    style: ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
                    child: Text('로그인')),
                TextButton(
                    onPressed: () {},
                    /* primary -> foregroundColor deprecated Migrate */
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                    child: Text('회원가입'))
              ],
            ),
          ),
        ),
      )
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '환영합니다',
      style: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길',
      style: TextStyle(
          fontSize: 16, color: BODY_TEXT_COLOR),
    );
  }
}
