import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// test
class InvestorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Positioned.fill(
              bottom: MediaQuery.of(context).size.height - 250,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage("asset/images/backgroundsaldo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('asset/images/avatar.jpeg'),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        NotificationButton(), // Ganti dengan widget yang sesuai untuk tombol notifikasi
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 15.0),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Balance',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Rp.5.000.000',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      // Tambahkan widget lainnya di sini jika diperlukan
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Isi Dana button tap
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                255, 240, 240, 240),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'asset/images/topup.svg',
                                                width:
                                                    24.0, // Sesuaikan ukuran ikon
                                                height: 24.0,
                                                color: Color.fromARGB(1000, 168,
                                                    81, 223), // Warna ikon
                                              ), // Ikon di atas tombol
                                              SizedBox(
                                                  height:
                                                      8.0), // Jarak antara ikon dan teks
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                4.0), // Jarak antara tombol dan teks
                                        Text(
                                          'Top Up Saldo',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16.0),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Isi Dana button tap
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                255, 240, 240, 240),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'asset/images/transfer.svg',
                                                width:
                                                    24.0, // Sesuaikan ukuran ikon
                                                height: 24.0,
                                                color: Color.fromARGB(1000, 168,
                                                    81, 223), // Warna ikon
                                              ), // Ikon di atas tombol
                                              SizedBox(
                                                  height:
                                                      8.0), // Jarak antara ikon dan teks
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                4.0), // Jarak antara tombol dan teks
                                        Text(
                                          'Transfer',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16.0),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Isi Dana button tap
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                255, 240, 240, 240),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'asset/images/request.svg',
                                                width:
                                                    24.0, // Sesuaikan ukuran ikon
                                                height: 24.0,
                                                color: Color.fromARGB(1000, 168,
                                                    81, 223), // Warna ikon
                                              ), // Ikon di atas tombol
                                              SizedBox(
                                                  height:
                                                      8.0), // Jarak antara ikon dan teks
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                4.0), // Jarak antara tombol dan teks
                                        Text(
                                          'Request',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16.0),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Isi Dana button tap
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                255, 240, 240, 240),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SvgPicture.asset(
                                                'asset/images/history.svg',
                                                width:
                                                    24.0, // Sesuaikan ukuran ikon
                                                height: 24.0,
                                                color: Color.fromARGB(1000, 168,
                                                    81, 223), // Warna ikon
                                              ), // Ikon di atas tombol
                                              SizedBox(
                                                  height:
                                                      8.0), // Jarak antara ikon dan teks
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                4.0), // Jarak antara tombol dan teks
                                        Text(
                                          'History',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle Verifikasi Akun button tap
                              Navigator.pushNamed(context, '/formVerifikasi');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(151, 126, 242, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                'Verifikasi Akun',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(height: 8.0),
                    Text(
                      'Rekomendasi',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/detailPortofolio');
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 20),
                                      child: Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                                                width: double.infinity,
                                                height: 120,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    20, 0, 20, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Total Pendanaan',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Rp. xxxxx',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      'Status Pendanaan',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // Handle notification options
        if (value == 'option1') {
          // Perform action for option 1
        } else if (value == 'option2') {
          // Perform action for option 2
        }
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'option1',
          child: Container(
            width: 200, // Adjust the width to your preference
            child: Text('Halo Selamat Datang di Aplikasi DAUS'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option2',
          child: Container(
            width: 200, // Adjust the width to your preference
            child: Text('Halo Investor'),
          ),
        ),
      ],
      child: Icon(
        Icons.notifications,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
