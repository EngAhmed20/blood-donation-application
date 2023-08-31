import 'package:flutter/material.dart';
import 'package:graduation_project/Styles/custom_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorCard extends StatelessWidget {
  const DonorCard({
    Key? key,
    required this.donorName,
    required this.donorPhone,
    required this.donorAddress,
    required this.donorBloodType,
  }) : super(key: key);
  final String donorName;
  final String donorPhone;
  final String donorAddress;
  final String donorBloodType;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(10.0),
          color: Colors.grey[300],
        ),
        padding: EdgeInsets.all(10),
        child: ExpansionTile(
          iconColor: CustomColors.primaryRedColor,
          collapsedIconColor: CustomColors.primaryRedColor,
          title: Text(
            donorName,
            style: Theme.of(context).textTheme.headline3,
          ),
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 30,
                        color: CustomColors.primaryRedColor,
                      ),
                      Text(
                        donorAddress,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.bloodtype,
                        size: 30,
                        color: CustomColors.primaryRedColor,
                      ),
                      Text(
                        donorBloodType,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    await launch(
                        'https://wa.me/+2$donorPhone?text= السلام عليكم ورحمة الله وبركاته');
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Image.asset('assets/images/whatsapp.png',height: 35,),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await launch('tel:$donorPhone');
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: const Icon(
                      Icons.phone,
                      size: 30,
                      color: CustomColors.primaryRedColor,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
