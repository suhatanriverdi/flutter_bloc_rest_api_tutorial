import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';
import 'details_page.dart';

class GameCard extends StatelessWidget {
  final double heigth;
  final double width;

  final DataModel dataModel;

  const GameCard(
      {Key? key,
      required this.heigth,
      required this.width,
      required this.dataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              dataModel: dataModel,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(width * 0.03),
        height: heigth,
        width: width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: width * 0.01),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(width * 0.05)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.97,
                          child: Text(
                            textAlign: TextAlign.center,
                            dataModel.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: width * 0.055,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.97,
                          child: Text(
                            textAlign: TextAlign.center,
                            dataModel.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              dataModel.platforms,
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
            Image(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                height: heigth * 0.7,
                width: width * 0.9,
                image: NetworkImage(dataModel.image)),
          ],
        ),
      ),
    );
  }
}
