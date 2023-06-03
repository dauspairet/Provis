from fastapi import FastAPI, Body, Depends
import schemas
import models
# database
from database import Base, engine, SessionLocal
from sqlalchemy.orm import Session

# create local db
Base.metadata.create_all(engine)

# create session for db
def get_session():
    session = SessionLocal()
    try:
        yield session
    finally:
        session.close()

# API METHOD
app = FastAPI()

# ==================================== USER =================================================
# GET ALL USER
@app.get("/getUser")
def get_user(session: Session = Depends(get_session)):
    users = session.query(models.UserModel).all()
    return {"user": users}

# ADD USER (page register)
@app.post("/addUser")
def add_user(user: schemas.UserSchema, personal_data: schemas.PersonalDataSchema, session: Session = Depends(get_session)):
    # CREATE NEW DATA USER
    user_data = models.UserModel(**user.dict())
    session.add(user_data)
    session.commit()
    session.refresh(user_data)

    # Create new data wallet for the user
    wallet_data = models.WalletModel(user_id=user_data.user_id, saldo=0.0)
    session.add(wallet_data)
    session.commit()
    session.refresh(wallet_data)

    # Create new personal data for the user
    personal_data_model = models.PersonalDataModel(user_id=user_data.user_id, **personal_data.dict())
    session.add(personal_data_model)
    session.commit()
    session.refresh(personal_data_model)

    msg = ""
    if user_data.jenis_user == "Investor":
        # Create new data penyediaDana for the user
        penyedia_dana = models.PenyediaDanaModel(user_id=user_data.user_id)
        session.add(penyedia_dana)
        session.commit()
        session.refresh(penyedia_dana)
        msg = "investor"
    elif user_data.jenis_user == "Borrower":
        # Create new data pemilikUMKM for the user
        pemilik_umkm = models.PemilikUmkmModel(user_id=user_data.user_id)
        session.add(pemilik_umkm)
        session.commit()
        session.refresh(pemilik_umkm)
        msg = "borrower"
    return {"user": user_data, "wallet": wallet_data, "msg": msg}

# GET USER BY ID
@app.get("/getUser/{user_id}")
def get_user_by_id(user_id: int, session: Session = Depends(get_session)):
    db_user = session.query(models.UserModel).get(user_id)
    return {"user": db_user}

# ==================================== Personal Data =================================================
# ADD PERSONAL DATA (page ktp, npwp, ttd, data_diri)
@app.post("/addPersonalData/{user_id}")
def add_personal_data(user_id:int, personal_data: schemas.PersonalDataSchema, session: Session = Depends(get_session)):
    personal_data = models.PersonalDataModel(**personal_data.dict())
    personal_data.user_id = user_id
    session.add(personal_data)
    session.commit()
    session.refresh(personal_data)
    return {"personal_data": personal_data}

# UPDATE PERSONAL DATA (page ktp, npwp, ttd, data_diri)
@app.put("/updatePersonalData/{user_id}")
def update_personal_data(user_id: int, personal_data: schemas.PersonalDataSchema, session: Session = Depends(get_session)):
    db_personal_data = session.query(models.PersonalDataModel).filter_by(user_id=user_id).first()
    if db_personal_data:
        # update data
        db_personal_data.nama = personal_data.nama
        db_personal_data.foto_ktp = personal_data.foto_ktp
        db_personal_data.foto_npwp = personal_data.foto_npwp
        db_personal_data.ttd = personal_data.ttd
        db_personal_data.tempat_lahir = personal_data.tempat_lahir
        db_personal_data.tgl_lahir = personal_data.tgl_lahir
        db_personal_data.jenis_kelamin = personal_data.jenis_kelamin
        db_personal_data.alamat = personal_data.alamat
        db_personal_data.agama = personal_data.agama
        db_personal_data.status_perkawinan = personal_data.status_perkawinan
        db_personal_data.pend_terakhir = personal_data.pend_terakhir
        db_personal_data.alamat = personal_data.alamat
        db_personal_data.status_kewarganegaraan = personal_data.status_kewarganegaraan
        session.commit()
        session.refresh(db_personal_data)
        return db_personal_data
    return {"message": "User not found"}

