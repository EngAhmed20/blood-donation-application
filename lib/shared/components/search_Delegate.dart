import 'package:flutter/material.dart';

import '../../models/user_model/UserModel.dart';

class dataSearch extends SearchDelegate<String>{
   List<dynamic>list;
  dataSearch({required this.list});
  @override
  List<Widget>? buildActions(BuildContext context) {
    //actio for app bar
    return [IconButton(onPressed: (){}, icon:Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //icon leading
    return IconButton(onPressed: (){
      close(context, 'null');
    }, icon:Icon(Icons.arrow_back));

  }

  @override
  Widget buildResults(BuildContext context) {
    // result
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone search about null

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 400,width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/no_result.png'),fit:BoxFit.cover),
        ),
      ),
    );
  }

}
/*
*
*/