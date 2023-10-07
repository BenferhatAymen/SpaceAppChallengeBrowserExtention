import 'package:flutter/material.dart';
import 'package:flutterext/constants.dart';
import 'package:flutterext/models/dataset_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DatasetModel extends StatelessWidget {
  var _deviceHeight;
  var _deviceWidth;
  DataSetsModel dataSetsModel;
  DatasetModel({required this.dataSetsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _launchNewTab(dataSetsModel.id);
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          border: Border.all(color: kSecondaryColor),
          borderRadius: BorderRadius.circular(49),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      maxLines: 2,
                      dataSetsModel.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Image.network(
                  dataSetsModel.authorImage,
                  height: 90,
                  width: 70,
                ),
              ],
            ),
            Text(
              "Uploaded By ${dataSetsModel.authorTitle}",
              style: TextStyle(
                  color: kThirdColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Usability ${dataSetsModel.usability.toDouble()}",
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "Uploaded on ${dataSetsModel.dateModified}",
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "${dataSetsModel.filesNumber} Files",
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Flexible(
              child: Text(
                maxLines: 2,
                "${dataSetsModel.description}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchNewTab(String id) async {
  String Burl =
      "https://simultaneousseveralcgi.aceiny.repl.co/api/v1/datasets/$id";
  var url = Uri.parse(Burl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
