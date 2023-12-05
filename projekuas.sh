#!/bin/bash

input=$(zenity --entry --title "SISTEM GAJI KARYAWAN" --text "Masukkan nama karyawan : ")
zenity --info --title "SISTEM GAJI KARYAWAN" --text "Halo $input, Selamat datang di Sistem Gaji Karyawan!"

pilihan=$(zenity --list --title "Masukkan golongan karyawan" --column "Golongan" "A" "B" "C" "D")

case $pilihan in
    A) upah_per_jam=5000 ;;
    B) upah_per_jam=7000 ;;
    C) upah_per_jam=8000 ;;
    D) upah_per_jam=10000 ;;
    *) zenity --error --title "Peringatan" --text "Golongan tidak valid" && exit ;;
esac

jam_kerja=$(zenity --entry --title "SISTEM GAJI KARYAWAN" --text "Masukkan jumlah jam kerja : ")

if ! [[ $jam_kerja =~ ^[0-9]+$ ]]; then
    zenity --error --title "Peringatan" --text "Masukkan jumlah jam kerja yang valid"
    exit
fi

if [ $jam_kerja -gt 48 ]; then
    lembur=$(($jam_kerja - 48))
    upah_lembur=$(($lembur*$upah_per_jam*2))
    total_upah=$(($upah_per_jam*48+$upah_lembur))
else 
    total_upah=$(($upah_per_jam*$jam_kerja))
fi

zenity --info --title "SISTEM GAJI KARYAWAN" --text "Nama karyawan: $input\nGolongan : $pilihan\nJumlah jam kerja : $jam_kerja\nTotal upah : $total_upah"
