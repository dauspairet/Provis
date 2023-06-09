import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percobaan_4/model.dart';
import 'package:provider/provider.dart';

// test
class tarikDana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          child: Column(
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
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/TambahRekeningPage');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple[200]!,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Tambah Rekening',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(),
                  child: Text(
                    'Rekening Bank',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child:
                      Consumer<BankUser>(builder: (context, dataBank, child) {
                    return dataBank.isLoading
                        ? CircularProgressIndicator()
                        : dataBank.bank != null
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: dataBank.bank!.listBank.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 5, 20, 5),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.purple[800],
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/tarikDanaPage',
                                                  arguments: index);
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 70,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    dataBank
                                                        .bank!
                                                        .listBank[index]
                                                        .nama_bank,
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 22,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 10),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          dataBank
                                                              .bank!
                                                              .listBank[index]
                                                              .nama_pemilik_bank,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        Text(
                                                          dataBank
                                                              .bank!
                                                              .listBank[index]
                                                              .nomor_rekening,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
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
                              )
                            : SizedBox();
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
