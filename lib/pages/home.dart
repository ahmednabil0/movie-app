import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/conests.dart';
import 'package:movie/pages/details.dart';
import 'package:movie/porviders/homeprovider.dart';
import 'package:provider/provider.dart';
import '../widgets/list.dart';
import '../widgets/top10.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundcolor,
        title: const Text('Movie',
            style: TextStyle(color: fontcolor, fontSize: 25)),
        centerTitle: true,
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.4,
                    width: double.infinity,
                    child: provider.list.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: primarycolor,
                          ))
                        : CarouselSlider.builder(
                            itemCount: provider.list.length,
                            itemBuilder: (context, index, realIndex) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              Text("loading"),
                                              CircularProgressIndicator(
                                                  color: primarycolor)
                                            ],
                                          ),
                                        );
                                      });
                                  provider
                                      .getkey(provider.list[index].id)
                                      .then((value) {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Details(
                                          id: value,
                                          img: provider.list[index].poster_path,
                                          overview:
                                              provider.list[index].overview,
                                          title: provider.list[index].title);
                                    }));
                                  });
                                },
                                child: Top10(
                                    size: size,
                                    img:
                                        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${provider.list[index].poster_path}',
                                    vote: provider.list[index].vote_average,
                                    title: provider.list[index].title),
                              );
                            },
                            options: CarouselOptions(
                                enlargeCenterPage: true,
                                autoPlay: false,
                                enableInfiniteScroll: false,
                                initialPage: 4)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      'Best Movies',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(
                      height: size.height * 0.309,
                      child: provider.list2.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: primarycolor,
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.list2.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: const [
                                                  Text("loading"),
                                                  CircularProgressIndicator(
                                                      color: primarycolor)
                                                ],
                                              ),
                                            );
                                          });
                                      provider
                                          .getkey(provider.list2[index].id)
                                          .then((value) {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Details(
                                              id: value,
                                              img: provider
                                                  .list2[index].poster_path,
                                              overview: provider
                                                  .list2[index].overview,
                                              title:
                                                  provider.list2[index].title);
                                        }));
                                      });
                                    },
                                    child: list(
                                      size: size,
                                      vote: provider.list2[index].vote_average,
                                      img:
                                          'https://image.tmdb.org/t/p/w600_and_h900_bestv2${provider.list2[index].poster_path}',
                                    ),
                                  ),
                                );
                              }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(
                      height: size.height * 0.309,
                      child: provider.list2.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: primarycolor,
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.list2.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: const [
                                                  Text("loading"),
                                                  CircularProgressIndicator(
                                                      color: primarycolor)
                                                ],
                                              ),
                                            );
                                          });
                                      provider
                                          .getkey(provider.list3[index].id)
                                          .then((value) {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return Details(
                                              id: value,
                                              img: provider
                                                  .list3[index].poster_path,
                                              overview: provider
                                                  .list3[index].overview,
                                              title:
                                                  provider.list3[index].title);
                                        }));
                                      });
                                    },
                                    child: list(
                                      size: size,
                                      vote: provider.list3[index].vote_average,
                                      img:
                                          'https://image.tmdb.org/t/p/w600_and_h900_bestv2${provider.list3[index].poster_path}',
                                    ),
                                  ),
                                );
                              }),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
