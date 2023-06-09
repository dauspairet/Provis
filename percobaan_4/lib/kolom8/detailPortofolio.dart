import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class detailPortofolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<Pendanaan> pendanaanList = arguments['pendanaanList'];
    final int index = arguments['index'];
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("asset/images/background.jpg"), // Latar belakang
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Consumer2<PinjamanUser, PendanaanData>(
              builder: (context, pinjaman, pendanaan, child) => Column(
                children: [
                  AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: SvgPicture.asset(
                        'asset/images/vector.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    title: Text(''),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pinjaman.dataUMKM.nama_umkm,
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.purple[200]!,
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                pendanaanList[index].status_pendanaan,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.purple[800]!,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Nama UMKM : ',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              pinjaman.dataUMKM.nama_umkm,
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Alamat:',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              pinjaman.dataUMKM.alamat_umkm,
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 140,
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pendanaan Awal',
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.purple[200]!,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: Text(
                                      "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(pinjaman.dataPinjaman![0].jumlah_pinjaman)}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 160,
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pendanaan Terkumpul',
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.purple[200]!,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: Text(
                                      "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(pinjaman.dataPinjaman![0].pinjaman_terkumpul)}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                    child: Container(
                      width: double.infinity,
                      height: 320,
                      decoration: BoxDecoration(
                        color: Colors.purple[800]!,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Lama Tenor',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        pinjaman
                                            .dataPinjaman![0].tenor_pinjaman,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Bunga Pinjaman',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        pinjaman
                                            .dataPinjaman![0].bunga_pinjaman,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Frekuensi Angsuran Pokok',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        pinjaman.dataPinjaman![0]
                                            .frekuensi_angsuran_pokok,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Total Pendanaan',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        // pendanaan.listPendanaan[index]
                                        //     .jumlah_pendanaan
                                        //     .toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(pendanaan.listPendanaan![index].jumlah_pendanaan)}",
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Total Pembayaran',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        // pendanaan.listPendanaan[index]
                                        //     .total_pembayaran
                                        //     .toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(pendanaan.listPendanaan![index].total_pembayaran)}",
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        'Pembayaran Selesai',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        // pendanaan.listPendanaan[index]
                                        //     .curr_pembayaran
                                        //     .toString(),
                                        "Rp ${NumberFormat.currency(locale: 'id_ID', symbol: '').format(pendanaan.listPendanaan![index].curr_pembayaran)}",
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ); //Material APP
  }
}
