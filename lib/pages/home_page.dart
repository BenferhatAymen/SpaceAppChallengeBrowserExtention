import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterext/constants.dart';
import 'package:flutterext/models/dataset_model.dart';
import 'package:flutterext/pages/widgets/dataset_card.dart';
import 'package:flutterext/services/datasets_service.dart';
import 'package:flutterext/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;
  String searchData = "";
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return searchData == ""
        ? StreamBuilder(
            stream: DataSetsService().getBestDatasets().asStream(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var DataSets = snapshot.data;
                return Scaffold(
                  backgroundColor: Colors.black,
                  body: SafeArea(
                    child: Column(
                      children: [
                        CustomTextField(
                          onChanged: (p0) {
                            setState(() {
                              searchData = p0;
                            });
                          },
                          hintText: "Search",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Most Downloaded Data",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 220,
                          width: _deviceWidth * 0.92,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemExtent:
                                MediaQuery.of(context).size.width * 0.92,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                DataSets!.length, // Use DataSets.length here
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 15),
                                child: DatasetModel(
                                  dataSetsModel: DataSets![index],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                // Handle the case when snapshot.data is null or still loading
                return Scaffold(
                  backgroundColor: kPrimaryColor,
                  body: SafeArea(
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "Search",
                        ),
                        CircularProgressIndicator(), // Loading indicator
                      ],
                    ),
                  ),
                );
              }
            }),
          )
        : StreamBuilder(
            stream: DataSetsService().searchDatasets(searchData).asStream(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var DataSets = snapshot.data;
                return Scaffold(
                  backgroundColor: kPrimaryColor,
                  body: SafeArea(
                    child: Column(
                      children: [
                        CustomTextField(
                          onChanged: (p0) {
                            setState(() {
                              searchData = p0;
                            });
                          },
                          hintText: "Search",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Search Results for : $searchData",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 220,
                          width: _deviceWidth * 0.92,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemExtent:
                                MediaQuery.of(context).size.width * 0.92,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                DataSets!.length, // Use DataSets.length here
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(right: 15, left: 15),
                                child: DatasetModel(
                                  dataSetsModel: DataSets![index],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                // Handle the case when snapshot.data is null or still loading
                return Scaffold(
                  backgroundColor: Colors.black,
                  body: SafeArea(
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "Search",
                        ),
                        CircularProgressIndicator(), // Loading indicator
                      ],
                    ),
                  ),
                );
              }
            }),
          );
  }
}
