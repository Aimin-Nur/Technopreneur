<?php


include "koneksi.php";

// payment
if(isset($_POST['bayar'])){

    $simpan = mysqli_query($koneksi, "INSERT INTO payment(nama_depan, nama_belakang, email, kota, alamat, kode_pos, bank, nomor_hp, notes, kecamatan) VALUES(
                                                    '$_POST[tdepan]',
                                                    '$_POST[tbelakang]', 
                                                    '$_POST[temail]', 
                                                    '$_POST[tkota]', 
                                                    '$_POST[talamat]', 
                                                    '$_POST[tpos]',  
                                                    '$_POST[tbank]',  
                                                    '$_POST[thp]', 
                                                    '$_POST[tnote]',
                                                    '$_POST[tcamat]')
                                                     ");
                
if($simpan){
    echo "<script>alert('Simpan Data Produk Berhasil!');
    document.location='checkout.php';
    </script>";
} else{
    echo "<script>alert('Simpan Gagal!');
    document.location='checkout.php';
    </script>";
}

}














?>