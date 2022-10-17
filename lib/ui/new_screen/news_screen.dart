import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/news_category.dart';
import 'package:hab_app_trac_nghiem/provider/news_category.dart';
import 'package:hab_app_trac_nghiem/ui/new_screen/news_detail_screen.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  int current = 0;

  Widget _tabContent(String date) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: date == "22/09/2022" ? 5 : 10,
                itemBuilder: (BuildContext context, int index) => Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 3.w, 3.w, 0.w),
                      child: InkWell(
                        onTap: () => Navigator.of(context, rootNavigator: true)
                            .pushNamed(NewsDetailScreen.route),
                        child: SizedBox(
                            width: 400.w,
                            child: Container(
                                width: 400.w,
                                color: const Color.fromRGBO(217, 217, 217, 1),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          5.w, 5.w, 5.w, 0.w),
                                      child: Image.asset(
                                        "assets/images/thumbnail/thumbnail_news_1.png",
                                        height: 350.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          5.w, 5.w, 5.w, 0.w),
                                      child: Text(
                                        "Trạm Thiên Cung cân bằng nhiệt thế nào ở độ cao...",
                                        style: TextStyle(
                                          fontSize: 17.w,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            5.w, 5.w, 5.w, 0.w),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.w, 40.w, 5.w, 0.w),
                                              child: RichText(
                                                text: TextSpan(children: [
                                                  WidgetSpan(
                                                    child: Icon(
                                                        Icons
                                                            .calendar_month_rounded,
                                                        size: 20.w),
                                                  ),
                                                  TextSpan(
                                                      text: date,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.w)),
                                                ]),
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ))),
                      ),
                    )),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<List<NewsCategory>> fectchNewsCategory() async {
      var data = await http.get(Uri.parse(AppUrl.newsCategory));

      var jsonData = json.decode(data.body);

      List<NewsCategory> newsCategory = [];

      for (var u in jsonData) {
        NewsCategory _newsCategory = NewsCategory(
            id: u["id"],
            newsCategoryName: u["news_category_name"],
            description: u["description"],
            status: u['status']);

        newsCategory.add(_newsCategory);
      }
      return newsCategory;
    }

    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            /// CUSTOM TABBAR
            SizedBox(
                width: double.infinity,
                height: 60,
                child: FutureBuilder(
                  future: fectchNewsCategory(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.all(5),
                                    width: 80,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: current == index
                                          ? Colors.white70
                                          : Colors.white54,
                                      borderRadius: current == index
                                          ? BorderRadius.circular(15)
                                          : BorderRadius.circular(10),
                                      border: current == index
                                          ? Border.all(
                                              color: const Color.fromRGBO(
                                                  0, 41, 255, 1),
                                              width: 2)
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data[index].newsCategoryName,
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            color: current == index
                                                ? Colors.black
                                                : Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                    visible: current == index,
                                    child: Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                          color: Color.fromRGBO(0, 41, 255, 1),
                                          shape: BoxShape.circle),
                                    ))
                              ],
                            );
                          });
                    } else if (snapshot.hasError) {
                      print(snapshot.error.toString());
                      return Text('${snapshot.error}');
                    } else {
                      return const SpinKitThreeInOut(
                        color: Color.fromRGBO(0, 41, 255, 1),
                      );
                    }
                  },
                )),

            /// MAIN BODY

            current == 0
                ? _tabContent("20/09/2002")
                : current == 1
                    ? _tabContent("22/09/2022")
                    : current == 2
                        ? _tabContent("28/09/2022")
                        : current == 3
                            ? _tabContent("29/09/2022")
                            : current == 4
                                ? _tabContent("03/10/2022")
                                : Container()
          ],
        ),
      ),
    );
  }
}
