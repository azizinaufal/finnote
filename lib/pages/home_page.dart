import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //dashboard
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Iconify(
                          MaterialSymbols.download,
                          color: Colors.green[600],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pemasukan",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Rp. 2.000.000",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 14))
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Iconify(
                          MaterialSymbols.upload,
                          color: Colors.red[600],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pengeluaran",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Rp. 1.000.000",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 14))
                        ],
                      )
                    ],
                  )
                ],
              ),
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              "Transaksi",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          //list transaksi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 10,
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Iconify(
                      MaterialSymbols.edit,
                      color: Colors.yellow[800],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Iconify(MaterialSymbols.delete, color: Colors.red)
                  ],
                ),
                title: Text("Rp. 20.000"),
                subtitle: Text("Makan Siang"),
                leading: Container(
                  child: Iconify(
                    MaterialSymbols.upload,
                    color: Colors.red[600],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 10,
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Iconify(
                      MaterialSymbols.edit,
                      color: Colors.yellow[800],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Iconify(MaterialSymbols.delete, color: Colors.red)
                  ],
                ),
                title: Text("Rp. 2.000.000"),
                subtitle: Text("Uang bulanan"),
                leading: Container(
                  child: Iconify(
                    MaterialSymbols.download,
                    color: Colors.blue[600],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
