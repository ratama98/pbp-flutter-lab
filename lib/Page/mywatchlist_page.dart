import 'package:counter_7/main.dart';
import 'package:counter_7/Page/tambah_budget.dart';
import 'package:counter_7/Page/data_budget.dart';
import 'package:counter_7/Model/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'mywatchlist_details_page.dart';

// Reference:
// https://stackoverflow.com/questions/54977982/rangeerror-index-invalid-value-valid-value-range-is-empty-0
// https://api.flutter.dev/flutter/material/Card-class.html
// https://docs.flutter.dev/cookbook/lists/long-lists

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({Key? key}) : super(key: key);

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  Future<List<MyWatchList>> fetchToDo() async {
    var url = Uri.parse('https://assignment-2-raditya.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object MyWatchList
    List<MyWatchList> listMyWatchList = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchList.add(MyWatchList.fromJson(d));
      }
    }

    return listMyWatchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TambahBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman Data Budget
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DataBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('MyWatchList'),
              onTap: () {
                // Route menu ke halaman mywatchlist
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: fetchToDo(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                  "Tidak ada watch list :(",
                  style: TextStyle(
                  color: Color(0xff59A5D8),
                  fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  ],
                );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index)=> Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0
                          )
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "${snapshot.data![index].fields.title}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  MyWatchListDetailsPage(watchlistData: snapshot.data[index],)),
                            );
                          },
                        )
                      ],
                    ),
                  )
              );
            }
          }
        }
      ),
    );
  }
}