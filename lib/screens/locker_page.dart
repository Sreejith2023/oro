import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oro/controllers/locker_controller.dart';
import 'package:oro/widgets/custom_button.dart';

class LockerPage extends GetView<LockerController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        leading: InkWell(onTap: (){Get.back();},child: SvgPicture.asset('asset/images/ic_left.svg', fit: BoxFit.scaleDown,)),
        title: Text('Locker Contents ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 590,
              margin: EdgeInsets.only(left: 16,top: 12, right: 16),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3.7/6,
                  mainAxisSpacing: 20),
                  itemCount: 3,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext ctx, index){
                return lockerContentsItem();
                  }),
            ),
            CustomButton(btnTxt: 'Pay',onBtnClicked: (){
              Get.toNamed('/choose');
            },)
          ],
        ),
      ),
    );
  }

  Widget lockerContentsItem(){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 8),
            height: 100,
            color: Color(0xFFF9F9F9),
            child: Align(alignment: Alignment.center,child: Text('SEAL PHOTOS\nHERE', textAlign: TextAlign.center,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),)),
          ),
          Text('OSS1001', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black),),
          Container(
            margin: EdgeInsets.only(left: 9, top: 11, right: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Necklace', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF454545)),),
                Container(
    padding: EdgeInsets.all(2)
    ,decoration: BoxDecoration(
                  color: Color(0xFFFFF7EA),
                  border: Border.all(
                      color: Color(0xFFFFE1A8), // Set border color
                      width: 1.0),   // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0)),
                ),child: Text('02 QTY', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800, color: Color(0xFF454545)),),)
              ],
            ),
          ),
          itemDetailsRow(head1: 'QUALITY',value1: '22 carats', head2: 'STONE WEIGHT', value2: '30 grams'),
          itemDetailsRow(head1: 'GROSS WEIGHT',value1: '150 grams', head2: 'NET WEIGHT / ANW', value2: '4g / 4g'),
          viewGoldPhotos()
        ],
      ),
    );
  }

  Widget itemDetailsRow({required String head1,required String value1,required String head2,required String value2}){
    return Container(
      margin: EdgeInsets.only(left: 9, top: 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(margin: EdgeInsets.only(bottom: 2),child: Text(head1, style: TextStyle(fontSize: 6, fontWeight: FontWeight.w700, color: Color(0xFF909090)),)),
                Text(value1, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFF454545)))
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 2),
                  child: Text(
                    head2,
                    style: TextStyle(
                        fontSize: 6,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF909090)),
                  ),
                ),
                Text(value2,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF454545)))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget viewGoldPhotos(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4 )
      ,decoration: BoxDecoration(
      color: Color(0xFFFFE1A8),
      borderRadius: BorderRadius.all(
          Radius.circular(10.0)),
    ),child: Text('VIEW GOLD PHOTOS', style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800, color: Colors.black),),);
  }

}
