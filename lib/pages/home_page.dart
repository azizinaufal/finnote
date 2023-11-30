import 'dart:math';

import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:finnote/model/transaction_wirh_category.dart';
import 'package:finnote/pages/category_page.dart';
import 'package:finnote/model/database.dart';
import 'package:finnote/pages/transaction_page.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class HomePage extends StatefulWidget {
  final DateTime selectedDate;
  const HomePage({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppDb database = AppDb();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  // page controller

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Iconify(
                                    MaterialSymbols.download,
                                    color: Colors.blue,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pemasukan',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: Colors.white)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Rp 3.800.000',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Iconify(
                                    MaterialSymbols.upload,
                                    color: Colors.redAccent[400],
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pengeluaran',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: Colors.white)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Rp 1.600.000',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Transaksi",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            StreamBuilder<List<TransactionWithCategory>>(
                stream: database.getTransactionByDateRepo(widget.selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length > 0) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(15)),
                                  elevation: 10,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Iconify(
                                            MaterialSymbols.edit,
                                            color: Colors.yellow[600],
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      TransactionPage(
                                                          transactionsWithCategory:
                                                              snapshot.data![
                                                                  index]),
                                                ))
                                                .then((value) {});
                                          },
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        IconButton(
                                            icon: Iconify(
                                              MaterialSymbols.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed: () async {
                                              await database
                                                  .deleteTransactionRepo(
                                                      snapshot.data![index]
                                                          .transaction.id);
                                              setState(() {});
                                            }),
                                      ],
                                    ),
                                    subtitle: Text(
                                        snapshot.data![index].category.name),
                                    leading: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: (snapshot.data![index].category
                                                    .type ==
                                                1)
                                            ? Iconify(
                                                MaterialSymbols.download,
                                                color: Colors.blue,
                                              )
                                            : Iconify(
                                                MaterialSymbols.upload,
                                                color: Colors.red,
                                              )),
                                    title: Text(
                                      snapshot.data![index].transaction.amount
                                          .toString(),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: Column(children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text("Belum ada transaksi",
                                style: GoogleFonts.poppins()),
                          ]),
                        );
                      }
                    } else {
                      return Center(
                        child: Text("Belum ada transaksi"),
                      );
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