# GET PERSONAL DATA BY ID (page profile_page, informasi_akun)
@app.get("/getPersonalData/{user_id}")
def get_personal_data_by_user_id(user_id: int, session: Session = Depends(get_session)):
    personal_data = session.query(models.PersonalDataModel).filter_by(user_id=user_id).first()
    if personal_data is None:
        return {"error": "Personal data not found"}
    return {"personal_data": personal_data}

# ==================================== BANK =================================================

# ADD DATA BANK (page tambah_rekening, akun_bank)
@app.post("/addBank")
def add_bank(bank_data: schemas.BankSchema, user_id: int, session=Depends(get_session)):
    bank = models.BankModel(**bank_data.dict(), user_id=user_id)
    session.add(bank)
    session.commit()
    session.refresh(bank)
    return {"bank": bank}

# GET BANK BY USER_ID (page tarik_dana, bankAndCards)
@app.get("/users/{user_id}/banks")
def get_user_banks(user_id: int,session=Depends(get_session)):
    user = session.query(models.UserModel).get(user_id)
    if user is None:
        return {"error": "User not found"}
    return {"bank_user": user.banks}

# ==================================== WALLET =================================================
# GET WALLET BY USER ID (page wallet)
@app.get("/users/{user_id}/wallet")
def get_user_wallet(user_id: int,session=Depends(get_session)):
    user = session.query(models.UserModel).get(user_id)
    if user is None:
        return {"error": "User not found"}
    return {"wallet_user": user.wallet}

# ==================================== RIWAYAT SALDO =================================================
# GET RIWAYAT WALLET BY USER ID (page wallet)
@app.get("/users/{user_id}/riwayat-saldo")
def get_riwayat_saldo_by_user_id(user_id: int, session=Depends(get_session)):
    wallet = session.query(models.WalletModel).filter_by(user_id=user_id).first()
    if wallet is None:
        return {"error": "Wallet not found"}

    riwayat_saldo = session.query(models.RiwayatSaldoModel).filter_by(wallet_id=wallet.wallet_id).all()
    return {"riwayat_saldo": wallet.riwayat_saldo}

# ==================================== UMKM =================================================
# ADD DATA UMKM (page data_identitas_usaha)
@app.post("/addUmkm/{user_id}")
def add_umkm(user_id:int, umkm_data: schemas.UMKMSchema, session=Depends(get_session)):
    # cari pemilik_umkm berdasarkan user_id
    pemilik_umkm = session.query(models.PemilikUmkmModel).filter_by(user_id=user_id).first()
    id_pemilik = pemilik_umkm.pemilik_id
    # add data umkm
    umkm = models.UMKMModel(**umkm_data.dict(), pemilik_id=id_pemilik)
    session.add(umkm)
    session.commit()
    session.refresh(umkm)
    return {"umkm": umkm}

# GET UMKM BY UMKM_ID (Page identitas_usaha, rincian_umkm, rincian_portofolio)
@app.get("/getUmkm/{umkm_id}")
def get_umkm_by_umkm_id(umkm_id: int, session=Depends(get_session)):
    umkm = session.query(models.UMKMModel).get(umkm_id)
    if umkm is None:
        return {"error": "UMKM not found"}
    return {"umkm": umkm}

# ==================================== PINJAMAN =================================================

# GET PINJAMAN RECOMMENDED (Page dashboard_investor)

# GET PINJAMAN WITH STATUS_PINJAMAN == OPEN (Page pendanaan)

# GET PINJAMAN BY PINJAMAN_ID (Page rincian_umkm, pendanaan_investor, rincian_portofolio, pembayaran)

# GET PINJAMAN BY USER_ID TOP 5 (Page dashboard_umkm)

# ==================================== PENDANAAN =================================================

# GET PENDANAAN BY USER_ID (Page pendanaan_investor -> semua)

# GET PENDANAAN BY USER_ID (Page pendanaan_investor -> terbaru) -> ngambil data pendanaan yang bulan pinjamannya == bulan ini

# GET PENDANAAN BY USER_ID (Page pendanaan_investor -> selesai) -> ngambil data pendanaan yang status_pendanaan == selesai

# ADD PENDANAAN BY USER_ID (Page mulai_pendanaan_investor)

# ==================================== PENDANAAN =================================================

# ADD PEMBAYARAN BY PINJAMAN_ID (page pembayaran)