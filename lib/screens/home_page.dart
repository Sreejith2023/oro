import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:oro/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  var pdfController = PdfController(
    document: PdfDocument.openAsset('asset/pdffiles/pdf1.pdf'),
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List horImages = [
      'asset/images/img1.png',
      'asset/images/img2.png',
      'asset/images/img1.png'
    ];
    List horImages1 = [
      'asset/images/ic_logo.png',
      'asset/images/img3.png',
      'asset/images/img4.png'
    ];
    var menuItems = [
      'English',
      'Tamil',
      'Telugu',
      'Kannada',
      'Marathi',
      'Hindi'
    ];
    HomeController con = Get.put(HomeController());
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Align(
            alignment: Alignment.center,
            child: Image.asset('asset/images/ic_logo.png')),
        actions: [
          InkWell(
            child: Container(
                margin: EdgeInsets.only(right: 10),
                child: SvgPicture.asset('asset/images/ic_ekyc.svg')),
            onTap: () {
              Get.generalDialog(
                  pageBuilder: (_scaffoldKey, animation, secondaryAnimation) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 24, top: 24, right: 22),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'e-Kyc Confirmation',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                value: menuItems[0],
                                iconSize: 0.0,
                                isDense: true,
                                selectedItemBuilder: (BuildContext context) {
                                  return menuItems.map<Widget>((String item) {
                                    return Obx(() {
                                      return Container(
                                        height: 30,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFE1A8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: Text(
                                                  menuItems[controller
                                                      .getLanguageIndex()],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black),
                                                )),
                                            SvgPicture.asset(
                                                'asset/images/ic_language.svg',
                                                fit: BoxFit.scaleDown)
                                          ],
                                        ),
                                      );
                                    });
                                  }).toList();
                                },
                                items: menuItems.map((String menuItems1) {
                                  return DropdownMenuItem(
                                      value: menuItems1,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                menuItems1,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              Obx(() {
                                                return con.getSelectedLanguage() ==
                                                        menuItems1
                                                    ? SvgPicture.asset(
                                                        'asset/images/ic_tick1.svg',
                                                        fit: BoxFit.scaleDown)
                                                    : Container();
                                              })
                                            ],
                                          ),
                                        ],
                                      ));
                                }).toList(),
                                onChanged: (String? newValue) async {
                                  con.setLanguageIndex(
                                      menuItems.indexOf(newValue!));
                                  con.setSelectedLanguage(newValue);
                                  pdfController = await PdfController(
                                    document: PdfDocument.openAsset(
                                        'asset/pdffiles/pdf2.pdf'),
                                  );
                                  con.setPdfController(pdfController);

                                  /* setState(() {
                                      dropdownvalue = newValue!;
                                    });*/
                                },
                              ))
                            ],
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(left: 24, top: 7, right: 24),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Please read the document carefully before\nproceeding further.',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF909090)),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          decoration: BoxDecoration(
                            //   color: Color(0xFFC4C4C4),
                            border:
                                Border.all(color: Color(0xFFC4C4C4), width: 17),
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.0)),
                          ),
                          child: Obx(() {
                            return PdfView(
                              controller: con.getPdfController(),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                );
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topCard(context),
            subheads(title: "Advantages of Doorstep Lockers", marginTop: 24),
            doorstepAdvantages(),
            subheads(
                title: "A sneak-peek into our Locker Space!", marginTop: 24),
            playArea(context),
            subheads(
                title: "Where are your Locker Items stored?", marginTop: 24),
            horizontalScrollImage(context, horImages),
            subheads(title: "Safe & Secure Guarantee", marginTop: 24),
            horizontalScrollImage1(context, horImages1),
          ],
        ),
      ),
    );
  }

  Widget playArea(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border.all(color: Color(0xFFE6E6E6)),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child:
          SvgPicture.asset('asset/images/ic_play.svg', fit: BoxFit.scaleDown),
    );
  }

  Widget topCard(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.only(left: 0, right: 0, top: 10),
      color: Colors.white,
      child: Container(
        height: 250,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 15, bottom: 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('asset/images/ic_stages.png'),
                  SvgPicture.asset('asset/images/ic_divider.svg'),
                  SvgPicture.asset('asset/images/ic_tick.svg'),
                  SvgPicture.asset('asset/images/ic_divider.svg'),
                  SvgPicture.asset('asset/images/ic_tick.svg')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 26),
                    child: Text(
                      "Current doorstep locker visit",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF909090)),
                    ),
                  ),
                  Text(
                    'Locker',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "We will confirm your request shortly.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF909090)),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/locker');
                    },
                    child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 90,
                        margin: EdgeInsets.only(bottom: 26, right: 15),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8B830),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Locker Contents ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SvgPicture.asset('asset/images/ic_right.svg'),
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget subheads({required String title, required double marginTop}) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: marginTop, right: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF454545)),
          ),
          Image.asset('asset/images/ic_oro.png'),
        ],
      ),
    );
  }

  Widget doorstepAdvantages() {
    return Card(
      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Container(
        height: 40,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Access lockers at your doorstep.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF454545))),
            SvgPicture.asset('asset/images/ic_dot.svg')
          ],
        ),
      ),
    );
  }

  Widget horizontalScrollImage(BuildContext context, List horImages) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(left: 12, top: 16, right: 16),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Image.asset(horImages[index], fit: BoxFit.scaleDown);
        },
        scrollDirection: Axis.horizontal,
        itemCount: 3,
      ),
    );
  }


  Widget horizontalScrollImage1(BuildContext context, List horImages) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 12, top: 16, right: 16, bottom: 20),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Image.asset(horImages[index], fit: BoxFit.scaleDown);
        },
        scrollDirection: Axis.horizontal,
        itemCount: 3,
      ),
    );
  }
}
