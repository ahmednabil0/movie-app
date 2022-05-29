import 'package:flutter/cupertino.dart';
import 'package:movie/conests.dart';

// ignore: camel_case_types
class list extends StatelessWidget {
  const list({
    Key? key,
    required this.size,
    required this.vote,
    required this.img,
  }) : super(key: key);

  final Size size;
  final double vote;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Stack(
        children: [
          Container(
            height: size.height * 0.35,
            width: size.width * 0.35,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: fontcolor.withOpacity(0.2),
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                  )
                ],
                color: primarycolor,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.fill)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width * 0.35,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                  color: primarycolor.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.5),
                  child: Text(
                    'Rate: ${vote.toString()}/10',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: fontcolor,
                        fontSize: 12,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
