import 'package:flutter/material.dart';
import 'package:shoes_store/Models/shoesModel.dart';
import 'package:shoes_store/Static/staticClass.dart';

class SelectPage extends StatefulWidget {
  var selectItem;
  int? index;

  SelectPage({this.selectItem, this.index});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  int myIndex = 0;
  int? sizeIndex;
  int? colorIndex;

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
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new)),
                  Icon(Icons.favorite_border)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
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
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: myHeight * 0.09,
                      bottom: myHeight * 0.06,
                      left: myWidth * 0.1,
                      right: myWidth * 0.1,
                    ),
                    child: Image.asset(
                      widget.selectItem.images[myIndex],
                      height: myHeight * 0.18,
                    ),
                  ),
                  Container(
                    height: myHeight * 0.08,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.selectItem.images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                myIndex = index;
                              });
                            },
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: myHeight * 0.06,
                                  width: myWidth * 0.13,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: myIndex == index
                                              ? Colors.black
                                              : Colors.grey.withOpacity(0.5))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(widget
                                                .selectItem.images[index]))),
                                  ),
                                ),
                                Container(
                                  height: myHeight * 0.06,
                                  width: myWidth * 0.13,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: myIndex == index
                                          ? Colors.transparent
                                          : Colors.grey.withOpacity(0.5)),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    child: Row(
                      children: [
                        Text(
                          widget.selectItem.model,
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: myHeight * 0.05,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.selectItem.sizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                sizeIndex = index;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: sizeIndex == index
                                            ? Colors.grey.withOpacity(0.5)
                                            : Colors.transparent),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    widget.selectItem.sizes[index].toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: myHeight * 0.06,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.selectItem.colors!.length,
                      itemBuilder: (context, indexx) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                colorIndex = indexx;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: colorIndex == indexx
                                          ? Colors.grey.withOpacity(0.5)
                                          : Colors.transparent),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                height: myHeight * 0.05,
                                width: myWidth * 0.06,
                                decoration: BoxDecoration(
                                    color: Color(int.parse(
                                        widget.selectItem.colors![indexx])),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      children: [
                        Text(
                          widget.selectItem.price.toString().substring(
                                  0,
                                  widget.selectItem.price.toString().length -
                                      2) +
                              ' \$',
                          style: TextStyle(
                              fontSize: 33, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: (){
                        addToCart();
                        final snackBar = SnackBar(content: Text('Done!'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.05,
                            vertical: myHeight * 0.025),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                        child: Center(
                            child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }

  addToCart(){
    StaticClass.myBasketItems.add(
      ShoesModel(
        model: widget.selectItem.model,
        price: widget.selectItem.price,
        isSave: widget.selectItem.isSave,
        colors: [widget.selectItem.colors[colorIndex]],
        images: [widget.selectItem.images[0]],
        sizes: [widget.selectItem.sizes[sizeIndex]],
      )
      
    );
  }



}
