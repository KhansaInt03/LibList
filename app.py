from flask import Flask, render_template, redirect, request, url_for
from mysql import connector

app = Flask(__name__)

db = connector.connect(
    host = 'localhost',
    user = 'root',
    passwd = '',
    database = 'db_liblist'
)

if db.is_connected():
    print('Welcome to Liblist Database!!!')

#mainpage

@app.route('/')
def home():
    return render_template('Home.html')

@app.route('/cari_buku/<judul>/<author>', methods=['post'])
def caribuku(judul , author):
    judul = request.form['judul']
    author = request.form['author']
    cursor = db.cursor()
    cursor.execute('SELECT b.id_buku,b.judul,b.author,r.no_rak,b.stok,b.tersedia FROM tb_buku b, tb_rak r WHERE judul LIKE %s AND author LIKE %s AND b.genre=r.genre', ('%'+judul+'%','%'+author+'%'))
    result = cursor.fetchall()
    cursor.close()
    return render_template('hasilcari.html', hasil = result)

#bukubaru

@app.route('/buku_baru')
def buku_baru():
    cursor = db.cursor()
    cursor.execute(
        'SELECT b.id_buku,b.judul,b.author,r.no_rak,b.stok,b.tersedia FROM tb_buku b, tb_rak r where b.genre=r.genre'
    )
    result = cursor.fetchall()
    cursor.close()
    return render_template('bukubaru.html', hasil=result)

@app.route('/buku_baru/tambah_buku', methods=['post'])
def tambah_buku():
    kodebuku = request.form['kodebuku']
    judul = request.form['judul']
    author = request.form['author']
    genre = request.form['genre']
    stok = request.form['stok']
    cursor = db.cursor()
    cursor.execute('INSERT INTO tb_buku (id_buku,judul,genre,author,stok,tersedia) VALUES (%s,%s,%s,%s,%d,%d)', (kodebuku,judul,genre,author,stok,stok))
    db.commit()
    cursor.execute(
        'SELECT b.id_buku,b.judul,b.author,r.no_rak,b.stok,b.tersedia FROM tb_buku b, tb_rak r where b.genre=r.genre'
    )
    result = cursor.fetchall()
    return render_template('bukubaru.html', hasil=result)

#pinjam

@app.route('/pinjam')
def pinjam_buku():
    return render_template('pinjam.html')

@app.route('/pinjam/datapinjam')
def data_pinjam_buku():
    cursor = db.cursor()
    cursor.execute(
        'SELECT * FROM tb_peminjaman'
    )
    result = cursor.fetchall()
    cursor.close()
    return render_template('hasilpinjam.html', hasil=result)

@app.route('/pinjam/',methods=['post'])
def proses_pinjam_buku():
    id_anggota = request.form['id_anggota']
    id_petugas = request.form['id_petugas']
    id_buku = request.form['kodebuku']
    id_buku_1 = request.form['kodebuku2']
    id_buku_2 = request.form['kodebuku3']
    tanggal = request.form['tanggal_pinjam']
    cursor = db.cursor()
    cursor.execute(
        'INSERT INTO tb_peminjaman (id_anggota,id_petugas,id_buku,id_buku_d,id_buku_t,tanggal) VALUES (%s,%s,%s,%s,%s,%s)', (id_anggota,id_petugas,id_buku,id_buku_1,id_buku_2,tanggal)
    )
    cursor.execute(
        'UPDATE tb_buku SET tersedia=tersedia-1 WHERE id_buku=%s', (id_buku,)
    )
    cursor.execute(
        'UPDATE tb_buku SET tersedia=tersedia-1 WHERE id_buku=%s', (id_buku_1,)
    )
    cursor.execute(
        'UPDATE tb_buku SET tersedia=tersedia-1 WHERE id_buku=%s', (id_buku_2,)
    )
    db.commit()
    return redirect(url_for('data_pinjam_buku'))

#kembali

@app.route('/kembali')
def kembali_buku():
    return render_template('kembali.html')

