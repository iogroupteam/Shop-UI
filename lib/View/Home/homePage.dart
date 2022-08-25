import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes_store/Models/shoesModel.dart';
import 'package:shoes_store/View/Home/selectPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await loadJson();
    });
    super.initState();
  }

  List myData = [];

  List<ShoesModel> shoesList = [];

  loadJson() async {
    String data = await rootBundle.loadString('assets/json/data.json');

    setState(() {
      myData = json.decode(data);
      shoesList = myData.map((e) => ShoesModel.fromJson(e)).toList();
      shoesList = shoesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: myHeight,
          width: myWidth,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: myHeight * 0.03,
                    left: myWidth * 0.08,
                    right: myWidth * 0.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.grey,
                    ),
                    Image.asset(
                      'assets/icons/5.png',
                      height: myHeight * 0.025,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: myHeight * 0.04,
                    left: myWidth * 0.08,
                    right: myWidth * 0.08),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sneakers',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text('Boots',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Text('Loafers',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                      Image.asset(
                        'assets/icons/6.png',
                        height: myHeight * 0.03,
                        color: Colors.grey,
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: myHeight * 0.008,
                    left: myWidth * 0.07,
                    right: myWidth * 0.08),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: myHeight * 0.003,
                          width: myWidth * 0.16,
                          color: Colors.black)
                    ]),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: shoesList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectPage(
                                    index: index,
                                    selectItem: shoesList[index])));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 9,
                                    spreadRadius: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(5, 5))
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: myHeight * 0.09,
                                  bottom: myHeight * 0.06,
                                  left: myWidth * 0.1,
                                  right: myWidth * 0.1,
                                ),
                                child: Image.asset(shoesList[index].images![0]),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: myWidth * 0.04,
                                    vertical: myHeight * 0.03),
                                child: Row(
                                  children: [
                                    Text(shoesList[index].model.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Container(
                                height: myHeight * 0.05,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: shoesList[index].colors!.length,
                                  itemBuilder: (context, indexx) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        height: myHeight * 0.05,
                                        width: myWidth * 0.06,
                                        decoration: BoxDecoration(
                                            color: Color(int.parse(
                                                shoesList[index]
                                                    .colors![indexx])),
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5)),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      shoesList[index]
                                              .price
                                              .toString()
                                              .substring(
                                                  0,
                                                  shoesList[index]
                                                          .price
                                                          .toString()
                                                          .length -
                                                      2) +
                                          ' \$',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    shoesList[index].isSave == false
                                        ? Image.asset('assets/icons/2.1.png',
                                            height: myHeight * 0.03)
                                        : Image.asset('assets/icons/2.png',
                                            height: myHeight * 0.03)
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  );
                },
              ))
            ],
          )),
    ));
  }
}
