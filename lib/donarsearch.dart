import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/shared/components/no_result.dart';

import 'constants/constants.dart';
import 'models/user_model/UserModel.dart';
import 'moduls/search/donor/donor_card.dart';

class FindDonorsScreen extends StatefulWidget {
  const FindDonorsScreen({Key? key}) : super(key: key);

  @override
  _FindDonorsScreenState createState() => _FindDonorsScreenState();
}

class _FindDonorsScreenState extends State<FindDonorsScreen> {
  late Future resultsLoaded2;
  List? _snapshotResultsList;
  List _searchResultList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    resultsLoaded2 = getSnapshots();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var donorSnapshot in _snapshotResultsList!) {
        var title =
        DonateUserModel.fromSnapshot(donorSnapshot).bloodtype!.toLowerCase();
        if (title.contains(
          _searchController.text.toLowerCase(),
        )) {
          showResults.add(donorSnapshot);
        }
      }
    } else {
      showResults = List.from(_snapshotResultsList!);
    }
    setState(
          () {
        _searchResultList = showResults;
      },
    );
  }

  getSnapshots() async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .get();
    setState(
          () {
        _snapshotResultsList = data.docs;
      },
    );
    searchResultsList();
    return "complete";
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(child: Text('اعثر علي متبرعين',style: TextStyle(color: Colors.black),)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'فصيلة الدم',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              _searchController != null && _searchController.text.isEmpty
                  ? Column(
                children: [
                  SizedBox(
                    height: height * 0.15,
                  ),
                  const WidgetNoResult(),
                ],
              )
                  : SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: SizedBox(
                  height: height * 0.7,
                  child: ListView.separated(
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var donorData = _searchResultList[index];
                      return DonorCard(
                        donorName: donorData['name'],
                        donorPhone: donorData['phone'],
                        donorAddress: donorData['userAddress'],
                        donorBloodType: donorData['bloodtype'],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10,);
                    },
                    itemCount: _searchResultList.length,
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}