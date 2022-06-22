import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oro/controllers/choose_plan_controller.dart';
import 'package:oro/widgets/custom_button.dart';

class ChoosePlanPage extends GetView<ChoosePlanController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        leading:  Container(margin: EdgeInsets.only(left: 16),child: Image.asset('asset/images/ic_plan.png')),
        title: Text('Choose Plan & Pay', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color:  Color(0xFF454545)),),
        actions: [
          InkWell(onTap: (){Get.back();},child: Container(margin: EdgeInsets.only(right: 16),child: SvgPicture.asset('asset/images/ic_close.svg')))
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              child: ListView.builder(
                itemCount: 4
              ,itemBuilder: (context, i){
                  return planItem(i, controller);
              }),
            ),
            noSecurity(context),
            Container(margin: EdgeInsets.only(top: 15, bottom: 15),child: Text('Tax payable (18%): ₹260', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),)),
            confirmPlan(context),
          ],
        ),
      ),
    );
  }

  Widget planItem(int i, ChoosePlanController controller){
    return Container(
      height: 85,
      margin: EdgeInsets.only(left: 16,right: 16),
      child: Obx((){
        return Card(
          color: controller.groupValue.value==i?Color(0xFFFFF7EA):Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(width: 0.5, color: Color(0xFFE6E6E6))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Radio<int>(value: i, groupValue: controller.groupValue.value, onChanged:(int? value){controller.setGroupValue(value!);}, fillColor: MaterialStateProperty.all(Colors.green),),
                  Text('6 Months', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(margin: EdgeInsets.only(bottom: 5),child: Text('₹ 1,444', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,  color: Colors.black),)),
                    Text('₹240 MONTHLY', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800,  color: Color(0xFF5A953E)),),

                  ],
                ),
              )

            ],
          ),
        );
      }),
    );
  }

  Widget noSecurity(BuildContext context){
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 16, top: 20, right: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFE79B), Color(0xFFFFB81E)],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        )
      ),
      child: Row(
        children: [
          Container(margin: EdgeInsets.only(left: 12,top: 14, right: 10),alignment: Alignment.topLeft,child: Image.asset('asset/images/ic_check.png')),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin: EdgeInsets.only(bottom: 5),child: Text('NO SECURITY DEPOSIT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.black),)),
              Container(margin: EdgeInsets.only(top: 5),child: Text('Oro Safe does not charge security deposit for your lockers. ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),)),

            ],
          )
        ],
      ),
    );
  }

  Widget confirmPlan(BuildContext context){
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE9BF), Color(0xFFFFFFFF)],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          )
      ),
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 4,child: Container(margin: EdgeInsets.only(bottom: 6),child: Text('Duration', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF454545)),))),
                Expanded(flex: 2,child: Text('Amount (INCL. TAX)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFF454545)),))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 4,child: Container(margin: EdgeInsets.only(bottom: 6),child: Text('6 Months', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),))),
                Expanded(flex: 2,child: Text('₹ 1,704', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),))
              ],
            ),
            Row(
              children: [
                Checkbox(value: true, onChanged: null,),
                Text('I agree to terms & conditions', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),)
              ],
            ),
            CustomButton(btnTxt: 'Confirm Plan Selection',onBtnClicked: (){

            },)

          ],
        ),
      ),
    );
  }

}