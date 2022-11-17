import 'package:counter_7/main.dart';
import 'package:counter_7/tambah_budget.dart';
import 'package:flutter/material.dart';

class DataBudgetPage extends StatefulWidget {
  var budgets;
  DataBudgetPage({super.key, this.budgets});

  @override
  State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
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
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.budgets == null || widget.budgets.length == 0)
              const Center(
                child: Text("Belum ada data budget"),
              )
            else
              ListView.builder(
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(widget.budgets[i].judul),
                      subtitle: Text(widget.budgets[i].nominal),
                      trailing: Text(widget.budgets[i].tipeBudget),
                    ),
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}