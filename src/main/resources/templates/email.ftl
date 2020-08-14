<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Email sent</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
    body {
        border: 1px solid #314AB2;
        align-content: center;
        width: 30%;
        font-size: 13pt;
    }
    .header{
        background-color: #02275D;
        height: 70px;
    }
    .div-title-email{
        display: flex;
        justify-content: center;
    }
    .title-email {
        position: absolute;
        display: table;
        margin: 0 auto;
        text-align: center;
    }
    .div-opening-email{
        padding: 0;
        margin: 10px;
        margin-top: -10px;
    }
    .table-user-account{
        margin-left: 20px;
    }
    .div-closing-email{
        margin: 10px;
        margin-top: 30px;
    }
    .div-admin-email{
        border-top: 1px solid #314AB2;
        margin-top: 50px;
    }
    footer {
        display: flex;
        justify-content: center;
        background-color: #02275D;
        height: 40px;
        align-content: center;
        align-items: center;
        color: #fff;
    }
</style>
<body >
<div class="header"></div>
<div class="div-title-email">
    <p class="title-email"><h3>Konfirmasi Akun Registrasi Siap Kaban</h3></p>
</div>

<div class="div-opening-email">
    <p>Pengguna aplikasi yang kami hormati,<br />Berikut adalah data akun anda :</p>
</div>

<div class="table-user-account">
    <table>
        <tr>
            <td>Username</td>
            <td>:</td>
            <td></td>
        </tr>
        <tr>
            <td>Password</td>
            <td>:</td>
            <td></td>
        </tr>
        <tr>
            <td>Nomor Identitas</td>
            <td>:</td>
            <td></td>
        </tr>
    </table>
</div>

<div class="div-closing-email">
    <p>Terima kasih Anda sudah melakukan registrasi.<br />
        Silahkan login pada aplikasi Siap Kaban menggunakan username dan password di atas.</p>
</div>

<div class="div-admin-email">
    <p style="margin:10px">Admin Siap Kaban<br />Kanwil DJBC Banten</p>
</div>
</body>
<footer>2020 Siap Kaban - KWBC Banten</footer>
</html>