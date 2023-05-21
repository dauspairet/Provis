import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Identitas UMKM',
      home: DataIdentitasPage(),
      debugShowCheckedModeBanner: false, // Remove the debug banner
    );
  }
}

class DataIdentitasPage extends StatefulWidget {
  @override
  _DataIdentitasPageState createState() => _DataIdentitasPageState();
}

class _DataIdentitasPageState extends State<DataIdentitasPage> {
  String selectedBentuk = 'Bulat';
  String selectedKategori = 'S';

  List<String> bentukList = ['Bulat', 'Persegi', 'Segitiga', 'Jajargenjang'];
  List<String> kategoriList = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 41, 96, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // Back button action
                    },
                    icon: SvgPicture.asset(
                      'asset/images/vector.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CircleAvatar(child: Text('1')),
                      Transform.rotate(
                        angle: 270.0 *
                            (3.14 /
                                180.0), // Rotate by 90 degrees as a double value
                        child: SvgPicture.asset(
                          'asset/images/sequence_arrow1.svg',
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 146, 143, 146),
                        child: Text('2'),
                      ),
                      Transform.rotate(
                        angle: 270.0 *
                            (3.14 /
                                180.0), // Rotate by 90 degrees as a double value
                        child: SvgPicture.asset(
                          'asset/images/sequence_arrow1.svg',
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 146, 143, 146),
                        child: Text('3'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Lengkapi Data Usaha',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Bentuk UMKM',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedBentuk,
                    onChanged: (newValue) {
                      setState(() {
                        selectedBentuk = newValue!;
                      });
                    },
                    items: bentukList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Jumlah Karyawan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '1',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Kontak UMKM',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '+62',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Kategori Usaha',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedKategori,
                    onChanged: (newValue) {
                      setState(() {
                        selectedKategori = newValue!;
                      });
                    },
                    items: kategoriList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Omset Bulanan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '1 digit 😁',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              Text(
                'Nama Usaha/Toko',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Toko Usman Tokopedia',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Pemilik Usaha/Toko',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Saya',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Alamat Usaha/Toko',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Tokopedia/Shopee',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Deskripsi Usaha/Toko',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Teknisi',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button tap
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Unggah Foto',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button tap
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 40),
                    backgroundColor: Color.fromARGB(255, 151, 126, 242),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}