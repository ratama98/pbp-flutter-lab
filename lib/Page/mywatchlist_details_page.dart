import 'package:counter_7/Page/data_budget.dart';
import 'package:counter_7/Page/tambah_budget.dart';
import 'package:counter_7/Page/mywatchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class MyWatchListDetailsPage extends StatelessWidget {
  var watchlistData;
  MyWatchListDetailsPage({super.key, this.watchlistData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
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
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Center (
                child: Padding (
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    watchlistData.fields.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
              ),
              const SizedBox(height: 12),
              Row (
                  children: [
                    const Text("Release Date: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(DateFormat.yMMMMd('en_US').format(watchlistData.fields.releaseDate)),
                  ]
              ),
              const SizedBox(height: 7),
              Row (
                  children: [
                    const Text("Rating: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("${watchlistData.fields.rating} / 5"),
                  ]
              ),
              const SizedBox(height: 7),
              Row (
                  children: [
                    const Text("Status: ",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    (watchlistData.fields.watched)
                        ? const Text('Watched')
                        : const Text('Not Watched')
                  ]
              ),
              const SizedBox(height: 7),
              Row (
                  children: const [
                    Text("Review: ",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ]
              ),
              const SizedBox(height: 7),
              Row (
                  children: [
                    Text(watchlistData.fields.review),
                  ]
              ),
              const Spacer(),
              MaterialButton(
                minWidth: double.maxFinite, // set minWidth to maxFinite
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                  );
                },
                child: const Text("Back", style: TextStyle(color: Colors.white)),
              )
            ],
          )
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}