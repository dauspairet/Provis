from pydantic import BaseModel, Field
from datetime import date
from decimal import Decimal


class UserSchema(BaseModel):
    username: str
    password: str
    c_password: str
    email: str
    nomor_hp: str
    jenis_user: str
    status_akun: str


class LoginSchema(BaseModel):
    email: str
    password: str


class PersonalDataSchema(BaseModel):
    id_user: int
    foto_ktp: str
    foto_npwp: str
    ttd: str
    nama: str
    tempat_lahir: str
    tgl_lahir: str
    jenis_kelamin: str
    agama: str
    status_perkawinan: str
    pend_terakhir: str
    alamat: str
    status_kewarganegaraan: str
    nomor_npwp: str
    pemilik_npwp: str


class BankSchema(BaseModel):
    user_id: int
    nama_bank: str
    nomor_rekening: str
    nama_pemilik_bank: str


class WalletSchema(BaseModel):
    saldo: float


class RiwayatSaldoSchema(BaseModel):
    wallet_id: int
    keterangan: str
    saldo_transaksi: float
    status_transaksi: str


class UMKMSchema(BaseModel):
    pemilik_id: int
    bentuk_umkm: str
    nama_umkm: str
    alamat_umkm: str
    kategori_umkm: str
    deskripsi_umkm: str
    kontak_umkm: str
    jumlah_karyawan: int
    omset_bulanan: Decimal
    foto_umkm: str


class PinjamanSchema(BaseModel):
    umkm_id: int
    jumlah_pinjaman: float
    tenor_pinjaman: str
    bunga_pinjaman: str
    frekuensi_angsuran_pokok: str
    status_pinjaman: str
    tujuan_pinjaman: str
    pinjaman_terkumpul: float


class PendanaanSchema(BaseModel):
    pinjaman_id: int
    jumlah_pendanaan: float
    status_pendanaan: str
    total_pembayaran: float
    curr_pembayaran: float


class PembayaranSchema(BaseModel):
    jumlah_pembayaran: float
    status_pembayaran: str
