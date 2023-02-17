<?php

include "koneksi.php";


if(isset($_POST['bsimpan'])){ 

    $direktori = "gambar_produk/";
    $file_name = $_FILES['gambar_produk']['name'];
    move_uploaded_file($_FILES['gambar_produk']['tmp_name'],$direktori.$file_name);

    $simpan = mysqli_query($koneksi, "INSERT INTO produk(kode_produk, gambar_produk, nama_produk, deskripsi, kategori, harga) VALUES(
                                                    '$_POST[tkode]', 
                                                    '$file_name', 
                                                    '$_POST[tnama]', 
                                                    '$_POST[tdeskripsi]', 
                                                    '$_POST[tkategori]', 
                                                    '$_POST[tharga]' ) 
                                                    ");
                
if($simpan){
    echo "<script>alert('Simpan Data Produk Berhasil!');
    document.location='tables.php';
    </script>";
} else{
    echo "<script>alert('Simpan Gagal!');
    document.location='tables.php';
    </script>";
}

}


// payment
if(isset($_POST['bayar'])){


    $q = mysqli_query($koneksi,"SELECT * FROM keranjang");
    // $tampil = mysqli_query($koneksi, $q);
    while ($data = mysqli_fetch_array($q)) :
   

    $simpan = mysqli_query($koneksi, "INSERT INTO payment(nama_depan, nama_belakang, email, kota, alamat, kode_pos, bank, nomor_hp, notes, kecamatan, qty, total, kode_produk) VALUES(
                                                    '$_POST[tdepan]',
                                                    '$_POST[tbelakang]', 
                                                    '$_POST[temail]', 
                                                    '$_POST[tkota]', 
                                                    '$_POST[talamat]', 
                                                    '$_POST[tpos]',  
                                                    '$_POST[tbank]',  
                                                    '$_POST[thp]', 
                                                    '$_POST[tnote]',
                                                    '$_POST[tcamat]',
                                                    '$data[qty]',
                                                    ($data[harga] * $data[qty]),
                                                    '$data[kode_produk]')
                                                     ");
         endwhile;        
if($simpan){
    echo "<script>alert('Simpan Data Produk Berhasil!');
    document.location='thankyou.html';
    </script>";
} else{
    echo "<script>alert('Simpan Gagal!');
    document.location='checkout.php';
    </script>";
}

}



if(isset($_POST['bubah'])){
    $ubah = mysqli_query($koneksi, "UPDATE produk SET 
                                                        kode_produk = '$_POST[tkode]',
                                                        nama_produk = '$_POST[tnama]',
                                                        deskripsi = '$_POST[tdeskripsi]',
                                                        kategori = '$_POST[tkategori]',
                                                        stok = '$_POST[tstok]',
                                                        harga = '$_POST[tharga]'
                                                    WHERE kode_produk = '$_POST[row_id]'
                                                    ");
                                                            



if($ubah){
    echo "<script>alert('Edit Data Produk Berhasil!');
    document.location='tables.php';
    </script>";
} else{
    echo "<script>alert('Ubah Data Produk Gagal!');
    document.location='tables.php';
    </script>";
}

}

//Uji jika tombol Hapus di klik
// if (isset($_POST['bhapus'])) {

//     //persiapan Hapus Data
//     $hapus = mysqli_query($koneksi, "DELETE FROM produk WHERE kode_produk = '$_POST[kode_produk]'");


//     //jika Hapus sukses
//     if ($hapus) {
//         echo "<script>
//                 alert('Hapus data produk Sukses!');
//                 document.location='tables.php';
//              </script>";
//     } else {
//         echo "<script>
//                 alert('Hapus data produk Gagal!');
//                 document.location='tables.php';
//              </script>";
//     }
// }


// tambah data User
if(isset($_POST['suser'])){
    $sadmin = mysqli_query($koneksi, "INSERT INTO admin_kalla(nama_lengkap, email, no_hp, alamat, username, kata_sandi, tingkat) VALUES(
                                                    '$_POST[tnama]', 
                                                    '$_POST[temail]', 
                                                    '$_POST[thp]', 
                                                    '$_POST[talamat]', 
                                                    '$_POST[tusername]', 
                                                    '$_POST[tpassword]', 
                                                    '$_POST[tlevel]') ");
if($sadmin){
    echo "<script>alert('Simpan Data Admin Berhasil!');
    document.location='admin_user.php';
    </script>";
} else{
    echo "<script>alert('Simpan Gagal!');
    document.location='admin_user.php';
    </script>";
}

}

?>