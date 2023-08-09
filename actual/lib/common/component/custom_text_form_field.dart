import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  /* 외부에서 값을 받아오는 경우 여기서 정리해둔다. */
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;


  const CustomTextFormField({
    required this.onChanged,
    this.autoFocus = false, /* 기본값 false */
    this.obscureText = false,
    this.hintText /* required 대신에 String? 을 해주었다. 이유는 뭘까.. */,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
          /* 테두리 */
          color: INPUT_BORDER_COLOR,
          width: 1.0),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText,    /* 비밀번호 */
      autofocus: autoFocus,        /* 화면에 들어왔을 때, 자동적으로 focus 할건지 */
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        filled: true,             /* false - 배경색 없음 , true - 배경색 있음 */
        border: baseBorder,       /* 모든 input 상태의 기본 스타일 세팅 */
        enabledBorder: baseBorder,/* 선택을 할 수 있는 상태 */
        focusedBorder: baseBorder.copyWith(
          /* copyWith : 속성들을 복사하고 원하는 것만 바꿀 수 있음 */
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          )
        ) /* -> focusedBorder 를 바꾸는데, borderSide 속성 중에서 색만 바꿔서 적용한다 */
      ),
    );
  }
}