@app.route('/kembali/datakembali')
def data_kembali_buku():
    cursor = db.cursor()
    cursor.execute(
        'SELECT * FROM tb_pengembalian'
    )
    result = cursor.fetchall()
    cursor.close()
    return render_template('hasilkembali.html', hasil=result)

@app.route('/kembali/', methods=['post'])
def proses_kembali_buku():
    no_pinjam = request.form['no_pinjam']
    id_anggota = request.form['id_anggota']
    id_petugas = request.form['id_petugas']
    id_buku = request.form['kodebuku']
    id_buku_1 = request.form['kodebuku2']
    id_buku_2 = request.form['kodebuku3']
    tanggal = request.form['tanggal_return']
    denda = request.form['denda']
    cursor = db.cursor()
    cursor.execute(
        'INSERT INTO tb_pengembalian (no_pinjam,id_anggota,id_petugas,id_buku,id_buku_d,id_buku_t,tanggal,denda) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)', (no_pinjam,id_anggota,id_petugas,id_buku,id_buku_1,id_buku_2,tanggal,denda)
    )
    cursor.execute(
        'UPDATE tb_buku SET tersedia=tersedia+1 WHERE id_buku=%s', (id_buku,)
    )
    cursor.execute(
        'UPDATE tb_buku SET tersedia=tersedia+1 WHERE id_buku=%s', (id_buku_1,)
    )
    cursor.execute(
        'UPDATE tb_buku SET tersedia=tersedia+1 WHERE id_buku=%s', (id_buku_2,)
    )
    db.commit()
    return redirect(url_for('data_kembali_buku'))

#anggota

@app.route('/anggota')
def anggota():
    cursor = db.cursor()
    cursor.execute(
        'SELECT * FROM tb_anggota'
    )
    result = cursor.fetchall()
    cursor.close()
    return render_template('anggota.html', hasil=result)

@app.route('/anggota/cari_anggota',methods=['post'])
def cari_anggota():
    nama_anggota = request.form['nama_anggota']
    cursor = db.cursor()
    cursor.execute(
        'SELECT * FROM tb_anggota WHERE nama_anggota=%s', (nama_anggota,)
    )
    result = cursor.fetchall()
    cursor.close()
    return render_template('hasilcarianggota.html',hasil=result)

@app.route('/anggota/tambah_anggota', methods=['post'])
def tambah_anggota():
    nama = request.form['nama_anggota']
    alamat = request.form['alamat']
    hp = request.form['hp']
    id_anggota = request.form['id_anggota']
    cursor = db.cursor()
    cursor.execute(
        'INSERT INTO tb_anggota (id_anggota,nama_anggota,alamat,no_hp) VALUES (%s,%s,%s,%s)', (id_anggota,nama,alamat,hp)
    )
    db.commit()
    cursor.execute(
        'SELECT * FROM tb_anggota'
    )
    result = cursor.fetchall()
    return render_template('anggota.html', hasil=result)

#petugas

@app.route('/petugas')
def petugas():
    cursor = db.cursor()
    cursor.execute(
        'SELECT * FROM tb_petugas'
    )
    result = cursor.fetchall()
    cursor.close()
    return render_template('petugas.html', hasil = result)

@app.route('/petugas/tambah_petugas', methods=['post'])
def tambah_staff():
    nama = request.form['nama_staff']
    alamat = request.form['alamat']
    hp = request.form['hp']
    id_staff = request.form['id_staff']
    cursor = db.cursor()
    cursor.execute(
        'INSERT INTO tb_petugas (id_petugas,nama_petugas,alamat,no_hp) VALUES (%s,%s,%s,%s)', (id_staff,nama,alamat,hp)
    )
    db.commit()
    cursor.execute(
        'SELECT * FROM tb_petugas'
    )
    result = cursor.fetchall()
    return render_template ('petugas.html', hasil=result)

if __name__ == "__main__":
    app.run(debug=True)