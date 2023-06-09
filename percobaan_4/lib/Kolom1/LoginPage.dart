import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:percobaan_4/model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "asset/images/background.jpg"), // Latar belakang
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
                    padding: EdgeInsets.all(16),
                    child: Consumer6<Login, Wallet, ProfileData, VerifikasiAkun, BankUser, PinjamanUser>(
                      builder: (context, login, wallet, profile, verif, bank, pinjaman, child) =>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Tumbuhkan bisnis anda',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'dengan cepat tanpa risau!',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              onChanged: (value){
                                login.email = value;
                              }
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              obscureText: true,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                              onChanged: (value){
                                login.password = value;
                              },
                            ),
                          ),
                          SizedBox(height: 32),
                          Consumer3<RiwayatWalletProvider, PendanaanData, UmkmProvider>(
                            builder: (context, riwayat, pendanaan, umkm, child) =>
                            ElevatedButton(
                                onPressed: () async{
                                  // MASUK KE DASHBOARD INVESTOR DAN BORROWER
                                  if(login.email == "" || login.password == ""){
                                    print("kosong");
                                  }
                                  final statusCode = await login.loginProcess();
                                  print(statusCode);
                                  if(statusCode == 200){
                                    // fetch data profile
                                    await profile.fetchData(login.user_id);
                                    // update user
                                    await verif.updateUser(login.user_id);
                                    // fetch data status akun
                                    await verif.fetchStatusAkun(login.user_id);
                                    // fetch data bank
                                    await bank.fetchDataBank(login.user_id);
                                    // print(riwayat.listRiwayatWallet!.length);
                                    if(login.jenis_user == "Investor"){
                                      // fetch data wallet
                                      await wallet.fetchData(login.user_id);
                                      // fetch data pendanaan
                                      await pendanaan.fetchDataPendanaan(login.user_id);
                                      if(pendanaan.listPendanaanPending.length > 0){
                                        for (var item in pendanaan.listPendanaanPending) {
                                          // assign data riwayat wallet
                                          riwayat.keterangan = "Pembayaran Pinjaman";
                                          riwayat.statusTransaksi = "Masuk";
                                          riwayat.saldoTransaksi = item.total_pembayaran;
                                          // update riwayat wallet
                                          await riwayat.addRiwayatWallet(wallet.wallet_id);
                                          // reset data wallet
                                          riwayat.reset();
                                          // update status pendanaan dan curr pembayaran by pendanaan_id
                                          await pendanaan.updateStatusPendanaan(item.pendanaan_id);
                                        }
                                      }
                                      // fetch data wallet
                                      await wallet.fetchData(login.user_id);
                                      // fetch data pendanaan
                                      await pendanaan.fetchDataPendanaan(login.user_id);
                                      // fetch data riwayat wallet
                                      await riwayat.fetchDataRiwayatWallet(wallet.wallet_id);
                                      // fetch data pinjaman status open
                                      await pinjaman.fetchDataPinjamanOpen();
                                      Navigator.pushNamed(context, '/dashboardInvestor');
                                    }else{
                                      // fetch data list pinjaman user
                                      await pinjaman.fetchDataPinjaman(login.user_id);
                                      // fetch data wallet
                                      await wallet.fetchData(login.user_id);
                                      // ada pinjaman yang close -> update wallet + riwayat wallet dan status_pinjaman ke pending
                                      if(pinjaman.pinjamanCloseList!.length > 0){
                                        // assign data riwayat wallet
                                        riwayat.keterangan = "Dana Pinjaman";
                                        riwayat.statusTransaksi = "Masuk";
                                        riwayat.saldoTransaksi = pinjaman.pinjamanCloseList![0].pinjaman_terkumpul;
                                        // update riwayat wallet
                                        await riwayat.addRiwayatWallet(wallet.wallet_id);
                                        // reset data wallet
                                        riwayat.reset();
                                        // update status_pinjaman
                                        await pinjaman.updateStatusPinjaman(pinjaman.pinjamanCloseList![0].pinjaman_id);
                                      }
                                      // fetch data wallet
                                      await wallet.fetchData(login.user_id);
                                      // fetch data riwayat
                                      await riwayat.fetchDataRiwayatWallet(wallet.wallet_id);
                                      // fetch data list pinjaman user
                                      await pinjaman.fetchDataPinjaman(login.user_id);
                                      // fetch data umkm
                                      await umkm.fetchDataUmkm(login.user_id);
                                      Navigator.pushNamed(context, '/dashboardUMKM');
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 70),
                                  backgroundColor: Colors
                                      .white, // Set the desired button color here
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: Text(
                                  'Masuk',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(1000, 168, 81, 223),
                                  ),
                                ),
                              ),
                          ),
                          SizedBox(height: 32),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                // MASUK KE PAGE LUPA PASSWORD (KALAU BIKIN)
                              },
                              child: Text(
                                'Lupa Password?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              'atau masuk dengan',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  // Facebook button action
                                },
                                icon: Image.asset(
                                  'asset/images/facebook.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Google button action
                                },
                                icon: Image.asset(
                                  'asset/images/google.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Belum punya akun?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4),
                              GestureDetector(
                                onTap: () {
                                  // MASUK KE ROLE SELECTION
                                  Navigator.pushNamed(
                                      context, '/roleSelectionPage');
                                },
                                child: Text(
                                  'Daftar Sekarang',
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
