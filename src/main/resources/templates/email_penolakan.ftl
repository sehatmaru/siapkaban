<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Email sent</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<div style="border: 1px solid #314AB2; align-content: center; width: 460px; font-size: 11pt;">
    <div style="background-color: #02275D; height: 70px;">
        <img width="60px" height="60px" src="https://i.ibb.co/h2k3hdy/logosiapkaban.png">
        <img width="250px" height="60px" src="https://i.ibb.co/Bg6ZRc6/siapkaban.png">
    </div>
    <div style="height: 50px; margin-top: 20px; margin-left: 10px;">
        <p style="font-size: 8pt;">KEMENTERIAN KEUANGAN REPUBLIK INDONESIA <br \>
        DIREKTORAT JENDERAL BEA DAN CUKAI <br \>
        KANTOR WILAYAH DJBC BANTEN <br \>
        KANTOR PENGAWASAN DAN PELAYANAN BEA DAN CUKAI TMP ${jenis_kppbc}</p>
    </div>

    <div style="display: flex; justify-content: center; height: 30px; margin-top: 30px; border-top: 1px solid;">
        <p style="color: #0b2e13; position: absolute; display: table; margin: 0 auto; text-align: center; margin-top: 10px; font-size: 10pt;">NOTA PEMBERITAHUAN PENOLAKAN (NPP)</p>
    </div>

    <div style="margin-left: 10px; font-size: 10pt; margin-top: 20px;">
        <table>
            <tr>
                <td>NOMOR PENGAJUAN</td>
                <td>:</td>
                <td>${nomor_pengajuan}</td>
            </tr>
            <tr>
                <td>WAKTU RESPON</td>
                <td>:</td>
                <td>${waktu_response}</td>
            </tr>
        </table>
    </div>

    <div style="margin-left: 10px; margin-top: 10px;">
        <p>Kepada :</p>
    </div>

    <div style="margin-left: 10px; font-size: 10pt;">
        <table>
            <tr>
                PEMOHON
            </tr>
            <tr>
                <td>NPWP</td>
                <td>:</td>
                <td>${npwp_pemohon}</td>
            </tr>
            <tr>
                <td>NAMA</td>
                <td>:</td>
                <td>${nama_pemohon}</td>
            </tr>
            <tr>
                <td>ALAMAT</td>
                <td>:</td>
                <td>${alamat_pemohon}</td>
            </tr>
        </table>
    </div>

    <div style="margin-left: 10px; font-size: 10pt; margin-top: 50px;">
        <p>
            CATATAN PERBAIKAN : <br \>
            Permohonan yang Saudara sampaikan tidak memenuhi syarat untuk diproses 
            lebih lanjut. Agar dilakukan perbaikan sebagai berikut:
        </p>
        <p>
            ${daftar_perbaikan}
        </p>
    </div>

    <div style="border-top: 1px solid #314AB2; margin-top: 50px;">
        <p style="margin:10px">Admin Siap Kaban<br />Kanwil DJBC Banten</p>
    </div>

    <div
            style="display: flex;
    justify-content: center;
    background-color: #02275D;
    height: 40px;
    align-content: center;
    align-items: center;
    color: #fff;"><h5 style="color: #fff; position: absolute; display: table; margin: 0 auto; text-align: center; margin-top: 10px">2020 Siap Kaban - KWBC Banten</h5>
    </div>
</div>
</html>