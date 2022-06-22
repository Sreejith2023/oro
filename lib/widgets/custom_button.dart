import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String btnTxt;
  Function onBtnClicked;
  CustomButton({required this.btnTxt, required this.onBtnClicked});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 30),
      child: MaterialButton(
        onPressed: (){onBtnClicked.call();},
        minWidth: MediaQuery.of(context).size.width,
        height: 44,
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0) ),
        color: Color(0xFFF8B830),
        disabledColor:  Color(0xFFF8B830),
        child: Text(
          btnTxt,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
    );
  }
}