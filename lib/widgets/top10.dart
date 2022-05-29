import 'package:flutter/cupertino.dart';
import '../conests.dart';
import '../helper.dart';

class Top10 extends StatelessWidget {
  const Top10({
    Key? key,
    required this.size,
    required this.img,
    required this.vote,
    required this.title,
  }) : super(key: key);

  final Size size;
  final String img;
  final double vote;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Container(
            height: size.height * 0.4,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: fontcolor.withOpacity(0.2),
                    blurRadius: 12,
                    blurStyle: BlurStyle.outer,
                  )
                ],
                color: primarycolor,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2$img',
                    ),
                    fit: BoxFit.fill)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width * 0.5,
              height: size.height * 0.089,
              decoration: BoxDecoration(
                  color: primarycolor.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(30))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Text(
                    cuttext(title),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: fontcolor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: size.width * 0.22,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                  color: primarycolor.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(20))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.5),
                  child: Text(
                    '${vote.toString()}/10',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: fontcolor,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
