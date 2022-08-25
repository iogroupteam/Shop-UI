import 'package:flutter/material.dart';
import 'package:shoes_store/Static/staticClass.dart';

class MyBasket extends StatefulWidget {
  const MyBasket({Key? key}) : super(key: key);

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  @override
  void initState() {
    sumPrice();
    itemCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: myHeight * 0.03,
                bottom: myHeight * 0.03,
                left: myWidth * 0.08,
                right: myWidth * 0.08,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios_new),
                  Text(
                    'Checkout',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/icons/7.png',
                    height: myHeight * 0.03,
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: StaticClass.myBasketItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                      padding: EdgeInsets.all(20),
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
                          Row(
                            children: [
                              Image.asset(
                                StaticClass.myBasketItems[index].images![0],
                                height: myHeight * 0.06,
                              ),
                              SizedBox(width: myWidth * 0.06),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StaticClass.myBasketItems[index].model
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: myHeight * 0.02),
                                  Row(
                                    children: [
                                      Text('Size:          '),
                                      Text(
                                        StaticClass
                                            .myBasketItems[index].sizes![0]
                                            .toString(),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: myHeight * 0.02),
                                  Row(
                                    children: [
                                      Text('Color: '),
                                      SizedBox(width: myWidth * 0.03),
                                      Container(
                                        height: myHeight * 0.02,
                                        width: myWidth * 0.045,
                                        decoration: BoxDecoration(
                                            color: Color(int.parse(StaticClass
                                                .myBasketItems[index]
                                                .colors![0])),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5))),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: myHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (counter[index] > 1) {
                                        setState(() {
                                          counter[index] = counter[index] - 1;
                                          totalPrice = totalPrice -
                                              int.parse(StaticClass
                                                  .myBasketItems[index].price
                                                  .toString()
                                                  .substring(
                                                      0,
                                                      StaticClass
                                                              .myBasketItems[
                                                                  index]
                                                              .price
                                                              .toString()
                                                              .length -
                                                          2));
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: myHeight * 0.025,
                                      width: myWidth * 0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.grey
                                                  .withOpacity(0.5))),
                                      child: Icon(
                                        Icons.remove,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      counter[index].toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        counter[index] = counter[index] + 1;
                                        totalPrice = totalPrice +
                                            int.parse(StaticClass
                                                .myBasketItems[index].price
                                                .toString()
                                                .substring(
                                                    0,
                                                    StaticClass
                                                            .myBasketItems[
                                                                index]
                                                            .price
                                                            .toString()
                                                            .length -
                                                        2));
                                      });
                                    },
                                    child: Container(
                                      height: myHeight * 0.025,
                                      width: myWidth * 0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.grey
                                                  .withOpacity(0.5))),
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                StaticClass.myBasketItems[index].price
                                        .toString()
                                        .substring(
                                            0,
                                            StaticClass
                                                    .myBasketItems[index].price
                                                    .toString()
                                                    .length -
                                                2) +
                                    ' \$',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      )),
                );
              },
            )),
            Container(
              height: myHeight * 0.25,
              // color: Colors.blue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Items: ',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[700]),
                        ),
                        Text(
                          totalPrice.toString() + ' \$',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.5),
                      thickness: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount: ',
                          style:
                              TextStyle(fontSize: 20, color: Colors.grey[700]),
                        ),
                        Text(
                          '0 \$',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.5),
                      thickness: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total: ',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(
                          totalPrice.toString() + ' \$',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: myHeight * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: myWidth * 0.05,
                          vertical: myHeight * 0.025),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black),
                      child: Center(
                          child: Text(
                        'Buy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int totalPrice = 0;

  sumPrice() {
    for (var i = 0; i < StaticClass.myBasketItems.length; i++) {
      totalPrice = totalPrice +
          int.parse(StaticClass.myBasketItems[i].price.toString().substring(
              0, StaticClass.myBasketItems[i].price.toString().length - 2));
    }
  }

  List<int> counter = [];

  itemCounter() {
    for (var i = 0; i < StaticClass.myBasketItems.length; i++) {
      counter.add(1);
    }
  }
}
