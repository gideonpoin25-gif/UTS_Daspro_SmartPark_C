program SmartPark;
uses crt;

var
  pilihan, jenis, jamMasuk, jamKeluar, durasi, totalBayar : integer;
  platNomor : string;
  i : integer;

begin
  clrscr;
  repeat
    writeln('========================================');
    writeln('           SMARTPARK SYSTEM             ');
    writeln('========================================');
    writeln('1. Hitung Tarif Parkir');
    writeln('2. Lihat Daftar Slot & Status Parkir');
    writeln('3. Keluar Program');
    write('Pilih menu (1-3): ');
    readln(pilihan);

    case pilihan of
      1:
      begin
        clrscr;
        writeln('--- KALKULATOR TARIF PARKIR ---');
        write('Masukkan Plat Nomor Kendaraan: ');
        readln(platNomor);
        
        writeln('Jenis Kendaraan:');
        writeln('1. Motor (Rp 2.000/jam)');
        writeln('2. Mobil (Rp 5.000/jam)');
        write('Pilih jenis (1/2): ');
        readln(jenis);

        { Validasi input menggunakan while-do & continue }
        while (jenis <> 1) and (jenis <> 2) do
        begin
          writeln('Pilihan tidak valid! Masukkan angka 1 atau 2.');
          write('Pilih jenis (1/2): ');
          readln(jenis);
          continue; 
        end;

        write('Jam Masuk (format 24 jam, cth: 8): ');
        readln(jamMasuk);
        write('Jam Keluar (format 24 jam, cth: 12): ');
        readln(jamKeluar);

        if jamKeluar < jamMasuk then
        begin
          writeln('Jam keluar tidak boleh lebih kecil dari jam masuk!');
        end
        else
        begin
          durasi := jamKeluar - jamMasuk;
          if durasi = 0 then durasi := 1; { Minimal hitung 1 jam }

          if jenis = 1 then
            totalBayar := durasi * 2000
          else
            totalBayar := durasi * 5000;

          { Percabangan untuk diskon jika durasi > 5 jam }
          if durasi > 5 then
          begin
            writeln('Selamat! Anda mendapatkan diskon loyalitas 10%!');
            totalBayar := totalBayar - trunc(totalBayar * 0.1);
          end;

          writeln('----------------------------------------');
          writeln('Kendaraan  : ', platNomor);
          writeln('Durasi     : ', durasi, ' jam');
          writeln('Total Bayar: Rp ', totalBayar);
          writeln('----------------------------------------');
        end;

        writeln;
        write('Tekan Enter untuk kembali ke menu...');
        readln;
        clrscr;
      end;

      2:
      begin
        clrscr;
        writeln('--- DAFTAR SLOT PARKIR TERSEDIA ---');
        { Perulangan for-to-do untuk menampilkan status slot }
        for i := 1 to 5 do
        begin
          write('Slot A', i, ' : ');
          if i mod 2 = 0 then
            writeln('Terisi')
          else
            writeln('Tersedia');
        end;

        writeln;
        write('Tekan Enter untuk kembali ke menu...');
        readln;
        clrscr;
      end;

      3:
      begin
        writeln('Terima kasih telah menggunakan SmartPark!');
        break; { Penggunaan break untuk keluar dari menu repeat-until }
      end;
    else
      begin
        writeln('Pilihan menu tidak valid! Silakan coba lagi.');
        delay(1000);
        clrscr;
      end;
    end;

  until pilihan = 3;
end.