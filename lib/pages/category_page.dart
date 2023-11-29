import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isExpense = true;
  void openDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      (isExpense) ? "Tambah Pengeluaran" : "Tambah Pemasukan",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: (isExpense) ? Colors.red : Colors.blue),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "Nama"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Simpan"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                value: isExpense,
                onChanged: (bool value) {
                  setState(() {
                    isExpense = value;
                  });
                },
                inactiveTrackColor: Colors.blue[200],
                inactiveThumbColor: Colors.blue,
                activeColor: Colors.red,
              ),
              IconButton(
                  onPressed: () {
                    openDialog();
                  },
                  icon: Iconify(MaterialSymbols.add))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: (isExpense)
                  ? Iconify(MaterialSymbols.upload, color: Colors.red)
                  : Iconify(MaterialSymbols.download, color: Colors.blue),
              title: Text("Sedekah"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Iconify(
                        MaterialSymbols.edit,
                        color: Colors.yellow[800],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Iconify(
                        MaterialSymbols.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: (isExpense)
                  ? Iconify(MaterialSymbols.upload, color: Colors.red)
                  : Iconify(MaterialSymbols.download, color: Colors.blue),
              title: Text("Sedekah"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Iconify(
                        MaterialSymbols.edit,
                        color: Colors.yellow[800],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Iconify(
                        MaterialSymbols.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
