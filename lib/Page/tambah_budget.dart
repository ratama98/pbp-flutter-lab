import 'package:counter_7/main.dart';
import 'package:counter_7/Page/data_budget.dart';
import 'package:counter_7/Model/budget.dart';
import 'package:counter_7/Page/mywatchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Reference:
// https://stackoverflow.com/questions/55073897/dropdownbuttonformfield-with-fixed-width-but-dynamic-text-items
// https://stackoverflow.com/questions/53588785/remove-underline-from-dropdownbuttonformfield
// https://api.flutter.dev/flutter/material/DropdownButtonFormField-class.html
// https://stackoverflow.com/questions/49577781/how-to-create-number-input-field-in-flutter

class TambahBudgetPage extends StatefulWidget {
  const TambahBudgetPage({super.key});

  @override
  State<TambahBudgetPage> createState() => _TambahBudgetPageState();
}

class _TambahBudgetPageState extends State<TambahBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  List<Budget> lstBudgets = [];
  String judul = "";
  int nominal = 0;
  final List<String> listTipeBudget = ['Pengeluaran', 'Pemasukan'];
  String? tipeBudget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Budget'),
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
                  MaterialPageRoute(builder: (context) => DataBudgetPage(budgets: lstBudgets)),
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Pak Dengklek",
                      labelText: "Judul",

                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: "Contoh: 1000",
                        labelText: "Nominal",

                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          nominal = int.parse(value!);
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          nominal = int.parse(value!);
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nominal tidak boleh kosong!';
                        }
                        return null;
                      },
                    )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                        hintText: "Pilih Jenis",
                        enabledBorder: InputBorder.none,
                        isDense: true
                    ),
                    value: tipeBudget,
                    items: listTipeBudget.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        tipeBudget = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jenis tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                    ),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        setState(() {
                          Budget newBudget =
                          Budget(judul, nominal, tipeBudget!);
                          lstBudgets.add(newBudget);
                        });

                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: ListView(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  const Center(child: Text('Informasi Data')),
                                  const SizedBox(height: 20),
                                  // Munculkan informasi yang didapat dari form
                                  Text('Judul: $judul'),
                                  Text('Nominal: $nominal'),
                                  Text('Jenis Budget: $tipeBudget'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kembali'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ]
            )
          )
        )
      ),
    );
  }
}