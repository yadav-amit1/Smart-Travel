import 'package:flutter/material.dart';
import 'package:smart_travel_planning_appli/Home/Chitwan_package/CApi_service.dart';
//import 'package:search_list_api_working/search.dart';
import 'package:smart_travel_planning_appli/Home/Chitwan_package/Cuser_model.dart';

class ChitwanPackageScreen extends StatefulWidget {

  @override
  _ChitwanPackageScreenState createState() => _ChitwanPackageScreenState();
}

class _ChitwanPackageScreenState extends State<ChitwanPackageScreen> {
  FetchCUserlist _cuserlist = FetchCUserlist();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF320D36),
        appBar: AppBar(
          title: Text('Packages'),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       showSearch(context: context, delegate: SearchUser());
          //     },
          //     icon: Icon(Icons.search_sharp),
          //   )
          // ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: FutureBuilder<List<CUserlist>>(
              future: _cuserlist.getCuserlist(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return GestureDetector(
                          onTap: () => print('Package open'),
                          child: Card(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD8AADD),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Image.network(
                                          '${data[index].cimage}',
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${data[index].cname.toString()}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '${data[index].cduration.toString()}',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '${data[index].cprice.toString()}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ])
                                    )],
                                ),
                                // trailing: Text('More Info'),
                              ),
                            ),
                          ));
                    });
              }),
        ),
      ),
    );
  }
}

